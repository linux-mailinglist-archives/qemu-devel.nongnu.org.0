Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE10D31E0CE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:52:04 +0100 (CET)
Received: from localhost ([::1]:59294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTnn-0002oo-1Q
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLU-000877-CS
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:48 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:41225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLR-0007Jc-7b
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:48 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a9so5912465plh.8
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QO2Vfh3SDoVnZQbKSwcYrZxIMU26hsw0Q/rupUE+HGg=;
 b=wk7gWkKCCXe3sbvydpv9jvMbuk+LcpEufWNcC/3ijbfEp7892vzYI1qg55PVpeXP01
 kI86M62tueZcqOh65kRSc/HyLPCuZ7nPMaKmXYYfGms9Uib2pKyN0XA/SigG09c3p/2a
 sf6worgcrodHBbP+goWxqIo4X8/AzRyWGZbet5rpCyM+emLJ1bEkTFZNIkI0FdOYVEPr
 4Z5JY6PRewKmp/CwEGwsJm3OFfuDTyUoikaUFLgPxZbZrohrZN5kMr/+YpUvkuvs+8so
 AJuETo+uJ9fQ9B+n9rFEOo5hM/8gEAicml4hp9VE4BvrYF/1tpT/XZd+vTyeOVu5cz1c
 p11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QO2Vfh3SDoVnZQbKSwcYrZxIMU26hsw0Q/rupUE+HGg=;
 b=EOqc17ti9gvHY7SivuHYP1ulbX20dXD9egtMrK5/dZ7T3hXbIKyFUi6bghP546q3JT
 8nachrPvatI3Tzn+by0C0uf2e6P26cEy3TTguib43PqpzcSrQMxNYjkWXEAjmqE4Eolj
 XQqOiNCYlx7No4dnwPLGksZMozv4xcsjUGkGwxayuJaAx2i8f1rpYXbZjWTSTdQstImP
 MUl5SzS18vz4Fhsf4gkkThpGk+K3OsHhrb1EgvvM/lETiG90ov0T2Dpt4HPhBfMoITd0
 e4QvwgLTn3knyqihOKNFvCW97XEHzRdS9K1h+W6htLcBqFlTkC2h7Z2kWKwn3HXBXiEp
 iLqw==
X-Gm-Message-State: AOAM532d6+ZZecQjrByrQ0sEHZvAzheHk8Z/SxCA6VKDP2hAW7dKIQkz
 viH+Jkm3Q8B0OEj/Z9q6y0eO/VjfM50sfg==
X-Google-Smtp-Source: ABdhPJwsmRirTnVMa3mAkjbNOlTbg6XLtzA2nZc0v2XfO49qeg9rwY32jRv7feNhSXQ1KOwOROwI7g==
X-Received: by 2002:a17:90b:3781:: with SMTP id
 mz1mr554051pjb.178.1613593362977; 
 Wed, 17 Feb 2021 12:22:42 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/71] tcg/tci: Split out tci_args_l
Date: Wed, 17 Feb 2021 12:19:47 -0800
Message-Id: <20210217202036.1724901-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index bdd2127ec8..6e9d482885 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -184,6 +184,11 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   s = signed ldst offset
  */
 
+static void tci_args_l(const uint8_t **tb_ptr, void **l0)
+{
+    *l0 = (void *)tci_read_label(tb_ptr);
+}
+
 static void tci_args_rr(const uint8_t **tb_ptr,
                         TCGReg *r0, TCGReg *r1)
 {
@@ -417,9 +422,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
             break;
         case INDEX_op_br:
-            label = tci_read_label(&tb_ptr);
+            tci_args_l(&tb_ptr, &ptr);
             tci_assert(tb_ptr == old_code_ptr + op_size);
-            tb_ptr = (uint8_t *)label;
+            tb_ptr = ptr;
             continue;
         case INDEX_op_setcond_i32:
             tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
-- 
2.25.1


