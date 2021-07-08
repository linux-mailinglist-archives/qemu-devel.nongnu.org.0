Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C0B3C188A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:40:23 +0200 (CEST)
Received: from localhost ([::1]:37280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Y0c-0005V0-UQ
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1XVQ-0003pi-GG
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:08:08 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1XVM-0008Rf-Og
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:08:08 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so4014661pju.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BG+kFD2r0et23C+nr0jstAj0aWQfOMfKOggOrYIFULE=;
 b=lNnFoIOcGAv+DPEcLndG+MGZ9U/Gjc8ynuL0nPanoKYvbN4ziOG/aTYAgEcSwRgHi9
 WLdUZhSdCrPqIDV7bGJXGQv6jno51P7wqre1kKZ8YDW1ldma9rENbXdZyg+18018sNZI
 9HWgTx73LcrwaGWcfvDUfmpVK3tK4quX7dTtzTx3QbjTWDRg/pimyX55rn/FpVQgG7rr
 iIGtWVsLBUaFj9nroglBs98dxNH9Oxp/zq79pkJV9D0yaALASJHGrTC86ILRuV+f65RC
 fO+lFFLN24Nb7EWAhxrIN9651iEvBctmg3+ymgMGLxKiThzPEBPIVuqkVSJJ/zStJKea
 Mrdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BG+kFD2r0et23C+nr0jstAj0aWQfOMfKOggOrYIFULE=;
 b=ci3rCSOPKdQaM8ljS+5hN2EKSujzMiQBVOLSpPLgjjwBgrO1PqzuqyR2vfcRC30FPj
 hX/hRFZAA9rPc7S3iEuZJxayn9GbhZxwY+57ILg0RFtJZnxbN/16GRfd4ksBBdcp454z
 Giw9X9ZAdCjZsDwnuQe6bAcUfcRPxddbb5xJRPj7+v5RX8K6iOeKkm0Ls0BsqAri5SP6
 qaETwTVMze65Mx80BKYVTHdz2lXZAS6APc2ZUYtusLMFgWIzmy3eFEGGOsgu3pYnYAG6
 wumUiQBNy2un5bg3VffouCsTEzsCJ5VnDDQYKrBBj25+OhManVtSqA5SMHPU8F2nx/0C
 NRDA==
X-Gm-Message-State: AOAM530WshvnBcDym6vLHbBBQFDS2Te+b+icDprdBqIPEM6TtYHEo0cb
 SUcAYuJ/WRCuH+NIGKHNFx7rEA==
X-Google-Smtp-Source: ABdhPJwcYz9TKEG73xQC4gxs4ElawWLI6PlFQ01f57So/Z6Hgzw6aXgYyA62SiS2u3Os/g9plVU0Dg==
X-Received: by 2002:a17:902:d2ce:b029:129:6eab:56de with SMTP id
 n14-20020a170902d2ceb02901296eab56demr24132573plc.64.1625764083086; 
 Thu, 08 Jul 2021 10:08:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id r13sm7001766pjj.9.2021.07.08.10.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 10:08:02 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
To: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org
References: <20210707134231.1835-1-jonathan.albrecht@linux.vnet.ibm.com>
 <20210707134231.1835-2-jonathan.albrecht@linux.vnet.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e6af279-6cb8-33af-8bf5-042dcb99f671@linaro.org>
Date: Thu, 8 Jul 2021 10:08:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707134231.1835-2-jonathan.albrecht@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com, iii@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 laurent@vivier.eu, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 6:42 AM, Jonathan Albrecht wrote:
> +                sig = TARGET_SIGFPE;
> +                if ((n & 0x03) == 0) {
> +                    /* An IEEE exception, simulated or otherwise. */
>                       if (n & 0x80) {
>                           n = TARGET_FPE_FLTINV;
>                       } else if (n & 0x40) {
> @@ -121,13 +123,12 @@ void cpu_loop(CPUS390XState *env)
>                           n = TARGET_FPE_FLTUND;
>                       } else if (n & 0x08) {
>                           n = TARGET_FPE_FLTRES;
> -                    } else {
> -                        /* ??? Quantum exception; BFP, DFP error.  */
> -                        goto do_sigill_opn;
>                       }
> -                    sig = TARGET_SIGFPE;
> -                    goto do_signal_pc;
> +                } else {
> +                    /* compare-and-trap */
> +                    n = 0;
>                   }

Nearly, but not quite.  Replace the ??? Quantum exception with n = 0, otherwise si_code 
will be garbage for that case.

The structure of the kernel code is

   if (n != 0) {
     /* do_fp_trap */
     si_code = 0;
     if ((n & 3) == 0) {
       /* select on bits 6 & 7 */
     }
     raise sigfpe w/ si_code
   } else {
     raise sigill
   }

The comment for compare-and-trap is misleading, because there are lots of entries in 
"Figure 6-2. Data-exception codes (DXC)" which arrive there and are not compare-and-trap.

As a general comment, I think a single switch over DXC would be cleaner for both kernel 
and qemu.  It seems like giving different si_code for e.g. "0x40 IEEE division by zero" 
and "0x43 Simulated IEEE division by zero" is actively incorrect.


r~

