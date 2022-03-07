Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4CA4CFC63
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:12:36 +0100 (CET)
Received: from localhost ([::1]:37590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBI3-00085w-08
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:12:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRATQ-0007xy-Mc
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:20:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRATO-0005YP-RG
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646648414;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=a5r/9Ad9M4LC+CnWwnf0WKIHJ37oVkohITJ/B7EDyPw=;
 b=F4mrv2l83OtpcJCRw1vruU/8J+tVp2MpDWYxZScvWQ3rlZazGlBRFxRoYcdPvTx9FgubP8
 eRlTlRNG0JyW2wPXs+zYsKujUE/KFBUJAOBouz1XvV2t8QE9x2KSzrpW5DjrlkWaHr6vgQ
 nUfIsXR9xDk79c2GNy4i9ygHfcrR4Rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-Kmbl2nckOhSSUSjOxrbFuQ-1; Mon, 07 Mar 2022 05:20:12 -0500
X-MC-Unique: Kmbl2nckOhSSUSjOxrbFuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAA09801AFC;
 Mon,  7 Mar 2022 10:20:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CB1E8089A;
 Mon,  7 Mar 2022 10:20:10 +0000 (UTC)
Date: Mon, 7 Mar 2022 10:20:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Tyler Fanelli <tfanelli@redhat.com>
Subject: Re: [PATCH v3] i386/sev: Ensure attestation report length is valid
 before retrieving
Message-ID: <YiXcV3ObOJulovnN@redhat.com>
References: <20220304201141.509492-1-tfanelli@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220304201141.509492-1-tfanelli@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: pbonzini@redhat.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 03:11:43PM -0500, Tyler Fanelli wrote:
> The length of the attestation report buffer is never checked to be
> valid before allocation is made. If the length of the report is returned
> to be 0, the buffer to retrieve the attestation buffer is allocated with
> length 0 and passed to the kernel to fill with contents of the attestation
> report. Leaving this unchecked is dangerous and could lead to undefined
> behavior.
> 
> Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
> ---
>  target/i386/sev.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 025ff7a6f8..e82be3e350 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -616,6 +616,8 @@ static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
>          return NULL;
>      }
>  
> +    input.len = 0;
> +
>      /* Query the report length */
>      ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
>              &input, &err);
> @@ -626,6 +628,11 @@ static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
>                         ret, err, fw_error_to_str(err));
>              return NULL;
>          }
> +    } else if (input.len == 0) {
> +        error_setg(errp, "SEV: Failed to query attestation report:"
> +                         " length returned=%u",
> +                   input.len);
> +        return NULL;

I still feel the described scenario is a kernel bug, as QEMU handles
len == 0 safely already AFAICT. I can't see how the upstream kernel
would end up in the problem state. Can you show the buggy kernel
code upstream.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


