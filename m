Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4A5884C9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 01:37:36 +0200 (CEST)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ1SB-0001TG-TC
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 19:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ1O7-0003H6-0k
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 19:33:23 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ1O5-0007mi-E4
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 19:33:22 -0400
Received: by mail-pf1-x433.google.com with SMTP id 130so7135607pfv.13
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 16:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=IugXNRq9zAwf3g2+57C9ciPWpdIXzCHebpc0gHhtpPs=;
 b=XPLtLL3F5oy+UVJLmNlyqz2ry76iM3TFvgoqrEbIEZR0S+JAAz/P57olgRixQXLzEg
 ZmEtsHFg4H4usx1GLuSXwQTlN/jPlcTn6mB3FBZqAVBFm09vpJkkt6WftAZ7z5TeCTQD
 vvebt/7u+YImKLpsFMI8OiBYSJpQbYZ8SoqbAX1Z+pV8z1Al49khvH4rHZlBGCwRRXF2
 B8+4FSGnB/fgABBuAw4YamoaXfr7T/IU4TtxDYiq1ggtVLHjdxQnTrTccBzT1+lUhBS1
 D0vKIjHQcZW4tJS7V4D+d2MKBgZfqVZKu7n60PBkRlhboEPdHcg5JJAVrDIvlrMpgess
 TLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=IugXNRq9zAwf3g2+57C9ciPWpdIXzCHebpc0gHhtpPs=;
 b=qVsYUEmrXQlK7hdqjQpGywvoqMg3ZdQxsCW4yXkZE7cniQjSfcHTzOQSjPS4iVR6w1
 rYC29VatwV53U3soo3e3VJw1p0QMfPJQl48Dd5lqDbSK7EieWilZAHz+a6OMCvBT9vpL
 SOBOM2sjZ4ZTpZ2En/9E9Xjw9gVLvmOa+b+V1DytMO+/1pnrivpnPyISRKr9FzPZsDh2
 aqa1uq/W0Az4+W1jAdsSVbZZM2ZyVQ2N0/PYeFclI9MYTE+6MqjsA2BBEL04zjrbo9Bc
 2joiRGiXAyUl4+RsSUVIPjYFDVSCqvEYydh5RzFC5y+jGUninonpGiIYU4QVpqNShJFH
 wMBw==
X-Gm-Message-State: AJIora8dfcVhAlw/TH81RS806AmyrOmAcEAB8fdo+3zzh/whQtoseEZL
 8fbv3cQ0o0ZC3ISPabYXvuvah9aN22vUGw==
X-Google-Smtp-Source: AGRyM1sC56QhUAk9qCFrdxZTG5MSQ5crsAznIQjoayhgdLUL23J7QnuM1P/ybDA1LOqb0yM6xlcXvA==
X-Received: by 2002:a63:1324:0:b0:419:afb2:af7b with SMTP id
 i36-20020a631324000000b00419afb2af7bmr18652638pgl.367.1659483199984; 
 Tue, 02 Aug 2022 16:33:19 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a170902a50a00b001636d95fe59sm250543plq.172.2022.08.02.16.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 16:33:19 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Heiko Stuebner <heiko@sntech.de>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v12 6/6] target/riscv: Remove additional priv version check
 for mcountinhibit
Date: Tue,  2 Aug 2022 16:33:07 -0700
Message-Id: <20220802233307.2106839-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802233307.2106839-1-atishp@rivosinc.com>
References: <20220802233307.2106839-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

With .min_priv_version, additiona priv version check is uncessary
for mcountinhibit read/write functions.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8753280e95b2..67367e678f38 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1489,10 +1489,6 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
 static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
                                          target_ulong *val)
 {
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     *val = env->mcountinhibit;
     return RISCV_EXCP_NONE;
 }
@@ -1503,10 +1499,6 @@ static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
     int cidx;
     PMUCTRState *counter;
 
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     env->mcountinhibit = val;
 
     /* Check if any other counter is also monitoring cycles/instructions */
-- 
2.25.1


