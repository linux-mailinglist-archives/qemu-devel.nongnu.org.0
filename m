Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E2B2C7A58
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 18:43:13 +0100 (CET)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjQj9-0006kD-Re
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 12:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjQgY-0004yB-ER
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 12:40:30 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjQgW-0000Z9-B2
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 12:40:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l1so12025079wrb.9
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 09:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+6qdXjOY6vrmE6Qmyi7bU3EJYlzynrR+4aevvSOyP5I=;
 b=DdG2s7nNdlxoN0kYmoNUcUVjJqjFA46RYA2i0sjdX4htl1NRNFmMBc6kWJG/AaBnIv
 C/wvtCktDHyOG5zydT0ZYU5cGBEyFWibnfog4tqyEwrotny8VyA3RZqfO5Si11CY0rQC
 qKhDsu9wOVHQoSdkAZ/tqs5ULEOX+lbblXVo8V8BPCUWdvFTBX018O5OUyUww71h8EMJ
 VcB5nx1dxKRR8s+dcbtIIiXbYeqBZMPcuMrZOQ/iVz0KiXTXONQ57OnzLqHG2GZC7gJf
 t7nrY/EqQ50o8vzQWr3T3tusVUV/EbXQ6vJIJA8rFI84XvUvJP9MSxRUdCCKJ1Mp1XpU
 hXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+6qdXjOY6vrmE6Qmyi7bU3EJYlzynrR+4aevvSOyP5I=;
 b=GmLTFSn032VOQGbaZrLP8+aM6+9L9P1YcQ+dxyXBeK1szA/E8HDmci8yM58gHuQtI/
 FSIFzTLyIcnFWZUr+JzALV6IGzxM82KziKxD1RPo/janXB7Q/D9Uzu1Ly6bXaBPhjodD
 iVejJTNtzPdvYsu0AtV9SI3WjDyWYatoB8d0iElwxKllGqX4IrPU8y09CS/aPIcwYGHo
 AKN10ZY6fbLZwnZS6bU0pBXBWKVPXCwW6rA/Ka63qb+zMZFF0ulxh72dursqpz0Y2AeS
 uVDHj3CgTJjG0nLe6aFEAv0KG6LJvbug2mHGze3aJpgRAP03X+YeKi0SEJLduvPoyQiq
 H3BQ==
X-Gm-Message-State: AOAM532MLXvRVv8WUhUVwcht9dmxdCSvHbgwkMGoF7XQX2LdyQHmkWFT
 5HTRBgbZwh7EEwhrXv6/kLmQby+UyPcdhQ==
X-Google-Smtp-Source: ABdhPJyIoyrtFYyd+Oo23eiDZxY5m6tm6sw7TsjeQ490ZUv2F8COaWvvf9M/7vm01qSdfhwylAvF6w==
X-Received: by 2002:a5d:60cb:: with SMTP id x11mr24067104wrt.0.1606671625340; 
 Sun, 29 Nov 2020 09:40:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b4sm23379940wmc.1.2020.11.29.09.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 09:40:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/nios2: Roll cpu_pic/nios2_iic code into CPU
 itself
Date: Sun, 29 Nov 2020 17:40:19 +0000
Message-Id: <20201129174022.26530-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>, Wentong Wu <wentong.wu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Nios2 architecture supports two different interrupt controller
options:

 * The IIC (Internal Interrupt Controller) is part of the CPU itself;
   it has 32 IRQ input lines and no NMI support.  Interrupt status is
   queried and controlled via the CPU's ipending and istatus
   registers.

 * The EIC (External Interrupt Controller) interface allows the CPU
   to connect to an external interrupt controller.  The interface
   allows the interrupt controller to present a packet of information
   containing:
    - handler address
    - interrupt level
    - register set
    - NMI mode

QEMU does not model an EIC currently.  We do model the IIC, but its
implementation is split across code in hw/nios2/cpu_pic.c and
hw/intc/nios2_iic.c.  The code in those two files has no state of its
own -- the IIC state is in the Nios2CPU state struct.

Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they
can have GPIO input lines themselves, so we can implement the IIC
directly in the CPU object the same way that real hardware does.

This fixes a Coverity-reported trivial memory leak of the IRQ array
allocated in nios2_cpu_pic_init().  I think the diffstat on the
overall patchset is also a pretty good argument for the refactor :-)


If we did ever want to model an EIC we'd do it like this:
 * define a TYPE_EIC_INTERFACE QOM interface corresponding to the
   hardware's EIC interface.  This would probably be something like
   just a single method function (to be implemented by the CPU) with
   a signature
    request_interrupt(uint32_t handler_address,
                      uint8_t register_set,
                      uint8_t irq_level,
                      bool is_nmi)
 * implement that interface on the CPU to have the required behaviour
   (take the interrupt if irq_level allows, etc, etc)
 * add a QOM property to the CPU for "disable the IIC" (I think the
   only needed behaviour change for IIC disabled would be to make
   "ipending" and "ienable" RAZ/WI)
 * implement the EIC as an external device in hw/intc/ with whatever
   internal state, guest-visible registers, etc the specific EIC
   implementation defines. If the EIC allows daisy-chaining, it
   should implement TYPE_EIC_INTERFACE itself as well.
 * the EIC object defines a QOM link property that accepts links
   to objects defining TYPE_EIC_INTERFACE
 * board models using the EIC should:
    - set the "disable the IIC" property on the CPU
    - create the EIC
    - pass the CPU to the EIC's TYPE_EIC_INTERFACE link property


Changes v1->v2:
 * patch 1 now rolls the hw/intc/nios2_iic.c code into the CPU too
 * patch 3 is new: a trivial change to some code that I moved
   without changing in patch 1 to use deposit32()

thanks
-- PMM

Peter Maydell (3):
  target/nios2: Move IIC code into CPU object proper
  target/nios2: Move nios2_check_interrupts() into target/nios2
  target/nios2: Use deposit32() to update ipending register

 target/nios2/cpu.h        |  3 --
 hw/intc/nios2_iic.c       | 95 ---------------------------------------
 hw/nios2/10m50_devboard.c | 13 +-----
 hw/nios2/cpu_pic.c        | 67 ---------------------------
 target/nios2/cpu.c        | 29 ++++++++++++
 target/nios2/op_helper.c  |  9 ++++
 MAINTAINERS               |  1 -
 hw/intc/meson.build       |  1 -
 hw/nios2/meson.build      |  2 +-
 9 files changed, 41 insertions(+), 179 deletions(-)
 delete mode 100644 hw/intc/nios2_iic.c
 delete mode 100644 hw/nios2/cpu_pic.c

-- 
2.20.1


