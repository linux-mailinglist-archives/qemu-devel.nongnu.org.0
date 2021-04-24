Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A029236A237
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:50:41 +0200 (CEST)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLUO-0000oc-Ng
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3a-0000Th-7d; Sat, 24 Apr 2021 12:22:58 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3Y-0004Oe-Os; Sat, 24 Apr 2021 12:22:57 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f195-20020a1c1fcc0000b029012eb88126d7so2773177wmf.3; 
 Sat, 24 Apr 2021 09:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l/YNVbkdkrW9ig2CLutDkjJUIXW08deJdCzaGMC/bGQ=;
 b=aBA1vfUNtMce97eMNDPXsk42BpnzZs/8zuc91IQvrBvji1U7u5sgmWnl7eYXz+SuKy
 9ZB99O9sQetXOXUF7G5phnObAiDkcXdRejbTqXol0uIdBTWM/el5pupmfZFy9lnZY7Wq
 Z4OLCLb8yMEi1I3j40XpZWzj5RV5QwwtVdfsKdFzw/Rw8gYCjiaOIdq/Hv8X5t7JdOHV
 hc/YCEK94yXx1SSHDoW4qIxJaDl6b147WcOlpcRlcybt4bKYJ4hxF69W8b1bJ+2DVUJb
 sJQQ4D/VZTZx0r1NBrhfRprXC7vc89CDd3IlTvo8SrwnQWwYaxpJhN85LBoBeUWYhp99
 CM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l/YNVbkdkrW9ig2CLutDkjJUIXW08deJdCzaGMC/bGQ=;
 b=NYinWce8N1/+trJ3hrMX+DT0xqD9reQszoQm0iMHegpcWwJ+zX4PaYnT4O9IOAExjc
 Pahtjbbj5XtV/YUVYNQLQqB8WdEr4DKn+x0qVxujpToDbXhLFst3QLrOvR/Ey4vz4H6m
 9+syHswUpLFrmM9iJ67zeu5C1sE7IG5OmFjkvSZUqFl5ymEChsRGfvtRhVyAu5FwL/yx
 6zyEItwoygfWIhEHuJqHK+j1dxPX1cwIqyIEZGhRw6ua49JWXDIV77UwdoO7dfX5Wjv/
 lXOqIYp7g6K/FUFY4vErstr8ARpDV2IPFjLIeBvMmHQ10qJB7r9ioQ8FDZS0VVKyQL10
 AdqQ==
X-Gm-Message-State: AOAM5315wEbDrKqFAZCvdmGYKrkMqjzs04S32LYaPoASCNlzvYMcksqW
 8oY9iWKG3OwukCrXz/puSw9vLR5352vxFQ==
X-Google-Smtp-Source: ABdhPJygIQ/b/koc21NBNJekP9t25XHEDhXl7XKQdtP3HWEguRcrfBdY8QJI9XTsGvHpoD79NbINzg==
X-Received: by 2002:a05:600c:17c3:: with SMTP id
 y3mr11578124wmo.185.1619281374244; 
 Sat, 24 Apr 2021 09:22:54 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a142sm14432967wmd.7.2021.04.24.09.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 09:22:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/pci-host/raven: Manually reset the OR_IRQ device
Date: Sat, 24 Apr 2021 18:22:28 +0200
Message-Id: <20210424162229.3312116-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424162229.3312116-1-f4bug@amsat.org>
References: <20210424162229.3312116-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The OR_IRQ device is bus-less, thus isn't reset automatically.
Add the raven_pcihost_reset() handler to manually reset the OR IRQ.

Fixes: f40b83a4e31 ("40p: use OR gate to wire up raven PCI interrupts")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/prep.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 0a9162fba97..275379e4c78 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -230,6 +230,15 @@ static void raven_change_gpio(void *opaque, int n, int level)
     s->contiguous_map = level;
 }
 
+static void raven_pcihost_reset(DeviceState *dev)
+{
+    PREPPCIState *s = RAVEN_PCI_HOST_BRIDGE(dev);
+
+    if (!s->is_legacy_prep) {
+        device_legacy_reset(DEVICE(&s->or_irq));
+    }
+}
+
 static void raven_pcihost_realizefn(DeviceState *d, Error **errp)
 {
     SysBusDevice *dev = SYS_BUS_DEVICE(d);
@@ -422,6 +431,7 @@ static void raven_pcihost_class_init(ObjectClass *klass, void *data)
 
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->realize = raven_pcihost_realizefn;
+    dc->reset = raven_pcihost_reset;
     device_class_set_props(dc, raven_pcihost_properties);
     dc->fw_name = "pci";
 }
-- 
2.26.3


