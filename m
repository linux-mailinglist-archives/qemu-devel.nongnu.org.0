Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F2550655C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:10:16 +0200 (CEST)
Received: from localhost ([::1]:35704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngi08-0005yG-12
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmP-0001Hz-7u
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmN-0004aK-HL
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:00 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so777916wma.3
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UKt0DrjvzmY4G9YYzIJzkavU9qGS6+OIBXr7HJbElYM=;
 b=DjDcA3sD4wmPCGdIe2S4m/uKWbTC7vqSXElw2FT34jj93J7XlcGQ2flzftAs1XVf6V
 QKnHPuM0VM/HXNWdy5ev9BmALpHBC17S1XcnzbQOClogN0xZ2FMsLUQidOr8Iwk9S6Fs
 LvR+qxp4L2I/KYU6Q8Q/o7rl8B9/cqXz7dGNyHvHaF0ohR1PvuWTjN73tkyLMduOBxzJ
 FaUCULYXyAlLF9SqHRRpoCXcdpPp8/rSMWrrWtIbSQVjsH6BqvJIv3p83wr40RecV/+H
 t7tiVhB2Z1KY2HI9D8YyBlCqb/JDhACJgs3Zfd6jqP2xGwMlEQMRARtbzZcjZ8n+q/ZL
 pORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UKt0DrjvzmY4G9YYzIJzkavU9qGS6+OIBXr7HJbElYM=;
 b=FUsA97M562kpJ9tUKr5xAw1kq3zBUk1NilbSH3Lj/gU0/7+o65mZzvMctqJdUtv3pa
 N3dRfrWc7CFX0LL1RtSzbT6AGCtcQvpztsleLEYFETp6wxiWx7vgB0kiU8zT2QK/i7gl
 jzv6U1/OH05Pmywtjsi92J8aaUqrtV5EcuEhyH7wBtN7Av3Be0mh+qCUQQ6p2tkUpEqn
 D/piynuZ+imzBir8m5d9rixpLasT0kCBiEJ72ckrj0ov3oYkFnlNTTXF8xJnLWStYjcN
 3Y7KrDZRGJL+XCPNCs0985XdE+ovvLvojXP1FM79yMvtX98f+iOZz1h4celUjGbWROWP
 5R8Q==
X-Gm-Message-State: AOAM533hns4dvOFYVIXtime7IiJfLw28/1UqB2miSevhA3lMc3WdnH8b
 GWo+0I2EhZjzwko0ggnXcLv4ibdbySWs5g==
X-Google-Smtp-Source: ABdhPJzAZ/TJsd40vnLU5hnzFg4LIkwCAz208xqSPEtVQMgGrr/fYrsrPVRwnjEC6d1R7VI+FO2dog==
X-Received: by 2002:a1c:f605:0:b0:37b:b5de:89a0 with SMTP id
 w5-20020a1cf605000000b0037bb5de89a0mr14048106wmc.88.1650347514498; 
 Mon, 18 Apr 2022 22:51:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 48/53] s390x: follow qdev tree to detect SCSI device on a CCW
 bus
Date: Tue, 19 Apr 2022 07:51:04 +0200
Message-Id: <20220419055109.142788-49-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not make assumptions on the parent type of the SCSIDevice, instead
use object_dynamic_cast all the way up to the CcwDevice.  This is cleaner
because there is no guarantee that the bus is on a virtio-scsi device;
that is only the case for the default configuration of QEMU's s390x
target.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/s390x/ipl.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 84971e537b..2dcc24175d 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -375,14 +375,18 @@ static CcwDevice *s390_get_ccw_device(DeviceState *dev_st, int *devtype)
                 object_dynamic_cast(OBJECT(dev_st),
                                     TYPE_SCSI_DEVICE);
             if (sd) {
-                SCSIBus *bus = scsi_bus_from_device(sd);
-                VirtIOSCSI *vdev = container_of(bus, VirtIOSCSI, bus);
-                VirtIOSCSICcw *scsi_ccw = container_of(vdev, VirtIOSCSICcw,
-                                                       vdev);
-
-                ccw_dev = (CcwDevice *)object_dynamic_cast(OBJECT(scsi_ccw),
-                                                           TYPE_CCW_DEVICE);
-                tmp_dt = CCW_DEVTYPE_SCSI;
+                SCSIBus *sbus = scsi_bus_from_device(sd);
+                VirtIODevice *vdev = (VirtIODevice *)
+                    object_dynamic_cast(OBJECT(sbus->qbus.parent),
+                                        TYPE_VIRTIO_DEVICE);
+                if (vdev) {
+                    ccw_dev = (CcwDevice *)
+                        object_dynamic_cast(OBJECT(qdev_get_parent_bus(DEVICE(vdev))->parent),
+                                            TYPE_CCW_DEVICE);
+                    if (ccw_dev) {
+                        tmp_dt = CCW_DEVTYPE_SCSI;
+                    }
+                }
             }
         }
     }
-- 
2.35.1



