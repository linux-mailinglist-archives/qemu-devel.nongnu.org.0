Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787B331CA28
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:51:44 +0100 (CET)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBytL-0001dg-Js
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1lByrZ-0000F4-A3
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:49:54 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1lByrU-0000MS-NS
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:49:52 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 7so12607600wrz.0
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=2RT0tRM1DdPCMHJKfEDAFXrCcZMksfcII+bgaw6x+LA=;
 b=bkFWG5MkivNg5E8gtVuMz4sVogiz6XPnZWwtF7DDTrToXSwPSXAq/ZgmX6vdPr97oh
 SCj+BmKsf4UWcl/pVg0UhIKDrKJ+sd1hQ59AfDvA5E1y2cjDXpIb5U8i0iEwGhiAGWpB
 HAEJodOwGqdmUYBF1cK3dNPkTRM6UF4W+xdkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=2RT0tRM1DdPCMHJKfEDAFXrCcZMksfcII+bgaw6x+LA=;
 b=uapNHl+wx9g1+lMQ4ZbJ4JAEp0xfC2Ws6lRacREnP1jHBxYzZVops/fUAXTFR3KljY
 kjYybv8/+w/ln76i0RKyXeyZW6Sp8mAT6CrCQuSDKUa/7HTHJHgPcom7n7FzhZ3h2AGT
 uqwU3MbDo5wux98dP1zcFRTavbPwSwqhSDr+DrORwiafkyeTclY7B0/tlrENnDA0VK+s
 a+OEgh2upBpfKZAxrYg69+IdnEzaHOODtnVZFoc6T6MrOD6tt2BbYh9ESPu2S73ZwFa1
 5avKkjHBsZUCQBwjP+DQjIVDRNnTe/UdYMqHcXhS7CerlSoZmEjDE8LBlCH46igVnVLG
 89ag==
X-Gm-Message-State: AOAM533QdEcaStNleA0gXjunExLqKVEr4vsWDWTA1Ji/OHCoe7Dskold
 8j1/OhFqqI6AX7S+tALyITf51A==
X-Google-Smtp-Source: ABdhPJxmApyRm6QdTno1gHdDZ6aGiMwobTohFKYYJ5XOQAK8LSPrKKb/hH+8e49P68UFpjMZ1wJmLg==
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr23005998wrb.378.1613476186552; 
 Tue, 16 Feb 2021 03:49:46 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc?
 ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
 by smtp.gmail.com with ESMTPSA id n186sm3164948wmn.22.2021.02.16.03.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 03:49:46 -0800 (PST)
Message-ID: <0fb977ec30a318ace2bb1853b9cca7b8d7cfcea5.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH] linux-user/mmap: Return EFAULT for invalid addresses
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurent Vivier <laurent@vivier.eu>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Date: Tue, 16 Feb 2021 11:49:45 +0000
In-Reply-To: <4309ac79-d729-682c-b3e2-7d657869566c@vivier.eu>
References: <b71cbfb68c227ae999e8caa5e247d5bb93ddad43.camel@linuxfoundation.org>
 <4309ac79-d729-682c-b3e2-7d657869566c@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sat, 2021-02-13 at 18:40 +0100, Laurent Vivier wrote:
> Le 08/01/2021 à 18:46, Richard Purdie a écrit :
> > When using qemu-i386 to run gobject introspection parts of a webkitgtk 
> > build using musl as libc on a 64 bit host, it sits in an infinite loop 
> > of mremap calls of ever decreasing/increasing addresses.
> > 
> > I suspect something in the musl memory allocation code loops indefinitely
> > if it only sees ENOMEM and only exits when it hits EFAULT.
> > 
> > According to the docs, trying to mremap outside the address space
> > can/should return EFAULT and changing this allows the build to succeed.
> > 
> > There was previous discussion of this as it used to work before qemu 2.11
> > and we've carried hacks to work around it since, this appears to be a
> > better fix of the real issue?
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> > 
> > Index: qemu-5.2.0/linux-user/mmap.c
> > ===================================================================
> > --- qemu-5.2.0.orig/linux-user/mmap.c
> > +++ qemu-5.2.0/linux-user/mmap.c
> > @@ -727,7 +727,7 @@ abi_long target_mremap(abi_ulong old_add
> >           !guest_range_valid(new_addr, new_size)) ||
> >          ((flags & MREMAP_MAYMOVE) == 0 &&
> >           !guest_range_valid(old_addr, new_size))) {
> > -        errno = ENOMEM;
> > +        errno = EFAULT;
> >          return -1;
> >      }
> >  
> > 
> > 
> > 
> 
> I agree with that, the ENOMEM is returned when there is not enough virtual memory (the
> mmap_find_vma() case).
> 
> According to the manpage, EFAULT is returned when old_addr and old_addr + old_size is an invalid
> address space.
> 
> So:
> 
>     if (!guest_range_valid(old_addr, old_size)) {
>         errno = EFAULT;
>         return -1;
>     }
> 
> But in the case of new_size and new_addr, it seems the good value to use is EINVAL.
> 
> So:
> 
>    if (((flags & MREMAP_FIXED) && !guest_range_valid(new_addr, new_size)) ||
>        ((flags & MREMAP_MAYMOVE) == 0 && !guest_range_valid(old_addr, new_size))) {
>         errno = EINVAL;
>         return -1;
>     }
> 
> Did you try that?

Its taken me a short while to reproduce the test environment but I did
so and can confirm that using EINVAL works just as well as EFAULT in
the test case we have. The above would therefore seem to make sense to
me and would fix the case we found.

Cheers,

Richard




