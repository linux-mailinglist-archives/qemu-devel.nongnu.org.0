Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A115905D9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:27:45 +0200 (CEST)
Received: from localhost ([::1]:59694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMByC-0004SU-84
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnM-0006z0-4y
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnK-0000un-Ko
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id h13so22075407wrf.6
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=r1E74ZaWNn2P/5ThDCeDHfHuw0UPDT5gSmbhru7GXsY=;
 b=elre4/iwhtxwJZnQdKxhFNECMdA/Xljk2hGO2/gPjXD8B/IyuQR+wwqm+JYKncQ0cL
 CJKVPpsSeJippjlCFz4DnzWRubCm6BsAXLOt5z0BJqqkIdf52nsG28hIlKbq3iZujZ93
 VPRKzrFAr0ugNMkl+GfE3wo3kPCLT9Be3CvKcEQrRdlEjLqv8BsUcRRaPWH2qK3OCA4y
 pulobMQS9wdU8h3mVrbwDheeAWCISaQB4hR69qXNU6+Hc92YtDIo8v4SEmLyPteRQimK
 Bbf4GwTu89vTXPz8lauE331V5fTabThE/OI47NsUjJ60rN/hyQZ9n/oRYwUjfta7wvtD
 gCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=r1E74ZaWNn2P/5ThDCeDHfHuw0UPDT5gSmbhru7GXsY=;
 b=UgOL1KmcmeoqjwnwH9uL3g9szC8QDzDTRtwFlyNeFixfeQo0Db5O3snwXLkhbOfYXU
 20IwrGlWccmi/CjzHqqIE+a5Lgq4QriSF7GCEHFbKTFcQxgsvrRnbEK0EhRP/IZBXgRQ
 UU3JGtAxIxvQLKXMcyv71h3uNhi9xGqBaWN8YXhwt6SU6O3dhJaugcgdRlCJRrvfdAmi
 hC8eqDRjMjJk2ZKGPEhDPZp1FtFyOiTC9drUs/+IMVqeveGg0ppd7msC2gokuyFZa0Jk
 E0Jz6Ekp3W4XOvZPhgz7dD60XaXiO+/aIRXxb6T7uQf8Q7cGRfFhZiYTjgKoKLQkS3GB
 PfTw==
X-Gm-Message-State: ACgBeo3C1WIfRLe39HcSurlgGgHBS1+GSdlPg6wKiFPS1xlxk2UAvWaG
 dA1Q677btcXLiDb7MTtMVSPu2LD9TXCaIQ==
X-Google-Smtp-Source: AA6agR7RDpWYXBQ/v1hNwQgEARFJWDOn/tBvmqgcB/pPsh/2BeEFtqGYQc6ngtwe1BfFD+bgGtoVzg==
X-Received: by 2002:a5d:5848:0:b0:222:c8cd:288 with SMTP id
 i8-20020a5d5848000000b00222c8cd0288mr42196wrf.34.1660238189834; 
 Thu, 11 Aug 2022 10:16:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/10] target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'
Date: Thu, 11 Aug 2022 18:16:19 +0100
Message-Id: <20220811171619.1154755-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the ID registers for TCG's '-cpu max' to report a FEAT_PMUv3p5
compliant PMU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c   | 2 +-
 target/arm/cpu_tcg.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 78e27f778ac..fa4b0152706 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1072,7 +1072,7 @@ static void aarch64_max_initfn(Object *obj)
 
     t = cpu->isar.id_aa64dfr0;
     t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
-    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
+    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
     cpu->isar.id_aa64dfr0 = t;
 
     t = cpu->isar.id_aa64smfr0;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 3099b38e32b..4c71a0b612d 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -81,7 +81,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = cpu->isar.id_dfr0;
     t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
-    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
     cpu->isar.id_dfr0 = t;
 }
 
-- 
2.25.1


