Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8E2207336
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 14:21:55 +0200 (CEST)
Received: from localhost ([::1]:47062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo4Pa-0004pg-Ke
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 08:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1jo4Ng-0002xt-UL
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 08:19:57 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:44659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1jo4Ne-0005Ae-QY
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 08:19:56 -0400
Received: by mail-qk1-x742.google.com with SMTP id b4so1527240qkn.11
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 05:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JeHrzBkl0W7YnFDNGzpK6Omqdh1SbNjh/JeqkFtYTYM=;
 b=bHiigOlfRJSOsDQUtI5OujwKxFy5ZwqLJpXGvaYBK5AXFjeFbyHjglZbPkR19/LD7K
 h8CxXew/iIM3amWTrmT8GzthWz80A4LojXAoLSAoYRfa/o4CTcMsaQ2MqCrcMmFyhmh3
 d65C6+bnnMFHZZUPCaKXHD8xuou/AYrpxpUHIZa4MUJAlOttRnvcUjqEMH2Azqysu6bY
 TrHvRBr4AOZ6qj8jPD4cTiibdikz02cW95d1+1iV6+6F0gl4CxgTZ/isKtni95qDKvs8
 hvmgb3+i7qzDkgRzLqAXFCJLilOQw7Y8u8kX0+9KDGdInvcMVCtQ7P0FjE9jy1kZkcpR
 aIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JeHrzBkl0W7YnFDNGzpK6Omqdh1SbNjh/JeqkFtYTYM=;
 b=Mza+dI6PeRzYVPSTkX0CFCYj7wfnhFZ4M0Wq9CvNOg8TythuGatxbRtvNjPZ8mz9wr
 WVASIpwN+jMnmomCS8W4sD8XXV9tPpO9AZ3omWBSKTlcdtq8hFVvJCV7Zuj05T72HC9a
 v0I2EEBzh3HyEb+81fiBQDylvaPQsTpbKUEVEXpmA0Eiu6+rHdzR4Mv7NbfnRD4/dToX
 eIcZ2tqWvKjy4HSXySAna0tqMJX5/WfMJNbf73EHrIjGLzLD1gjTsVrxxQ5LGZ48pHab
 R6sAwpMZjx2plugKJESUTrNSVd/bXOI8imptjI0BMr1sMRdUtNASl3pzEEsvwjI3R4Wp
 Pk0Q==
X-Gm-Message-State: AOAM533bhH/v5vf2kaha8TBgeAmNDxqE9PJOsEiPMm2EzqtXk8L0vdVv
 YqK4vU4CcoM/mmSpffmk/Yo=
X-Google-Smtp-Source: ABdhPJx3ZT4gYwkDD4T3fNbH4/7YMHFKibhaBWBHBCSo0bX+lInlvhxyUp1HwIUySWDeId8zj6gV/Q==
X-Received: by 2002:a37:451:: with SMTP id 78mr16239725qke.117.1593001193342; 
 Wed, 24 Jun 2020 05:19:53 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ad7b:336a:2d40:4130])
 by smtp.gmail.com with ESMTPSA id x4sm3685635qtj.50.2020.06.24.05.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 05:19:52 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: [PATCH] xen: Fix xen-legacy-backend qdev types
Date: Wed, 24 Jun 2020 08:19:39 -0400
Message-Id: <20200624121939.10282-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::742;
 envelope-from=jandryuk@gmail.com; helo=mail-qk1-x742.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, Jason Andryuk <jandryuk@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

xen-sysdev is a TYPE_SYS_BUS_DEVICE.  bus_type should not be changed so
that it can plug into the System bus.  Otherwise this assert triggers:
qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
`dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
failed.

TYPE_XENBACKEND attaches to TYPE_XENSYSBUS, so its class_init needs to
be set accordingly to attach the qdev.  Otherwise the following assert
triggers:
qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
`dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
failed.

TYPE_XENBACKEND is not a subclass of XEN_XENSYSDEV, so it's parent
is just TYPE_DEVICE.  Change that.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 hw/xen/xen-legacy-backend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 2335ee2e65..c5c75c0064 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -789,11 +789,12 @@ static void xendev_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     /* xen-backend devices can be plugged/unplugged dynamically */
     dc->user_creatable = true;
+    dc->bus_type = TYPE_XENSYSBUS;
 }
 
 static const TypeInfo xendev_type_info = {
     .name          = TYPE_XENBACKEND,
-    .parent        = TYPE_XENSYSDEV,
+    .parent        = TYPE_DEVICE,
     .class_init    = xendev_class_init,
     .instance_size = sizeof(struct XenLegacyDevice),
 };
@@ -824,7 +825,6 @@ static void xen_sysdev_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     device_class_set_props(dc, xen_sysdev_properties);
-    dc->bus_type = TYPE_XENSYSBUS;
 }
 
 static const TypeInfo xensysdev_info = {
-- 
2.25.1


