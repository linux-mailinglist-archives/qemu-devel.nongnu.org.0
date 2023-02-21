Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3611269D86C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 03:22:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIGb-0001hz-V2; Mon, 20 Feb 2023 21:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGG-0001cx-Fl
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:08 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGE-0008Em-U9
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:08 -0500
Received: by mail-pl1-x62e.google.com with SMTP id l15so4609067pls.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=atup5JzD1u28pHb0Z+S8hkpRI38cVehaAA91hoO5SKs=;
 b=Knk1M/Jd7wuSWsJ+ikRciTVUjGiojB8MLfIppiI52SRw1FEw+Iq3geY9c3psmc8ADo
 xgw4z975tkLnuT2ADIltw4uTMIYK7fVpwrOS7TISy7gCjBynAjXwmtACo0fwnn4byQP7
 fSWLxl31ixs/HzUck+z+gqpTuFJ+STXgfnvKrq2DDg8NcJObepYpTQ19BRFfSB5/vin0
 VYllOBo92AVu92dy6PMpn31eKfIw3PSemmsUgK3xbOW/x3/LQdsVSxO1p1Ci+U6hlJDu
 hIV92TA/DW/eR9rgIe48yZrmtKf0ZvPAFhtLqVYJZnoHCSjzwPLfBknom1eHuCg10uMt
 1o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atup5JzD1u28pHb0Z+S8hkpRI38cVehaAA91hoO5SKs=;
 b=jjUsgLn/QXKx1oGozHrpOU78Gf4FoqN4rorUKtgn0HnVDJrFZQd4FCZpNdVlZtDGM8
 HVwI9jgHTMcFU6L5+h8qTnUi95dLSE78OjzW4ATgBN/HPLUgCl3DtRIkr0IFNvczOqvd
 dy4w0CKKO/dPkFJ/P2ov8glMl55pyiAc+me/uDDXZUj/agWzTXhL0xOzBLiB8arV7dQY
 YEP2lD97kx6FLvknlpoJ79eANn15YvvqcDUtvEj7tS2c2D+0mInvBO7zhW+s3nC6Y2yp
 G3ZApQXwm7eUbUcdUCGyKdZN6CIXRrcMuWuXaIcvhZamA8DypI3u+RU5gS8AmwI5/hZs
 A2Xw==
X-Gm-Message-State: AO0yUKUaO1nnQsQf3e5jxzQ3wNPvDPZG0CYJumqdVBMBGTXWnoaJlDYb
 4AZzCN9S3hsUCwAMHSrmTiRfvvojChOrx5AUDf8=
X-Google-Smtp-Source: AK7set/wJ1yZQiF/JTxViwJQBmjNXtUVYcPDyX300xARs/f3A9p3eixoOdmYL8md6wfTyRl42RnDtQ==
X-Received: by 2002:a17:902:ce81:b0:19a:a650:ac55 with SMTP id
 f1-20020a170902ce8100b0019aa650ac55mr4788618plg.23.1676946005572; 
 Mon, 20 Feb 2023 18:20:05 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 07/14] target/arm: Fix svep width in
 arm_gen_dynamic_svereg_xml
Date: Mon, 20 Feb 2023 16:19:44 -1000
Message-Id: <20230221021951.453601-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Define svep based on the size of the predicates,
not the primary vector registers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 895e19f084..d0e1305f6f 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -297,7 +297,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     /* Create the predicate vector type. */
     g_string_append_printf(s,
                            "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
-                           reg_width / 8);
+                           pred_width / 8);
 
     /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
-- 
2.34.1


