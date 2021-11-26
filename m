Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD2C45E844
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 08:10:13 +0100 (CET)
Received: from localhost ([::1]:38516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqVN5-0000Xr-HG
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 02:10:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqVLs-0008Ij-FN
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 02:08:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqVLr-00028V-1Y
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 02:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637910534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tPfjZ41mBNgM8bS5rNtIvCv2IAA5pFQp1SkGhOsQEfo=;
 b=OE+uDoB26PKMeqnpo7h9v/nKjNZOOPYELWVByXjNiDEiFE0LXgYOTgqOS4+C9+uwSiHbWi
 N9QGUxGlT0HDq4qLuPQJI2nMYEsal5VybYJ1BKqO2KqKXojGdChxkGez6xgHBbcbWgNRlF
 IMTEEMl8tNNiSjWxWF6h90QDT06z7RU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-uQeRdaK9PVmLU0XgSqFofw-1; Fri, 26 Nov 2021 02:08:53 -0500
X-MC-Unique: uQeRdaK9PVmLU0XgSqFofw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B1785A07E;
 Fri, 26 Nov 2021 07:08:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 114855F4F4;
 Fri, 26 Nov 2021 07:08:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B607311380A7; Fri, 26 Nov 2021 08:08:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v6 2/3] cpu-throttle: implement vCPU throttle
References: <cover.1637856472.git.huangy81@chinatelecom.cn>
 <cover.1637857372.git.huangy81@chinatelecom.cn>
 <2d9259a1e7cf45352a264890bb9cc3154568ec65.1637857372.git.huangy81@chinatelecom.cn>
Date: Fri, 26 Nov 2021 08:08:13 +0100
In-Reply-To: <2d9259a1e7cf45352a264890bb9cc3154568ec65.1637857372.git.huangy81@chinatelecom.cn>
 (huangy's message of "Fri, 26 Nov 2021 00:27:51 +0800")
Message-ID: <877dcvbdia.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The use of atomics in this patch and the previous requires careful
review by an expert on proper use of atomics.


