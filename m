Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1146CA81F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 16:47:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgo7k-0007JT-I2; Mon, 27 Mar 2023 10:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pgo7Y-00075w-SK; Mon, 27 Mar 2023 10:46:54 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pgo7X-0001cJ-Cy; Mon, 27 Mar 2023 10:46:52 -0400
Received: by mail-pj1-x1029.google.com with SMTP id a16so7871147pjs.4;
 Mon, 27 Mar 2023 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679928409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EhVv6WlDwJL96Zy7vKftB7CwaSpSxc9eBC1kxbXoR8g=;
 b=jkMkTrmMDfu7jcduhsdp0OdpMDt3QaUHq6SNx6capV/KEJVdEWW7XfEzF33Ywt1pBl
 +W6mn7o9xMvYrk7fLUkQVuO8CdXWQGm0qoInrCzclweQ33w/Du0ENry7MFi6vOntnRnu
 g8mHpc0ELD0ExuFJOftOuK2MQjxJS8xDkKhvfO3ZN8oqF1Np2YrN7fNk9e6dVYKF6qlc
 0Qnb0aAYq2sI7/x+GB1MCbX/3rbFKXl93gpetxoELhg2MXe6cKzhLLwL1OJw0fXkaU36
 lJRSSgO+lQphOT3l2tMf7jOrEdM8qoS5j7PaHQi6x5HD6c7NESyriBeCWKD2UcuMXqyl
 qSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679928409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EhVv6WlDwJL96Zy7vKftB7CwaSpSxc9eBC1kxbXoR8g=;
 b=gZxRuSmsB9zXXhOra1SJu8DKSRQig1GDwKVqZ5DGA6yMFXkhkJ/tgL9HPuyjuP8Ae1
 B/NVN52cpoaaLYwMfIfBGMzVauDuq29Gh4nbF9zzMXOMhwg81wocpiB53qlG5JiWZsIv
 /v7RKPG92RWfWg4zKZPsM76h3nRzkqDZyyjEKHTiW0SQL5e/4anVDpPpgCU9H1gVzvdR
 WXf453xZnDS3DNipIPV8sPEBdC102+0kVpi6RZYzN5srBBwun5BO/sVwtEvLoevn8wnM
 uO89+yZRgQWq04lJUC+kek5FYnOn3Pl8JP9Km7wf4gmxsrMsfYbsPUSKjnIxAi9WZXVt
 +iXg==
X-Gm-Message-State: AAQBX9fkkM4xqDb1Tgy5WMNundOtjaZ7UVOnap94Jyt9Ne2YaKRRUINU
 RPmPSiDP9RtgrPgTy4CD1k7IEitUXlNf7ie5
X-Google-Smtp-Source: AKy350aV3IBryUWOhK8ye7hkpcR3bqYjgYOmYRSs7lgKumH3OA+cjpGUaC5zPEf6K59so4r+eOvSQw==
X-Received: by 2002:a17:902:e749:b0:19d:244:a3a8 with SMTP id
 p9-20020a170902e74900b0019d0244a3a8mr14196693plf.10.1679928409088; 
 Mon, 27 Mar 2023 07:46:49 -0700 (PDT)
Received: from fedlinux.. ([106.84.130.102]) by smtp.gmail.com with ESMTPSA id
 s21-20020a170902b19500b00183c6784704sm17368276plr.291.2023.03.27.07.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 07:46:48 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, dmitry.fomichev@wdc.com,
 kvm@vger.kernel.org, damien.lemoal@opensource.wdc.com, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 5/5] docs/zoned-storage:add zoned emulation use case
Date: Mon, 27 Mar 2023 22:45:53 +0800
Message-Id: <20230327144553.4315-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327144553.4315-1-faithilikerun@gmail.com>
References: <20230327144553.4315-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1029.google.com
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


