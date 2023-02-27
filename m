Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C536A4516
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:48:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAQ-00081k-66; Mon, 27 Feb 2023 09:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9h-0007gT-C3
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9f-0000EZ-Qr
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:05 -0500
Received: by mail-wm1-x332.google.com with SMTP id az36so4333616wmb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QS1nmh8lEScxSkqCqb2XqzqDwPQdmLvq21fW8K7LJn8=;
 b=lKtFj8P53gUno+PDgZbq/JCYKkKg/iyC4DpWRoEjM2VRYneTLOc0svmv2eIRfnpTKw
 wogM5MOkMuJK7nGCifnLEl5SHKVDQt0f1ZVT1WvZcuL8CjLOmaIjiyk7aZWCYF2025wE
 i7d+HiuTpUR9XE5zukVqDD2UgwIymtsZpOZZSRLXchh69naFZJ+wFX9/o+qpWMuiqzzq
 k3I/+RKE3KdnCWPWDPCFedLWGdzy86quIhLWugPJcLcWwETp77Tr6LX0xzH5gBMc1zYT
 EL8UxNq6gs9Nxrdq7H2vMl+aZOEXvNbxb4CvhM3m4rfbPOflAU1avLCJieeD8pCCIUTl
 Q2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QS1nmh8lEScxSkqCqb2XqzqDwPQdmLvq21fW8K7LJn8=;
 b=2ITTunrvBl+DaPZNRCyVYP+8wY4LNxvwEgzGtPCvjp8eJeVQlKoaybImjxPKUjBiG4
 xiML6udW8sv2RDdx7/H5TW4lUb/TXaNyY40G7SF8UPIyhtdvwwWpoCHwgrEnubYz6bE1
 wnF3JFWC6HBrhKIw4/Ff+A0wCyf3KdMJ4cmu+Oywv/qFONU85QmitsJM2/hf1ttMTgVn
 qi9FYx60P/xVXnJ5sjtAY/3SMtgaa5GBOpevvr3FaptIso1Viw1gcQLWvTLiettIIYhX
 i1GT8oMMb+k6xb2gs1eWDkPj5m7kGB/KEC2JAVOwrIaOJoKpHGGxf6fxBygElSg7G0Na
 P50g==
X-Gm-Message-State: AO0yUKUhJ5wHCWlDujFzGjhBH0J5HmFuYvvEz7RNFtCOSJXU1zyJ6yBD
 whWDJxe8tfARB1sQQkJnjq3gyHBdhck600+6
X-Google-Smtp-Source: AK7set/1TpbgnOAVs8VQbk0D76tNuFPSJ8zeLo2W3a2PcFvTchyNRD/0Dcl3lOuZQNp+zV667rxXjg==
X-Received: by 2002:a05:600c:714:b0:3e2:1368:e3a0 with SMTP id
 i20-20020a05600c071400b003e21368e3a0mr17308710wmn.18.1677506822319; 
 Mon, 27 Feb 2023 06:07:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 ay26-20020a05600c1e1a00b003e21f20b646sm9573905wmb.21.2023.02.27.06.07.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:07:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 062/126] hw/isa: Use isa_address_space_io() to reduce access on
 global 'isabus'
Date: Mon, 27 Feb 2023 15:01:09 +0100
Message-Id: <20230227140213.35084-53-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230210163744.32182-11-philmd@linaro.org>
---
 hw/isa/isa-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index ce9999f7f7..b3d2e5ec52 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -114,7 +114,7 @@ static inline void isa_init_ioport(ISADevice *dev, uint16_t ioport)
 
 void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start)
 {
-    memory_region_add_subregion(isabus->address_space_io, start, io);
+    memory_region_add_subregion(isa_address_space_io(dev), start, io);
     isa_init_ioport(dev, start);
 }
 
@@ -135,7 +135,7 @@ int isa_register_portio_list(ISADevice *dev,
     isa_init_ioport(dev, start);
 
     portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name);
-    portio_list_add(piolist, isabus->address_space_io, start);
+    portio_list_add(piolist, isa_address_space_io(dev), start);
 
     return 0;
 }
-- 
2.38.1


