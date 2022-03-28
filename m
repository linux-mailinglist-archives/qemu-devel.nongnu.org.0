Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C104B4E99D0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:36:30 +0200 (CEST)
Received: from localhost ([::1]:37744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqTt-00054T-Sl
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:36:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYqO5-0007B2-9X; Mon, 28 Mar 2022 10:30:29 -0400
Received: from [2a00:1450:4864:20::635] (port=33376
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nYqO2-0000uW-MZ; Mon, 28 Mar 2022 10:30:27 -0400
Received: by mail-ej1-x635.google.com with SMTP id pv16so29141104ejb.0;
 Mon, 28 Mar 2022 07:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j2ok0yF7eJVHzP1VeskyrGyUFS14B8x0AbHqrWAdE7U=;
 b=C9mSbF9sou4+iNPXKrkNM8hQU817oLzFwl/6B0QRBVE8lX4TZptvc+B7jzCRIKDYhE
 z7uQtwRK08zSLDGPkHx6RbfLsqxa8D7nSZeK/HQ+0sAl3NdPi4qBZ0fprrxQ4Rq7aEPG
 725xj7NG24iKXXIHefMrktTYLpa+6iS2haNV40/iOgh5BcKvEIhVX0E0XqpFi7QdsI2f
 4AXla1IxEtdYKbCDBr+TssVDRlcoM+sq7BJ4dhnczTK1woCVvgUbRpRb73PXbeIpAke3
 m63yPabNf9bJV3/wtuSTFQaWFP1osfKCliSdwD+x0j75Em6eNOdGAXN2LrtxESgKeG84
 Jaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j2ok0yF7eJVHzP1VeskyrGyUFS14B8x0AbHqrWAdE7U=;
 b=54aYXOYurH1Is+crA8scuCHsqTRAWcHkkqMrZcrqq1E1L3oMHQWrcFhWHK89+a3ZT8
 xkjGEpeLAPYt7cEfD+aj1178OVmEYEMu3wZ7f7pe1VZnbcc8D11+5h9Ljg6vhanoZYLU
 vYAYEhvFlMT4Z95VnmXMMuA8qsY+K+1AqTN1etrh2dzCnvAh0X2f1/JSZmsK3d7zlCr7
 gRLHgQJF+OmCSpXug9h9QmWHT7WAlFHgZqgWF/ubTukbLHbNWnV/l87BRl6ziNGkF3UV
 6Btp7jYb6rrWUzTMZCrTOI4lxPOPcU9lNUfdQeBEzEFcVEw7MO0deg35+iVX7Qeogpiy
 U+6w==
X-Gm-Message-State: AOAM530RbSXxJ5XRwF7wVi7ayHFV/rOggxFGErZxE419P42BL/6l3L/E
 pEiwUrujtHTLXhaWce8ijCoVjv4rFHs=
X-Google-Smtp-Source: ABdhPJwhasLF/pktD6QDb15cCmg4sH9ai6pio2+fNsAN24CqZZYAqFM2k7CiY2982UsbxY21bMYZIA==
X-Received: by 2002:a17:907:3eaa:b0:6df:b058:96a with SMTP id
 hs42-20020a1709073eaa00b006dfb058096amr28077869ejc.368.1648477824892; 
 Mon, 28 Mar 2022 07:30:24 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a1709062b5500b006e10152162asm1982310ejg.222.2022.03.28.07.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 07:30:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] s390x: follow qdev tree to detect SCSI device on a CCW bus
Date: Mon, 28 Mar 2022 16:30:16 +0200
Message-Id: <20220328143019.682245-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328143019.682245-1-pbonzini@redhat.com>
References: <20220328143019.682245-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not make assumptions on the parent type of the SCSIDevice, instead
use object_dynamic_cast all the way up to the CcwDevice.  This is cleaner
because there is no guarantee that the bus is on a virtio-scsi device;
that is only the case for the default configuration of QEMU's s390x
target.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/s390x/ipl.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 84971e537b..e21776822a 100644
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
+		if (vdev) {
+                    ccw_dev = (CcwDevice *)
+                        object_dynamic_cast(OBJECT(qdev_get_parent_bus(DEVICE(vdev))->parent),
+                                            TYPE_CCW_DEVICE);
+                    if (ccw_dev) {
+                        tmp_dt = CCW_DEVTYPE_SCSI;
+                    }
+		}
             }
         }
     }
-- 
2.35.1



