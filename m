Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08FE6834B8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:06:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMuzG-0000US-St; Tue, 31 Jan 2023 13:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxc-0007LR-RA
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:29 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxa-0000pT-T8
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:24 -0500
Received: by mail-wr1-x42f.google.com with SMTP id q5so15064721wrv.0
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yvHIRBCasGI/M7FOrkWVgk4VvqK1NIRoMsNprIYB95I=;
 b=ALUHW/7C5F5mpsTpPTOBfOzzUhvwbJuKGs0HnSr8oIT2YGEo0zXYcMD22dtxGJhIiS
 ErSXudYLWefsurCMki6vBH6LbWMO0V3US7vzr1lRhAIwTFyomgPPIhCHZwWzxTPYBnRs
 YkuNia/SmmtiYvPewpHckXK5C65ptZkpb3dXFPFgmZh/KvTB7jWor3VxwFA04hRbtugH
 apD6z4RbN4cecJQyFYLfINpkFMmSw/VaPAYGom8CBxmC3FHsR/sMrB3bgKopUPNnDD0D
 1cra/0syLG7S/58w4ob9HQ4D7xWyiutjXGobEkj176IADr6c7Mpgb64b6KykL3HNS39N
 r06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yvHIRBCasGI/M7FOrkWVgk4VvqK1NIRoMsNprIYB95I=;
 b=7vW1nvKip4spH2XEd+wUvud/zPpoTU1RTxMol79v2E5YakaZ1eK5OrOEMGX+WUAVBk
 2gcWtWy/cJXP7fMa6Q+9Snk9nuc3QrXVdtgrh8DpDMKoZC7Q4Vs+FSuxpiv/xFGzMPQa
 Zu3GAcKzLt0orF+cNEgSth0QtfzJYA6ddOEta1evbqle7DHseBdIRtEWYW+vvCdp17CE
 76o9Xr49e9Wy5PIo2/6xsf8hRjsvjyS6IhZmt6n9MMeln6s2m5+mdogAFqq85NHaNYTt
 VxpbjOy0Cn3Vq/rJ5onkaPhIQxwnpjM7B5AL2nLbMnx3erkNGSZEFXBNHOzdb0CjCPnn
 hqGg==
X-Gm-Message-State: AO0yUKUQ2y9uVQ7a6ECQkHglkQNAdXv1iSwIkpg5HCDTstuU2DGrSdF+
 091bMDQtCQgqgqzBD8T4qjzefg==
X-Google-Smtp-Source: AK7set/ySLEPTVGla8Biw5EYZb/JaH0yZSOpnGPxokZllnVNhjKOuMMZ/f/9DQ25aHMPQZV/amP1Pw==
X-Received: by 2002:a5d:694a:0:b0:2bf:f2f2:7d68 with SMTP id
 r10-20020a5d694a000000b002bff2f27d68mr6586719wrw.21.1675188142208; 
 Tue, 31 Jan 2023 10:02:22 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b002bc8130cca7sm15453146wrr.23.2023.01.31.10.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:02:21 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v4 11/14] RISC-V: Set minimum priv version for Zfh to 1.11
Date: Tue, 31 Jan 2023 19:01:55 +0100
Message-Id: <20230131180158.2471047-12-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
References: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42f.google.com
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

There are no differences for floating point instructions in priv version 1.11
and 1.12. There is also no dependency for Zfh to priv version 1.12.
Therefore allow Zfh to be enabled for priv version 1.11.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5679e2cb83..3078556f1b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -77,7 +77,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
-    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
+    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
     ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
     ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
-- 
2.39.1


