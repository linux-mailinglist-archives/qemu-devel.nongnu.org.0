Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BA06C812F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:28:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfgiS-0004wc-Sg; Fri, 24 Mar 2023 08:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfgiQ-0004w9-J9; Fri, 24 Mar 2023 08:40:18 -0400
Received: from mail-yw1-f180.google.com ([209.85.128.180])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfghI-0000iy-Mv; Fri, 24 Mar 2023 08:40:18 -0400
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-541a05e4124so30771567b3.1; 
 Fri, 24 Mar 2023 05:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679661532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EhVv6WlDwJL96Zy7vKftB7CwaSpSxc9eBC1kxbXoR8g=;
 b=BSjM94HjbZmaEZCMh0F34KSN053HPEGrRd2xdSGofD/V7bIGBXnwkg+D3aULC8vITR
 2AV2SBWc7iyjKjOdMvcGF8XXSg7Xcbu4SPbvmCWylsmX7vG36HGVYQ7yH4pJxsJdrV7n
 ZWp83SZvcqtcKJM771qYEJmY+eG0fkJONRcJuE/l6Y7ot8RxeF+ahENdcgbjGSodL6tJ
 mKXuHZa5P+hCUUyS164hBxflKaFX9jQAmnODXt8QpjwCpybJ+8B/UJel3mBfbe2m+GSJ
 /cibO3EyAhdEnmB5MQBfRMfgR4cXcJEkLgdjwQe9HyJr51r9xeGY22FT3rd6e619Hcff
 vmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679661532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EhVv6WlDwJL96Zy7vKftB7CwaSpSxc9eBC1kxbXoR8g=;
 b=PnriUBqjC2ubvNcFpLTReEZrZwRxfiMBl8z8XVIA4LTCUatE2nVnAxxxZE002Wg4wE
 WQJpJYBMjuoVb2R8+ZyHZV7fijfcHRSiVZZRezjBgiU/xG5DWfphaBnyBT6so+UJxPDC
 2J8jng2fjlbysIeJAaFDk6X+K+V9o1dvjyoyviQ2Sk7ZaLznHrD6iK3esg9JMTCWvbl9
 SdSP1OOZmWq53lk2ipsciKU+7jYyWGshtEUZJvuKzfxoert26Yl8AVbTuKup7F/1N69Q
 p2J4O6cQ/aXYl7pb9RFb60835Fb1Z0crJ7kN8P61A9aENsZjjQcD8QMMpgTLLzcjkQSI
 MFXw==
X-Gm-Message-State: AAQBX9erh0NlZwzzOREjctkAUAMTzFlaJZmrymhZ24bUTFbO4LcbTEB8
 haAlQSvqknjno1Pd5OR5duU6uVq9OyXt5eF0
X-Google-Smtp-Source: AK7set8RuwFJg1oKhPOf2dU/0CUWCkXcuPlzpmAxnKmcGZX+OPLOwf46uNOtDyknLd31iRliBhDubg==
X-Received: by 2002:a05:6a20:c525:b0:d4:b5dc:2909 with SMTP id
 gm37-20020a056a20c52500b000d4b5dc2909mr2824300pzb.28.1679655272943; 
 Fri, 24 Mar 2023 03:54:32 -0700 (PDT)
Received: from fedlinux.. ([106.84.130.185]) by smtp.gmail.com with ESMTPSA id
 bn10-20020a056a00324a00b005d72e54a7e1sm13617355pfb.215.2023.03.24.03.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 03:54:32 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, stefanha@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 damien.lemoal@opensource.wdc.com, hare@suse.de, kvm@vger.kernel.org,
 Markus Armbruster <armbru@redhat.com>, dmitry.fomichev@wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 5/5] docs/zoned-storage:add zoned emulation use case
Date: Fri, 24 Mar 2023 18:54:18 +0800
Message-Id: <20230324105418.3752-2-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324105418.3752-1-faithilikerun@gmail.com>
References: <20230324105418.3752-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.180;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-f180.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Add the documentation about the example of using virtio-blk driver
to pass the zoned block devices through to the guest.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 docs/devel/zoned-storage.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
index 6a36133e51..05ecf3729c 100644
--- a/docs/devel/zoned-storage.rst
+++ b/docs/devel/zoned-storage.rst
@@ -41,3 +41,20 @@ APIs for zoned storage emulation or testing.
 For example, to test zone_report on a null_blk device using qemu-io is:
 $ path/to/qemu-io --image-opts -n driver=host_device,filename=/dev/nullb0
 -c "zrp offset nr_zones"
+
+To expose the host's zoned block device through virtio-blk, the command line
+can be (includes the -device parameter):
+    -blockdev node-name=drive0,driver=host_device,filename=/dev/nullb0,
+    cache.direct=on \
+    -device virtio-blk-pci,drive=drive0
+Or only use the -drive parameter:
+    -driver driver=host_device,file=/dev/nullb0,if=virtio,cache.direct=on
+
+Additionally, QEMU has several ways of supporting zoned storage, including:
+(1) Using virtio-scsi: --device scsi-block allows for the passing through of
+SCSI ZBC devices, enabling the attachment of ZBC or ZAC HDDs to QEMU.
+(2) PCI device pass-through: While NVMe ZNS emulation is available for testing
+purposes, it cannot yet pass through a zoned device from the host. To pass on
+the NVMe ZNS device to the guest, use VFIO PCI pass the entire NVMe PCI adapter
+through to the guest. Likewise, an HDD HBA can be passed on to QEMU all HDDs
+attached to the HBA.
-- 
2.39.2


