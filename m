Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D5D55BB39
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 19:05:38 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5sB7-0001B4-8P
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 13:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5rnP-0004TM-9i
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:41:07 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:37447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5rnL-0006Z0-1x
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:41:07 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso13037497pjn.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 09:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oOi+DoXNamcchYtk/5LRIx8vypDln25eD4Ti0nz/Yl8=;
 b=AZ5vvTy+XfFkE6nAf3xCL/Nkz/OOcLOpbTPBF4EJx8ITpC/l9PLstBlNApM5RzwWuy
 uwgreWyxgD+vOYufV9wQ8fqjlkInmBbmBkMzO2aULt/6VpCoKUGbpu0kPGK2zPPf45dN
 PuyMFIT+d85j7j81GH25qXVKBlzqtqde2tYsPDd6kb6C/kVZlPvRutYAG+RqvMOmSEtd
 eCYt0O4Nbya6VdQM/pvS1PbpBWeDJIkiVDmrTDyRmEhc9hoMsAXU6/JSkoiB2IJRldNA
 WegPXiUml2lnkwkJ8DBDn/rkk+2Ml1YG+493IvxcZncfv833S3KL0UvpA1fgNX0H8xtE
 tK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oOi+DoXNamcchYtk/5LRIx8vypDln25eD4Ti0nz/Yl8=;
 b=EKz+XmMkB4ME6TJ89SVTo0QVwY8dV4Dt0VrsyWEA1yxp5lVSZ8hWO4N9POpLcSfAhr
 DH/IwuEax60fUGeyZvxCaMBLrUKNRgJQTz5+ETzWS3aiLeb9KPA6e/h/eUSK7ft0F/Yr
 +S+nYP+QaxuLg+xSptSQtXNodGeFr04tQZaBKcuEbDCMMed/p5hXQfDL5w0/u/6suTzv
 daYKM5BKBvp3GV0KbZKtLsjj/tmSC7sNdiSF2B8RuaERg7G9RhGxhI+8sbphFSB5sdhM
 dqYowWaPJDxsrYSN/Wi0MkDEygKWooSApK7NGJMq9uYwrEIs0Mxc0Ql2X92/pNF6fqxo
 9SAA==
X-Gm-Message-State: AJIora9KhGqsvjSISiT26UM0j7U1SyVIEWnbzHB+KaH+6lypRFWb2ZT8
 tpT/EIK6aBK3dFypdeufxVUA5Q==
X-Google-Smtp-Source: AGRyM1syanIACDvCdQ+AlH1MxiD4dxGPVDJI7PN4wJ/j94/ppf/Ho8+NLls0RwYVoYtgN5wFleo34g==
X-Received: by 2002:a17:902:ca91:b0:16a:1126:c5af with SMTP id
 v17-20020a170902ca9100b0016a1126c5afmr373559pld.78.1656348061023; 
 Mon, 27 Jun 2022 09:41:01 -0700 (PDT)
Received: from rpathak-ThinkPad-T490.dc1.ventanamicro.com
 ([2405:201:1010:106f:39d1:78b4:ede5:f50c])
 by smtp.googlemail.com with ESMTPSA id
 n12-20020a17090ade8c00b001ec84b0f199sm18743772pjv.1.2022.06.27.09.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 09:41:00 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 apatel@ventanamicro.com, rpathak@ventanamicro.com,
 rpathakmailbox@gmail.com, victor.colombo@eldorado.org.br
Subject: [PATCH v2] target/riscv: fix user-mode build issue because mhartid
Date: Mon, 27 Jun 2022 22:10:44 +0530
Message-Id: <20220627164044.1512862-1-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

mhartid csr is not available in user-mode code path and
user-mode build fails because of its reference in
riscv_cpu_realize function

Commit causing the issue is currently in Alistair's
riscv-to-apply.next branch and need to be squashed there.

Fixes: 7ecee770d40 ("target/riscv: Force disable extensions if priv spec version does not match")

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---

Changes in V2:
- remove the stray format specifier
- add the Fixes tag and reference to external tree
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e4ec05abf4..509923f15e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -636,9 +636,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
             (env->priv_ver < isa_edata_arr[i].min_version)) {
             isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
+#ifndef CONFIG_USER_ONLY
             warn_report("disabling %s extension for hart 0x%lx because "
                         "privilege spec version does not match",
                         isa_edata_arr[i].name, (unsigned long)env->mhartid);
+#else
+            warn_report("disabling %s extension for hart because "
+                        "privilege spec version does not match",
+                        isa_edata_arr[i].name);
+#endif
         }
     }
 
-- 
2.34.1


