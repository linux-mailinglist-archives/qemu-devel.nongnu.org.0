Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C7C6F5470
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:18:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8ci-0003Mk-RI; Wed, 03 May 2023 05:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8ce-00032d-Qt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:04 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8cd-0000Mg-0w
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:18:04 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f315735514so15053895e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105481; x=1685697481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WC01IUajOQVovgGje8S9D1xVOHkvVNHazKK2bsSkbgs=;
 b=WoBm1tBuYVLcFWmyFf/X/fgLa1BvNKPO5dsct1X4vwwZVr6MtR0miW3BSOdVoA01vE
 A4txyu0OM+RXD+POmUPjcntelipDxCPkAHVGBU6ZceSsESK8r80xuk2nJi5/pfz7wE4z
 vL/8WKJyPvBOeI0Ag9R4quQWC9crw/YlFtTNb/ZQFJvkwsv35YNLuB+6+g+j1DQn/man
 M13rhJs9C3Rxj9uumKnZNoDOVfzUMuKZQegQCvFyfGYWSqQsDuFlxRAggmtKTyiQpJOV
 Am73SV9Zu+1V86DlCdmfk9sg4ZZkxcw0eSijywEMEUqlVogs9r9LLNLmZdiqWdeb8xuC
 cCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105481; x=1685697481;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WC01IUajOQVovgGje8S9D1xVOHkvVNHazKK2bsSkbgs=;
 b=ZBVm5QXapqjwNhyATBUKFsXXlIFMsJLgBut9uCq6AuurbthZs8nQS76QJKJRkTpxeC
 z/rwFelrLOfLOLN+bV7HS/3HeH0Y433Bcj38k67+q6y3QDEfadTpi8cISphE+hQFeu+g
 BEhmK7wdYC0Mt1q3lEUJYXotef/Xwc0aRtXlX1uk0N5ngIcOaaDVm/Q2cz1lOHW0XVvt
 ecQYAOWsdYnTabRHYUyp2iQA1JAtyAmMa9LCCYfAN+nx6AKaaaQUBXNH1CiRyqAfN63N
 flF09QqSpuMHq9iNs8y/Q65+VPEGsfATneMSqKMfgbBPjUqFQ28us/k8gxC9QRXG8j77
 POlQ==
X-Gm-Message-State: AC+VfDyHTU3VVvNy3CTwv0msAbY7p57nfIucdcB/g/+6rBhQLD5UsUsZ
 kEAABKyuMaNYQd/whSf/nzWjsw==
X-Google-Smtp-Source: ACHHUZ6FGT/G7Up6Z4aE0dr/nD/yfuGFPxfueb4qq75dtT+UyR8uSZUPaxxD2hHjkIxTLPMCdpn52A==
X-Received: by 2002:a05:600c:1c21:b0:3f1:7371:86bb with SMTP id
 j33-20020a05600c1c2100b003f1737186bbmr846903wms.20.1683105481532; 
 Wed, 03 May 2023 02:18:01 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm1271469wmj.23.2023.05.03.02.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:17:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E8391FFC6;
 Wed,  3 May 2023 10:17:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 10/10] xxhash: remove qemu_xxhash7
Date: Wed,  3 May 2023 10:17:56 +0100
Message-Id: <20230503091756.1453057-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091756.1453057-1-alex.bennee@linaro.org>
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

Message-Id: <20230420150009.1675181-11-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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


