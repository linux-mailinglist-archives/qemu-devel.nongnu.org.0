Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D216AAAB3
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:28:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTnF-0003S2-0R; Sat, 04 Mar 2023 10:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTnD-0003Rt-Dl
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:27 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmx-0008CM-NE
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:27 -0500
Received: by mail-ed1-x52d.google.com with SMTP id o12so21557640edb.9
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677943627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ois2BqEazqSVamsuutRemdEMBkx4q6hGG0wIeuPIfcE=;
 b=duJKZKbb/egrfJvztHX0n+m/5cQamJR5xfMzOfSTGp83BclEX8Lk4NGtKuhvRficcA
 w89A1m0TxBJQeaMRI438J5Gyc8HMfmY/L6Vzrv0WarkL9Zz01RqfV4FARIhKDpF/CHMr
 mZrELjR3eF+gC7gNyD3t8lpMHuAKIImoOEL61zI5xCzGZ7oIKpIBErcuRi848owJFcwx
 Dim7o01v8GtOAMZEbCWF6rjgMvr6xbCUl7bX2/XC9lh46adPY+1tOx37HGXlUanoza13
 mkXGCQrjBvmZDWR6qm6R7soZjZ0vD2WVL2MgN86EJepinfkArwvF8CLypkIWKoqdzxA1
 aAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ois2BqEazqSVamsuutRemdEMBkx4q6hGG0wIeuPIfcE=;
 b=oG+rE430XrR0mOrA44UEPg7MP/LLINdG3t9RCejZt5HFOOgYAohWsf4ID/Osdk2KBC
 +EvpkS/yxRPNrOO0xIrItlh7gD1Eo9PBMOvxptKMElaoTJYI3Fd3JDLHwwZ+s3ku8CBA
 NsN1ga2uFTHqZFA4i3bskKGIRhU7/ch30C4+cUrlTAxTw5CY/79gff2FrACYUXOfE+Yl
 LmKdF7DgsxlYnfEJBoTNNDYKBoGE3ebaq2RGt7SH+6niDblVm3IXNVYuZg1fSF8hcpaf
 Wy+MssFc5VFD/LR1mE1+UGppnYgSxBW2kYMBfV6vDumkY3+Pit3rwLQqbJ5Xw65Mf/aW
 3Ntw==
X-Gm-Message-State: AO0yUKUsPFt9Zen0aqgvlkGDbwHRrufJw7shM/N6M8TvVXUltwFII0yi
 T+UXfKozZSeicxrtkh+qi7cJ/0YVJFI=
X-Google-Smtp-Source: AK7set9oM906JMNwP/G1zSpXHXrYEa6OJH64CooD7sSoatSRLdkO8xZrGXrGFfEUboZFwc73SGVwPQ==
X-Received: by 2002:a17:907:a808:b0:8aa:c35b:a34b with SMTP id
 vo8-20020a170907a80800b008aac35ba34bmr5380424ejc.20.1677943627361; 
 Sat, 04 Mar 2023 07:27:07 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b008dd6bf721c2sm2170540eje.106.2023.03.04.07.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:27:06 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 11/13] hw/pci-host/q35: Propagate to errp rather than doing
 error_fatal
Date: Sat,  4 Mar 2023 16:26:46 +0100
Message-Id: <20230304152648.103749-12-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304152648.103749-1-shentey@gmail.com>
References: <20230304152648.103749-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
index cf9fb35064..39d70b9f59 100644
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
2.39.2


