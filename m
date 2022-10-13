Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D17A5FDBBE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:56:02 +0200 (CEST)
Received: from localhost ([::1]:43346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiygq-00038s-V1
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiyJ0-0008J2-Sb
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:31:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiyIz-0005eh-9k
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665667878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Aw9adUFB/juzsqoumphcPYb990OVAX41oP8SwYKW3KQ=;
 b=cjGhwYMI1wj0ZQETSyyK9k2ZyrY77xh9w9q8gL0pkD/coZTddT79GA8+7IAEj/SISb9z6o
 XJ+/CK2yjxWcgnDvqBEH/BZCFPL3t+3nDS5DYDKdiG0h20y3Ul070Eoj/lUTbmGwsymgx1
 i0x8X7l4c4gh/UNoJ/j8+JB64w34Ffs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-GeqbtvOGN5iuv5Ww1Vu1kw-1; Thu, 13 Oct 2022 09:31:16 -0400
X-MC-Unique: GeqbtvOGN5iuv5Ww1Vu1kw-1
Received: by mail-wm1-f72.google.com with SMTP id
 3-20020a05600c020300b003c5eefe54adso831248wmi.9
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 06:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aw9adUFB/juzsqoumphcPYb990OVAX41oP8SwYKW3KQ=;
 b=i2vFKpZ2eor4oaz61YuYjIREcAjJycyK4E15QrSEMdAzS1S2k59eCPT9Ut/NJ5jY6C
 PZDeCNn01KASCwHeSJz9N5KUVnel89hVZpzwVRrFGpUtZFs+OP3ayQDar7GvJex7ENH+
 JFjjN1OIgA1YXjZA1/cnSCwYmDv/rAEPON3Qma9sqLAxPsu7UbnKVV/71cOC/BTQGcqD
 G0J9Jcj//5s8QcTGhCsfGsc8WHdB7mvDtNV0dMlJlONywUgfDGCK+FvAO5jFsbEyqCU1
 r+0fZntCHGIwcjsrTMEHEik0KxSAiSRwRLIxQLxHMx0gKpT6boQdoZyMLS+V+5BwyVt6
 SAjw==
X-Gm-Message-State: ACrzQf1A/QA++D89+QykS1GMNP3Zg0QY5gSwY+pWmd3dpAF7WIo1Ygqb
 KidRQizlSH3xafup7yW+uVIsIMi/0Mb3/KQnm1ij+gvzGaX8dKtFyxeFy/Pz2b29S+Nag6onlJ0
 REkhjkDWFAscc4Pk=
X-Received: by 2002:a05:600c:2219:b0:3c4:cf31:8a13 with SMTP id
 z25-20020a05600c221900b003c4cf318a13mr6582343wml.122.1665667874990; 
 Thu, 13 Oct 2022 06:31:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7CU6hVSgwnUbjb0jsk7uAS5VvzrK3DptOzeRSw9zcV93zR9/Mmt/HG5Jjk7LyGJOGa3iT4sA==
X-Received: by 2002:a05:600c:2219:b0:3c4:cf31:8a13 with SMTP id
 z25-20020a05600c221900b003c4cf318a13mr6582333wml.122.1665667874816; 
 Thu, 13 Oct 2022 06:31:14 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 iv20-20020a05600c549400b003b4c40378casm5000447wmb.39.2022.10.13.06.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 06:31:14 -0700 (PDT)
Date: Thu, 13 Oct 2022 14:31:12 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH 3/4] i386/sev: Update checks and information related to
 reduced-phys-bits
Message-ID: <Y0gTICvjTDUd8Oqw@work-vm>
References: <cover.1664550870.git.thomas.lendacky@amd.com>
 <cca5341a95ac73f904e6300f10b04f9c62e4e8ff.1664550870.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cca5341a95ac73f904e6300f10b04f9c62e4e8ff.1664550870.git.thomas.lendacky@amd.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tom Lendacky (thomas.lendacky@amd.com) wrote:
> The value of the reduced-phys-bits parameter is propogated to the CPUID
> information exposed to the guest. Update the current validation check to
> account for the size of the CPUID field (6-bits), ensuring the value is
> in the range of 1 to 63.
> 
> Maintain backward compatibility, to an extent, by allowing a value greater
> than 1 (so that the previously documented value of 5 still works), but not
> allowing anything over 63.
> 
> Fixes: d8575c6c02 ("sev/i386: add command to initialize the memory encryption context")
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  target/i386/sev.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 32f7dbac4e..78c2d37eba 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -932,15 +932,26 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>      host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
>      host_cbitpos = ebx & 0x3f;
>  
> +    /*
> +     * The cbitpos value will be placed in bit positions 5:0 of the EBX
> +     * register of CPUID 0x8000001F. No need to verify the range as the
> +     * comparison against the host value accomplishes that.
> +     */
>      if (host_cbitpos != sev->cbitpos) {
>          error_setg(errp, "%s: cbitpos check failed, host '%d' requested '%d'",
>                     __func__, host_cbitpos, sev->cbitpos);
>          goto err;
>      }
>  
> -    if (sev->reduced_phys_bits < 1) {
> -        error_setg(errp, "%s: reduced_phys_bits check failed, it should be >=1,"
> -                   " requested '%d'", __func__, sev->reduced_phys_bits);
> +    /*
> +     * The reduced-phys-bits value will be placed in bit positions 11:6 of
> +     * the EBX register of CPUID 0x8000001F, so verify the supplied value
> +     * is in the range of 1 to 63.
> +     */
> +    if (sev->reduced_phys_bits < 1 || sev->reduced_phys_bits > 63) {
> +        error_setg(errp, "%s: reduced_phys_bits check failed,"
> +                   " it should be in the range of 1 to 63, requested '%d'",
> +                   __func__, sev->reduced_phys_bits);
>          goto err;
>      }
>  
> -- 
> 2.37.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


