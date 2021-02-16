Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBB131D09C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:04:28 +0100 (CET)
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5e7-0005pu-HC
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1lC5b5-0004Jv-2R
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:01:19 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1lC5b2-0003LI-SW
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:01:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id u14so14560238wri.3
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 11:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=7PKY3k6RLbp+wiclG4m0U834BMq23ehxIku6sx+bu6E=;
 b=fxHufIi4l04wgNHLGVbPLej0WjF2lKVjtNvgt3qRg5D+WT1nMw8eGOXJsMxE5EW+ve
 Bf6CE+INPkvbzSf4pgm0vkUECCtnLRFff5fK9k8SYqVtZ26T+AWPFN9XHM9gsF3j37VP
 Gxzl1lWwl1nO2aCgqC9fHroL7SEncDnYnniCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=7PKY3k6RLbp+wiclG4m0U834BMq23ehxIku6sx+bu6E=;
 b=RyjcCT3RLoPtsNfS5WW1YAsJbsuIWPGSIC27RCGdMSU4w/IO2e7HvaMNeVDreSnxRg
 ZAsi1eqFmxlb6ZiXuG+hgdL4dEkfNRLmzBimurKbMlQ11s7TazGMDSqq6okabMBRShoh
 NXeXvk8UCMBnQ2zj+6BFPXwsTSNbrP9ZUxqVro2fSZyHCOxCuJnKxdKrXZxIQkSoJI0Y
 1UrGYqkaiqgVDGr1YZd8cs9heh9kHDeAp5zOJJI1pw4b68c89dpOWmVHXdv20FrrtzwA
 vBzyT4s52zNnAXl/+Q23tf/2lgp6UU7A0dM45OzH/lafX0Sv1PzwtbxF8EOZ9XO+kEFa
 pMfg==
X-Gm-Message-State: AOAM533bDDDI/wuoX7CeqOOa/sMQN75hnwuYjGuNbA4CxyGGpDTLrpW0
 nugmQrksJ86bnR/9fOjMrEbZEA==
X-Google-Smtp-Source: ABdhPJy/DRgZar90Lk4NS95yhiosAqc45NNScOBQPY8Pia4lp/h6GUJ9deI9uuKnmPrqIIsAG7zEzw==
X-Received: by 2002:a5d:6602:: with SMTP id n2mr24533105wru.150.1613502075107; 
 Tue, 16 Feb 2021 11:01:15 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc?
 ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
 by smtp.gmail.com with ESMTPSA id q140sm6927306wme.0.2021.02.16.11.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 11:01:14 -0800 (PST)
Message-ID: <6cc082b0f12641ed38675cac776999b184c8020e.camel@linuxfoundation.org>
Subject: [PATCH v2] linux-user/mmap: Return EFAULT/EINVAL for invalid addresses
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurent Vivier <laurent@vivier.eu>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Date: Tue, 16 Feb 2021 19:01:11 +0000
In-Reply-To: <40acb232-a9da-951c-38fd-2fa1c529edd5@vivier.eu>
References: <b71cbfb68c227ae999e8caa5e247d5bb93ddad43.camel@linuxfoundation.org>
 <4309ac79-d729-682c-b3e2-7d657869566c@vivier.eu>
 <0fb977ec30a318ace2bb1853b9cca7b8d7cfcea5.camel@linuxfoundation.org>
 <40acb232-a9da-951c-38fd-2fa1c529edd5@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wr1-x435.google.com
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

When using qemu-i386 to build qemux86 webkitgtk on musl, it sits in an
infinite loop of mremap calls of ever decreasing/increasing addresses.

I suspect something in the musl memory allocation code loops
indefinitely if it only sees ENOMEM and only exits when it hits other
errors such as EFAULT or EINVAL.

According to the docs, trying to mremap outside the address space
can/should return EFAULT and changing this allows the build to succeed.

A better return value for the other cases of invalid addresses is
EINVAL rather than ENOMEM so adjust the other part of the test to this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org

Index: qemu-5.2.0/linux-user/mmap.c
===================================================================
--- qemu-5.2.0.orig/linux-user/mmap.c
+++ qemu-5.2.0/linux-user/mmap.c
@@ -722,12 +722,14 @@ abi_long target_mremap(abi_ulong old_add
     int prot;
     void *host_addr;
 
-    if (!guest_range_valid(old_addr, old_size) ||
-        ((flags & MREMAP_FIXED) &&
-         !guest_range_valid(new_addr, new_size)) ||
-        ((flags & MREMAP_MAYMOVE) == 0 &&
-         !guest_range_valid(old_addr, new_size))) {
-        errno = ENOMEM;
+    if (!guest_range_valid(old_addr, old_size)) {
+        errno = EFAULT;
+        return -1;
+    }
+
+    if (((flags & MREMAP_FIXED) && !guest_range_valid(new_addr, new_size)) ||
+        ((flags & MREMAP_MAYMOVE) == 0 && !guest_range_valid(old_addr, new_size))) {
+        errno = EINVAL;
         return -1;
     }
 


