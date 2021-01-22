Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C772FFF51
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 10:39:46 +0100 (CET)
Received: from localhost ([::1]:48418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2suu-0006lA-Gu
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 04:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1l2ssx-00060L-Ec
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:37:44 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1l2ssv-0000wy-9p
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:37:43 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m2so3681378wmm.1
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 01:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=CyYF0H0kB75jUYJztneC1YXjx/AZ7BvdtZqdAJGMAAY=;
 b=fT4J8CVAil9Atjqpzv/156Ij53I3EHlBFOBIr4mPEaoxeg20AgP2vAkIYO/MR8F3V+
 SnL1RvIFQHrSLXOSizC4s0JDqQJgCfFhWzqJ/i4Gc6/6pUlWUfVTecG7Ihe/uLbswcTe
 IW31Y0vW4zUc3nVob6JuRUd5nq5BgXNAyQBMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=CyYF0H0kB75jUYJztneC1YXjx/AZ7BvdtZqdAJGMAAY=;
 b=BO9iLtLo7eXy1CqJUsQoTnA3gsYRFOxm0yJshCRxhMRhBt5eGTUc3G9EbA17doFBLk
 bOxUZUjeh/I8atd65yxoYoQQahiNeCy36mwfLUhegVp9jTMvy41MLyr/0cmdky6RBPbf
 D155YEc/W8X9HyUDEt8T2z4t0by6k2pf37hYZgeiv9oiGEauPTwEiuzLobYukEhWkBRu
 VsOHJSgdFDw56dj06kVAWDofb0vu98nEtOAGE1YMXak7yUNIsQVHd7aTgjZCmTs/T9U8
 BgJFjMa1zBq1ONkxk35SnXN3SLfDcc8Uq37ZOS2N/7geF8Qk34wpcgyO4eOCP4MNFk7R
 AK2w==
X-Gm-Message-State: AOAM532vzQ6xTl87RusvdB5rTT2oAc7jwr74iIBqFfxq4k79If1gmnnw
 rZaO5+dNMEt47mYIQCt/36WvgXDdfI/YwA==
X-Google-Smtp-Source: ABdhPJzPg2N5NcrD1kRFduUQclkB0lVcjR/9HfE/X39+BFS6wO9VXJA00Sg1uCi6vzs2GxAPK5InGQ==
X-Received: by 2002:a1c:2403:: with SMTP id k3mr3079779wmk.130.1611308258055; 
 Fri, 22 Jan 2021 01:37:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78?
 ([2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78])
 by smtp.gmail.com with ESMTPSA id l20sm12363295wrh.82.2021.01.22.01.37.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 01:37:37 -0800 (PST)
Message-ID: <0025f40ee1c0c4261fc3ce82c3095f5d1166b386.camel@linuxfoundation.org>
Subject: Re: [PATCH] linux-user/mmap: Avoid asserts for out of range mremap
 calls
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Date: Fri, 22 Jan 2021 09:37:34 +0000
In-Reply-To: <70c46e7b999bafbb01d54bfafd44b420d0b782e9.camel@linuxfoundation.org>
References: <70c46e7b999bafbb01d54bfafd44b420d0b782e9.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-01-08 at 17:42 +0000, Richard Purdie wrote:
> If mremap() is called without the MREMAP_MAYMOVE flag with a start address
> just before the end of memory (reserved_va) where new_size would exceed 
> it (and GUEST_ADDR_MAX), the assert(end - 1 <= GUEST_ADDR_MAX) in 
> page_set_flags() would trigger.
> 
> Add an extra guard to the guest_range_valid() checks to prevent this and
> avoid asserting binaries when reserved_va is set.
> 
> This meant a bug I was seeing locally now gives the same behaviour 
> regardless of whether reserved_va is set or not.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> 
> Index: qemu-5.2.0/linux-user/mmap.c
> ===================================================================
> --- qemu-5.2.0.orig/linux-user/mmap.c
> +++ qemu-5.2.0/linux-user/mmap.c
> @@ -727,7 +727,9 @@ abi_long target_mremap(abi_ulong old_add
>  
> 
>      if (!guest_range_valid(old_addr, old_size) ||
>          ((flags & MREMAP_FIXED) &&
> -         !guest_range_valid(new_addr, new_size))) {
> +         !guest_range_valid(new_addr, new_size)) ||
> +        ((flags & MREMAP_MAYMOVE) == 0 &&
> +         !guest_range_valid(old_addr, new_size))) {
>          errno = ENOMEM;
>          return -1;
>      }
> 
> 

Any comments on this? I believe its a valid issue that needs fixing and
multiple distros appear to be carrying fixes in this area related to
this.

Cheers,

Richard


