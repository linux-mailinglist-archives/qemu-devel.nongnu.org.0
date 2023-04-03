Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BD76D4B36
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:57:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLcg-00048E-7E; Mon, 03 Apr 2023 10:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjLce-00047X-2y
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:57:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjLcc-0002yx-KH
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680533846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IAM3GigFSe3rAFPTa3nz+duJjEw0gXwIUuq3W6GV7qk=;
 b=YtdoWbVczsjmZ91GAI6w3N7ODekCtgD4h4rlNA5dNLWfpdsh6iG+4+ExJyTZbNoih/FiPw
 pd11W/ePYZ3muVRCRH6hpEl2p4vXW98fz3Bd7dXkKvCUhP71c6ZflFk4TVuKJRsGyCxZwp
 M1ExszEI8/WU57C9W341XSJoBAauA8I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-RzRfRMcwONmFVr_DC0uUKQ-1; Mon, 03 Apr 2023 10:57:20 -0400
X-MC-Unique: RzRfRMcwONmFVr_DC0uUKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D142857FB5;
 Mon,  3 Apr 2023 14:57:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BF7E40C20FA;
 Mon,  3 Apr 2023 14:57:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6484821E6926; Mon,  3 Apr 2023 16:57:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: <kvm@vger.kernel.org>,  <qemu-devel@nongnu.org>
Subject: Re: [PATCH qemu] sev/i386: Fix error reporting
References: <20230403031231.2003480-1-aik@amd.com>
Date: Mon, 03 Apr 2023 16:57:19 +0200
In-Reply-To: <20230403031231.2003480-1-aik@amd.com> (Alexey Kardashevskiy's
 message of "Mon, 3 Apr 2023 13:12:31 +1000")
Message-ID: <87wn2t814g.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Alexey Kardashevskiy <aik@amd.com> writes:

> c9f5aaa6bce8 ("sev: Add Error ** to sev_kvm_init()") converted
> error_report() to error_setg(), however it missed one error_report()
> and other 2 changes added error_report() after conversion. The result
> is the caller - kvm_init() - crashes in error_report_err as local_err
> is NULL.
>
> Follow the pattern and use error_setg instead of error_report.
>
> Fixes: 9681f8677f26 ("sev/i386: Require in-kernel irqchip support for SEV-ES guests")
> Fixes: 6b98e96f1842 ("sev/i386: Add initial support for SEV-ES")
> Fixes: c9f5aaa6bce8 ("sev: Add Error ** to sev_kvm_init()")
> Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
> ---
>  target/i386/sev.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 859e06f6ad..6b640b5c1f 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -922,7 +922,7 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>  
>      ret = ram_block_discard_disable(true);
>      if (ret) {
> -        error_report("%s: cannot disable RAM discard", __func__);
> +        error_setg(errp, "%s: cannot disable RAM discard", __func__);
>          return -1;
>      }
>  
> @@ -968,15 +968,14 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>  
>      if (sev_es_enabled()) {
>          if (!kvm_kernel_irqchip_allowed()) {
> -            error_report("%s: SEV-ES guests require in-kernel irqchip support",
> -                         __func__);
> +            error_setg(errp, "%s: SEV-ES guests require in-kernel irqchip support",
> +                       __func__);
>              goto err;
>          }
>  
>          if (!(status.flags & SEV_STATUS_FLAGS_CONFIG_ES)) {
> -            error_report("%s: guest policy requires SEV-ES, but "
> -                         "host SEV-ES support unavailable",
> -                         __func__);
> +            error_setg(errp, "%s: guest policy requires SEV-ES, but host SEV-ES support unavailable",
> +                       __func__);
>              goto err;
>          }
>          cmd = KVM_SEV_ES_INIT;

Preexisting, but here goes anyway: __func__ in error messages is an
anti-pattern.  Error messages are for the user, not the developer.  The
developer can find the function just fine; grep exists.


