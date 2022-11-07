Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7497C6203CE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:33:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAzW-00055y-5Y; Mon, 07 Nov 2022 17:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAzI-00050P-6S
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:53:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAz2-0008Cy-F8
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=07k8A4rUL9cQ02YqKeKDtX/ICWeD2sKhWNjZoFlPqFY=;
 b=bLqG3aelvnGHhgqhYOnbWAnpUXtnqeWhbHVLKFkbUooUYy/UDbhMPyK9Hcp09Z1/6K3i4Q
 CXWdacGAXTfD3m8qLlGh/kAyk0F35PIobQqSn3MjtxHzuQVEd3qqx2kQ8x0PWEWI0hgmkR
 BkmbruetBucdDS7EkFljpaDfKL7c05k=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-w2JVFyPHPd6CfKxlESiK8Q-1; Mon, 07 Nov 2022 17:52:45 -0500
X-MC-Unique: w2JVFyPHPd6CfKxlESiK8Q-1
Received: by mail-qk1-f197.google.com with SMTP id
 bm2-20020a05620a198200b006fa6eeee4a9so11405598qkb.14
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:52:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07k8A4rUL9cQ02YqKeKDtX/ICWeD2sKhWNjZoFlPqFY=;
 b=1sJ4IrBzq+vAcgoavIQaUiF2wFlK9p+2JtFZs1L0QR2QObAVzf+jL+UZvZScvTwaB8
 wjXZzhYYz7vRiicmwNzDNFR7vN9y2lv3CfUNM71My2Qx7LQPDvhYiLQ0nXsFYOGgKkB0
 9pZGEVxZnfKgCi8C2JlSmO9KKl/WnN+Qadi44Q0CoILfUqzmc4YqXJ7NZvtr/ApjjsUl
 nY4WZHswSBUKXr29ENroFch+zC6Z3Lm4fqztp+GP1SfjlXlvt4EOLhHrT+SWh0CqZpsL
 /xcUXxPH0MaQjALrAhPC5EPGLjKQdpdV9pDL9ijaImlIPrfIddHzhZqQu/i3m/wEdz7C
 yIEg==
X-Gm-Message-State: ACrzQf3dcg65GciZ2GJbp5wi1CwbsEWTEQ3/ZzBcZTxgdm87F1j0uokL
 7jzjzpMWc4K/aURoMW9fmnY9Lk6ZjqfGPwVlyhS1saItyT3e6zsmUkp0ka0NVi0U/F7kjOJYH7Q
 xUMyDpVHcNebn+oTOewBzL0CbPo8EpZbv8E+XbUYCYEW8+B5URSKmzjlqj0Ix
X-Received: by 2002:a05:620a:1b9c:b0:6fa:9fd8:99ca with SMTP id
 dv28-20020a05620a1b9c00b006fa9fd899camr12159052qkb.723.1667861564582; 
 Mon, 07 Nov 2022 14:52:44 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6Qb327+0cwukRmMXUlEdluDlUS5VMQmzRbp29/TbUNpoXFavnnGW9R4j7IIwes63f7Z3G9qw==
X-Received: by 2002:a05:620a:1b9c:b0:6fa:9fd8:99ca with SMTP id
 dv28-20020a05620a1b9c00b006fa9fd899camr12159023qkb.723.1667861564236; 
 Mon, 07 Nov 2022 14:52:44 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 q3-20020a05620a2a4300b006eed47a1a1esm7795165qkp.134.2022.11.07.14.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:52:44 -0800 (PST)
Date: Mon, 7 Nov 2022 17:52:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Brice Goglin <Brice.Goglin@inria.fr>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Jingqi Liu <jingqi.liu@intel.com>, Yicong Yang <yangyicong@hisilicon.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL v4 62/83] hmat acpi: Don't require initiator value in -numa
Message-ID: <20221107224600.934080-63-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Brice Goglin <Brice.Goglin@inria.fr>

The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
has a "Processor Proximity Domain Valid" flag that is currently
always set because Qemu -numa requires an initiator=X value
when hmat=on. Unsetting this flag allows to create more complex
memory topologies by having multiple best initiators for a single
memory target.

This patch allows -numa without initiator=X when hmat=on by keeping
the default value MAX_NODES in numa_state->nodes[i].initiator.
All places reading numa_state->nodes[i].initiator already check
whether it's different from MAX_NODES before using it.

Tested with
qemu-system-x86_64 -accel kvm \
 -machine pc,hmat=on \
 -drive if=pflash,format=raw,file=./OVMF.fd \
 -drive media=disk,format=qcow2,file=efi.qcow2 \
 -smp 4 \
 -m 3G \
 -object memory-backend-ram,size=1G,id=ram0 \
 -object memory-backend-ram,size=1G,id=ram1 \
 -object memory-backend-ram,size=1G,id=ram2 \
 -numa node,nodeid=0,memdev=ram0,cpus=0-1 \
 -numa node,nodeid=1,memdev=ram1,cpus=2-3 \
 -numa node,nodeid=2,memdev=ram2 \
 -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \
 -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
 -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \
 -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
 -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
 -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 \
 -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 \
 -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
 -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
 -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
 -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
 -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576
which reports NUMA node2 at same distance from both node0 and node1 as seen in lstopo:
Machine (2966MB total) + Package P#0
  NUMANode P#2 (979MB)
  Group0
    NUMANode P#0 (980MB)
    Core P#0 + PU P#0
    Core P#1 + PU P#1
  Group0
    NUMANode P#1 (1007MB)
    Core P#2 + PU P#2
    Core P#3 + PU P#3

Before this patch, we had to add ",initiator=X" to "-numa node,nodeid=2,memdev=ram2".
The lstopo output difference between initiator=1 and no initiator is:
@@ -1,10 +1,10 @@
 Machine (2966MB total) + Package P#0
+  NUMANode P#2 (979MB)
   Group0
     NUMANode P#0 (980MB)
     Core P#0 + PU P#0
     Core P#1 + PU P#1
   Group0
     NUMANode P#1 (1007MB)
-    NUMANode P#2 (979MB)
     Core P#2 + PU P#2
     Core P#3 + PU P#3

Corresponding changes in the HMAT MPDA structure:
@@ -49,10 +49,10 @@
 [078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
 [07Ah 0122   2]                     Reserved : 0000
 [07Ch 0124   4]                       Length : 00000028
-[080h 0128   2]        Flags (decoded below) : 0001
-            Processor Proximity Domain Valid : 1
+[080h 0128   2]        Flags (decoded below) : 0000
+            Processor Proximity Domain Valid : 0
 [082h 0130   2]                    Reserved1 : 0000
-[084h 0132   4] Attached Initiator Proximity Domain : 00000001
+[084h 0132   4] Attached Initiator Proximity Domain : 00000080
 [088h 0136   4]      Memory Proximity Domain : 00000002
 [08Ch 0140   4]                    Reserved2 : 00000000
 [090h 0144   8]                    Reserved3 : 0000000000000000

Final HMAT SLLB structures:
[0A0h 0160   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
[0A2h 0162   2]                     Reserved : 0000
[0A4h 0164   4]                       Length : 00000040
[0A8h 0168   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[0A9h 0169   1]                    Data Type : 00
[0AAh 0170   2]                    Reserved1 : 0000
[0ACh 0172   4] Initiator Proximity Domains # : 00000002
[0B0h 0176   4]   Target Proximity Domains # : 00000003
[0B4h 0180   4]                    Reserved2 : 00000000
[0B8h 0184   8]              Entry Base Unit : 0000000000002710
[0C0h 0192   4] Initiator Proximity Domain List : 00000000
[0C4h 0196   4] Initiator Proximity Domain List : 00000001
[0C8h 0200   4] Target Proximity Domain List : 00000000
[0CCh 0204   4] Target Proximity Domain List : 00000001
[0D0h 0208   4] Target Proximity Domain List : 00000002
[0D4h 0212   2]                        Entry : 0001
[0D6h 0214   2]                        Entry : 0002
[0D8h 0216   2]                        Entry : 0003
[0DAh 0218   2]                        Entry : 0002
[0DCh 0220   2]                        Entry : 0001
[0DEh 0222   2]                        Entry : 0003

[0E0h 0224   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
[0E2h 0226   2]                     Reserved : 0000
[0E4h 0228   4]                       Length : 00000040
[0E8h 0232   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[0E9h 0233   1]                    Data Type : 03
[0EAh 0234   2]                    Reserved1 : 0000
[0ECh 0236   4] Initiator Proximity Domains # : 00000002
[0F0h 0240   4]   Target Proximity Domains # : 00000003
[0F4h 0244   4]                    Reserved2 : 00000000
[0F8h 0248   8]              Entry Base Unit : 0000000000000001
[100h 0256   4] Initiator Proximity Domain List : 00000000
[104h 0260   4] Initiator Proximity Domain List : 00000001
[108h 0264   4] Target Proximity Domain List : 00000000
[10Ch 0268   4] Target Proximity Domain List : 00000001
[110h 0272   4] Target Proximity Domain List : 00000002
[114h 0276   2]                        Entry : 000A
[116h 0278   2]                        Entry : 0005
[118h 0280   2]                        Entry : 0001
[11Ah 0282   2]                        Entry : 0005
[11Ch 0284   2]                        Entry : 000A
[11Eh 0286   2]                        Entry : 0001

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
Message-Id: <20221027100037.251-2-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/core/machine.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 907fa78ff0..8d34caa31d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1178,9 +1178,7 @@ static void numa_validate_initiator(NumaState *numa_state)
 
     for (i = 0; i < numa_state->num_nodes; i++) {
         if (numa_info[i].initiator == MAX_NODES) {
-            error_report("The initiator of NUMA node %d is missing, use "
-                         "'-numa node,initiator' option to declare it", i);
-            exit(1);
+            continue;
         }
 
         if (!numa_info[numa_info[i].initiator].present) {
-- 
MST


