Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1A6E97EA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:03:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVlt-0003qM-Rm; Thu, 20 Apr 2023 11:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVlk-0003dA-71
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:21 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVlg-00047W-I6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:00:19 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 he11-20020a05600c540b00b003ef6d684102so3204490wmb.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682002815; x=1684594815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mUGdFeLesXixgZdR4dkifVgmw89yr/nJqMOkP0ydlI=;
 b=Q9YAuYXcSydEZ7VVlWXZMKct4mjUM6fD40au3zTtI88VlqrXmktxXyF5zg3P0Sko0v
 SNapRdEd4veuK0oeO42R0L2zc+qLnqvIiPU3tv5L68CRJLQBMSyHD7iYP1sJLpPPIgF7
 W0ce3WLYbAdNQX15apEycgNs3ACmGZZkz8mquxW+Eec4kMRZRtxnhX/uYpdGEu4Oqzqv
 dWLupWIAIPHWIQd/Ug2EzV+uxkMzK0iG5FmdMg3StR1BQU+XTf34jt6kiDATxjDshs+k
 bTZJVyUqhe6Om+VmPErVOVBToY5RPm6EyzCBgQtVDsdij8f+zeQ25s0H7SqWGj4PK5W7
 ohIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002815; x=1684594815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mUGdFeLesXixgZdR4dkifVgmw89yr/nJqMOkP0ydlI=;
 b=RpCQgy4/NXx0jZzYHXBmbHiJpXWcvdL+ikBJlGHrSZ/sZMgSVo7RbysyCa1OSHAOb/
 yl+UGLcd3notU7VBJUGWmrZK0vSSbXcqvDuOlThXXGkbebcd7VZ2T1knl2hswjT/dIOv
 EsxAjpboiNxekh4ED8YgmuW+LKjEOLlApIf7TwUGoX+kxT2owvKWX++59OIjKyUgXQRs
 ULKOeVH0zcJxzyf/yaRBBeIJq2j+basJoGg1czZiVJWDGh7P6LIxakZca70kC+SlLTzY
 80XG11H/MBU1jeBMAQaZBSWrJvGqiv0ezTrXd85UbcqVjo0ubgMe0JRdWityBf8OTvLz
 obWw==
X-Gm-Message-State: AAQBX9elbEpfzPWYSqZ2yfeggxPG8PG25UBPvQM8+XWw23UmpBfUOdGV
 BvgMPPNoY5+GKBOdxD8/510FOA==
X-Google-Smtp-Source: AKy350Z0eD/OUhdLLjwd9Cpdx9kVYMjL2F31BxGwY+28wAAZ0M66//CX+/x3de5XCXUpRy+yaztniw==
X-Received: by 2002:a1c:7916:0:b0:3f1:72dc:8bae with SMTP id
 l22-20020a1c7916000000b003f172dc8baemr1625459wme.21.1682002815004; 
 Thu, 20 Apr 2023 08:00:15 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a05600c35c300b003f1836c98b7sm3334870wmq.48.2023.04.20.08.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:00:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 428B31FFC0;
 Thu, 20 Apr 2023 16:00:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Riku Voipio <riku.voipio@iki.fi>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 10/10] xxhash: remove qemu_xxhash7
Date: Thu, 20 Apr 2023 16:00:09 +0100
Message-Id: <20230420150009.1675181-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420150009.1675181-1-alex.bennee@linaro.org>
References: <20230420150009.1675181-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now we no longer have users for qemu_xxhash7 we can drop an additional
multiply and rol and make qemu_xxhash6 the implementation. Adjust the
smaller hash functions accordingly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/xxhash.h | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/include/qemu/xxhash.h b/include/qemu/xxhash.h
index c2dcccadbf..bab7d4ca09 100644
--- a/include/qemu/xxhash.h
+++ b/include/qemu/xxhash.h
@@ -49,7 +49,7 @@
  * contiguous in memory.
  */
 static inline uint32_t
-qemu_xxhash7(uint64_t ab, uint64_t cd, uint32_t e, uint32_t f, uint32_t g)
+qemu_xxhash6(uint64_t ab, uint64_t cd, uint32_t e, uint32_t f)
 {
     uint32_t v1 = QEMU_XXHASH_SEED + PRIME32_1 + PRIME32_2;
     uint32_t v2 = QEMU_XXHASH_SEED + PRIME32_2;
@@ -86,9 +86,6 @@ qemu_xxhash7(uint64_t ab, uint64_t cd, uint32_t e, uint32_t f, uint32_t g)
     h32 += f * PRIME32_3;
     h32  = rol32(h32, 17) * PRIME32_4;
 
-    h32 += g * PRIME32_3;
-    h32  = rol32(h32, 17) * PRIME32_4;
-
     h32 ^= h32 >> 15;
     h32 *= PRIME32_2;
     h32 ^= h32 >> 13;
@@ -100,23 +97,17 @@ qemu_xxhash7(uint64_t ab, uint64_t cd, uint32_t e, uint32_t f, uint32_t g)
 
 static inline uint32_t qemu_xxhash2(uint64_t ab)
 {
-    return qemu_xxhash7(ab, 0, 0, 0, 0);
+    return qemu_xxhash6(ab, 0, 0, 0);
 }
 
 static inline uint32_t qemu_xxhash4(uint64_t ab, uint64_t cd)
 {
-    return qemu_xxhash7(ab, cd, 0, 0, 0);
+    return qemu_xxhash6(ab, cd, 0, 0);
 }
 
 static inline uint32_t qemu_xxhash5(uint64_t ab, uint64_t cd, uint32_t e)
 {
-    return qemu_xxhash7(ab, cd, e, 0, 0);
-}
-
-static inline uint32_t qemu_xxhash6(uint64_t ab, uint64_t cd, uint32_t e,
-                                    uint32_t f)
-{
-    return qemu_xxhash7(ab, cd, e, f, 0);
+    return qemu_xxhash6(ab, cd, e, 0);
 }
 
 /*
-- 
2.39.2


