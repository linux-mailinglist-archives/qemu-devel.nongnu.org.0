Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520B869F6D1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:41:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqJE-0003jg-TC; Wed, 22 Feb 2023 09:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqJB-0003iw-2W
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:41:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqJ9-00024o-Fq
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PfsG5DMetFuzBEjkHodWxxuvVXtGrylwCyzdwqZVZXI=;
 b=GhpA24F5rE2X43m10ooLI1ZFuOt0U9UXAT7NAwbp9CunEAm8DrQrRm0iUHi6kYAo3Toxpi
 ey0wK/y0E+2NGdpxy6dAmRFtvtrXRbexXEEFJCkKzaaPxxVLrdiHmnak1nyKlR5f20nq6+
 7Xs8QbNLdSfnL878naPrOj3IEPBwDUA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-299-HW2QdJN1Ns25SOV_ddWqaA-1; Wed, 22 Feb 2023 09:41:20 -0500
X-MC-Unique: HW2QdJN1Ns25SOV_ddWqaA-1
Received: by mail-ed1-f69.google.com with SMTP id
 co14-20020a0564020c0e00b004aab4319cedso10475214edb.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PfsG5DMetFuzBEjkHodWxxuvVXtGrylwCyzdwqZVZXI=;
 b=vtmIgNtKUiiYfVFLLrbJzdI4KBf6BS20ZGWotN5vr6job4OQ+GW4v01Q9KbGu2qW3Y
 Ea8frQRkW73aPZKaAbvAERnPtiRogTU6W1cDfGSYHJ4IE+CGXlFGNwVkPV3AwDmnc9wB
 Kzsv4/ky0Riq7MBYGQ86jfl/FtqMjKDUBh0fJ/fLmmF2xreOrtM2SruUQ3uq94XI6D62
 9ts64Z94yHsgKFiF/7fTaluvDEcCupZ08CUnEVTjLTSwC5a/6OVaSPU4aLdprmV95cuz
 9MY0QAdIvieXZrVZlUmAQQ+Z95aAB/vzL872VoB0arVqqtxDkn5Vk9qeKLvRX4jpWLe4
 4h+w==
X-Gm-Message-State: AO0yUKWhUlbXHtfNUQBvLprgNawVS6b3KmEZ2mGfcd4rJo4TQl6L2JaW
 gRtOoTmNX1HZLRL65R8rSb/QhpcThDPCfpMABA5iwlHeU9Ffkfeod8fb+KDEA2ptGyr/i6XncCc
 kN7tYafLceDFMCJN8ETycNDp9oAUwp0gMaOKBVgVZf3fna7RUxg5cGL2NLnqaN/jzhdw+u6xK
X-Received: by 2002:aa7:c692:0:b0:4ac:b614:dcfc with SMTP id
 n18-20020aa7c692000000b004acb614dcfcmr6525137edq.9.1677076879249; 
 Wed, 22 Feb 2023 06:41:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9WytsdYP2+HacGmGo0QLjMuMCPwOfggdHeG1muBDRHvAGXCGWfjwbJ9ZmO/MfMp8RKkKqYfA==
X-Received: by 2002:aa7:c692:0:b0:4ac:b614:dcfc with SMTP id
 n18-20020aa7c692000000b004acb614dcfcmr6525116edq.9.1677076878927; 
 Wed, 22 Feb 2023 06:41:18 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 c30-20020a50f61e000000b004aee4e2a56esm3993520edn.0.2023.02.22.06.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:41:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: TaiseiIto <taisei1212@outlook.jp>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 4/4] target/i386/gdbstub: Fix a bug about order of FPU stack in
 'g' packets.
Date: Wed, 22 Feb 2023 15:41:03 +0100
Message-Id: <20230222144103.467002-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222144103.467002-1-pbonzini@redhat.com>
References: <20230222144103.467002-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: TaiseiIto <taisei1212@outlook.jp>

Before this commit, when GDB attached an OS working on QEMU, order of FPU
stack registers printed by GDB command 'info float' was wrong. There was a
bug causing the problem in 'g' packets sent by QEMU to GDB. The packets have
values of registers of machine emulated by QEMU containing FPU stack
registers. There are 2 ways to specify a x87 FPU stack register. The first
is specifying by absolute indexed register names (R0, ..., R7). The second
is specifying by stack top relative indexed register names (ST0, ..., ST7).
Values of the FPU stack registers should be located in 'g' packet and be
ordered by the relative index. But QEMU had located these registers ordered
by the absolute index. After this commit, when QEMU reads registers to make
a 'g' packet, QEMU specifies FPU stack registers by the relative index.
Then, the registers are ordered correctly in the packet. As a result, GDB,
the packet receiver, can print FPU stack registers in the correct order.

Signed-off-by: TaiseiIto <taisei1212@outlook.jp>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/gdbstub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index c3a2cf6f2825..786971284ae7 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -121,7 +121,9 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
             return gdb_get_reg32(mem_buf, env->regs[gpr_map32[n]]);
         }
     } else if (n >= IDX_FP_REGS && n < IDX_FP_REGS + 8) {
-        floatx80 *fp = (floatx80 *) &env->fpregs[n - IDX_FP_REGS];
+        int st_index = n - IDX_FP_REGS;
+        int r_index = (st_index + env->fpstt) % 8;
+        floatx80 *fp = &env->fpregs[r_index].d;
         int len = gdb_get_reg64(mem_buf, cpu_to_le64(fp->low));
         len += gdb_get_reg16(mem_buf, cpu_to_le16(fp->high));
         return len;
-- 
2.39.1


