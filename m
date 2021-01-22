Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820012FFF52
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 10:39:55 +0100 (CET)
Received: from localhost ([::1]:48866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2sv4-0006wL-Ku
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 04:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1l2st6-00064U-Co
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:37:52 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1l2st4-00011e-PI
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:37:52 -0500
Received: by mail-wm1-x332.google.com with SMTP id c128so3740128wme.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 01:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=X/MhdIxKQVQioCvCjc1eSDFDP5NeTgmCS88UEuTJXFo=;
 b=M7r0lDQ4zUWkZhoi0d5LnM3HJvPp693VEC/cfSUOc+QLUCK4PBy/athm3CMySMHY7x
 qBSC29KsVL4MFyr9gn21CGH48HgvBVwehLOojS38Rhe6QXATHEk60N1zfbrhwX2KeEHL
 FPKzY6/o+6BWiIfTCcg4eGXiv14p7zdLrxQ3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=X/MhdIxKQVQioCvCjc1eSDFDP5NeTgmCS88UEuTJXFo=;
 b=gnIZL0LWX2JFfduFGss5Y19EaejJSjus5ftnpF15+oQ5pZNVyy5Jq+kHcWL17Z9om5
 Wdr6LvWWdzMSfXsEV8r1ge5Ar7M7R9/hDt5420/vNdiK/E33LlpwI5zfM7MticNaf/rh
 4em2PzQQlg0NU1034jxpFyR1ziDY/74HrC/pL9LRtY7YRc6Tw+yZkjF6psGutP+LJSUf
 S0+l8vMVe72VHQyJacON4V3qbsa3TapSgjisvw/tnHwrFCTBxshxqeP6lIarjVlKAAUT
 3SDnHNpz51u6vluYvmTEsfP2dG3HGREgacdNNxgRqPbkiyl3Qb2AFyn0ISORiQaL3uTn
 XSoQ==
X-Gm-Message-State: AOAM530KtjKGiB0tpkQVorYIpscHHGOdiJdyGIp3SHMuLATDxIGQliMC
 rVOx5KFuJ6MUjWnwtxDPKN0LiTxRzBDjIA==
X-Google-Smtp-Source: ABdhPJzSz22+zQU1edbSTQt1mchnT6HYrzuXG35JlhzxgMNjxaNEgGuTqK9n8CZP99Lwvz2yDtqUPg==
X-Received: by 2002:a1c:9a90:: with SMTP id c138mr3092153wme.147.1611308268621; 
 Fri, 22 Jan 2021 01:37:48 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78?
 ([2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78])
 by smtp.gmail.com with ESMTPSA id n9sm11538573wrq.41.2021.01.22.01.37.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 01:37:48 -0800 (PST)
Message-ID: <d4ea76d141067563c24aacc99dab9aa753cd55a2.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH] linux-user/mmap: Return EFAULT for invalid addresses
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Date: Fri, 22 Jan 2021 09:37:47 +0000
In-Reply-To: <b71cbfb68c227ae999e8caa5e247d5bb93ddad43.camel@linuxfoundation.org>
References: <b71cbfb68c227ae999e8caa5e247d5bb93ddad43.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wm1-x332.google.com
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

On Fri, 2021-01-08 at 17:46 +0000, Richard Purdie wrote:
> When using qemu-i386 to run gobject introspection parts of a webkitgtk 
> build using musl as libc on a 64 bit host, it sits in an infinite loop 
> of mremap calls of ever decreasing/increasing addresses.
> 
> I suspect something in the musl memory allocation code loops indefinitely
> if it only sees ENOMEM and only exits when it hits EFAULT.
> 
> According to the docs, trying to mremap outside the address space
> can/should return EFAULT and changing this allows the build to succeed.
> 
> There was previous discussion of this as it used to work before qemu 2.11
> and we've carried hacks to work around it since, this appears to be a
> better fix of the real issue?
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> 
> Index: qemu-5.2.0/linux-user/mmap.c
> ===================================================================
> --- qemu-5.2.0.orig/linux-user/mmap.c
> +++ qemu-5.2.0/linux-user/mmap.c
> @@ -727,7 +727,7 @@ abi_long target_mremap(abi_ulong old_add
>           !guest_range_valid(new_addr, new_size)) ||
>          ((flags & MREMAP_MAYMOVE) == 0 &&
>           !guest_range_valid(old_addr, new_size))) {
> -        errno = ENOMEM;
> +        errno = EFAULT;
>          return -1;
>      }

Any comments on this? I believe its a valid issue that needs fixing and
multiple distros appear to be carrying fixes in this area related to
this.

Cheers,

Richard


