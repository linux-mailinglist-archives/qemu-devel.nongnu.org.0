Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87471696465
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:17:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv9f-0007bs-Ue; Tue, 14 Feb 2023 08:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9a-0007XU-BX
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:26 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9X-0003ua-52
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:25 -0500
Received: by mail-ej1-x634.google.com with SMTP id mc25so2573291ejb.13
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tuewnRepBxWxAmnfjA8IaGCcRoQ04g+hEFXzxkgFJS4=;
 b=SriBttZQKBMzCwQmqNDX7yIB9WXVORGUnqWhnH3j9jTQMC4umyjWMeJ2cZVgUVOI+j
 ySuSKRyFo/DVKdz5OOMhsq+9PiHC2u24je/ABsAR3Ucx5S8xoFyXC7p1q2yA+d1wcv4F
 hoMrCIJX5kBe665pJwgBCMwKG/2tpLDTqkGeSfGbz7qX8hCNX5PfqqY1fjPj4h8UhXz1
 eNa8RwHmXKZDYLpG7XtyDdNwz6MzKGyB3TyuVR41v7xiXzvfDgE2R+5RfXfns1kHjvmE
 m8Cj/17yGio+pQ/fUEQy1YBDwXxthTOfTDsF9Q2zjOoR5/H4OnvWM7VONsOxzT2zD0vo
 9kaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tuewnRepBxWxAmnfjA8IaGCcRoQ04g+hEFXzxkgFJS4=;
 b=xefoHnp3jDtgZYds6z7RxWIHsVCoMEbieBdHv9o7rxkGDJmtgoEsBhIJTzdUz9Q9Ae
 7e8hPSiY0uPw1Yor9qrgaUxMXhgktMOW0tJG6I3BhktZwVc2LmBkvfTRb8suw1NRGNn1
 FXe05mZ2IxHIkRBBkOFsyYotVc5TE6ElvL6/badvwBQfk+/UZ9hytslTMQf9WNh+RNLk
 HBHbG3GmLd7WB6/Ysf5HdeU2P74DSuSzgha/mDia0pQ9KOIt5vJ5fMTKkSyejZm4H8gh
 xATD3FtKv+0ygaNF+0nlgLUSxrsSOeyO/GTY8TaENQF+CxBrxF/9hekGmSmLe7TlccNu
 4V0A==
X-Gm-Message-State: AO0yUKUTGFOtPvUZSNG4ly7SiJMnnPsgnQOZaSk3apDzKS9nUey3T+0W
 erUQN3AFDL95wIaLGWZ+tlDwnUQ/2VU=
X-Google-Smtp-Source: AK7set9+Qp5clpot8IjBjVng8aWDesi25zng0Y0yCcYmpvdSEn56thnPWaBG2NQqxP8BWXMPxrH0eg==
X-Received: by 2002:a17:906:774f:b0:8aa:c105:f0bf with SMTP id
 o15-20020a170906774f00b008aac105f0bfmr3551639ejn.17.1676380521981; 
 Tue, 14 Feb 2023 05:15:21 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-101-237.92.224.pool.telefonica.de. [92.224.101.237])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b008b13836801bsm220153ejc.183.2023.02.14.05.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:15:21 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 10/12] hw/pci-host/q35: Propagate to errp rather than doing
 error_fatal
Date: Tue, 14 Feb 2023 14:14:39 +0100
Message-Id: <20230214131441.101760-11-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

q35_host_realize() has an errp parameter. Use that to be able to
propagate the error instead of terminating abruptly.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/q35.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 8f81debfa5..d517f5622b 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -46,6 +46,7 @@
 
 static void q35_host_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_GUARD();
     Q35PCIHost *s = Q35_HOST_DEVICE(dev);
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
@@ -74,7 +75,7 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
                                 s->mch.address_space_io,
                                 0, TYPE_PCIE_BUS);
 
-    qdev_realize(DEVICE(&s->mch), BUS(phb->bus), &error_fatal);
+    qdev_realize(DEVICE(&s->mch), BUS(phb->bus), errp);
 }
 
 static const char *q35_host_root_bus_path(PCIHostState *host_bridge,
-- 
2.39.1


