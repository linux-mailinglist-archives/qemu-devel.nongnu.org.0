Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440DE2EF6A8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:43:45 +0100 (CET)
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvnc-0001Rv-Ch
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1kxvmE-0000Uz-GM
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:42:18 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1kxvmC-0000SE-KI
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:42:18 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r7so9780792wrc.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 09:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=cK82wX6q+gunl6v30xsV8pEMyvOPReFlCx86bs7Jhi4=;
 b=BMNIqHDV6GoYuyVuyvdm4/8eSLqIko4p5lHlfFiuYRpIuGJf26RcOO32+Xx4so1Dy2
 KVKirmSVLyp5RvQnsyTHhGsNEGiYNl5HD2W4ElpsFdKz5X4pXJQ9sKqTy/l39ssGqeYZ
 JQO9OnBwoPP+hpqy1th3iFoAPY4qSTNP78yok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=cK82wX6q+gunl6v30xsV8pEMyvOPReFlCx86bs7Jhi4=;
 b=AEtirC66nu7hPF/jh3Xxrn2y4uETB6y6wN1CdKgxwUhAtrdwmYB+IQ8UkbzFIXWlpU
 iSyJg7GIY2ahr9ZG1O+uMG/un59wH9cKNwBYuyjBMFReT3pGDIRaPlnt2Bfj+48gEAX2
 A8ZwZTcrN+8Qh1KaocNRGKFXAg9teW51rFLXdZpO8WMrIPltd6of8KbX7lVt64TrXyKC
 zJsJOfNR7rsHLZUHvm02ciP1usSJR/QN+vlGrXulCe/2a/JGu4C+DbMNszDkIYFh6H8O
 ZZvO/cvzzEp2Yewpg6pXEb11XwN8BG8NVRB3IHNvutKVy49vDXh3ysVu4WVthqZr9VCm
 O1zQ==
X-Gm-Message-State: AOAM532PiR7ht02oCEbV24uZIDP/X2/zzGKJDq+d8ViFwfF828oq++FR
 NNw4CxZcykO+EhlC3oNKQAoP0ayXApg7QQ==
X-Google-Smtp-Source: ABdhPJz9GNVzsdper4+IZitk9H76kh3ttvbqm+rt1iZUdubHvIU8ViNbiUVnFtWWIXcHMO3LMjl7pw==
X-Received: by 2002:adf:e9d0:: with SMTP id l16mr4466828wrn.376.1610127734318; 
 Fri, 08 Jan 2021 09:42:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8262:2156:a38b:824c?
 ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
 by smtp.gmail.com with ESMTPSA id k6sm13076265wmf.25.2021.01.08.09.42.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 09:42:13 -0800 (PST)
Message-ID: <70c46e7b999bafbb01d54bfafd44b420d0b782e9.camel@linuxfoundation.org>
Subject: [PATCH] linux-user/mmap: Avoid asserts for out of range mremap calls
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Date: Fri, 08 Jan 2021 17:42:12 +0000
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wr1-x42e.google.com
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

If mremap() is called without the MREMAP_MAYMOVE flag with a start address
just before the end of memory (reserved_va) where new_size would exceed 
it (and GUEST_ADDR_MAX), the assert(end - 1 <= GUEST_ADDR_MAX) in 
page_set_flags() would trigger.

Add an extra guard to the guest_range_valid() checks to prevent this and
avoid asserting binaries when reserved_va is set.

This meant a bug I was seeing locally now gives the same behaviour 
regardless of whether reserved_va is set or not.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org

Index: qemu-5.2.0/linux-user/mmap.c
===================================================================
--- qemu-5.2.0.orig/linux-user/mmap.c
+++ qemu-5.2.0/linux-user/mmap.c
@@ -727,7 +727,9 @@ abi_long target_mremap(abi_ulong old_add
 
     if (!guest_range_valid(old_addr, old_size) ||
         ((flags & MREMAP_FIXED) &&
-         !guest_range_valid(new_addr, new_size))) {
+         !guest_range_valid(new_addr, new_size)) ||
+        ((flags & MREMAP_MAYMOVE) == 0 &&
+         !guest_range_valid(old_addr, new_size))) {
         errno = ENOMEM;
         return -1;
     }


