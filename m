Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5D96F9EFC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 07:20:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvtHq-0005vO-Pf; Mon, 08 May 2023 01:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvtHm-0005uk-1l; Mon, 08 May 2023 01:19:46 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvtHk-0002xb-A6; Mon, 08 May 2023 01:19:45 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6439d505274so2019549b3a.0; 
 Sun, 07 May 2023 22:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683523182; x=1686115182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vlz1D9sSRlg2wpkJDN4rWzGDm6M6wMtbI3+dKbQXJXY=;
 b=KzXhjhcMJs873dDzVV4MiL+3QhNqxt2D6XEZ4C3MGvV0ay4qbwRXjKTU5kto9umWk2
 Xh7f754BDuax30tfNQFKujje4U4FkcfTkxBCfvxPLoJXnbcsCK8C3AZLU5GwR+Euvxra
 7nLa/kxaUli/CMPOk3MZ9LQbg3N9c+WB/hBTjnAW/M7nykCiVcapsCx7xqo+B9hbbLGT
 s3Vi2QCgX4ULPfUnA1VYo0isUtSVMPsocHgQvYsXYqARe9tD+Y8QQd8JwRdNMcd09Ka0
 QnlTykB2sWC3tnfaixxtjwcPksP9qFhHxAlZrxorQXopillDYj9xhf2ceYiMdtGgdT8Z
 6u5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683523182; x=1686115182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vlz1D9sSRlg2wpkJDN4rWzGDm6M6wMtbI3+dKbQXJXY=;
 b=QbVFezuoFz7xNH48seGhQXNZrNWYp7QOLDwFJre1rCDE/BNZQMfbXRXeH0qe4VZDTR
 r4MmxQUl1PH5Hx/zpwe5BDzgd9eM0eX7HEl8hbuwDcmHxNgYRwrskdKojujN/I0F/Smk
 e3VkFxjBTtmx3W0y9sx+fYBYfVMLA7p93SPZ84Qm0rJNovOQcdbrFnbOkD2qGIcKxbOj
 kqX3KVNYOI+vyHd7rEyUXoozbzYjU0DGTqdU9Hw73CXO9GWwD9TD0hsviTmk9Wb1wLEA
 sd08cGEw8T96FWy9ITkDQG+ypbIWgt1sYVfcjOfxNn1yHZeNfl2i/3fQunU1vFex60LZ
 J7Ww==
X-Gm-Message-State: AC+VfDwVWKpfj9T8QyAUd305xZfB8lDHVUGH8NsDh0LGssnPhMpRuH2Z
 18OGHOLDpzal02v1nRt4xgUGPH+nYQ9XO6NA
X-Google-Smtp-Source: ACHHUZ62H0WVyKpInYOzR7GjA7qkuV+r9sHWQbnEgd6C+ohCSeY3JDIOaIUw17qFpRPDqferhsSAAQ==
X-Received: by 2002:a05:6a20:4326:b0:100:3258:d163 with SMTP id
 h38-20020a056a20432600b001003258d163mr3985520pzk.35.1683523181968; 
 Sun, 07 May 2023 22:19:41 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.239]) by smtp.gmail.com with ESMTPSA id
 j1-20020aa783c1000000b0063a1e7d7439sm5247997pfn.69.2023.05.07.22.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 22:19:41 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, hare@suse.de, qemu-block@nongnu.org,
 dlemoal@kernel.org, dmitry.fomichev@wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v11 4/4] docs/zoned-storage:add zoned emulation use case
Date: Mon,  8 May 2023 13:19:16 +0800
Message-Id: <20230508051916.178322-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508051916.178322-1-faithilikerun@gmail.com>
References: <20230508051916.178322-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
2.40.0


