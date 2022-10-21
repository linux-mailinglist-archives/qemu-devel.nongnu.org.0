Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3B6073AA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:13:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo6B-0006Dh-9E
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:13:54 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHO-0003De-55
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmH7-0003Ai-OU
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:01 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmH6-0005go-4y
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:01 -0400
Received: by mail-pg1-x533.google.com with SMTP id b5so1801536pgb.6
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AwWY0LmSatCRIwkg33bhhLxAFaDGQf8EaVCLJgJX9aU=;
 b=RUwyoiJkbgSjWhd6l8SGRvriRE1hjRJlfuYU1qc5Ik606kiCjWQFUnYk+KZeA8pWrt
 rsKHTptNVUDsAMpgZYkYnPvC1A7OAFD+GMplcNakDTljb2KDCSuuxVezaYVQV6PqW70G
 7unmG9fZHy9EDxnnwgh6M/h/zOkQf5pvv54BzkQWab55PCaVI1MEmjbgmjSoUXp4qe96
 MS4YB9qpx48dk6jMoVrn1FTOZYcKr1VF7ZWzKrbuDp613kYwb+Souqubgd4SKyl4bDVN
 bYhydvfn6kdclXZ22+bt4A5WgQlqFzlfXgzLrZFlcJYfzx6JTt4GoZVwCd55Rt27udyg
 RAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AwWY0LmSatCRIwkg33bhhLxAFaDGQf8EaVCLJgJX9aU=;
 b=7wJT+WeiArY3SIF1Y7BCegXnHPDXfU0kjpUgNno4WG8Oa2Z60LeLXBA83riTqBBCGC
 G6s6UBfGq/SiNOpp7b+GSTn/TxwTtOIp3wttDTcMtqm/mTARcbWMT7Skaix8v3yInnIP
 eoNIPVSptKeLtImtEfZ0dhU8M9vf+DrcdMd1WpafiQAyYYo7PNdlciSL+kuzHYaIbNg7
 CDBDd6nO71vlgRWsL1ek+jaYyMj2mkURZfNyAtya6UEyu3ci1B/GImNgRwLiTllK3j/U
 szxxfDoWEhxhffdfdoS5OOVfXZxIDlRaKN/HW9Fuyv1yYUFC9EQTb3sFpDcM53BRiuF9
 jtRQ==
X-Gm-Message-State: ACrzQf1rI8pCjtwNfe58KoR65DR+DJLWftawBgZ9aqpTX88OkkdyTFTK
 EEJ7XKTgb64Rmth5EQhn2VevXvCNLI7okQUv
X-Google-Smtp-Source: AMsMyM7HO6YU3gFYPcFDOjiBeSCpFNfnmmEldrMb3aBgln33vI8PGmUaRCxE+T3hkL4PrL0vqqoAsw==
X-Received: by 2002:aa7:809a:0:b0:567:6e2c:2e2a with SMTP id
 v26-20020aa7809a000000b005676e2c2e2amr14442105pff.56.1666336618558; 
 Fri, 21 Oct 2022 00:16:58 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:16:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/36] tcg: Simplify calls to temp_sync vs mem_coherent
Date: Fri, 21 Oct 2022 17:15:25 +1000
Message-Id: <20221021071549.2398137-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The first thing that temp_sync does is check mem_coherent,
so there's no need for the caller to do so.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 135d9a9a0a..9fd58e46b9 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4117,12 +4117,8 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
 
     /* If the two inputs form one 64-bit value, try dupm_vec. */
     if (itsl + 1 == itsh && itsl->base_type == TCG_TYPE_I64) {
-        if (!itsl->mem_coherent) {
-            temp_sync(s, itsl, s->reserved_regs, 0, 0);
-        }
-        if (!itsh->mem_coherent) {
-            temp_sync(s, itsh, s->reserved_regs, 0, 0);
-        }
+        temp_sync(s, itsl, s->reserved_regs, 0, 0);
+        temp_sync(s, itsh, s->reserved_regs, 0, 0);
 #if HOST_BIG_ENDIAN
         TCGTemp *its = itsh;
 #else
-- 
2.34.1


