Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223024BDA2E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:24:58 +0100 (CET)
Received: from localhost ([::1]:38248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM9cW-0001uW-MJ
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:24:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tai7sy@gmail.com>) id 1nM6Ij-0003r2-Ad
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 05:52:17 -0500
Received: from [2607:f8b0:4864:20::102c] (port=45820
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tai7sy@gmail.com>) id 1nM6Ih-00069Z-HJ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 05:52:16 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso15298439pjl.4
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 02:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Sw3Dp97c1QFbK4KkjRRiaxoQc2tNfkSCi867n9f1v98=;
 b=g7wJFOO/bDbezaAJNXz5uH7h/5pMJWPKjYT9UNG3YV/UT5eVt1cQNGPoQtsnAbX8Bz
 M/bIatbkpW1jlgUpLtKVuR4J73+WnJeevYiOdz/OeZs13GzbEzQUYY5zIm8i6RG2do0r
 qhPrGoxs5kmQArQJFC100jatUkkDZ4YYV5D9lbwfRDXiQIUU6P3Y1+fPzdvklr29WWKB
 3SW0CoQUJk02cfzGUxAyqDDn1VXLqjvxa8PQI36wy49UTSmHzLZwsL19FuCW+kuuWmDb
 via/RbqgYcIKtPVOoJW214WdAebZ+ZVLKEO1l3FOA2CanW+BwohJ1JLr+yWcJaDrYa7+
 LT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Sw3Dp97c1QFbK4KkjRRiaxoQc2tNfkSCi867n9f1v98=;
 b=7cE2wHhqcjFSAW/+V+f/yCXpHi7udT79fu3idOO8CZlaDgtiW1tkNcaYBvvhGVhwj1
 w0+IlP8KIJ5oVDKhms1/dHXi52ydgdn+YfqxKAGU2dffosVruw3PnNKRljZhLd7OTpXS
 NmgIl1mGftJZgY3z2t4rzqKLrumTfWjqxuUugYiWByqRNWS0kGPRvVJEV2wgefKx6PHc
 LIQ/GH5FHVoaxctnMOqADSQJbFOiZ1pBnK84aNRhymjiv9VBNeisPreVgM0s50R1lPgw
 8or/gz8RC9yA9QP/6AFsk4wZB4oGMCRJf48EqGxGM4X2edP3ZAzBn+4B08azuQ2RgjOG
 LA0w==
X-Gm-Message-State: AOAM533KVbabSLwaFZQqzn3dIMRdcuC/OrmqvTBfgkaXCBc96Ee9qG9E
 jAMGvsauH8/OjmlInU1UnBR3P5CsRN8YORk=
X-Google-Smtp-Source: ABdhPJxYOUe//tOB+Yoe6cgNbbsnnN7fzQGcI/0sSyAquArRH7UdMapd+tV7AQb8DQhEWqQs8SDauQ==
X-Received: by 2002:a17:903:40c6:b0:14d:c5dc:2604 with SMTP id
 t6-20020a17090340c600b0014dc5dc2604mr18249992pld.161.1645440730134; 
 Mon, 21 Feb 2022 02:52:10 -0800 (PST)
Received: from app.0c2w5jh2v1levhbyasxgagyywc.hx.internal.cloudapp.net
 ([65.52.179.246])
 by smtp.gmail.com with ESMTPSA id w198sm12795263pff.96.2022.02.21.02.52.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Feb 2022 02:52:09 -0800 (PST)
From: windy <tai7sy@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] The processor id in SMBIOS should be same as edx:eax that
 CPUID instruction returned.
Date: Mon, 21 Feb 2022 18:52:05 +0800
Message-Id: <1645440725-3865-1-git-send-email-tai7sy@gmail.com>
X-Mailer: git-send-email 1.8.3.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=tai7sy@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Feb 2022 09:21:19 -0500
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
Cc: windy <tai7sy@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: windy <tai7sy@gmail.com>
---
 hw/i386/fw_cfg.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index a283785..44f27ae 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -56,9 +56,14 @@ void fw_cfg_build_smbios(MachineState *ms, FWCfgState *fw_cfg)
     struct smbios_phys_mem_area *mem_array;
     unsigned i, array_count;
     X86CPU *cpu = X86_CPU(ms->possible_cpus->cpus[0].cpu);
+    CPUState *cs = CPU(cpu);
 
     /* tell smbios about cpuid version and features */
-    smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX]);
+    uint32_t edx = cpu->env.features[FEAT_1_EDX];
+    if (cs->nr_cores * cs->nr_threads > 1) {
+        edx |= CPUID_HT;
+    }
+    smbios_set_cpuid(cpu->env.cpuid_version, edx);
 
     smbios_tables = smbios_get_table_legacy(ms, &smbios_tables_len);
     if (smbios_tables) {
-- 
1.8.3.1


