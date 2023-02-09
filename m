Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B869004F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 07:25:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ0Lw-0000sm-T4; Thu, 09 Feb 2023 01:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Lu-0000s9-3c
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:24:14 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Ls-0007vq-5X
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:24:13 -0500
Received: by mail-pg1-x530.google.com with SMTP id r18so912727pgr.12
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 22:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7CUYidC2PYJ4aSSo65h6OAHrCirLGNVfJL1zZ8fOzVI=;
 b=ZiI62LHWMC7KlKecQDIy1C3+ekw76I6k4j1WyE6ErWJ8Fv2Pl17SA34CvnfjBOFSj+
 ZlQOKDdVgroh/eRt6cLdUoqdTvFaltt4V1FW7KtuTO+1GVhKS5JT7yOCZg0FBhYIFFt3
 xrcVOiNARQGlSMsNoW6g+YhAf+//Gex2Imns6s2tMxrUB5Pv4hnnqcnwvexfZzjKkaB0
 jYAznpXYkJFA/ydBmfRGx2IFa+TSXShJ8NJ/iWjWKKYOzG0xjQCNyBx2GzrB87WEX9pu
 dqYPhJHuSN+JDWPH3KPkG+tgPY7g1PDaMYvp6wbhfNJCvohomp39ZfrdFqEqHPeC/fb4
 BCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7CUYidC2PYJ4aSSo65h6OAHrCirLGNVfJL1zZ8fOzVI=;
 b=bXW/Optznz+KQKn9T75MP6BYHU8f7DAmz4zYvnm892t1VK02XwNQ8RGuLVxebBwZH0
 4Zsn2NVHlpw0Q9ejQHqrkJx45UVLQJ8QRGYeGEq1jbnRDEpuh+7UEkyflNFI3q0LC6b6
 GZyXCdJCkUK72Tm24XHdZJDr2+TbYiCzPlvj5WU6aYMg5HSo79kH2oUDDUcrqnyr8uX9
 qIBymJHD3Oq85xd29pXH0oiPwOFP1ZFqY0atsXOP6DsRX6IN2fBZPqKZgcE7K8rWCLN2
 xWIYETG4bvD49Pnbaiu9hIKzoEkQt11FlwHO+15xpMnXzWo7WES/nDI3tTAntDzufd69
 8VYQ==
X-Gm-Message-State: AO0yUKWezOjDlLYaqRzNNpNRdHXEadhels1QBJwwsDyiZYq3UO+Zhlhx
 jlMJ75XikkLSukmKVRKMUme9BQ==
X-Google-Smtp-Source: AK7set9f5ri3wD2OEEyMPyCqVcZGtrOhgEtsPIj7qAs7gAeNw5XGMcIHaPzeIxfY7NaBz7abj+jTFw==
X-Received: by 2002:a62:150a:0:b0:59c:8937:435e with SMTP id
 10-20020a62150a000000b0059c8937435emr9399084pfv.28.1675923849835; 
 Wed, 08 Feb 2023 22:24:09 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7800e000000b00571cdbd0771sm521919pfi.102.2023.02.08.22.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:24:09 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 1/9] target/riscv: adding zimops and
 zisslpcfi extension to RISCV cpu config
Date: Wed,  8 Feb 2023 22:23:56 -0800
Message-Id: <20230209062404.3582018-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062404.3582018-1-debug@rivosinc.com>
References: <20230209062404.3582018-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Introducing riscv `zisslpcfi` extension to riscv target. `zisslpcfi`
extension provides hardware assistance to riscv hart to enable control
flow integrity (CFI) for software.

`zisslpcfi` extension expects hart to implement `zimops`. `zimops` stands
for "unprivileged integer maybe operations". `zimops` carve out certain
reserved opcodes encodings from integer spec to "may be operations"
encodings. `zimops` opcode encodings simply move 0 to rd.
`zisslpcfi` claims some of the `zimops` encodings and use them for shadow
stack management or indirect branch tracking. Any future extension can
also claim `zimops` encodings.

This patch also adds a dependency check for `zimops` to be enabled if
`zisslpcfi` is enabled on the hart.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Kip Walker  <kip@rivosinc.com>
---
 target/riscv/cpu.c | 13 +++++++++++++
 target/riscv/cpu.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cc75ca7667..6b4e90eb91 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -110,6 +110,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
+    ISA_EXT_DATA_ENTRY(zimops, true, PRIV_VERSION_1_12_0, ext_zimops),
+    ISA_EXT_DATA_ENTRY(zisslpcfi, true, PRIV_VERSION_1_12_0, ext_cfi),
 };
 
 static bool isa_ext_is_enabled(RISCVCPU *cpu,
@@ -792,6 +794,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             return;
         }
 
+        if (cpu->cfg.ext_cfi && !cpu->cfg.ext_zimops) {
+            error_setg(errp, "Zisslpcfi extension requires Zimops extension");
+            return;
+        }
+
         /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
             cpu->cfg.ext_zhinxmin) {
@@ -1102,6 +1109,12 @@ static Property riscv_cpu_properties[] = {
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
+    /*
+     * Zisslpcfi CFI extension, Zisslpcfi implicitly means Zimops is
+     * implemented
+     */
+    DEFINE_PROP_BOOL("zisslpcfi", RISCVCPU, cfg.ext_cfi, true),
+    DEFINE_PROP_BOOL("zimops", RISCVCPU, cfg.ext_zimops, true),
 
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f5609b62a2..9a923760b2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -471,6 +471,8 @@ struct RISCVCPUConfig {
     uint32_t mvendorid;
     uint64_t marchid;
     uint64_t mimpid;
+    bool ext_zimops;
+    bool ext_cfi;
 
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
-- 
2.25.1


