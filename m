Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7173B78B8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:33:27 +0200 (CEST)
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJU6-0008IM-6W
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItF-0008BA-8a
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:21 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000tj-2R
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:20 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g192so99559pfb.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1eZd84MrBkQ4EtK0PZ1SOJT9XE+/f091S9/PfyqFFNM=;
 b=jQp7NEdldcfa5yQ4mQ8N/t7nyrZtU/bzgPnsjGRG0z/aDxEGc0kzFBtDhig9j9QcLq
 fTIFmDbImVST3PQBDEAU5RFa8og0++ptRmw8t4XSdPUSRonZkYzmsXD2LY5FMQ5PXAGL
 Wl02vB1pzFheMl+62MZaNFEuG7VZjzWiTGpsvFWJwxDDrV7jg14Yb+mopGi3XjwVs7pa
 G35pJsxMpie0TB+l2iVMJEPYUgZMRV7WikV0hBxTsSiMlScq7XYDZ5z92Jf4iPGV5ztk
 AVsKmzJ4oTpGCuvo9bixN+5mOL6YN2hCA1sByBV4t/UPSXsoX7l2T9d4XBh02u/vOrmn
 2x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1eZd84MrBkQ4EtK0PZ1SOJT9XE+/f091S9/PfyqFFNM=;
 b=U+oQ305tw/LV4M5w5ULOSmdl3lJpq7qJqHOZv9xznxGgfhODqnfvsQjPXD9T8WMBjW
 caUxRNgZlFBNqBOpXZcmrmd9x3lC8UWOc9Qgx6JFTIiOftgIIodS7DraqI68iVHTv4zB
 fWOG3WEzdPAi+M744C+G2lbb0vTKweBTPxeuRaN0NG8lMOluQnrHTG90DGiU9Nl63iRM
 OIawMcVxHMwGUbHOL8AQz5sLjw5fEOeBG7xo3MPW8sV3n4BKYCTckud3GYQ52b+YKU3e
 cVzQPJO2BNbFAs7rv+mcleIFarV16ZsRQCaN3TRGb/kPqpWWIRBn5C3v3pOTSrcs+PV4
 emfw==
X-Gm-Message-State: AOAM530/wZLk0OdrIL6CTZD1/x91vZN/6QirY7SbpoCu6+zmMOf/+NRI
 NoPdnZjNu59Wi8CoqBqu2UGwqUDw6zagrQ==
X-Google-Smtp-Source: ABdhPJxD6amcoq6J9nSZAz+S2eW/7PJDx/MEFXWDbwXgSy3vmscrfnJQpC4iOzQBqwQwrtMK4cUw8Q==
X-Received: by 2002:a63:5d5:: with SMTP id 204mr29525072pgf.72.1624992908561; 
 Tue, 29 Jun 2021 11:55:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/63] target/cris: Set cpustate_changed for rfe/rfn
Date: Tue, 29 Jun 2021 11:54:14 -0700
Message-Id: <20210629185455.3131172-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These insns set DISAS_UPDATE without cpustate_changed,
which isn't quite right.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 80276ae84d..df92b90d4e 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -2880,6 +2880,7 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
         cris_evaluate_flags(dc);
         gen_helper_rfe(cpu_env);
         dc->base.is_jmp = DISAS_UPDATE;
+        dc->cpustate_changed = true;
         break;
     case 5:
         /* rfn.  */
@@ -2887,6 +2888,7 @@ static int dec_rfe_etc(CPUCRISState *env, DisasContext *dc)
         cris_evaluate_flags(dc);
         gen_helper_rfn(cpu_env);
         dc->base.is_jmp = DISAS_UPDATE;
+        dc->cpustate_changed = true;
         break;
     case 6:
         LOG_DIS("break %d\n", dc->op1);
-- 
2.25.1


