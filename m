Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7BF343D84
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:11:25 +0100 (CET)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHWu-0000yL-DI
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOHTP-0007DQ-C8
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:07:47 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOHTL-0002RP-OT
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:07:47 -0400
Received: by mail-pf1-x42e.google.com with SMTP id g15so10599226pfq.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jr7Nf4ZOpS+Hp/7sKCD1OOapTVuiNfoOxyZqmhUtVbY=;
 b=bfKGvzUMkZvD8O5vhedoiQESIMu4RIH7ra9TbytC80xVAXrARWOKCB2poUytDaP6wj
 s9jDQMsrGCCDPUAeBaGU+UIHKhlYuSnOmBDQMLl/bP7mTtJmwg3Z3Nu5v1uIYof9ojO/
 du/xCfvE55wVpRwvjiGSh2J+0vEKFNX6Wti7EOv1iuwVb8btaFwBcjiClNKhEHHefVNw
 aSRdgPf3l9D0CTMbSrdef/vcUyoEnnts+X67HI6H97qDN0NigY1NCR1Dfw06h/geCJzu
 lacTURJnhh/MWlA4ZrQ1dEIH6dYj5xhc3dU/7pxWHmi9ve+N7yOFgYHQeAxvMhyxCTkx
 VpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jr7Nf4ZOpS+Hp/7sKCD1OOapTVuiNfoOxyZqmhUtVbY=;
 b=fbhV2PaXqbsa8jnvYZwEM2Ilt2Crmgb2mgsOwB58p+KcD7SljXa7G/BmfkajzCzO1q
 +qj8TG6FAYpx020PI6DAO5GL4F5QLvd4hEtaGxBzZiaHuxvlj6evpb1kOyGndARC3VoU
 o7WDukaTFToJbfrrIUOKDYz2XsCD1BT3HsUOstlDGk++R1kPL4ccpeJehVa4gkemK49G
 X3OY50eiVzrA2a+DxrN9MbIHrhH8lr8jnHAiiOKvcyMrjDGQ97UVHtt37qE/bJyqDKR9
 9G0tM7buuL7dA1o68Z08jgzn33KE73YaFiZA8spFF0rttwbSoQP2IOX/byAce96s0m/g
 jYRA==
X-Gm-Message-State: AOAM531xXXBroBd2aA4F1EhTfdr96vLqLw+06dP9ceVWCcZfN0m9bcje
 kh0SRR7CoRsQAwJeNDeDZ47NIDKoejt8
X-Google-Smtp-Source: ABdhPJwQ4Wi0SoR8PB4nSaZaRr1CmjoII0BxMni5AwatVReMkZ7g3iZnb+rSf9kZIjl6gL5kuNwSng==
X-Received: by 2002:aa7:99c6:0:b029:1f5:c49d:dce7 with SMTP id
 v6-20020aa799c60000b02901f5c49ddce7mr20611403pfi.78.1616407659285; 
 Mon, 22 Mar 2021 03:07:39 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id c193sm13697145pfc.180.2021.03.22.03.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 03:07:39 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 0/3] target/arm: Add nested virtualization support
Date: Mon, 22 Mar 2021 10:07:23 +0000
Message-Id: <cover.1616052889.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=haibo.xu@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 Haibo Xu <haibo.xu@linaro.org>, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series add support for ARMv8.3/8.4 nested virtualization support
in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and
has been tested on a FVP model to run a L2 guest with Qemu. Now the
feature can be enabled by "-M virt,accel=kvm,virtualization=on" when
starting a VM.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-5.12-WIP

Haibo Xu (3):
  Update linux header with new arm64 NV macro.
  Enable support for setting KVM vGIC maintenance IRQ
  Enable nested virtualization support in arm64 KVM mode

 hw/arm/virt.c                      | 11 ++++++++---
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 16 ++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 linux-headers/asm-arm64/kvm.h      |  2 ++
 linux-headers/linux/kvm.h          |  1 +
 target/arm/cpu.h                   |  8 ++++++++
 target/arm/kvm64.c                 | 14 ++++++++++++++
 target/arm/kvm_arm.h               | 28 ++++++++++++++++++++++++++++
 9 files changed, 79 insertions(+), 3 deletions(-)

-- 
2.17.1


