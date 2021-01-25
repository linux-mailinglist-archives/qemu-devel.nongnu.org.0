Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62BE302B58
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:19:42 +0100 (CET)
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l47On-0000iC-CS
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l474e-0006xW-F5
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:58:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l474b-0006I3-KG
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611601127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zHac+loGt9pvJ3ucyE/+rVawDMRHJawcv3rmbk+zyIM=;
 b=KSAEMA5R62EEp6W+Y8EW3kFRzivClLWmMB0WHP+q9cAyfcmVgpwqgnGlz5Gj37K3BMC03Q
 QbY+TVDzQVmXxx35TY0DE+5PQaSwMjMwPbYNZa4/3mYjRIlSMFoCGQlCUkqJ/Ld4v3GIUk
 NVSc9F7QY1S+oiaDmCu9I0UzZ60yn6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-udNWGQvbMD-sYO2gYbaV8A-1; Mon, 25 Jan 2021 13:58:46 -0500
X-MC-Unique: udNWGQvbMD-sYO2gYbaV8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C5F58799E0;
 Mon, 25 Jan 2021 18:58:44 +0000 (UTC)
Received: from work-vm (ovpn-114-3.ams2.redhat.com [10.36.114.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C2AF100AE46;
 Mon, 25 Jan 2021 18:58:38 +0000 (UTC)
Date: Mon, 25 Jan 2021 18:58:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v5 2/6] sev/i386: Require in-kernel irqchip support for
 SEV-ES guests
Message-ID: <20210125185836.GP2925@work-vm>
References: <cover.1610665956.git.thomas.lendacky@amd.com>
 <d959102a84943107c7c2e58d5e2760d2ef4750a9.1610665956.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d959102a84943107c7c2e58d5e2760d2ef4750a9.1610665956.git.thomas.lendacky@amd.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tom Lendacky (thomas.lendacky@amd.com) wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> In prep for AP booting, require the use of in-kernel irqchip support. This
> lessens the Qemu support burden required to boot APs.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

(I'm failing to fidn a definition of irqchip_required vs allowed)

> ---
>  target/i386/sev.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index fce2128c07..ddec7ebaa7 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -776,6 +776,12 @@ sev_guest_init(const char *id)
>      sev->api_minor = status.api_minor;
>  
>      if (sev_es_enabled()) {
> +        if (!kvm_kernel_irqchip_allowed()) {
> +            error_report("%s: SEV-ES guests require in-kernel irqchip support",
> +                         __func__);
> +            goto err;
> +        }
> +
>          if (!(status.flags & SEV_STATUS_FLAGS_CONFIG_ES)) {
>              error_report("%s: guest policy requires SEV-ES, but "
>                           "host SEV-ES support unavailable",
> -- 
> 2.30.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


