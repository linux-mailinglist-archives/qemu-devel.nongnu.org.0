Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D2F5FDC12
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 16:08:26 +0200 (CEST)
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiysq-0001wS-Tj
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 10:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiymk-0004M1-Jx
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 10:02:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiymf-000489-26
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 10:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665669719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cDpQAoNALIq+h8KbThlvz2lpLVvK17PHPFb0cifDAek=;
 b=KVe+kOdtJbhkemtE0FRlmLiBU0UhC1lbHWJZvUCdCeIlxzxWD4eOHWIeaJRtDWvjgSLfje
 jqIcSlaTkiqI//YUgkZY/q32ZWrWCtjVJdSiZ0y/135O9bSxWM6HvOP6/Tw4MEvaowm9s3
 IP7OLoq/1MbGR/XRPvY8lntdcw4rGGU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-133-PFaal1ioMYS5ye9nvwexBw-1; Thu, 13 Oct 2022 10:01:58 -0400
X-MC-Unique: PFaal1ioMYS5ye9nvwexBw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r132-20020a1c448a000000b003c3a87d8abdso1233050wma.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 07:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cDpQAoNALIq+h8KbThlvz2lpLVvK17PHPFb0cifDAek=;
 b=o88YGvG85IuBlq+05miTbW6m1FnbF59hkChMDWstbt5RngnnNmqlPrkl683ysVog4W
 oRNDZJAJZUFCqmJjvyp2y4NYrkLU1nfmz2joF03Ufjf5LEJjlNkucMMVX3fV0gSyP0yU
 /OwnZgr3P6eIzq143rGlLFnlQIHtUp4xrq/QUre1kxC87DnUlXVgBxRfc78dHISMPM/d
 O5VV/X0k6fTTIbyf4fKJ0E1VvGuLutNi6bT0S5DLE26Hz6FXRAkE1R2KZ/YfaKg/jqnx
 kIcZaGNrfJT8ft++FEo46RdIZflG+S0J1Euqv4qJ7+xP+bP+OVsYMKPw1n54TimcktBk
 cvrQ==
X-Gm-Message-State: ACrzQf2QrU0bEjWtJtKb1omhbvySqvCkxYKs/HhV+i5I1QmjsZAIVcFY
 +4MBXhlYKHGskvMvLhuXq7S2meZnHVERh3g47P1ygn/JhxYRGimQv0e4mwZouN+T7nKIHYgE8Pp
 u5ma+z26wawyqAqQ=
X-Received: by 2002:adf:9d8a:0:b0:230:5212:d358 with SMTP id
 p10-20020adf9d8a000000b002305212d358mr62939wre.405.1665669717173; 
 Thu, 13 Oct 2022 07:01:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4imcYQGES8zlCKJ5HwmdvBAJVA4AYX5YQd3dYEFRhf977vBrZlmNHTSJaewCknJLwTPls8BA==
X-Received: by 2002:adf:9d8a:0:b0:230:5212:d358 with SMTP id
 p10-20020adf9d8a000000b002305212d358mr62913wre.405.1665669716922; 
 Thu, 13 Oct 2022 07:01:56 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bh15-20020a05600c3d0f00b003b31c560a0csm4736635wmb.12.2022.10.13.07.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 07:01:56 -0700 (PDT)
Date: Thu, 13 Oct 2022 15:01:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH 4/4] i386/cpu: Update how the EBX register of CPUID
 0x8000001F is set
Message-ID: <Y0gaUYeH3Wzojd6W@work-vm>
References: <cover.1664550870.git.thomas.lendacky@amd.com>
 <5822fd7d02b575121380e1f493a8f6d9eba2b11a.1664550870.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5822fd7d02b575121380e1f493a8f6d9eba2b11a.1664550870.git.thomas.lendacky@amd.com>
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
> Update the setting of CPUID 0x8000001F EBX to clearly document the ranges
> associated with fields being set.
> 
> Fixes: 6cb8f2a663 ("cpu/i386: populate CPUID 0x8000_001F when SEV is active")
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  target/i386/cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 1db1278a59..d4b806cfec 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5853,8 +5853,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>          if (sev_enabled()) {
>              *eax = 0x2;
>              *eax |= sev_es_enabled() ? 0x8 : 0;
> -            *ebx = sev_get_cbit_position();
> -            *ebx |= sev_get_reduced_phys_bits() << 6;
> +            *ebx = sev_get_cbit_position() & 0x3f; /* EBX[5:0] */
> +            *ebx |= (sev_get_reduced_phys_bits() & 0x3f) << 6; /* EBX[11:6] */
>          }
>          break;
>      default:
> -- 
> 2.37.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


