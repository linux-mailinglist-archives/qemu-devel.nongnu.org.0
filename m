Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5DE5387CE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:42:00 +0200 (CEST)
Received: from localhost ([::1]:55680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlH6-0001G0-1b
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlE5-0006o6-FE; Mon, 30 May 2022 15:38:53 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:44589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlE4-0008D6-0f; Mon, 30 May 2022 15:38:53 -0400
Received: by mail-pf1-x431.google.com with SMTP id g205so172891pfb.11;
 Mon, 30 May 2022 12:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tzxi57a4Nyv9nQAXUie7IHq8uaYskXtrhIjYfuzd22k=;
 b=M8yLfIuJ3ksZ/wr+M/5k4Xb0oCnurH1kaDaJ2LuLJ47ntv2uG6mDcDPpvds4YMFQUm
 INcu1c5rmFlWVHDqUjPVhe1u1EBsrQRBYYUdtlFREtvYESelBhT3pw6Eq1dgdKCaDo++
 naPdM5yyPUAP2W86kbBA27dFp+oHDn+y/MA2eIte03gpu6RxxJWzAIwYwsh+ugNaDkZu
 pFJRkuGj2uFI5MkiC5dvXkfBP3R4UkyDVDUi8hHyg5V9GBNFc7eF/68IcOXJJnh1aB7j
 3EZzu+abmB5STE6ENrMi1f8EbpUjwTvImpI7r6MnG9HVwmp09+edx1vw/aBZuBvlAW/o
 DQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tzxi57a4Nyv9nQAXUie7IHq8uaYskXtrhIjYfuzd22k=;
 b=jjaiBPzxYHdKvpWsLc8HgVQlft7CkMZRJ0UYXnmi0mqyyKs3q1iF9cTby9CLl1rSWV
 ComkWzCQha/trJtg/A7nhWoIVv+kofXLP9Cy++2Mpbr057C9Sg0EN8bGTHZS+J4bEozU
 4oXimsGQoCP9p0ByUjpnPxaAHWmvjKVxm/YJyeMdVhNszevn2K0NfHpwwruJVgPi67FT
 pnUTonDCXYKmAgd3cIyh7rG2bNYbukEguBV+hrqG8J2DSGKkGfG2/07cTTXf6oTvlIJk
 zx2fj5PG0n6rswcsNs92T63k8cK5Pm75if2ABE3Vb5A1IeJ+B7bwIaRbvezybaLh3JEC
 T7zQ==
X-Gm-Message-State: AOAM532mpslumo2TvQbXa4vyBQoowT6OERB05I6ws1YHLpq3mdNQ0zQk
 dBF2253WxXjzW5y5TZ3lPaIeEf4nFok=
X-Google-Smtp-Source: ABdhPJx35Vqyd0g0GUNppHz38SHtmi66jAjv+t2d71+q/aU3WMhnmNowjlTgtLXLoerMDc35607Ckg==
X-Received: by 2002:a05:6a00:1690:b0:517:cc9e:3e2d with SMTP id
 k16-20020a056a00169000b00517cc9e3e2dmr58202395pfc.0.1653939529254; 
 Mon, 30 May 2022 12:38:49 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v189-20020a6389c6000000b003c14af50607sm9011233pgd.31.2022.05.30.12.38.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:38:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 03/25] hw/sd: When card is in wrong state,
 log which spec version is used
Date: Mon, 30 May 2022 21:37:54 +0200
Message-Id: <20220530193816.45841-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add the sd_version_str() helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index b0e7a7e6d0..b3e61b9f84 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -145,6 +145,19 @@ struct SDState {
 
 static void sd_realize(DeviceState *dev, Error **errp);
 
+static const char *sd_version_str(enum SDPhySpecificationVersion version)
+{
+    static const char *sdphy_version[] = {
+        [SD_PHY_SPECv1_10_VERS]     = "v1.10",
+        [SD_PHY_SPECv2_00_VERS]     = "v2.00",
+        [SD_PHY_SPECv3_01_VERS]     = "v3.01",
+    };
+    if (version >= ARRAY_SIZE(sdphy_version)) {
+        return "unsupported version";
+    }
+    return sdphy_version[version];
+}
+
 static const char *sd_state_name(enum SDCardStates state)
 {
     static const char *state_name[] = {
@@ -968,8 +981,9 @@ static bool address_in_range(SDState *sd, const char *desc,
 
 static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
 {
-    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
-                  req.cmd, sd_state_name(sd->state));
+    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s (spec %s)\n",
+                  req.cmd, sd_state_name(sd->state),
+                  sd_version_str(sd->spec_version));
 
     return sd_illegal;
 }
-- 
2.36.1


