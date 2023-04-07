Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0267D6DAA0A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 10:26:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkhQ9-0006jV-KT; Fri, 07 Apr 2023 04:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pkhQ5-0006dI-JN; Fri, 07 Apr 2023 04:26:06 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pkhQ3-00028g-OK; Fri, 07 Apr 2023 04:26:05 -0400
Received: by mail-pl1-x632.google.com with SMTP id 20so330524plk.10;
 Fri, 07 Apr 2023 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680855960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EhVv6WlDwJL96Zy7vKftB7CwaSpSxc9eBC1kxbXoR8g=;
 b=Lx7+IWlNZLpFPLspcDDgNsLn9e2v//1yXAAvdd8sSWT6nYo0r3FYRVcNZihGKzv4Ya
 Zz510KNt69TIkVFlEBKaCAx50782oYI6nDQxlm4P/KbgoTTmZ8eiVdRB9BshokftPO5e
 npmDH8wZEFXuY2E0FRBVxQa5fWcLLovMCxrd6M61+EhLv6bmeft8Civ2ErDKQavpkh95
 sp/Bml5QNBieWS9je9OAoEUlHmwMZ5vACf1ZlSLfVuvakaCtfGW1HrxHZd5oZ/zmjGqv
 CCDchGWS4FDgeIEteVgfPjf+8nH8QDQTjFjLl7Fd9Amu/ktTnV1onIYSp5W9fVRybr5G
 tGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680855960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EhVv6WlDwJL96Zy7vKftB7CwaSpSxc9eBC1kxbXoR8g=;
 b=B+54ZlHa6fU0JXgBqU5pgggsiVtZsaASSXtGT026jY9Rs30V1ifvLY8DsR+c0Yehi3
 dfSDoAa8FEILuNHvmNRNUxPrqaYskUi78/xxnUxdURnZvtNxAU0f/JvZhaMWA0K9wwgc
 whJvcsq6Ew4wOGdVi1uRrfiRABhzg9GYrgHg22Nx/GnH/RveTvy1EXtQhVoZh9FYx1Bl
 l6MZAzasirXtLJL5koO2Bq2sctMURo5ScnUdjCHRYdQtpdI+s4Vd9JKAyOEL4UIUYhcg
 i3JazX1WcgMY3/jCyyM2x9/K0sXOqBcuwPY+WJluXx7YVEWP5gg02EZFAO94oxVj8nuZ
 rMzQ==
X-Gm-Message-State: AAQBX9djHvL34Kuau7PcGvJmPbnNLfZZWIhaQkXYZE48K5XhFSAhiLJM
 7ErMBZ0G6EymBdu8Mo2Hflpp9YC/919CFe6S
X-Google-Smtp-Source: AKy350b7xmI9h98+hauaLK6B8e+TPhEgpy3X5dFcvJxzYydogAVxS9xPpHLoTYKTkebcQN6udPPapA==
X-Received: by 2002:a05:6a20:8593:b0:d3:45f8:256 with SMTP id
 s19-20020a056a20859300b000d345f80256mr1844602pzd.60.1680855960384; 
 Fri, 07 Apr 2023 01:26:00 -0700 (PDT)
Received: from fedlinux.. ([106.84.131.166]) by smtp.gmail.com with ESMTPSA id
 fe12-20020a056a002f0c00b0062dcaa50a9asm2521331pfb.58.2023.04.07.01.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 01:26:00 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hare@suse.de,
 "Michael S. Tsirkin" <mst@redhat.com>, dmitry.fomichev@wdc.com,
 kvm@vger.kernel.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v10 5/5] docs/zoned-storage:add zoned emulation use case
Date: Fri,  7 Apr 2023 16:25:28 +0800
Message-Id: <20230407082528.18841-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407082528.18841-1-faithilikerun@gmail.com>
References: <20230407082528.18841-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x632.google.com
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


