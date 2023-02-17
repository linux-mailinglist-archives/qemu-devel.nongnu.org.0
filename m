Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2C669A924
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 11:38:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSy6q-0006WC-Gx; Fri, 17 Feb 2023 05:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSy6l-0006Vk-BK
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:36:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSy6j-0003Vn-LM
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676630207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BK3tsLK0YA04Gr/PIDWgSrQkPb6qq33TPBVHWrc4huw=;
 b=WngrXUFbM6/8L5F9+YAKN9CN6OZU5DBduPIXj4XjRADATfaj0/OmC3q8bUUr29okIxjXV3
 c2/gBLOcfkF5KHiEhKKW0pBi95hFpLg4MCrijjI+3v5lrRuzCz2CVrXHvbi8FZF5Z3CJ6f
 PXJQDJyZR1+55VnQOJ6kRNjA/Tz+wnQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-vrilnTE7Ntmplq2BMMM4UA-1; Fri, 17 Feb 2023 05:36:43 -0500
X-MC-Unique: vrilnTE7Ntmplq2BMMM4UA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF3AA29A9D2A;
 Fri, 17 Feb 2023 10:36:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E8A9140EBF4;
 Fri, 17 Feb 2023 10:36:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4F5E621E6A1F; Fri, 17 Feb 2023 11:36:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  libvir-list@redhat.com,  Paolo Bonzini
 <pbonzini@redhat.com>,  Daniel Berrange <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Reinoud Zandijk
 <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>,  Brad Smith <brad@comstyle.com>,  Stefan
 Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
References: <20230130114428.1297295-1-thuth@redhat.com>
Date: Fri, 17 Feb 2023 11:36:41 +0100
In-Reply-To: <20230130114428.1297295-1-thuth@redhat.com> (Thomas Huth's
 message of "Mon, 30 Jan 2023 12:44:28 +0100")
Message-ID: <87a61cbmti.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I feel the discussion petered out without a conclusion.

I don't think letting the status quo win by inertia is a good outcome
here.

Which 32-bit hosts are still useful, and why?

Please note my question is not about the cost of keeping them (or
savings from not keeping them), it's about the value they provide.  When
value rounds to zero, cost is irrelevant, so let's get a firm idea of
value *first*.


