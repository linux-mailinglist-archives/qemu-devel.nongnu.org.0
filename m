Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C705FDC4C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 16:20:16 +0200 (CEST)
Received: from localhost ([::1]:51756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiz4I-0001T7-Tq
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 10:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiyHb-0006ln-Os
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:29:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiyHI-00055j-9M
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665667774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4KKY8/s+sQ9lr7rd7ALjTl6lLhXVb6v154EmyfSO0rM=;
 b=KQHHs1skr2k01mR55m6gNRGEw/6MWcIgFsuJ2G6dVcVoadd6a1O6PIP9U0blp1Px2k1EDj
 Zp7eKbWiU6iBNKiFHHgaZQjvU5EFZmhsPFhCBIL1G2yKtTD2eef/Ys3kLxJcTVMcGmPkcM
 mevothgFFAT2WgKG/SKpPpiOVccFW1k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-241-nHsEKKWiP_yXBIKuMQ81Dg-1; Thu, 13 Oct 2022 09:29:30 -0400
X-MC-Unique: nHsEKKWiP_yXBIKuMQ81Dg-1
Received: by mail-wr1-f69.google.com with SMTP id
 i26-20020adfaada000000b0022e2f38ffccso560434wrc.14
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 06:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KKY8/s+sQ9lr7rd7ALjTl6lLhXVb6v154EmyfSO0rM=;
 b=eE0KqFE86tIFrr0pwd5F9lNNhfV/Xqu8g4kMxP/25bPr0jjnm1++dwxsD8oXkgAP0X
 xhgLf+XWo1MvqhkwKNwPG5CoFB9Ags2Sr8RZC3yAL20wk0xE7BowKurpwMwngyLckhSG
 gmCvzbINV629pdX/J8qclS7noNxAuA6bhHD2JYOjGjX3YyNEodVpAA+JmZZRwminibAp
 StYzMmNR9lsZrgQt1CBrIXs0upsvz1wLp/nfzndCeSrZa8nF1U9ZdykOfCHL/UNGyi0X
 ygKFpsFc7VGF+UsiIhfJeGvnt4eGN2J3eagNSPjQXINK9WCaXE/RZkzcd6XjD9x/dCT0
 txJA==
X-Gm-Message-State: ACrzQf3IoS6kMsykP4hLKXGV+lzWs4n9J/YsNf6L47yn6tmit+Ndrdxc
 Dmm6sFcCCfqutq5z2Kh43DTC93xP5mzOWcjcm+hvUM5bwkor8X+WrGzJ4DpGtlOLzGwqYEeD6NI
 U3QwtLKf72DEUsTg=
X-Received: by 2002:adf:fdc6:0:b0:22e:373:939e with SMTP id
 i6-20020adffdc6000000b0022e0373939emr4286wrs.290.1665667769831; 
 Thu, 13 Oct 2022 06:29:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7G8cHIkuPk67dNvD/drU7XrtQ67tQo7bcihxyTxwEo+LRIraZZPwGx0hx1u7GGcQ1E6azzsw==
X-Received: by 2002:adf:fdc6:0:b0:22e:373:939e with SMTP id
 i6-20020adffdc6000000b0022e0373939emr4275wrs.290.1665667769658; 
 Thu, 13 Oct 2022 06:29:29 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b002305cfb9f3dsm2048230wrr.89.2022.10.13.06.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 06:29:29 -0700 (PDT)
Date: Thu, 13 Oct 2022 14:29:27 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH 2/4] qemu-options.hx: Update the reduced-phys-bits
 documentation
Message-ID: <Y0gSt44XtIOLvioT@work-vm>
References: <cover.1664550870.git.thomas.lendacky@amd.com>
 <13a62ced1808546c1d398e2025cf85f4c94ae123.1664550870.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13a62ced1808546c1d398e2025cf85f4c94ae123.1664550870.git.thomas.lendacky@amd.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tom Lendacky (thomas.lendacky@amd.com) wrote:
> A guest only ever experiences, at most, 1 bit of reduced physical
> addressing. Update the documentation to reflect this as well as change
> the example value on the reduced-phys-bits option.
> 
> Fixes: a9b4942f48 ("target/i386: add Secure Encrypted Virtualization (SEV) object")
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  qemu-options.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 913c71e38f..3396085cf0 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -5391,7 +5391,7 @@ SRST
>          physical address space. The ``reduced-phys-bits`` is used to
>          provide the number of bits we loose in physical address space.
>          Similar to C-bit, the value is Host family dependent. On EPYC,
> -        the value should be 5.
> +        a guest will lose a maximum of 1 bit, so the value should be 1.
>  
>          The ``sev-device`` provides the device file to use for
>          communicating with the SEV firmware running inside AMD Secure
> @@ -5426,7 +5426,7 @@ SRST
>  
>               # |qemu_system_x86| \\
>                   ...... \\
> -                 -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=5 \\
> +                 -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1 \\
>                   -machine ...,memory-encryption=sev0 \\
>                   .....
>  
> -- 
> 2.37.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


