Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E42666F72
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:24:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuMT-0003jp-HR; Thu, 12 Jan 2023 04:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMR-0003hX-4U
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:03 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMO-0004Rt-R4
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:02 -0500
Received: by mail-pl1-x62f.google.com with SMTP id jl4so19713916plb.8
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ykOhzCDzLEKwYNMzfH2tcDpltX6JSM4qCNudMYyZ6A=;
 b=EieaTzg3ENsw6k00/3RxQgJfirfNuBTDrRLzDqOeXInApaboV+Pnx2B2cAWAEVkhyq
 +EkoVQyhbrIM5/aHcuPiLsxxC0nTOQYPu8ez349TAw/wVHmwvpueVBXMIobhPjxYB+uh
 2HuP0SWy5y7LXYNHBcKFA4sVXc4yfYoxSEOwDW+2ziR3Bx6VnbnxboL/AUSF9W7jW7v8
 FLZWIAgHCi+ya1XnZuYtbGrzM3KWp/y/JK5pgeJsevlfzkGockxPp2WUHJo2sV1OOJG9
 ZBvXKZw+z3+QsBYfN23mLXV3gPzQ6Mmf+UcVIQzshC86vgVmI5lni1dndkqwcZsRk6iK
 SPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ykOhzCDzLEKwYNMzfH2tcDpltX6JSM4qCNudMYyZ6A=;
 b=toOzdBMrHWC31Xkix3J6JK5wIOynMrVh+ByXC2Sxu+E5rCpX8eCxYKE1hz1Iww9mxq
 p9PcMt9LSTIv323+FrR8DxJQqRsXuMPJGER4wegGNjxIXp9mAQGzjD2t9R/Piq7kWLZw
 6tDkZwcDQAECYiEIfHz74mmfz2cl46hLL0H0T++8MFZ3ruzycon+vc13anQDYMrrXnCy
 vyOmw6T9PVDniRwNgnS98t4cRgsqYAkSsrnj1sQC2hOV6zQQA56JnWPZOYKllYKIFSU9
 gV5ruoKnH6MKuQdqrgPuNjr6i0Mb6eFcxdyoo9TXR32PC+ymY2neKxbqbjw2FLBrct2N
 dQSQ==
X-Gm-Message-State: AFqh2kru+eYwTyoGXrIHnB8I80YuTfYFs7g9Y7UzASObSJywrgAj3zVy
 C032mzIrYaSG0td2VRqA3n7drA==
X-Google-Smtp-Source: AMrXdXvmHhW1kspXueaJwa+5mjovCaead1uri1sjvMh7pwCvbVUJ+s7gx0WjLqSv5Nc4l3GrK4G2gw==
X-Received: by 2002:a17:90a:5b05:b0:225:d190:f16c with SMTP id
 o5-20020a17090a5b0500b00225d190f16cmr65098928pji.21.1673517539633; 
 Thu, 12 Jan 2023 01:58:59 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:58:59 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 13/31] e1000: Configure ResettableClass
Date: Thu, 12 Jan 2023 18:57:25 +0900
Message-Id: <20230112095743.20123-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

This is part of recent efforts of refactoring e1000 and e1000e.

DeviceClass's reset member is deprecated so migrate to ResettableClass.
Thre is no behavioral difference.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/e1000.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 1bcc0cd4f3..a66cb39c8b 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1731,9 +1731,9 @@ static void pci_e1000_realize(PCIDevice *pci_dev, Error **errp)
                                         e1000_flush_queue_timer, d);
 }
 
-static void qdev_e1000_reset(DeviceState *dev)
+static void qdev_e1000_reset(Object *obj)
 {
-    E1000State *d = E1000(dev);
+    E1000State *d = E1000(obj);
     e1000_reset(d);
 }
 
@@ -1762,6 +1762,7 @@ typedef struct E1000Info {
 static void e1000_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     E1000BaseClass *e = E1000_CLASS(klass);
     const E1000Info *info = data;
@@ -1774,9 +1775,9 @@ static void e1000_class_init(ObjectClass *klass, void *data)
     k->revision = info->revision;
     e->phy_id2 = info->phy_id2;
     k->class_id = PCI_CLASS_NETWORK_ETHERNET;
+    rc->phases.hold = qdev_e1000_reset;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     dc->desc = "Intel Gigabit Ethernet";
-    dc->reset = qdev_e1000_reset;
     dc->vmsd = &vmstate_e1000;
     device_class_set_props(dc, e1000_properties);
 }
-- 
2.39.0


