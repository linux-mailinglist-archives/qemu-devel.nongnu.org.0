Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9968F30CBB0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 20:33:10 +0100 (CET)
Received: from localhost ([::1]:48454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l71QD-0001ON-Lx
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 14:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l71OG-0008Sy-SA
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 14:31:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l71OE-0001Iu-Vb
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 14:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612294266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ji6KeukqbRf7zODdJI6lHJJTAz5NSV5XkIwI85m3pt4=;
 b=Ma1E28rzJvydaieiEmH34czMD1KTX5VJxe7P0W21X95MqMTn37pXGnqMS0ibbn99aDPjT2
 FYIZNth13migQhJpVEoMZdseKXupp62rhBL/1yzYJ0QeUunzpqFSqr1JKsMsewVAP6728I
 QbjdM820iJnAmUtJCnxcEeqOYViUS5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-nxIsz9zMP6GTyFYNLWm2Dw-1; Tue, 02 Feb 2021 14:30:55 -0500
X-MC-Unique: nxIsz9zMP6GTyFYNLWm2Dw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 083DA1084D61;
 Tue,  2 Feb 2021 19:30:26 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3B1350B44;
 Tue,  2 Feb 2021 19:30:25 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 3/3] nvdimm: check -object memory-backend-file,
 readonly=on option
Date: Tue,  2 Feb 2021 14:30:20 -0500
Message-Id: <20210202193020.4107711-4-ehabkost@redhat.com>
In-Reply-To: <20210202193020.4107711-1-ehabkost@redhat.com>
References: <20210202193020.4107711-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Check that -device nvdimm,unarmed=on is used when -object
memory-backend-file,readonly=on and document that -device
nvdimm,unarmed=on|off controls whether the NVDIMM appears read-only to
the guest.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20210104171320.575838-4-stefanha@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/nvdimm.txt | 24 +++++++++++++++++-------
 hw/mem/nvdimm.c |  9 +++++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
index c2c6e441b34..0aae682be3e 100644
--- a/docs/nvdimm.txt
+++ b/docs/nvdimm.txt
@@ -17,8 +17,8 @@ following command line options:
 
  -machine pc,nvdimm
  -m $RAM_SIZE,slots=$N,maxmem=$MAX_SIZE
- -object memory-backend-file,id=mem1,share=on,mem-path=$PATH,size=$NVDIMM_SIZE
- -device nvdimm,id=nvdimm1,memdev=mem1
+ -object memory-backend-file,id=mem1,share=on,mem-path=$PATH,size=$NVDIMM_SIZE,readonly=off
+ -device nvdimm,id=nvdimm1,memdev=mem1,unarmed=off
 
 Where,
 
@@ -31,9 +31,10 @@ Where,
    of normal RAM devices and vNVDIMM devices, e.g. $MAX_SIZE should be
    >= $RAM_SIZE + $NVDIMM_SIZE here.
 
- - "object memory-backend-file,id=mem1,share=on,mem-path=$PATH,size=$NVDIMM_SIZE"
-   creates a backend storage of size $NVDIMM_SIZE on a file $PATH. All
-   accesses to the virtual NVDIMM device go to the file $PATH.
+ - "object memory-backend-file,id=mem1,share=on,mem-path=$PATH,
+   size=$NVDIMM_SIZE,readonly=off" creates a backend storage of size
+   $NVDIMM_SIZE on a file $PATH. All accesses to the virtual NVDIMM device go
+   to the file $PATH.
 
    "share=on/off" controls the visibility of guest writes. If
    "share=on", then guest writes will be applied to the backend
@@ -42,8 +43,17 @@ Where,
    "share=off", then guest writes won't be applied to the backend
    file and thus will be invisible to other guests.
 
- - "device nvdimm,id=nvdimm1,memdev=mem1" creates a virtual NVDIMM
-   device whose storage is provided by above memory backend device.
+   "readonly=on/off" controls whether the file $PATH is opened read-only or
+   read/write (default).
+
+ - "device nvdimm,id=nvdimm1,memdev=mem1,unarmed=off" creates a read/write
+   virtual NVDIMM device whose storage is provided by above memory backend
+   device.
+
+   "unarmed" controls the ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM
+   State Flags" Bit 3 indicating that the device is "unarmed" and cannot accept
+   persistent writes. Linux guest drivers set the device to read-only when this
+   bit is present. Set unarmed to on when the memdev has readonly=on.
 
 Multiple vNVDIMM devices can be created if multiple pairs of "-object"
 and "-device" are provided.
diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 03c2201b564..e0a9d606e1b 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -146,6 +146,15 @@ static void nvdimm_prepare_memory_region(NVDIMMDevice *nvdimm, Error **errp)
         return;
     }
 
+    if (!nvdimm->unarmed && memory_region_is_rom(mr)) {
+        HostMemoryBackend *hostmem = dimm->hostmem;
+
+        error_setg(errp, "'unarmed' property must be off since memdev %s "
+                   "is read-only",
+                   object_get_canonical_path_component(OBJECT(hostmem)));
+        return;
+    }
+
     nvdimm->nvdimm_mr = g_new(MemoryRegion, 1);
     memory_region_init_alias(nvdimm->nvdimm_mr, OBJECT(dimm),
                              "nvdimm-memory", mr, 0, pmem_size);
-- 
2.28.0


