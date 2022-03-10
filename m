Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BBC4D4675
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:07:43 +0100 (CET)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHa2-0000fd-Vh
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:07:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxo-0006K8-Kq
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:14 -0500
Received: from [2607:f8b0:4864:20::52d] (port=45863
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxm-00083U-GB
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:11 -0500
Received: by mail-pg1-x52d.google.com with SMTP id z4so4467905pgh.12
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3YCeMoFSIPOtuFxyHW9qCFQJFQUeLRVbZvCIxi8q4XE=;
 b=FINuLbuz155DTpUngqqhLnixH2INKODooSjzfWh2RnsW6z4Mk4N6E7OlDKQ7hMKbPI
 pAozDFYy2B2meSoYAEyn2mzN03pae7B85xy7eG7dgKzoYULFQfAVOYBZ/AQvV6E4Cy06
 xyO+BNTG0iFhB+GaUlC1FZgsrbr7II/av3RKgAzKWVdC4MIflnrSBbYqkv5SSRt46esY
 sqXPDbCaGfVbQAQqBvCoMAOy9Nydjixzh9xagjVXuiUpA0Q7g/YUElBZlndEh08o14Tp
 vYkxSj0f0gHHcv+ZVy8OmW3rHmrlARUDw3lh8f5HdgPg45e/7fW0drPa5HBCkYobJbgA
 JIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3YCeMoFSIPOtuFxyHW9qCFQJFQUeLRVbZvCIxi8q4XE=;
 b=tR2eEXmBQlqY6CFqqoF3LX/3qutHsCeCJaKuRQeUXMbnkqIVp170oX/kQdqK4b4wun
 MDpri7/ZwtVbDrwS5zEEUT91GqXO/6mt7i4CVDfwzgZzSQ4JambKnsBdA71MLCqFoXKR
 KzsBvFAMgQXaIeolsJFl0Hn0eoClXPQuWc3kcFSK0Jd+ApOkO5qpzPCz6Ua65INpY0Dn
 xy4CN2LtWQGBUX6hL4JGvs1V/iGlii1lEYcxcPIzsSIqZau+jWJU/TTlYHn3XWCFctMr
 TqRneSyi5FddEMs6ZspspF5VzoyuQHZUd23bNLiCdL378IV0ut9FBSCMhKK1T3fDfPqi
 t6bA==
X-Gm-Message-State: AOAM531OD0cEF+GK+4UQg2Q2id3V6Cdwv3g1qMcHCNUieqsVpHkXPmWP
 aSWHJDqel3W13LvzRryAArAqluD3WYZm+w==
X-Google-Smtp-Source: ABdhPJw0sr2HXlqhbUthr43+X2Vyl7gnuxqLoQ81t7tdxEGt4Zzi84u0bqdtfXj4vGIvCJ/rMxaVgQ==
X-Received: by 2002:a05:6a00:24c4:b0:4f7:2fc6:50e8 with SMTP id
 d4-20020a056a0024c400b004f72fc650e8mr4176073pfv.63.1646911689247; 
 Thu, 10 Mar 2022 03:28:09 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:28:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 37/48] target/nios2: Use gen_goto_tb for DISAS_TOO_MANY
Date: Thu, 10 Mar 2022 03:27:14 -0800
Message-Id: <20220310112725.570053-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the reason for ending the TB, we can chain
to the next TB because the PC is constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 51907586ab..6f31b6cc50 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -834,8 +834,11 @@ static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     /* Indicate where the next block should start */
     switch (dc->base.is_jmp) {
     case DISAS_TOO_MANY:
+        gen_goto_tb(dc, 0, dc->base.pc_next);
+        break;
+
     case DISAS_UPDATE:
-        /* Save the current PC back into the CPU register */
+        /* Save the current PC, and return to the main loop. */
         tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
         tcg_gen_exit_tb(NULL, 0);
         break;
-- 
2.25.1


