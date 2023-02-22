Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42A869ECF0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:38:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexT-0007fS-6j; Tue, 21 Feb 2023 21:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexE-0007NO-BK
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:02 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexC-0001cV-Mw
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:00 -0500
Received: by mail-pl1-x634.google.com with SMTP id e5so8271389plg.8
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9iG9/NOmHP3MVj9nzPcx5U3Tkz40AHCYrjm18zTuNT0=;
 b=Bw6iPzI43P5H9s9qs63KgiGr4M6bWw6o1rWU47REeYdFGsXCUVWYjUs1lNaEgUZqJ+
 hmmrla5PtZsYOK3KPDDD4y2wAtz15vBzqKl8I05NGfSy5z3l5VJifbwJCrI8Ph5oTTBf
 TKHqoesEPjYpA8e4v5b42O1ofO4MUw+mQV1zFi8MYN2qcKiG83HF0uI5ytN+RqftTvfy
 dnByXPruz9+1op97yz2eIf93RIWLOu5SwfnKU6MBBzokREkcxBuH5E/TgRHMNBzPNFYP
 AaCGkY2xbZs2I3E1s3ZgHOKEUPQLGC1uWDGGJlLfPWZcY24oRYnqJ5oIxXbGB3hVDa6q
 6w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9iG9/NOmHP3MVj9nzPcx5U3Tkz40AHCYrjm18zTuNT0=;
 b=CQaUTU3The40z4MjRK0N8QZ746vuzSTGpZ2yvf5Gm3EoMI+ZYnIiCKGxtTG1dpZrr7
 DJ3x1Y0eofQnAmoumF2R17D8sX1m76oS4W/S4om6IgmPGqQdK5b18M6EY8h4pi5WeLC3
 td0JDqdM3BUt8n4Hew2XZxtSzvzdW1eJw1WNJYrYbB+5VPnh4Tjpygs+qujKphRRlbYp
 aghNxpk2m9NIPEJ6uYXwLjKDVsyDH6dqzD7u+GHQMID9ikvKpehrDr75JQOZTHh4kQzp
 pJtupbNZI6fphBNAP+CX2iq8tifZZ475x3rs/XwjykxDZspCbSnSmPbWt86F2VeLIUwX
 q5Tg==
X-Gm-Message-State: AO0yUKVzGgXTFbkRrhrzBKsLmQFED38gTruBOZAG6MlpxyOUDrnocTw2
 ZaMHnsvxwHAWpxAZhRqKgbNbO7ypeuW8cB9lmNg=
X-Google-Smtp-Source: AK7set+U0dRCrtUmqxO8aDlQXVBOTpSYOBn3aq20pGHlPuHOAYPXAlzdblIkf98b6JfqdtrIcb8K9w==
X-Received: by 2002:a17:903:2291:b0:19a:b427:2335 with SMTP id
 b17-20020a170903229100b0019ab4272335mr9823248plh.56.1677033237914; 
 Tue, 21 Feb 2023 18:33:57 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 13/25] target/arm: Remove __attribute__((nonnull)) from
 ptw.c
Date: Tue, 21 Feb 2023 16:33:24 -1000
Message-Id: <20230222023336.915045-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This was added in 7e98e21c098 as part of a reorg in which
one of the argument had been legally NULL, and this caught
actual instances.  Now that the reorg is complete, this
serves little purpose.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5a0c5edc88..9f608b12b2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -32,15 +32,13 @@ typedef struct S1Translate {
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                uint64_t address,
                                MMUAccessType access_type, bool s1_is_el0,
-                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
-    __attribute__((nonnull));
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi);
 
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
                                       GetPhysAddrResult *result,
-                                      ARMMMUFaultInfo *fi)
-    __attribute__((nonnull));
+                                      ARMMMUFaultInfo *fi);
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
 static const uint8_t pamax_map[] = {
-- 
2.34.1


