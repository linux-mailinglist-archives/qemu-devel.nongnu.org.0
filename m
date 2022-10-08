Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EA55F855C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 15:09:43 +0200 (CEST)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oh9aI-0004cM-49
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 09:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sisshiki@isshiki-clinic.com>)
 id 1oh9Yd-0002yz-On
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 09:07:59 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sisshiki@isshiki-clinic.com>)
 id 1oh9Yb-0004Rk-Bj
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 09:07:59 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 g1-20020a17090a708100b00203c1c66ae3so6888384pjk.2
 for <qemu-devel@nongnu.org>; Sat, 08 Oct 2022 06:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isshiki-clinic-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vAROz0sAFRZA2tLTAQPXPO1fuYDIUeuWvfgiObT8Qxg=;
 b=eHMD6canhjiaKP29pHC9gkrM1elTz46gEyxcS5O9fcQ1wlXXZy3eEZEqSBJBu6/5n/
 mSehoDC30KDUBjYu9wptzGKBxt/Jz9he4a5m821SD4tGFDXAoJKcoBjfZ+GRc9AoYE7N
 DBu7/P/cS33g9kwBOgOOAfA/eEp2djgHyGP91ac0F3RVAh9gWq4iEZkzaXte06zVnoAP
 bwNnLHlkSsvNs4gKzWzsgrR7chbBwLS0nj4rSIuzb2ND5qxvbWmgOT4+XeZAkDRdWC63
 hCqMYulUpypB404pReid3HvzFRbxLtWULWnl9FgQXwxQUsmUlgEN1WWQS2DurYX5eg33
 E6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vAROz0sAFRZA2tLTAQPXPO1fuYDIUeuWvfgiObT8Qxg=;
 b=3NEXnKA+1gOJxVEiYBLRPMmtt92s1nveVRpWY1xnVtLPXW8dBWm+PF9bIUvlBL4BO6
 V9tOWd00aF6pzwkyEWyz0XP10Lu5gGpm6FnEqUgEzxkOzBr2WXefBS43esa7QL8KcG18
 Fy4LSOXJaUBn/ORkBm+IbGur0VTP/Xn+CRjyV26rqpDn0w6kQq5IGeHMXZbHy5PQZ2my
 vJnn7KdOy9EC8v/kSQ4l4as0wA65gMweYjNxrdQSJb3xKgd70asRHZ3RWQmp1A7Bfl2h
 K0SEmFKDEQB0mVKD1oWLhsz0pAPJVUkuPOcNkvpbJE7jBBarWSf2IXQv8JBRqndKQonY
 XcgA==
X-Gm-Message-State: ACrzQf0fi1vzW0AVkvYl0Rg4KWpP0tFcbUvkjQllYXM6B1DmqtY+xeKk
 NXYr6N3yCsvphrWC0gupnXwDzw==
X-Google-Smtp-Source: AMsMyM5858reGsNJRJWxWON8fbmM4KdBVQcgTQQThVR2YcewTVS4pVBeZ50uPwkDZbpmJ+41GhJneA==
X-Received: by 2002:a17:902:a611:b0:178:6b71:2ee5 with SMTP id
 u17-20020a170902a61100b001786b712ee5mr9716531plq.53.1665234474570; 
 Sat, 08 Oct 2022 06:07:54 -0700 (PDT)
Received: from DESKTOP-8TCEJFK.localdomain
 (215.134.178.217.shared.user.transix.jp. [217.178.134.215])
 by smtp.gmail.com with ESMTPSA id
 u204-20020a6279d5000000b00535da15a252sm3458718pfc.165.2022.10.08.06.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 06:07:53 -0700 (PDT)
From: Soichiro Isshiki <sisshiki@isshiki-clinic.com>
X-Google-Original-From: Soichiro Isshiki <sisshiki@mac.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Soichiro Isshiki <sisshiki@mac.com>
Subject: [PATCH v3] linux-user: mprotect() should returns 0 when len is 0.
Date: Sat,  8 Oct 2022 22:06:43 +0900
Message-Id: <20221008130642.2158-1-sisshiki@mac.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=sisshiki@isshiki-clinic.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On Sat, Oct 8, 2022 at 12:41 AM Soichiro Isshiki <sisshiki@isshiki-clinic.com> wrote:
> A validation for wrap-around was added, I think it is neccesory.

I noticed the validation for wrap-around is *not* necessary, because it is done
by guest_range_valid_untagged().

Signed-off-by: Soichiro Isshiki <sisshiki@mac.com>
---
 linux-user/mmap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 28f3bc85ed..6f23a1ac39 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -124,17 +124,17 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
     if ((start & ~TARGET_PAGE_MASK) != 0) {
         return -TARGET_EINVAL;
     }
-    page_flags = validate_prot_to_pageflags(&host_prot, target_prot);
-    if (!page_flags) {
-        return -TARGET_EINVAL;
+    if (len == 0) {
+        return 0;
     }
     len = TARGET_PAGE_ALIGN(len);
-    end = start + len;
     if (!guest_range_valid_untagged(start, len)) {
         return -TARGET_ENOMEM;
     }
-    if (len == 0) {
-        return 0;
+    end = start + len;
+    page_flags = validate_prot_to_pageflags(&host_prot, target_prot);
+    if (!page_flags) {
+        return -TARGET_EINVAL;
     }
 
     mmap_lock();
-- 
2.25.1


