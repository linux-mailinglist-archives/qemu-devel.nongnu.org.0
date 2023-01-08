Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31626616DE
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:51:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEYtM-0001rf-8l; Sun, 08 Jan 2023 11:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYtI-0001rU-6t
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:51:24 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYtE-0001NE-VR
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:51:23 -0500
Received: by mail-qv1-xf35.google.com with SMTP id t17so4641964qvw.6
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 08:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdYBozkTmEnnxMe67YTmLz59tHO5RbfllBVv5dQ0Y3U=;
 b=4rt7y2byDKry2+p586uomYyFNjwAmFzcVrDWHeC4DA+tjQBH0bfYY/GNy5R/4LXWO0
 vUPbaVLARibxnHjFaBFykHYash4kiN8cJWqnauAhivVj2IY2jVcj+BZ6dOV+MSuAXpRS
 oBsdpKDyWnOiFd2+bCaiOGae7gBm0Jukh8YgsYu0/O+Pw6Tf2KUMC38vf4Go0BI6fskJ
 MK0euWrsNM1xV395CYwehCYWgFEvQldJl/1ikPVdAzYdZg3FqxR01l4TDqy/fHpjGJo9
 iy/VsNGWt66+7bCoUXSkKTZDRzxriggkjdzo0A/hsy+OD55zkLPiEWvByG00yp3mLGSO
 V5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qdYBozkTmEnnxMe67YTmLz59tHO5RbfllBVv5dQ0Y3U=;
 b=W5xu6xANTj5LvFr8dd57L0EfxOsdUQAePDc/iJeV6wD5EeiOP6AjrQ1Mr1dNVco7Qh
 BDEfGbQgoJ/SBsEWeU9EmDKZVODXEg2fMCXH/SQUN2keZdV28o3nWK8X5RluixQA4nBQ
 2/zjhFUhjPurTl2XhfpZXV8WDWMhYylaFjF9SPU2KNVbO94q40thnxih0YvpGKJyhoNe
 aVpze1dBwwEItrIyVKblYMrS1ekDyZ+wcuHbYq0Fhph2GVcC2DCWjPftBdS0ixMCg4CH
 QHCgXaKgPNv2YHEcFhMQLi67S0VWD7mZIaBflAnWy+UwIkeKLCFV2Kh0hU4aZj3OZsIH
 X0Vg==
X-Gm-Message-State: AFqh2krEuKO0dU734MZe7ZrjAE1lCMfSWbMOhRQHGvtdUtodxmVfo1Wk
 eCQTYaNOpRFJth0Bp3edHc8tYYgAlIEO/cRpGjv8JQ==
X-Google-Smtp-Source: AMrXdXvDW0olP9LtmWJ8A315j3/Q/IzEUFGybO59puD5PzbAn5d9EepFa2dFtgVk0BkW8ian7AfRhA==
X-Received: by 2002:a05:6214:1383:b0:531:a8f3:e8db with SMTP id
 pp3-20020a056214138300b00531a8f3e8dbmr45231241qvb.47.1673196678952; 
 Sun, 08 Jan 2023 08:51:18 -0800 (PST)
Received: from localhost ([185.156.46.146]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a430c00b006ee949b8051sm3912447qko.51.2023.01.08.08.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:51:18 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH 4/4] cpu-exec: assert that plugin_mem_cbs is NULL after
 execution
Date: Sun,  8 Jan 2023 11:51:07 -0500
Message-Id: <20230108165107.62488-1-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108164731.61469-1-cota@braap.org>
References: <20230108164731.61469-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::f35;
 envelope-from=cota@braap.org; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Fixes: #1381

Signed-off-by: Emilio Cota <cota@braap.org>
---
 accel/tcg/cpu-exec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 356fe348de..de4ba6e23c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -504,6 +504,7 @@ static void cpu_exec_exit(CPUState *cpu)
     if (cc->tcg_ops->cpu_exec_exit) {
         cc->tcg_ops->cpu_exec_exit(cpu);
     }
+    g_assert(cpu->plugin_mem_cbs == NULL);
 }
 
 void cpu_exec_step_atomic(CPUState *cpu)
@@ -1031,6 +1032,7 @@ int cpu_exec(CPUState *cpu)
 
             cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
 
+            g_assert(cpu->plugin_mem_cbs == NULL);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
             align_clocks(&sc, cpu);
-- 
2.34.1


