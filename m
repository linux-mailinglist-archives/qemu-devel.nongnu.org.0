Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8972E8E29
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 21:53:20 +0100 (CET)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwANL-00048K-VQ
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 15:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAKi-0002M0-S8
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:36 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAKh-0005bc-GR
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:36 -0500
Received: by mail-wm1-x330.google.com with SMTP id r4so16627679wmh.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FI0wjjU7ydWM6Tw/dQ+710uQoMT5xzqHZJT1DeBID0A=;
 b=olA1933n73p5oltNXmG5C0nNtJuhG2Xf72WqiwrGGYSpUjfmxqqjOXhsHh6NgPpSO1
 Ao97KDc2pJrV0EEI+cJ0qsukDz+C2xPb9JN4Mnwu+Q3A6/rWujP0S3hgSgn0n0MRQzWJ
 qMde4brrz/WukXx8HO/IdfItke7PHh6bc7dl9exVj/0vGBOaQBEEgkgFGdgnBvX9yiBP
 R+UsbhstdpXOCV+b2PAPjYZw3Bi9DOybCmZighbvW2Nsvk/OXHsPs/h3Ig3lwWWT5+YW
 i0o2t8T4BZuJcr2uQbkmctOV7HjaxFIcfVVeDkb37TsllxvhdshsHlZ5SAtyUQGznUNg
 pYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FI0wjjU7ydWM6Tw/dQ+710uQoMT5xzqHZJT1DeBID0A=;
 b=n/uhqhqa9iTgD7SenndtYfY7F8FRR0jsbX5fs2hdhusPfByII3nZXs8nVY1HT6vxa4
 m5FkY92eWzmZrbPBKJSVkWbPP2a162doxJuFhxC7rqtd3iM8+OEaq/gX25Akly+ymSyq
 Cs1SMTUOAw8/w/ujYOwNBvikFn32AB8vh3HVOf9EPkrv1Yti7ZHC30XvjNn/y0aRh4bR
 KCQvbEqjLlxWG2s81h+35722ckt6F1ytw/QO295SzEnsf5ONPJ60P4m97W2+rzt+T6pc
 TqMkpXSXm8yVP6y4EojW7P2nWNETkFuGuPV1x33blgTEE0F7Uru5bV5OWdfSq6sHE0ww
 nF7g==
X-Gm-Message-State: AOAM5323latJiVIA2vk3j1aB26JkQY7wC7adlg6V75GqSjPUS/j7bN08
 vo19CjLXHDOpEykIo5vxDwnSm8IpyB4=
X-Google-Smtp-Source: ABdhPJy6QwfPsDeSz8vG6LOJLQ2/uWRfC75uRmK73T2NkVkZiIaIscK4eEPynLDHgaN6yoXR/bnJbA==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr24046309wml.100.1609707033988; 
 Sun, 03 Jan 2021 12:50:33 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id s12sm29011792wmh.29.2021.01.03.12.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:50:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/35] hw/pci-host/uninorth: Use the PCI_FUNC() macro from
 'hw/pci/pci.h'
Date: Sun,  3 Jan 2021 21:49:48 +0100
Message-Id: <20210103205021.2837760-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have a generic PCI_FUNC() macro in "hw/pci/pci.h" to
extract the PCI function identifier, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20201012124506.3406909-4-philmd@redhat.com>
---
 hw/pci-host/uninorth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index 0c0a9ecee14..f0a4d8c7178 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -63,7 +63,7 @@ static uint32_t unin_get_config_reg(uint32_t reg, uint32_t addr)
         if (slot == 32) {
             slot = -1; /* XXX: should this be 0? */
         }
-        func = (reg >> 8) & 7;
+        func = PCI_FUNC(reg >> 8);
 
         /* ... and then convert them to x86 format */
         /* config pointer */
-- 
2.26.2


