Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FC1593A95
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 22:20:06 +0200 (CEST)
Received: from localhost ([::1]:38724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNgZA-0003EP-SG
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 16:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coder@frtk.ru>) id 1oNduw-00039j-Ol
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 13:30:23 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:39935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coder@frtk.ru>) id 1oNduv-0000Xh-3g
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 13:30:22 -0400
Received: by mail-lj1-x22d.google.com with SMTP id s9so8265868ljs.6
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 10:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=frtk-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc;
 bh=+CteDp2kmOqZ0ie91TWZnMVxcTuuiZ86qRQWo2bjA9w=;
 b=5wi5FeXny0Xp/Hrhad5wp4C6MYaS5TSjeJ9fsvoIOnrzzMkCZ81Uq/YWRTWLhc9avS
 8KmmIIEBuEY0GuwNXpKJAtQNqLt6JezgjTA4MFBfw5SWEHHlkkopwbadmF+U1ii4FNQf
 zgWZL/JqCKlvmzA6ExXiHl2gYUAE8Aw2CxCR/L5ihv0ATfwfoU6pa8iOJ+cCiOjR+piC
 Bfqem8S4wGoqSAzARBzkrqwEJ7dt2k52xDAELs7GtLYuUAtYEb1BoYvlYhBcGHzWKq2k
 ruT6Cs6YLIuUYXCEbuL5hWNofzZIMxBUBtCi1o65C2HWyE7N+pqMMSze1/yhnj9Omd3x
 5GIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+CteDp2kmOqZ0ie91TWZnMVxcTuuiZ86qRQWo2bjA9w=;
 b=iGPJZowrmuCLeNznd8EtkApufo5C/myp6fbPqFw+5/tc2YIc7PloNCmRihSE0Faw4u
 4FQKvTB8gzIN+3gPH3XXRC7kQIsqxi+IdQMCb0kjX2l2L3EtgOL7V/d5QfLqln64YgXH
 k89GhJrHlEUB+JNajM7KkQDZtUS8tjv+iFlhdFyRVeN85YvtApsWKDVn4Lkasfuo4jIZ
 ezdw08Inr5e7hvK/+CPRVbl6jrk92QusC/aBEn64aTL+E+LAHdDNSKbp7AnoJrGp+UO0
 wYnfEQbI1pi+hWxD3QVv+bE9kVuSbej2VAxJW8IJcyIlTzgKbCVFPEZW/r9yyXMoEUQR
 1ugQ==
X-Gm-Message-State: ACgBeo10knPgfJP8y7piCYxK8iYuvwwNox14n4hDjwnKUYPcjAH9Bpfq
 So2LNtw5Lfeqk3CAT3QeweZ5Mw==
X-Google-Smtp-Source: AA6agR4FnL7Fp5DRE7pG77wIE8XpGQDPFi1U5k3qoFrLKoOC9vL1ew98TPWFHK6PnDoSEdNIs4Rxxg==
X-Received: by 2002:a2e:86cd:0:b0:260:55e:db13 with SMTP id
 n13-20020a2e86cd000000b00260055edb13mr4929420ljj.146.1660584618401; 
 Mon, 15 Aug 2022 10:30:18 -0700 (PDT)
Received: from coder-comp.dolgopa ([93.175.20.83])
 by smtp.gmail.com with ESMTPSA id
 d36-20020a0565123d2400b0048aee825e2esm1141816lfv.282.2022.08.15.10.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 10:30:17 -0700 (PDT)
From: Maksim Perov <coder@frtk.ru>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Maksim Perov <coder@frtk.ru>
Subject: [PATCH] hw/riscv: Setting address of vector reset is improved
Date: Mon, 15 Aug 2022 20:30:10 +0300
Message-Id: <20220815173010.19638-1-coder@frtk.ru>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=coder@frtk.ru; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 Aug 2022 16:14:48 -0400
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

Previously address is set by default value 0x1000 which is hardcoded in target/riscv/cpu_bits.h
If add to new RISC-V Machine in which ROM area is based on 0x1000 address than there is problem of running simulation

Signed-off-by: Maksim Perov <coder@frtk.ru>
---
 hw/riscv/boot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 06b4fc5ac3..5e2438d39a 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -327,6 +327,10 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
     riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof(reset_vec),
                                  kernel_entry);
 
+    /* change reset vector address */
+    for (i = 0; i < harts->num_harts; i++) {
+        harts->harts[i].env.resetvec = rom_base;
+    }
     return;
 }
 
-- 
2.17.1


