Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8A96A4F78
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:04:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmVQ-0008Fr-DF; Mon, 27 Feb 2023 18:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmV5-0007rL-Vw
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:49 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmV3-000125-AG
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:42 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c1so8515219plg.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UwykunfgJ4wHWdk7tq7XjhvoPxXNDp8LS8Cf559qMMI=;
 b=dD/Hxj+i4JO5E9/7bDVlNFbiuK2VqASHUD/v0D3HSg7yvIuvl2H+TnVnpwmmt1e/jU
 +0HrWsTnl+1PMWOseAJe7PuqtZCBeB8kjTn47dnGH3fi/v2XFcbGBlPqQ5UJxzo1XT5+
 531oqjqoxzZADgWOMYmgk+o9nTrCNYkkVNcBJYSKCepaihithtw7X/J7DWQeh6HB0HCI
 26OulfIkqGFxqM+4Jfq5lSueMN3B/C4pP8ZO+6JvJRNJpa7IYQUYUPb1lRwzDQJHR1Zk
 EcBBOumzNkI8bDoOdXV420SwGRAZbJgzUeq98t2YwWmeSGsnwtk7joCvbKYMGr/G7kBc
 LHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UwykunfgJ4wHWdk7tq7XjhvoPxXNDp8LS8Cf559qMMI=;
 b=AT90moaY9MWOgL5Mp9ErIDx6+lYKxft+1JKnuDbg7C0tqUzzwg1JMZ2XbZarGbelEG
 rilx/ANM8D48lghXQPyvAL8kMqDS2AzJv/sOXMSXowZmI0pxvukGwQ7WcgYv5WbBYmWM
 +Hkk9bEw0AEBtqOzfymJyBEQijSqDa5WCLdX/U6VXS6ML0Avo1I/woMNG/SgWD8LrfBg
 b/6W1O9ivKFnCSAD5thv30RsLLmKCvLhSA0apAyBOSe2IhbeUe1KN3VojNOHcmnRNt0/
 dfRNhZAbGt82izwc2Axt9ep7RJ3PG9RrIqTpXnzaPBTf+GAjzyMYy2NkKUYbU1RuopW6
 hKbg==
X-Gm-Message-State: AO0yUKVt3itDx1RoN1bCr15EnohTSud6ZUfHC/BfiFfiAbtWIzGEsF24
 3MTtSlA3Ob/WEQ7xVSS/8vrpwdUTJQXTgsB7lGI=
X-Google-Smtp-Source: AK7set+zHe6pFXCW3ErUEGvrsVtF+hniKQP2fBNoQb0btXJF/HnR5QtP/QK037pJWhXCnp6JI5wl/Q==
X-Received: by 2002:a05:6a20:8e06:b0:cd:1e80:587d with SMTP id
 y6-20020a056a208e0600b000cd1e80587dmr1482783pzj.23.1677538899838; 
 Mon, 27 Feb 2023 15:01:39 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v4 09/21] target/arm: Remove __attribute__((nonnull))
 from ptw.c
Date: Mon, 27 Feb 2023 13:01:10 -1000
Message-Id: <20230227230122.816702-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0788c342b8..1a51add39c 100644
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


