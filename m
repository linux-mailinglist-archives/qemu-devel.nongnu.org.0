Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E734755FC59
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:44:38 +0200 (CEST)
Received: from localhost ([::1]:50072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6UFR-0002Nu-RA
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6U5R-0006Lj-LJ
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:34:17 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:45884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6U5P-0000db-M0
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 05:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to;
 bh=lOKvM8qagVWDLXNc7aRUv/qVSlJP/SmnAQ9iPljGSD8=;
 b=IIXV4Z7kUQHMVeLK+cJ3V3EvzbdHXyhvyqzLSqApdGtX7KZfNL6ctx+p
 XE8L2UWbzSUvwpjLwX7oi7etH/dleyoZEjIIO1oXg1q1Br/oapAjyctGj
 DoHCNKNz51VpynX7E08CPNi/qIgfUQysrLxfBPz7ueGp/vRzykzuyPkEc s=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,231,1650924000"; d="scan'208";a="18060835"
Received: from clt-128-93-179-171.vpn.inria.fr (HELO [128.93.179.171])
 ([128.93.179.171]) by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 11:34:13 +0200
Subject: [PATCH v3 1/4] hmat acpi: Don't require initiator value in -numa
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <1e9d4c01-0ce3-4514-1e5b-ffccc6e88f9e@inria.fr>
Message-ID: <965c03a7-b61b-dc25-1527-b26cb5f5f9bd@inria.fr>
Date: Wed, 29 Jun 2022 11:34:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1e9d4c01-0ce3-4514-1e5b-ffccc6e88f9e@inria.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lvcVacswRjgrQf2mwJtxWHGo7BtEYPRcY"
Received-SPF: pass client-ip=192.134.164.104;
 envelope-from=Brice.Goglin@inria.fr; helo=mail3-relais-sop.national.inria.fr
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lvcVacswRjgrQf2mwJtxWHGo7BtEYPRcY
Content-Type: multipart/mixed; boundary="tHl8Guk2qzBkCLK33xmNTiskXE2c6KkvS";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Message-ID: <965c03a7-b61b-dc25-1527-b26cb5f5f9bd@inria.fr>
Subject: [PATCH v3 1/4] hmat acpi: Don't require initiator value in -numa
References: <1e9d4c01-0ce3-4514-1e5b-ffccc6e88f9e@inria.fr>
In-Reply-To: <1e9d4c01-0ce3-4514-1e5b-ffccc6e88f9e@inria.fr>

--tHl8Guk2qzBkCLK33xmNTiskXE2c6KkvS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
has a "Processor Proximity Domain Valid" flag that is currently
always set because Qemu -numa requires an initiator=3DX value
when hmat=3Don. Unsetting this flag allows to create more complex
memory topologies by having multiple best initiators for a single
memory target.

This patch allows -numa without initiator=3DX when hmat=3Don by keeping
the default value MAX_NODES in numa_state->nodes[i].initiator.
All places reading numa_state->nodes[i].initiator already check
whether it's different from MAX_NODES before using it.

Tested with
qemu-system-x86_64 -accel kvm \
  -machine pc,hmat=3Don \
  -drive if=3Dpflash,format=3Draw,file=3D./OVMF.fd \
  -drive media=3Ddisk,format=3Dqcow2,file=3Defi.qcow2 \
  -smp 4 \
  -m 3G \
  -object memory-backend-ram,size=3D1G,id=3Dram0 \
  -object memory-backend-ram,size=3D1G,id=3Dram1 \
  -object memory-backend-ram,size=3D1G,id=3Dram2 \
  -numa node,nodeid=3D0,memdev=3Dram0,cpus=3D0-1 \
  -numa node,nodeid=3D1,memdev=3Dram1,cpus=3D2-3 \
  -numa node,nodeid=3D2,memdev=3Dram2 \
  -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D10 \
  -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D10485760 \
  -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D20 \
  -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D5242880 \
  -numa hmat-lb,initiator=3D0,target=3D2,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D30 \
  -numa hmat-lb,initiator=3D0,target=3D2,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D1048576 \
  -numa hmat-lb,initiator=3D1,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D20 \
  -numa hmat-lb,initiator=3D1,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D5242880 \
  -numa hmat-lb,initiator=3D1,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D10 \
  -numa hmat-lb,initiator=3D1,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D10485760 \
  -numa hmat-lb,initiator=3D1,target=3D2,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D30 \
  -numa hmat-lb,initiator=3D1,target=3D2,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D1048576
which reports NUMA node2 at same distance from both node0 and node1 as se=
en in lstopo:
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

Before this patch, we had to add ",initiator=3DX" to "-numa node,nodeid=3D=
2,memdev=3Dram2".
The lstopo output difference between initiator=3D1 and no initiator is:
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
  [078h 0120   2]               Structure Type : 0000 [Memory Proximity D=
omain Attributes]
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
[0A0h 0160   2]               Structure Type : 0001 [System Locality Late=
ncy and Bandwidth Information]
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

[0E0h 0224   2]               Structure Type : 0001 [System Locality Late=
ncy and Bandwidth Information]
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
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
  hw/core/machine.c | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index a673302cce..d4d7e77401 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1173,9 +1173,7 @@ static void numa_validate_initiator(NumaState *numa=
_state)
 =20
      for (i =3D 0; i < numa_state->num_nodes; i++) {
          if (numa_info[i].initiator =3D=3D MAX_NODES) {
-            error_report("The initiator of NUMA node %d is missing, use =
"
-                         "'-numa node,initiator' option to declare it", =
i);
-            exit(1);
+            continue;
          }
 =20
          if (!numa_info[numa_info[i].initiator].present) {
--=20
2.30.2




--tHl8Guk2qzBkCLK33xmNTiskXE2c6KkvS--

--lvcVacswRjgrQf2mwJtxWHGo7BtEYPRcY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmK8HJQFAwAAAAAACgkQRJGQ8yNavTsh
fw//X/JikQnpsnlwoRzw2VbO/R4zCkuh46Nu+QKbpGyfgkCWtfi8e+7jOByvk8270XrKLnFGXVvW
6zoaX1cRu8XkDwQyUO/w8vEpFdCN1FQrnL4UcwFbk56bhaqWWBUl5StT6aES/MOyXvpXbmK1X11u
dV4OWAqunnbQq39As4p3BG18DLwJS52WyyM8ijqAlR4AoiftvFU+VAlAQChHkq2RlU2h8fACcvka
wvPDV4ewahQDHWwfLiCnCbMqVwYtsHjvWYgLSx92s+FrONwd/efwcndc6v35Pb6N/gzISPbAS8XI
D4QFydG71epMyJmXMLJlgDimc3kV8AUtsAsf47GScEa7WJt+yCd6fURj6DIvoPbG0MprtdY5bXbV
2iGrOswpiPmCK69zMrf8RE8PsVN/0wf7UF0SFhKOihSH/aHlLprZ+ULmD1CXJ8K0WKI80+7gOfIn
DKfg+dbtMuKH319XGlgGMemJmPWfRi5WjU80JkWcSWLofmkcge3wG3BvBPMkxH6Lw0wJ43sBo28x
DealM0VlqcQOid1dyJWOZKiX/s4PwQvku/p0qZEDqLi6WxVU+RnbXGOIhYdjxu0gmhkji3MxfWnO
J8iLdX3s1y1WGxdpMtpVnnbtJG2CRRihPKbTgG/rT+DdQ4pixFBJxcHgq41+iiq/K19e4kSLlMEE
uRQ=
=/heh
-----END PGP SIGNATURE-----

--lvcVacswRjgrQf2mwJtxWHGo7BtEYPRcY--

