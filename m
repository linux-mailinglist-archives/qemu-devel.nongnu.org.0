Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9866555B4A8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 02:25:24 +0200 (CEST)
Received: from localhost ([::1]:58014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5cZ9-000686-NR
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 20:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5cTx-0007cC-23; Sun, 26 Jun 2022 20:20:01 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5cTv-0000cT-JI; Sun, 26 Jun 2022 20:20:00 -0400
Received: by mail-pg1-x529.google.com with SMTP id e63so7606141pgc.5;
 Sun, 26 Jun 2022 17:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aQauG1xPWeXI+3hfKGKaEx5Uo9MpNuqh+ACmDAc1ZzE=;
 b=aWXAjIFRFoUn1lu8WZWdcitgCH70rSMTKMWc5IsK+JeYA02NIgA8xYNCYJmmzucPrV
 JPKWXNlWXa67SlnQ8jL0CzfqxELvsZtcvb57pDLqn0d9vU5qfvV76toaAJm3IDiXDZ7W
 BDfqvUnEP9PqgZmiwf+TJISXkMGHuhgEciYNiGHk+ZmirDQt/0tn8nOP1Ziu33G8MsqQ
 df72ZTs91teS4nJIUTm+qCSQtPlzT8WH1JUFL6kCbVBBshwacxjArI5TtA8Dt7U5Nav+
 lV/ZR1fc95B2/S7j/8oXyKAH5glc1juY+c7J0SQ30r0aNErKNZwR1dNC24bkthzfSUJl
 H4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQauG1xPWeXI+3hfKGKaEx5Uo9MpNuqh+ACmDAc1ZzE=;
 b=35qSKQ20d/spti7xnycZq2BBR4nc1yl2u246ggbk41xMB9uo8nnCHZE8sXmS7N0c0N
 cD9r0LwKnoM9y1h5gwCL9PI8Mddyc5y+2Gtt9BBiHz61XQU5J1TcCtrqDk0QTXZ0YPtb
 9DNaaL2fpa94ZPGNluQyXJ1vBvOYAEaoknRqx59g+cC2RO/l1CXyU/ZOygZngRTPaXBq
 cQwcO5CUskiIKXPbBqhid2vVouuWXjMRUUN7pGBKmNbqWK3o9KZQ/A7N+1pg9aIm/zE4
 JyJ5rAMrN9CNWz1JtpGDXVTl9WppM02UaPQTGP1omlKARjec0eunv4PrP7ZRJKTziEPU
 t6Fg==
X-Gm-Message-State: AJIora/gkI6qYCKqxW71cINCHyRHl+mgug6NiGmB8wISg7ZM2o4GEINW
 cYCkiwOxKqabeqos7H6Ec2kBHkGul8fxWQ==
X-Google-Smtp-Source: AGRyM1ug3HIg7eEB+p9y1Swwh5+5wajVhKElOIz86ty7UaREXqjw5gmd3YxxE6YK68d3IHEMbU0GPA==
X-Received: by 2002:a63:454c:0:b0:40d:ffa7:9dc4 with SMTP id
 u12-20020a63454c000000b0040dffa79dc4mr1596506pgk.500.1656289197881; 
 Sun, 26 Jun 2022 17:19:57 -0700 (PDT)
Received: from fedora.. ([106.84.130.34]) by smtp.gmail.com with ESMTPSA id
 e11-20020a6558cb000000b00408b89e4282sm5715294pgu.47.2022.06.26.17.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 17:19:57 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v3 5/5] qemu-iotests: add zone operation tests.
Date: Mon, 27 Jun 2022 08:19:17 +0800
Message-Id: <20220627001917.9417-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627001917.9417-1-faithilikerun@gmail.com>
References: <20220627001917.9417-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 tests/qemu-iotests/tests/zoned.sh | 49 +++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
new file mode 100755
index 0000000000..262c0b5427
--- /dev/null
+++ b/tests/qemu-iotests/tests/zoned.sh
@@ -0,0 +1,49 @@
+#!/usr/bin/env bash
+#
+# Test zone management operations.
+#
+
+QEMU_IO="build/qemu-io"
+IMG="--image-opts driver=zoned_host_device,filename=/dev/nullb0"
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
+
+echo "Testing a null_blk device"
+echo "Simple cases: if the operations work"
+sudo modprobe null_blk nr_devices=1 zoned=1
+# hidden issues:
+# 1. memory allocation error of "unaligned tcache chunk detected" when the nr_zone=1 in zone report
+# 2. qemu-io: after report 10 zones, the program failed at double free error and exited.
+echo "report the first zone"
+sudo $QEMU_IO $IMG -c "zone_report 0 0 1"
+echo "report: the first 10 zones"
+sudo $QEMU_IO $IMG -c "zone_report 0 0 10"
+
+echo "open the first zone"
+sudo $QEMU_IO $IMG -c "zone_open 0 0x80000"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zone_report 0 0 1"
+echo "open the last zone"
+sudo $QEMU_IO $IMG -c "zone_open 0x3e70000000 0x80000"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zone_report 0x3e70000000 0 2"
+
+echo "close the first zone"
+sudo $QEMU_IO $IMG -c "zone_close 0 0x80000"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zone_report 0 0 1"
+echo "close the last zone"
+sudo $QEMU_IO $IMG -c "zone_close 0x3e70000000 0x80000"
+echo "report after:"
+sudo $QEMU_IO $IMG -c "zone_report 0x3e70000000 0 2"
+
+
+echo "reset the second zone"
+sudo $QEMU_IO $IMG -c "zone_reset 0x80000 0x80000"
+echo "After resetting a zone:"
+sudo $QEMU_IO $IMG -c "zone_report 0x80000 0 5"
+
+# success, all done
+sudo rmmod null_blk
+echo "*** done"
+#rm -f $seq.full
+status=0
-- 
2.35.3


