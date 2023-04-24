Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8979D6EC868
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:08:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsAj-0006Zq-JH; Mon, 24 Apr 2023 05:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAT-0006ZB-W6
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:07:30 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1pqsAO-0001JJ-Qm
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:07:28 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1a6817adde4so47115085ad.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1682327243; x=1684919243;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0ZLJMjIfbteWgeTcitGPEMCjIxn5hMvK2omBBWKwyY=;
 b=fq0Jyl4ZxwJPKbMeJLyxi9p0RP7KmtkU7WUA4tz8RC4/28JDQSA5PrCQYR1QIpn0sJ
 9V3Eam0beiDPJ0gMQfNjyqgjmaCampqBYvLatXsMPV83QqJRxrvO09bLBk2ndcjjneok
 IkFsiaAy6euujSRI2KFjRKCbW9XAQSW4cXU3z66eeHIXKzr70Zj479wojwyFQ6R2REhf
 Y5YGJkS/O52/SFkyfh2naJYgvrxN4sXPkmk4kGcqulVZi9u1KSHU3eUTqnadBg0BMkCw
 5S+pKOhIscj5ApEv0QP4ICl3URE+gJwmFyCtANSY5JSaLomfI5P8wHjyqAoywVWifj0a
 gKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327243; x=1684919243;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0ZLJMjIfbteWgeTcitGPEMCjIxn5hMvK2omBBWKwyY=;
 b=DhSSTOLh7CaUccqbzzePX+h1oPSM3f1IpUg6YK7svr77JkkpJ1VvVnhghlQOPl86LD
 wqJIzDvZlSHJ1SfI5UHvV8cwpca1ANEIbvPKcqvibKWDUCZSpu+HqfLepnIUbdfpRHfB
 ZIpfgLxVmtVZDynyh1/y/2ZWy36nrSW7D9eUl4un0mCzeddo6ZG9lPc81zHuIKnAaMs8
 2mAT7LOgyQoQCEnJcoTeM9vpTBKH+2TyZ+Y/kEeLgG3A011SZOEd3oESRnzWWsAHKv1J
 ci3tHOEeHtNcwfC8DOTXY+/KlYkT2EURFUUvXUHLvA5SEh1/8Fr3S+L0z8ugYxaRorBX
 Zsnw==
X-Gm-Message-State: AAQBX9f1RRQrDn/aZgY5IeudLH0i8YbHkzaufUGUyPOdTYa91bgsgP7O
 aja7lxMLC9BBklIFZ6dqjnQVVaA307k1bdLwaFt+910d1j+OWU3ZrTFQO6bT/k4K3XrgADqvh+Z
 uSVCUbSmc79T7deIAQaY2eMGfk6bnKr1bR+lLKSc/akUZrIr1pf4H1TwoNZBrOzSKn9GiUuKXfi
 aln5Lu
X-Google-Smtp-Source: AKy350ZoO57h/XuKK+tNI/Br+M4m5wQJx/Lip/K3clt+KuomxdZBHh9m4cRozL2p5KojAI5nWj8JMA==
X-Received: by 2002:a17:902:ead2:b0:1a4:fc40:bf04 with SMTP id
 p18-20020a170902ead200b001a4fc40bf04mr12594617pld.27.1682327242706; 
 Mon, 24 Apr 2023 02:07:22 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001a207906418sm6234820plb.23.2023.04.24.02.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:07:22 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH 0/6]  Add RISC-V KVM AIA Support
Date: Mon, 24 Apr 2023 09:07:02 +0000
Message-Id: <20230424090716.15674-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pl1-x631.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series introduces support for KVM AIA in the RISC-V architecture. The
implementation is refered to Anup's KVM AIA implementation in kvmtool
(https://github.com/avpatel/kvmtool.git). To test these patches, a Linux kernel
with KVM AIA support is required, which can be found in the qemu_kvm_aia branch
at https://github.com/yong-xuan/linux.git. This kernel branch is based on the
riscv_aia_v1 branch from https://github.com/avpatel/linux.git and includes two
additional patches.


Yong-Xuan Wang (6):
  update-linux-headers: sync-up header with Linux for KVM AIA support
  target/riscv: support the AIA device emulateion with KVM enabled
  target/riscv: check the in-kernel irqchip support
  target/riscv: Create an KVM AIA irqchip
  target/riscv: update APLIC and IMSIC to support KVM AIA
  target/riscv: select KVM AIA in riscv virt machine

 hw/intc/riscv_aplic.c     |  19 +++-
 hw/intc/riscv_imsic.c     |  16 ++-
 hw/riscv/virt.c           | 214 +++++++++++++++++++++-----------------
 linux-headers/linux/kvm.h |   2 +
 target/riscv/kvm.c        |  96 ++++++++++++++++-
 target/riscv/kvm_riscv.h  |  36 +++++++
 6 files changed, 277 insertions(+), 106 deletions(-)

-- 
2.17.1


