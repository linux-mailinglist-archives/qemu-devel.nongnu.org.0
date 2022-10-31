Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC8613781
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:11:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUJN-00062W-4J; Mon, 31 Oct 2022 08:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJ5-0004qX-Lg
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJ3-0003S7-1d
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qT7pmuuhAedegTkhVbDvlHMbBR0jRGRVLdkXNqaowBM=;
 b=goWDtY7ggYcFRiXtnqzGdsytwqhl/9PGEX8GdKciKaG0ecLuctrpMIHzBoJBdHWA3uvKch
 kNv/XPC3l4nWlypXmOWAS1DtpEKZpyffGbuMk3wOHe5U/DCAqrtP0KWD3q3EZrql8frpc/
 Ax2N5yvEibe1XTR/vD9YI2Jbcj8k0qc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-Zr10nF2IPIGjOn3IwJj91g-1; Mon, 31 Oct 2022 08:54:19 -0400
X-MC-Unique: Zr10nF2IPIGjOn3IwJj91g-1
Received: by mail-wr1-f70.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso3037769wrc.10
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qT7pmuuhAedegTkhVbDvlHMbBR0jRGRVLdkXNqaowBM=;
 b=j8k/Wu0mKfgBK2xu19rf5lXDyTXSkWFQW+xNgkOR8XjySHsZuum8rgJcfrN35T69zB
 mVUJScAx4Q9l4lxY5FuRyhtPrvuZDww5NTW1wa1RF84kE8EYuJKxOkAeWhAfFWpELX9Q
 FoCNTXaB5HgUlwSCwQwLBtVoQ/NxFPM7haDcAvPyv9alo0P4Apw31OYQglXZxmGtlkY3
 NVFiQf5kAQmnTLZMAHhSf67rO/TJSUuF9SE54FgO6eaxdjNjUN9NDsOAhXV8oxCrOfe5
 SDqufjTPidFxxG0ZupWyYHrbX5C/KEXHzseinVU75V39ge8VMOIZtOBhQuwxY5sYueD6
 tWlQ==
X-Gm-Message-State: ACrzQf3UC2lD+/HfaeJlGrh9zr4zbmvXARSe/j4PAkksYZJFijtDV8Pi
 1Cne8D0hmEXebdLOBoPiNiPRPg/VoGU16ngwSPlaBxqxzYHdy1iV0+cRFIir783/D/MnCt9OMXX
 Rr+LVAX+lVhjEakAVwWhOA/dPqbuUBwR9OQLRFE4+BqChttOoWxDutZQwT34e
X-Received: by 2002:a05:600c:2116:b0:3cf:69ff:5da2 with SMTP id
 u22-20020a05600c211600b003cf69ff5da2mr5827983wml.16.1667220857598; 
 Mon, 31 Oct 2022 05:54:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5vptNRZMIA7t3JHryUnhR6eEiBWklzQC7SQbJ2Yp9+KgzZKBp+avfyy68CLXgRNG7xGOHMfg==
X-Received: by 2002:a05:600c:2116:b0:3cf:69ff:5da2 with SMTP id
 u22-20020a05600c211600b003cf69ff5da2mr5827954wml.16.1667220857247; 
 Mon, 31 Oct 2022 05:54:17 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 j18-20020a5d6192000000b00228692033dcsm7035481wru.91.2022.10.31.05.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:54:16 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:54:14 -0400
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
Subject: [PULL 74/86] hmat acpi: Don't require initiator value in -numa
Message-ID: <20221031124928.128475-75-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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
index 65fdfe2fed..3f66fca5c6 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1180,9 +1180,7 @@ static void numa_validate_initiator(NumaState *numa_state)
 
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


