Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D884D45E839
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 08:08:41 +0100 (CET)
Received: from localhost ([::1]:36362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqVLd-0007WX-0n
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 02:08:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqVKL-0006px-RH
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 02:07:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqVKJ-00021F-2B
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 02:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637910437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tPfjZ41mBNgM8bS5rNtIvCv2IAA5pFQp1SkGhOsQEfo=;
 b=E6pNmSK2FEEPZeLZzkXvYKHzkad40wmEXm1jXJpbQ97rnSTlSq/j27IQUunZ6DCiheNeZr
 tNIGTxAFb3he78EK+W0I9dG2zQnXSoUT3ZHYoA8j5dzLQLvmUkiTdWwtWDCtPy6WQu0Wbv
 jNzpWm91BK0FLcoF+h5iwfYNYjn4828=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-h8B-JYJpOTOe_jbFBVmV6Q-1; Fri, 26 Nov 2021 02:07:15 -0500
X-MC-Unique: h8B-JYJpOTOe_jbFBVmV6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3E39101AFA7;
 Fri, 26 Nov 2021 07:07:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F29E85D9C0;
 Fri, 26 Nov 2021 07:06:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 86C5411380A7; Fri, 26 Nov 2021 08:06:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v5 2/3] cpu-throttle: implement vCPU throttle
References: <cover.1637759139.git.huangy81@chinatelecom.cn>
 <cover.1637759139.git.huangy81@chinatelecom.cn>
 <af74a618001b13b113952b630ef4da26b1fb912f.1637759139.git.huangy81@chinatelecom.cn>
Date: Fri, 26 Nov 2021 08:06:51 +0100
In-Reply-To: <af74a618001b13b113952b630ef4da26b1fb912f.1637759139.git.huangy81@chinatelecom.cn>
 (huangy's message of "Wed, 24 Nov 2021 21:17:12 +0800")
Message-ID: <87mtlrbdkk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The use of atomics in this patch and the previous requires careful
review by an expert on proper use of atomics.


