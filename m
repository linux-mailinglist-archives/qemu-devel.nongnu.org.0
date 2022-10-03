Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8D75F27FD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 06:20:41 +0200 (CEST)
Received: from localhost ([::1]:38358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofCwa-0000ey-Qi
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 00:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ofCr4-0003Xk-4x
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 00:15:03 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ofCr2-0006TP-M2
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 00:14:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id 10so5045252pli.0
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 21:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date;
 bh=6zUl2HU3Z5FB+WM/KgUcWz+nUT78Ab2AAKdW88gdUHQ=;
 b=ZHwJ7nmSA/HhiRQZq0meor3/TLygrMmciw6ONBwKishhaJTkeuqYbK2J2lcW2SSPRd
 JEZl3pnCZJSlnSFqFi2Ga/CrGVZZUE60nalxHOQzlNcLaXny7GMZiFmr9IqRTlM7i5J5
 aUkqsLm23rHIQMjzjoxUUDfqQcLZkd1B1g+DcBUH3S50ReHY5NNYnVKYVVaP5Pln27oN
 zSvMdeHB0Iw5d3p/kDASy3HubSYE/YsqIo5eNeRWD41jtaAdBj3f77OvlwG6bWSP4F9W
 +HzL+cASZ3fUuiPwaVe5NeBvG13jPbGGJu+Ewa54Mmo7Gk3wjffnn+EEAP/STQMtQ0xB
 2XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6zUl2HU3Z5FB+WM/KgUcWz+nUT78Ab2AAKdW88gdUHQ=;
 b=l1AEAGVasjAm8RFdjaDY4ct0k3DVrSRTgo1AH/H0Q3wuKMNCiEuSkKemFeQ4ll10l2
 4M+GlNLJxIzgd0RU2HjOLVj68Eluckae8seEkj8nKOvycVO9vZ78Pl28pvRLBgCTA9gI
 cGEAEMtdPJMFe/W6EviVDmxxfTWTDBbwa0qMm8XX+qiWLhexOtM3+Tv8KSsCIwliz13n
 NlehPe0zM/2pI8MznREXAyaPtkob24SDNqGkbXo6EefwAv2Kwpw7DRw5e2+w52KIKkFD
 /7w9+RS7OSF5EkZDp6dV+0G3813kTxy8g7nY1hkFznBH96D+z4AJAwCqi+/IFyV2458u
 22WA==
X-Gm-Message-State: ACrzQf1mRNVg30Yo5oXqb/xrqfjJI6jQ8hm3foURkNt+LxZPzkFUoxLI
 2rxnTlqPIELOPhgexlI1BpKFbe0C30cbSj51Ug3DMNxroIO9me0GtH6JT0WMOCnY4xATv/zYHB4
 umdy2cAqb8SX0Du06ydlXVXcB4fvIJHPAfZGfNDVpUqfb4HT3E0xrmeveqlw66tbIOT8=
X-Google-Smtp-Source: AMsMyM5C7v5e7Vq+P9HStNYrUbEzAsgAD/JLSNB+ubeDAn4BIcg5ZlFLau3xkHncfaNlC+cHa+5F4Q==
X-Received: by 2002:a17:90b:33c9:b0:200:a0ca:e6c8 with SMTP id
 lk9-20020a17090b33c900b00200a0cae6c8mr10176264pjb.147.1664770495169; 
 Sun, 02 Oct 2022 21:14:55 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170902cecc00b0017732e4003bsm6108596plg.141.2022.10.02.21.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 21:14:54 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 chigot@adacore.com, Jim Shu <jim.shu@sifive.com>,
 Emmanuel Blot <emmanuel.blot@sifive.com>
Subject: [PATCH v3 1/2] hw/intc: sifive_plic: fix hard-coded max priority level
Date: Mon,  3 Oct 2022 04:14:39 +0000
Message-Id: <20221003041440.2320-2-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003041440.2320-1-jim.shu@sifive.com>
References: <20221003041440.2320-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The maximum priority level is hard-coded when writing to interrupt
priority register. However, when writing to priority threshold register,
the maximum priority level is from num_priorities Property which is
configured by platform.

Also change interrupt priority register to use num_priorities Property
in maximum priority level.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/intc/sifive_plic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index af4ae3630e..f864efa761 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -180,8 +180,10 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
         uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
 
-        plic->source_priority[irq] = value & 7;
-        sifive_plic_update(plic);
+        if (value <= plic->num_priorities) {
+            plic->source_priority[irq] = value;
+            sifive_plic_update(plic);
+        }
     } else if (addr_between(addr, plic->pending_base,
                             plic->num_sources >> 3)) {
         qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.17.1


