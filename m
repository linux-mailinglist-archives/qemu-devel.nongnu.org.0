Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF457519DF2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:27:56 +0200 (CEST)
Received: from localhost ([::1]:36220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDAh-0002XA-PQ
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBpD-0000Ql-6h
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBpA-0006HN-IO
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651658495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBGmOd+ztf6Fw/4X0tGkERuaGl13ZSRfvCTVQ/ZlYFA=;
 b=BEeBMhTUX/qiYZfLCYh+2fBM11byf2MhcVRqfT1r3rcSUfBFWCQxDsUFiJY/DfPirMkGKE
 ge5J9LO4t/2d97uuuBpHqAUqWuhiMvEvXvkUwrf9xADYxbvmjLJn6EuqxchcriZiopLBwH
 3MMNXGvw8qyzN0Tn2u4pkGTGvgWclj4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-hfw1pr6tP8OGeSdDOoN40A-1; Wed, 04 May 2022 06:01:34 -0400
X-MC-Unique: hfw1pr6tP8OGeSdDOoN40A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31081811E78;
 Wed,  4 May 2022 10:01:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CD3840CFD32;
 Wed,  4 May 2022 10:01:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PULL 6/7] qga: Introduce NVMe disk bus type
Date: Wed,  4 May 2022 14:01:00 +0400
Message-Id: <20220504100101.564747-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220504100101.564747-1-marcandre.lureau@redhat.com>
References: <20220504100101.564747-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: zhenwei pi <pizhenwei@bytedance.com>

Assigning a NVMe disk by VFIO or emulating a NVMe controller by QEMU,
a NVMe disk get exposed in guest side. Support NVMe disk bus type and
implement posix version.

Test PCI passthrough case:
~#virsh qemu-agent-command buster '{"execute":"guest-get-disks"}' | jq
  ...
    {
      "name": "/dev/nvme0n1",
      "dependencies": [],
      "partition": false,
      "address": {
        "serial": "SAMSUNG MZQL23T8HCLS-00A07_S64HNE0N500076",
        "bus-type": "nvme",
        "bus": 0,
        "unit": 0,
        "pci-controller": {
          "bus": 0,
          "slot": 22,
          "domain": 0,
          "function": 0
        },
        "dev": "/dev/nvme0n1",
        "target": 0
      }
  ...

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20220420022610.418052-2-pizhenwei@bytedance.com>
---
 qga/qapi-schema.json | 3 ++-
 qga/commands-posix.c | 5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 94e4aacdcc65..5ea76cfd1d73 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -827,13 +827,14 @@
 # @mmc: Win multimedia card (MMC) bus type
 # @virtual: Win virtual bus type
 # @file-backed-virtual: Win file-backed bus type
+# @nvme: NVMe disks (since 7.1)
 #
 # Since: 2.2; 'Unknown' and all entries below since 2.4
 ##
 { 'enum': 'GuestDiskBusType',
   'data': [ 'ide', 'fdc', 'scsi', 'virtio', 'xen', 'usb', 'uml', 'sata',
             'sd', 'unknown', 'ieee1394', 'ssa', 'fibre', 'raid', 'iscsi',
-            'sas', 'mmc', 'virtual', 'file-backed-virtual' ] }
+            'sas', 'mmc', 'virtual', 'file-backed-virtual', 'nvme' ] }
 
 
 ##
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 7ab8d5eb3c69..a5fbae00e90c 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -890,7 +890,8 @@ static bool build_guest_fsinfo_for_pci_dev(char const *syspath,
         if (driver && (g_str_equal(driver, "ata_piix") ||
                        g_str_equal(driver, "sym53c8xx") ||
                        g_str_equal(driver, "virtio-pci") ||
-                       g_str_equal(driver, "ahci"))) {
+                       g_str_equal(driver, "ahci") ||
+                       g_str_equal(driver, "nvme"))) {
             break;
         }
 
@@ -985,6 +986,8 @@ static bool build_guest_fsinfo_for_pci_dev(char const *syspath,
             g_debug("no host for '%s' (driver '%s')", syspath, driver);
             goto cleanup;
         }
+    } else if (strcmp(driver, "nvme") == 0) {
+        disk->bus_type = GUEST_DISK_BUS_TYPE_NVME;
     } else {
         g_debug("unknown driver '%s' (sysfs path '%s')", driver, syspath);
         goto cleanup;
-- 
2.36.0.44.g0f828332d5ac


