Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1CA5BF1B4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:07:31 +0200 (CEST)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanH0-0004py-89
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8v-0001SL-WA; Tue, 20 Sep 2022 15:42:57 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:41663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8s-0001sA-D9; Tue, 20 Sep 2022 15:42:52 -0400
Received: by mail-oi1-x22e.google.com with SMTP id r125so5091811oia.8;
 Tue, 20 Sep 2022 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XEFMl/F9fXeFGAmmZTne9RFTH5sYwxvE5sveyj0yfbk=;
 b=TH7DhTI0ttrvfhcuzMjRBV015F1v/ml5yvmx4CCzo18egjfSpCxCOrdSEOD41uSXX0
 U7iVXwYGq+3LKLXXQEprAY+6IithN8hkKoPMlIAfv5PdZTED+ZLlRM6MxHR26i0kSNoG
 RT4AgrtJ9vZ2MP9MyGgLm/OiKR8Mkcsa6TJo8bBM5ADKHnHzV7h3mebp2WtUTcT8xhs2
 34xtOPZVd+BBQJViGWeg9KJoTPTiek+5Cqp9dj3cp9EfPvuN9UoDDOfB6PcEowLG+51h
 a9hPGFquY1Kz2FJICdGQpxYXymL/TRbPMGS6UwREnzhWMC9/K/zu+Vipd0kmfq5THQ0i
 JXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XEFMl/F9fXeFGAmmZTne9RFTH5sYwxvE5sveyj0yfbk=;
 b=7orWrqBnwCkBGNca+oIVlUzcPVqKakSoOp3ejVju2ahiYIXznqFt6s7igJPoVDWPkl
 rYDiJQx3vqRCBfc2YYB6Ay3U6PMoF+kjYWlNhuNyPaQC4JTTUbxEFz4DQBUnlGMZT381
 yggDHwt4afxe+0nvuGU1VnNsCsKVZBJVssuBnAlNDea6yhk6BeoZH6t1zKVOhZl4vudZ
 oszbqMvdM0SviwlUHtE0kKmaRX5pyJEyUa77/rV0EZJC3VFFw2/vdx/NO2YGW20aVxwe
 TDrxSWVxid1UjJCkaNjeoOX5Vghf9NDdIYBeBOduj7W6ZtPmVu+YT8zsjI0WtuQAWi7j
 9E0Q==
X-Gm-Message-State: ACrzQf20flSRyqQWWSTpt2ctevPSm0SaaX/MMRcoBaq0fIf6YetzDa4Z
 p/Kmks6GFVLbSyju2KXyfvB+Zq/7/Go=
X-Google-Smtp-Source: AMsMyM4rn+AIbxJPRmFqGJV8HaLQsZA9Rx0CyUcvMohw9mNFl8ZPmu3ABqGphsrskptPfDJNwNkP4w==
X-Received: by 2002:a05:6808:3013:b0:34d:7e2b:4f01 with SMTP id
 ay19-20020a056808301300b0034d7e2b4f01mr2371148oib.233.1663702959552; 
 Tue, 20 Sep 2022 12:42:39 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:39 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 11/17] target/ppc: Zero second doubleword for VSX madd
 instructions
Date: Tue, 20 Sep 2022 16:41:56 -0300
Message-Id: <20220920194202.82615-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

In 205eb5a89e we updated most VSX instructions to zero the
second doubleword, as is requested by PowerISA since v3.1.
However, VSX_MADD helper was left behind unchanged, while it
is also affected and should be fixed as well.

This patch applies the fix for MADD instructions.

Fixes: 205eb5a89e ("target/ppc: Change VSX instructions behavior to fill with zeros")
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220906125523.38765-6-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 32995179b5..f07330ffc1 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2167,7 +2167,7 @@ VSX_TSQRT(xvtsqrtsp, 4, float32, VsrW(i), -126, 23)
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                  ppc_vsr_t *s1, ppc_vsr_t *s2, ppc_vsr_t *s3)                 \
 {                                                                             \
-    ppc_vsr_t t = *xt;                                                        \
+    ppc_vsr_t t = { };                                                        \
     int i;                                                                    \
                                                                               \
     helper_reset_fpstatus(env);                                               \
-- 
2.37.3


