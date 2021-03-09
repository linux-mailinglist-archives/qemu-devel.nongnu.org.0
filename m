Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E9331FE8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 08:32:59 +0100 (CET)
Received: from localhost ([::1]:51058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJWrS-0000Rm-3A
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 02:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lJWo9-0006bY-1c
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:29:33 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lJWo6-0008CD-R0
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:29:32 -0500
Received: by mail-pl1-x62f.google.com with SMTP id e2so863415pld.9
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 23:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=FuyC5jnAooK41anpii2GAR0KlKISXfyvvpO9vXe/EVk=;
 b=LAaqidHDedQuBBUheQW/DtcfBcosLFEp+LmMIhRRBT0ghIZXTrYaCN0UU5OuA3qj97
 ZdctEw5jKd0+/oIVOXciepNkTS4f2v26XGy4AFxLnNdYl9PNOS0TYWhz/Y3eyroEUX9P
 s4LpLk86jNfy0BFXmx+hB7OptLTgxGJk2R8n34Xmdwf1ErkKSTNplhWVelkgRp9VsVKN
 Q++fEXyIhr9DUQsJ4KPtWLvu3XHNSNR1u8gZ/7eRPbWQfkP4CpNrSDysEiZ8ljWC9bWX
 hS9Iq0dZgzIu0jhKfq2NP8HMoZY2WG4eR7UXbCSXvN4UJDh8m6aVHgLq7h+/Ry8aV2aI
 Eoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FuyC5jnAooK41anpii2GAR0KlKISXfyvvpO9vXe/EVk=;
 b=XaSe6VjIQ9iJC5BFZ+LX/K23qJEisu47DqcdTSvtxKHTMKhVNqmaZ2lk6njxB+k8W5
 WDYYXu39MeUm1QVsMPlnE7Twmo3ypVx4N6ks2v24JxzIC0lymNFH8xPM+dT/6nc5+b2c
 jOmdqA6aj9YUUfA69ZZPETQ8RduCAkK0TTkqm01x352om6NvXQb4INDPWuKsk2KlKHIH
 nSh8MpC76BFtJi+ClUjitC4VQwehaOcdBop3rrH2ozy5JRu2AGkHM2XqN+AXFwIW92a/
 f5YhsRFREyLMne2O736vx3hmBS970g/RoPpViv8+NVsn6P/wGRMDrTJsgTH58OQjmc1f
 A1Fg==
X-Gm-Message-State: AOAM530zhIY0izAE2V6q20my417JBW8H2Ok+J47jBisFOgvdPR/HVL6a
 HnKqAOvK8cuHiV635d3SG5futc8eLgY0nQ==
X-Google-Smtp-Source: ABdhPJwuOH6XaNshPJXDN7kXJWOXKaBG9Fd5EQU0LaLKhI5adgW+6eWezwCvtcmYoeH/GT4YX0YY1w==
X-Received: by 2002:a17:902:a518:b029:e4:777d:33dd with SMTP id
 s24-20020a170902a518b02900e4777d33ddmr25064643plq.16.1615274968742; 
 Mon, 08 Mar 2021 23:29:28 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v26sm11822133pff.195.2021.03.08.23.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 23:29:28 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC 0/1] target/riscv: add RNMI support
Date: Tue,  9 Mar 2021 15:29:21 +0800
Message-Id: <20210309072925.4314-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

This patchset add suport of Resumable NMI (RNMI) in RISC-V.

There are four new CSRs and one new instruction added to allow NMI to be
resumable in RISC-V, which are:

=============================================================
  * mnscratch (0x350)
  * mnepc     (0x351)
  * mncause   (0x352)
  * mnstatus  (0x353)
=============================================================
  * mnret: To return from RNMI interrupt/exception handler.
=============================================================

RNMI also has higher priority than any other interrupts or exceptions
and cannot be disable by software.

RNMI may be used to route to other devices such as Bus Error Unit or
Watchdog Timer in the future.

The interrupt/exception trap handler addresses of RNMI are
implementation defined.

The technical proposal of RNMI can be found:
https://lists.riscv.org/g/tech-privileged/message/421

The port is available here:
https://github.com/sifive/qemu/tree/nmi-upstream-v1

To enable RNMI feature, add cpu argument: 'rnmi=true' and specify
RNMI interrupt/exception handler addresses with 'rnmi_irqvec' and
'rnmi_excpvec' arguments, e.g.
    -cpu rv64,rnmi=true,rnmi_irqvec=0x2000,rnmi_excpvec=0x3000

Frank Chang (1):
  target/riscv: add support of RNMI

 target/riscv/cpu.c                            | 40 +++++++++++++
 target/riscv/cpu.h                            | 16 ++++-
 target/riscv/cpu_bits.h                       | 19 ++++++
 target/riscv/cpu_helper.c                     | 47 +++++++++++++--
 target/riscv/csr.c                            | 59 +++++++++++++++++++
 target/riscv/helper.h                         |  1 +
 target/riscv/insn32.decode                    |  3 +
 .../riscv/insn_trans/trans_privileged.c.inc   | 13 ++++
 target/riscv/op_helper.c                      | 31 ++++++++++
 9 files changed, 224 insertions(+), 5 deletions(-)

--
2.17.1


