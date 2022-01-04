Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657604840E8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 12:33:09 +0100 (CET)
Received: from localhost ([::1]:48626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4i3v-0000Lg-VM
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 06:33:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4i35-00086t-Ph
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:32:15 -0500
Received: from [2a00:1450:4864:20::42a] (port=36521
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4i34-0002iv-4e
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:32:15 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r17so75523162wrc.3
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 03:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yT+gANTJzhvLSKJ00i6kx5zZarxpdYRyDoY4W8MdHrs=;
 b=OTReLHwL4gSgBta73R99PP6+jOjFWEprMRoJMBWgCCDE6e9CZVG+hD75e4c4Ohv6mV
 HkTjMJJ33Oyg9MtposHzW4V1t8b2MDACkti+yhooe1ND+ie9ZELoa1f0crqdgx9BuzpO
 Yo05xaEPLOjQfJTTrOR2dNlB9B4CiQM/m+cDc3MAH+A7TxvVQjoUcyRnfl38/qI1im61
 VvFB/Q4mFavd3A4TzxY+p2jvorrGh+7kK1+2FcKqE8doGOUBAKODjCuRldzmyltj9rpw
 mV7Fp+JgsnDcGMp7ytTbDUI4DCGJ2C1MFYUfs6gZ5gMQmNky/q9h+/aTlDvy4UH3eLGp
 w1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yT+gANTJzhvLSKJ00i6kx5zZarxpdYRyDoY4W8MdHrs=;
 b=RnfMWuvFjb1RmR8PYM59jdgqpYQc0k0isDBan21R2NUGIt4xFGYpe4z/ubwgIvIU//
 onivjuADhiZwX9rtTZV4YaKglV2/Nj8iKCyhvKSzf+1pS7Z5M4G3d95SGR39MYB6q08s
 DyjZ2hIWhjqKZ69JnmDzUQeC885KUtwbebymABig+P/kDd8JRgE22Uvo5vASql63zhR3
 NhgYFccewp8zhqfss9ZvoS4d6ltKLWgKPQz6zfp9FyvV8UkvQ3u4ecId0zqr9HhsoztX
 VBl0MSYADGUazKisTK3wRQODCd5LpVNnVBCDjzphhSPvKwhnR0/qhwUTAbJctLb5k2OV
 jQtQ==
X-Gm-Message-State: AOAM533cvKkngGtT9I5D2dUy3UjF6oW0NOOLHlWbt4rhcA/Sn6LTQI0O
 sHmSqMqmEV+3WK88+tu67jsN+w==
X-Google-Smtp-Source: ABdhPJwgGfVDxIfyMIhcWLkhACwM7s1N5Qyf//rlpKiUpV86DTM+dHyq5gDXOqhfsVakkW7ulLxv6w==
X-Received: by 2002:adf:d225:: with SMTP id k5mr42497260wrh.360.1641295932266; 
 Tue, 04 Jan 2022 03:32:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g3sm37679984wrp.79.2022.01.04.03.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 03:32:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B7791FFB7;
 Tue,  4 Jan 2022 11:32:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: don't adjust base of found hole
Date: Tue,  4 Jan 2022 11:32:02 +0000
Message-Id: <20220104113202.766884-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pgb_find_hole function goes to the trouble of taking account of
both mmap_min_addr and any offset we've applied to decide the starting
address of a potential hole. This is especially important for
emulating 32bit ARM in a 32bit build as we have applied the offset to
ensure there will be space to map the ARM_COMMPAGE bellow the main
guest map (using wrapped arithmetic).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/690

---
v2
  - also make same adjustment to fallback
---
 linux-user/elfload.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 238979b8b6..fa9dae5f3f 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2293,8 +2293,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
     brk = (uintptr_t)sbrk(0);
 
     if (!maps) {
-        ret = pgd_find_hole_fallback(guest_size, brk, align, offset);
-        return ret == -1 ? -1 : ret - guest_loaddr;
+        return pgd_find_hole_fallback(guest_size, brk, align, offset);
     }
 
     /* The first hole is before the first map entry. */
@@ -2334,7 +2333,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
 
         /* Record the lowest successful match. */
         if (ret < 0) {
-            ret = align_start - guest_loaddr;
+            ret = align_start;
         }
         /* If this hole contains the identity map, select it. */
         if (align_start <= guest_loaddr &&
-- 
2.30.2


