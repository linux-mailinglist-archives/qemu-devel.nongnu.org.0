Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A617C666EDB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:00:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuMZ-0003l2-28; Thu, 12 Jan 2023 04:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMW-0003kX-Dw
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:08 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMT-0004Sr-Tz
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:08 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so20250478pjj.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8pJOzIi7dHZXTwLvlfWYGPjOtxPzrt95Tarlxs6tuqo=;
 b=krP3pXgUOdN96FBH47vvstrojqnM24rnSmpDOzb7YDNGDpqjuyvD/gckoabO4bOkVe
 Gc1VZqnDJAqzv4+YLksc6tOvazC2Lzylo6BVZUafjqFCu77NfEKcIiqcRHR5y5SW+3h9
 zNed/LiNTptzI0WRr2bNJEudwIExn8fCWjf04VK5FD9EbFqbsHwWGh6IKdjvz/SDFzqp
 Au0SVhLr4YPy0y7heSfKci8PwZOS71b/T5Db4Ai1nsIKE7npb8clVqNiGlOnXWlJeuBU
 qdyMcDCvUgzvuN5claUTwRESvp4x1QEWg+KhXSRWbxLQiqHtx7rO7PcI/oqkEAvJmVK3
 RE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8pJOzIi7dHZXTwLvlfWYGPjOtxPzrt95Tarlxs6tuqo=;
 b=tid8zLFtWN/CRRYDvUvRThQ50TKpCJeFOmZ9NB7r6ujSIrkbGrdxig64iQen62jpU/
 mKDGcemsSDhz3e8HxkHeChZTzjPLNU6iUF48tZtHUcSjx1lAnO1hfx9rkmU/QQlZ1ScN
 /OCYBjW7KUQ08q/xKM4mBYhO33hOjAKCE28o1QePfY2Qo0KbH7AiigFM5fbxhQzcAJie
 M/6Mf2Ow9/mwab8Y/5L4nQXx+gFZWNMNTrNdOJUgGudoUWKW4R8w/d/+aHA2fzZ384Gs
 OBJLwrN54uMUVG+xt52xSEfXWiGVvuF726bS7RlTpnY6rj96remgJ+1y6XdRWus3sM+j
 UlXA==
X-Gm-Message-State: AFqh2korCz25oO2miV4KjBuD/27hKUoLNKyZNa2vGNx01iqB6tGZa8x0
 1xquhsCdIfmvuKrSxU6YcJFB5w==
X-Google-Smtp-Source: AMrXdXv+0e3N/93awWuOq4En7TnNsvhnvmqyysAzhwiuqDRrh3ffmhkHSB+FozJTbl/Fz+BNjMUxBw==
X-Received: by 2002:a17:90b:904:b0:227:1452:70b4 with SMTP id
 bo4-20020a17090b090400b00227145270b4mr13912410pjb.22.1673517544717; 
 Thu, 12 Jan 2023 01:59:04 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:59:04 -0800 (PST)
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
Subject: [PATCH 14/31] e1000e: Configure ResettableClass
Date: Thu, 12 Jan 2023 18:57:26 +0900
Message-Id: <20230112095743.20123-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
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
 hw/net/e1000e.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 0bc222d354..40a4b97938 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -513,9 +513,9 @@ static void e1000e_pci_uninit(PCIDevice *pci_dev)
     msi_uninit(pci_dev);
 }
 
-static void e1000e_qdev_reset(DeviceState *dev)
+static void e1000e_qdev_reset(Object *obj)
 {
-    E1000EState *s = E1000E(dev);
+    E1000EState *s = E1000E(obj);
 
     trace_e1000e_cb_qdev_reset();
 
@@ -669,6 +669,7 @@ static Property e1000e_properties[] = {
 static void e1000e_class_init(ObjectClass *class, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(class);
+    ResettableClass *rc = RESETTABLE_CLASS(class);
     PCIDeviceClass *c = PCI_DEVICE_CLASS(class);
 
     c->realize = e1000e_pci_realize;
@@ -679,8 +680,9 @@ static void e1000e_class_init(ObjectClass *class, void *data)
     c->romfile = "efi-e1000e.rom";
     c->class_id = PCI_CLASS_NETWORK_ETHERNET;
 
+    rc->phases.hold = e1000e_qdev_reset;
+
     dc->desc = "Intel 82574L GbE Controller";
-    dc->reset = e1000e_qdev_reset;
     dc->vmsd = &e1000e_vmstate;
 
     e1000e_prop_disable_vnet = qdev_prop_uint8;
-- 
2.39.0


