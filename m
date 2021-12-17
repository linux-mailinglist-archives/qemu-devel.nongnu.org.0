Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D037478561
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 08:05:53 +0100 (CET)
Received: from localhost ([::1]:36676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my7JQ-0003sz-1q
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 02:05:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1my7ES-0002ce-8W
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 02:00:44 -0500
Received: from [2a01:111:f400:fea5::825] (port=50240
 helo=IND01-BO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1my7EO-0003pX-5X
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 02:00:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZELVTSwsMuwxL/apwCgk2jYtWrR66zwDPG/zeX0XfHRZCelJpwY7V697XhhDKgTGpnL2zIW/YF5ETs9XV8RuVkoJzbhijakpXOS59CiixiaJ1P4MfYX4A8Vs2RYh+G/ptSxG3zQN7jidYSluJCZ9peABkyZBkx989gc9p6SD6MgDTgPNL4FJ7pBEEexPyAAF2Q5BHyV9rEgijvrNY/T+wn2RyurwC+Ighd87ZK1ashhCdnXujBaBmnP+eViqmYsVu7t1avxwrGzDBq/nmLKyIye+LCXBMIMKTgtc67g4d2HmggXZdEA3sVlYwBKoaDzjRR7YKPDmioWmQdh5p5zmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8heyUTa8Ln+lpWEWSxYXqhh/VZ1ZNr51pIPKuYMMTvk=;
 b=X7IH5e8J3GJmi4shPwDhmkko6sIuPTT/k+GLQ6XJ23H9Iz4j5/pA9VEF2yL4FbKUgDS3OszhynKcZYhziZN5ls7CDk1Dgf65VlfMBeJC56AxlEt3tWyYd/xP8X5rPn31hYqxNNUbDqPgDkXiSHe3aiM/i3AWaawceje6KQwNOForzphGnNQecJtWOB/WX54nhara2vQfczYehd2V5RM6bSXPZhf1RRzfjWVcdCKbszt+b7JjApIOfQkiG/umul4/iVrV2W/NWD3DDUv+LoOH+pu/XDTStty4Ai/tQzG+jz1EGnnfjgT7PALMVxq3D1cyELWjTWWsNJWH1eVby0nhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8heyUTa8Ln+lpWEWSxYXqhh/VZ1ZNr51pIPKuYMMTvk=;
 b=j/imXUDJCxij9Jau9T+ENi0AiX5WJ9XzbeHvZ0EWekFbrQWLanwPyqugW6XYEDpSczaln6A21jg0Nb2+asxsrD0jLzyXNpneLuP6YCsj3m2b+pVU3Rs3QoRs4CO6TxD7dBr+gXfT6zihEoScsmCkEsb73AAdx2TJSNfZW6HP0CarTsbdG5g/2pbE3G5EMjiFepBqjKmN3BKLinla2VAbaejDiaq08L0neUIwFqmr7ewtuxqV55RdncI6eFjkoW5cr3GtUq+7IbCzhyh2Y8MrJ8/dp3/Yup9IQrGhnnc1b1biJABkFDddxC4S0UlawY4TG+ZDJni0+wQhtoheHfqnBw==
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:72::9)
 by PN0PR01MB7671.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:b7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 06:27:44 +0000
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b943:a630:da36:19ad]) by PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b943:a630:da36:19ad%5]) with mapi id 15.20.4801.015; Fri, 17 Dec 2021
 06:27:44 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
Thread-Topic: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
Thread-Index: AQHX8vOE8JQFGZhxSUOnUPZ/Fa8BJqw2Mbez
Date: Fri, 17 Dec 2021 06:27:44 +0000
Message-ID: <PN0PR01MB6352C2E496E5723275EB1878FC789@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
References: <20211217030858.834822-1-alxndr@bu.edu>
In-Reply-To: <20211217030858.834822-1-alxndr@bu.edu>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 1b9faf91-9f86-debb-6a99-97c12469929d
x-tmn: [NJRLgEeHddwGk9AMayDHHF7Ow99D97o4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b42f709-aa73-4062-889c-08d9c126563f
x-ms-traffictypediagnostic: PN0PR01MB7671:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m7Uva/Q7u6BfMNvR0yR784KzQXOO8EBlsl4jliiPdvPag7eHeyWp949KvUk02rN5eS07oIev/gt+z4oo3DFXQTHYJ78FqWL7RN9VR0PnWsOZ17fULkCXB3N9YHybXxDySFfLQDkdoTbsllyFD75/t2GKfUglpdRN1aTHVzCVgyL4YtheaaQWBKAdmBmFHpR9eKk6ozKprjg20W3r5b0qTdc6SVDlgvAmjDbIa9iUb1NbWirlt+ha6+XlXlOiifRpkZNJUfto8kpYR681kQVEZDygSr2fSANCFW5lIXYT0OqhDOF89gY9j9jsfNzFujl3pVxA7Yu8iQIeSEnXs3+HF3tcWhOh+JNMZDW4DWSg6mSXnQXCC59Png2xGNwTgLiHZhWYfuzdeetmCEgAdZKhthOTgn/ECkyDjg6jRpRIXPS8N1BJhHgEWPCFqoormDuKwtYSMRv5EbaHuC5vxl/2p7G4aN9UN2BfVX8Sxnl/HIMdU7oyzXIBXAJ5+xKGlgeHkJ1yS/DreMQUZmmt6iZDdGFYWXSM/y3TkPix4kHamwt54qafnUYc2kqBvIfopKs7bZxwQjyZxutg/Olm3qm31WfC+wJAsCesj8HGMB9T6V1mkzD5Is01M0EUkUpIj+UC
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 1rEmW4tdGbbaHj0UB1HcVV1p8lzHWlitqxrLbYq2IjJTBPim9t38l0fcJGc4vK/28cneww6TaI3M6IgZgbj6HGw8cK2QsqzhnagaTDstEZBMSNbbMk1IEjR+GfXUvuJ3l7CxfYBvx161+ZE+/BHAcCtHQFihZWOZ6myY45aWYrM+eTS1ffSC1o5Y+9p3e5PYXyLu2jbBgQdCfYP/G5JIgq2SM/Z7HfeRYyXKbLo3wBDhztXKQur79m/6LlMUBG/UBHQCJRgUkkvl+ndvDd2Op3bQ0A+3sWfEdS7dCYpZv9s7aHutH8vfy+p6JccjQ9FFpGmy/cPs/pzmCAXicf6al0SKaqG+pYpxvP5ruZeeXqTmH+sebK/ixMcSWP3almWxsDELE9EDs71wQAL9ALTahqFIUUb+kevTaOxzMMY7/WyuKxa5nbB2B6nzqhMTOOTpfre+K5DeyoRfgE/wrtxpf2xE5CEX2lW2rF5fhRSccdMeEGEiZAOh9PRBPu8hw9Y7Yy4kTARpcX+0Lzt/4VUbQmFlbpK91CTeiU6gfhAPWIVnhPt4MKoH2L6PKMYH0qxV2xf/FjWXIBMQb+lyuVn1harVRXYCJ4rnsfpuT6pwzCWrSmh8v/p7v2+wWdEfJIcjng2dIw4dCXynwdOCUdLhBFJPsUV6fPSDGNHthtnkDMye5y7xWrQ8PxKU5cNYrFQC91sZp/eIv1VSSFDz9IcthtoY72SW+10SQJCI/sIYB/RBgAUNNxMDg6wUkLbT9V68cSfOWlVqZnAWD8GAJcJzUbUtzWpZnudyANjVKL1ro64eEGsnDDlMbPe1dh1o49G7F5j5B+hrnyrNTsjNKVJaNn6hvbGaXQdGLNhPoTF2P3aSXEdf4DcEqSpR6wwIZvKLMlGX4PQO3qONi6+bUpiJLhRuV3Eg7q25MJb5NQGkTCjeCeo2aKcDZ6y9G+n0Fy84
Content-Type: multipart/alternative;
 boundary="_000_PN0PR01MB6352C2E496E5723275EB1878FC789PN0PR01MB6352INDP_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b42f709-aa73-4062-889c-08d9c126563f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 06:27:44.9089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7671
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fea5::825
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fea5::825;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=IND01-BO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?Windows-1252?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?Windows-1252?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_PN0PR01MB6352C2E496E5723275EB1878FC789PN0PR01MB6352INDP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thanks Alex. It seems this patch sets and checks if the destination device =
is busy. But how about the data transfers not triggered directly by PMIO/MM=
IO handlers? For example:

1. Device A Timer's callback -> Device A MMIO handler
2. Device A BH's callback -> Device A MMIO handler

In these situations, when A launches a DMA to itself, the dev->engaged_in_d=
irect_io is not set, so the operation is allowed. Maybe we should log the s=
ource and check the destination when we launch data transfers. Is there a w=
ay to do that?

Below is a reproducer in NVMe which triggers DMA in a timer's callback (nvm=
e_process_sq). I can still trigger use-after-free exception with this patch=
 on qemu-6.1.0:

cat << EOF | ./qemu-system-x86_64 -display none -machine accel=3Dqtest \
-machine q35 -nodefaults -drive file=3Dnull-co://,if=3Dnone,format=3Draw,id=
=3Ddisk0 \
-device nvme,drive=3Ddisk0,serial=3D1 -qtest stdio \

outl 0xcf8 0x80000810               /* MLBAR (BAR0) =96 Memory Register Bas=
e Address, lower 32-bits */
outl 0xcfc 0xe0000000               /* MMIO Base Address =3D 0xe0000000 */
outl 0xcf8 0x80000804               /* CMD - Command */
outw 0xcfc 0x06                     /* Bus Master Enable, Memory Space Enab=
le */
write 0xe0000024 0x4 0x02000200     /* [3] 3.1.8, Admin Queue Attributes */
write 0xe0000028 0x4 0x00100000     /* asq =3D 0x1000 */
write 0xe0000030 0x4 0x00200000     /* acq =3D 0x2000 */
write 0xe0000014 0x4 0x01004600     /* [3] 3.1.5, Controller Configuration,=
 start ctrl */
write 0xe0001000 0x1 0x01           /* [3] 3.1.24, SQyTDBL =96 Submission Q=
ueue y Tail Doorbell */
write 0x1000 0x1 0x02               /* cmd->opcode, NVME_ADM_CMD_GET_LOG_PA=
GE, nvme_get_log() */
write 0x1018 0x4 0x140000e0         /* prp1 =3D 0xe0000014, NVME_REG_CC, nv=
me_ctrl_reset() */
write 0x1028 0x4 0x03000004         /* cmd->cdw10, lid =3D 3 NVME_LOG_FW_SL=
OT_INFO, nvme_fw_log_info, buf_len =3D 4 */
write 0x1030 0x4 0xfc010000         /* cmd->cdw12 =3D 0x1fc, Log Page Offse=
t, trans_len =3D sizeof(fw_log) - 0x1fc =3D 4 */
clock_step
EOF

CC: Mauro Matteo Cascella and Philippe Mathieu-Daud=E9. Should we put the r=
eproducer above to https://gitlab.com/qemu-project/qemu/-/issues/556?

________________________________
From: Alexander Bulekov <alxndr@bu.edu>
Sent: Friday, December 17, 2021 11:08
To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Cc: Alexander Bulekov <alxndr@bu.edu>; Philippe Mathieu-Daud=E9 <philmd@red=
hat.com>; Mauro Matteo Cascella <mcascell@redhat.com>; Qiuhao Li <Qiuhao.Li=
@outlook.com>; Peter Xu <peterx@redhat.com>; Jason Wang <jasowang@redhat.co=
m>; David Hildenbrand <david@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>=
; Peter Maydell <peter.maydell@linaro.org>; Li Qiang <liq3ea@gmail.com>; Th=
omas Huth <thuth@redhat.com>; Laurent Vivier <lvivier@redhat.com>; Bandan D=
as <bsd@redhat.com>; Edgar E . Iglesias <edgar.iglesias@gmail.com>; Darren =
Kenny <darren.kenny@oracle.com>; Bin Meng <bin.meng@windriver.com>; Paolo B=
onzini <pbonzini@redhat.com>; Stefan Hajnoczi <stefanha@redhat.com>; Daniel=
 P. Berrang=E9 <berrange@redhat.com>; Eduardo Habkost <eduardo@habkost.net>
Subject: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level

Here's my shot at fixing dma-reentracy issues. This patch adds a flag to
the DeviceState, which is set/checked when we call an accessor
associated with the device's IO MRs.

The problem, in short, as I understand it: For the vast majority of
cases, we want to prevent a device from accessing it's own PIO/MMIO
regions over DMA.

This patch/solution is based on some assumptions:
1. DMA accesses that hit mmio regions are only dangerous if they end up
interacting with memory-regions belonging to the device initiating the
DMA.
Not dangerous:  sdhci_pio->dma_write->e1000_mmio
Dangerous:      sdhci_pio->dma_write->sdhci_mmio

2. Most devices do not interact with their own PIO/MMIO memory-regions
using DMA.

3. There is no way for there to be multiple simultaneous accesses to a
device's PIO/MMIO memory-regions.

4. All devices are QOMified :-)

With this patch, I wasn't able to reproduce the issues being tracked
here, with QTest reproducers:
https://gitlab.com/qemu-project/qemu/-/issues/556

This passes the i386 qos/qtests for me and I was able to boot some linux/wi=
ndows
VMs with basic devices configured, without any apparent problems.

Cc: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Li Qiang <liq3ea@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Bandan Das <bsd@redhat.com>
Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Cc: Darren Kenny <darren.kenny@oracle.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/hw/qdev-core.h |  1 +
 softmmu/memory.c       | 15 +++++++++++++++
 softmmu/trace-events   |  1 +
 3 files changed, 17 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 20d3066595..32f7c779ab 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,7 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+    int engaged_in_direct_io;
 };

 struct DeviceListener {
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7340e19ff5..255c3c602f 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr add=
r,
     uint64_t access_mask;
     unsigned access_size;
     unsigned i;
+    DeviceState *dev =3D NULL;
     MemTxResult r =3D MEMTX_OK;

     if (!access_size_min) {
@@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr ad=
dr,
         access_size_max =3D 4;
     }

+    /* Do not allow more than one simultanous access to a device's IO Regi=
ons */
+    if (mr->owner &&
+        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        dev =3D (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE=
);
+        if (dev->engaged_in_direct_io) {
+            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, si=
ze);
+            return MEMTX_ERROR;
+        }
+        dev->engaged_in_direct_io =3D true;
+    }
+
     /* FIXME: support unaligned access? */
     access_size =3D MAX(MIN(size, access_size_max), access_size_min);
     access_mask =3D MAKE_64BIT_MASK(0, access_size * 8);
@@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr add=
r,
                         access_mask, attrs);
         }
     }
+    if (dev) {
+        dev->engaged_in_direct_io =3D false;
+    }
     return r;
 }

diff --git a/softmmu/trace-events b/softmmu/trace-events
index 9c88887b3c..d7228316db 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -13,6 +13,7 @@ memory_region_ops_read(int cpu_index, void *mr, uint64_t =
addr, uint64_t value, u
 memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t v=
alue, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value=
 0x%"PRIx64" size %u name '%s'"
 memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint6=
4_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64=
" size %u"
 memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint=
64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx6=
4" size %u"
+memory_region_reentrant_io(int cpu_index, void *mr, uint64_t offset, unsig=
ned size) "cpu %d mr %p offset 0x%"PRIx64" size %u"
 memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint=
64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64"=
 size %u"
 memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uin=
t64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64=
" size %u"
 memory_region_sync_dirty(const char *mr, const char *listener, int global)=
 "mr '%s' listener '%s' synced (global=3D%d)"
--
2.33.0


--_000_PN0PR01MB6352C2E496E5723275EB1878FC789PN0PR01MB6352INDP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks Alex. It seems this patch sets and checks if the destination device =
is busy. But how about the data transfers not triggered directly by PMIO/MM=
IO handlers? For example:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
1.&nbsp;Device A Timer's callback -&gt; Device A MMIO handler</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
2. Device A BH's callback -&gt; Device A MMIO handler</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
In these situations, when A launches a DMA to itself, the&nbsp;dev-&gt;enga=
ged_in_direct_io is not set, so the operation is allowed.&nbsp;<span style=
=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif=
; font-size: 12pt;">Maybe we should log the source
 and check the destination when we launch data transfers. Is there a way to=
 do that?</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Below is a reproducer in NVMe which triggers=
 DMA in a timer's callback (nvme_process_sq). I can still trigger use-after=
-free exception with this patch on
 qemu-6.1.0:</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">cat &lt;&lt; EOF | ./qemu-system-x86_64 -dis=
play none -machine accel=3Dqtest \
<div>-machine q35 -nodefaults -drive file=3Dnull-co://,if=3Dnone,format=3Dr=
aw,id=3Ddisk0 \</div>
<div>-device nvme,drive=3Ddisk0,serial=3D1 -qtest stdio \</div>
<div><br>
</div>
<div>outl 0xcf8 0x80000810 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 /* MLBAR (BAR0) =96 Memory Register Base Address, lower 32-bits */</div>
<div>outl 0xcfc 0xe0000000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 /* MMIO Base Address =3D 0xe0000000 */</div>
<div>outl 0xcf8 0x80000804 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 /* CMD - Command */</div>
<div>outw 0xcfc 0x06 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; /* Bus Master Enable, Memory Space Enable */</div>
<div>write 0xe0000024 0x4 0x02000200 &nbsp; &nbsp; /* [3] 3.1.8, Admin Queu=
e Attributes */</div>
<div>write 0xe0000028 0x4 0x00100000 &nbsp; &nbsp; /* asq =3D 0x1000 */</di=
v>
<div>write 0xe0000030 0x4 0x00200000 &nbsp; &nbsp; /* acq =3D 0x2000 */</di=
v>
<div>write 0xe0000014 0x4 0x01004600 &nbsp; &nbsp; /* [3] 3.1.5, Controller=
 Configuration, start ctrl */</div>
<div>write 0xe0001000 0x1 0x01 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* [3] 3.=
1.24, SQyTDBL =96 Submission Queue y Tail Doorbell */</div>
<div>write 0x1000 0x1 0x02 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 /* cmd-&gt;opcode, NVME_ADM_CMD_GET_LOG_PAGE, nvme_get_log() */</div>
<div>write 0x1018 0x4 0x140000e0 &nbsp; &nbsp; &nbsp; &nbsp; /* prp1 =3D 0x=
e0000014, NVME_REG_CC, nvme_ctrl_reset() */</div>
<div>write 0x1028 0x4 0x03000004 &nbsp; &nbsp; &nbsp; &nbsp; /* cmd-&gt;cdw=
10, lid =3D 3 NVME_LOG_FW_SLOT_INFO, nvme_fw_log_info, buf_len =3D 4 */</di=
v>
<div>write 0x1030 0x4 0xfc010000 &nbsp; &nbsp; &nbsp; &nbsp; /* cmd-&gt;cdw=
12 =3D 0x1fc, Log Page Offset, trans_len =3D sizeof(fw_log) - 0x1fc =3D 4 *=
/</div>
<div>clock_step</div>
<span>EOF</span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><span><br>
</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><span>CC: Mauro Matteo Cascella and&nbsp;Phi=
lippe Mathieu-Daud=E9. Should we put the reproducer above to&nbsp;<a href=
=3D"https://gitlab.com/qemu-project/qemu/-/issues/556" target=3D"_blank" re=
l=3D"noopener noreferrer" data-auth=3D"NotApplicable" data-linkindex=3D"0" =
style=3D"margin:0px;font-size:14.6667px;font-family:&quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-syste=
m, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;backg=
round-color:rgb(255, 255, 255)">https://gitlab.com/qemu-project/qemu/-/issu=
es/556</a>?</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><span><br>
</span></span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Bulekov &lt=
;alxndr@bu.edu&gt;<br>
<b>Sent:</b> Friday, December 17, 2021 11:08<br>
<b>To:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Cc:</b> Alexander Bulekov &lt;alxndr@bu.edu&gt;; Philippe Mathieu-Daud=
=E9 &lt;philmd@redhat.com&gt;; Mauro Matteo Cascella &lt;mcascell@redhat.co=
m&gt;; Qiuhao Li &lt;Qiuhao.Li@outlook.com&gt;; Peter Xu &lt;peterx@redhat.=
com&gt;; Jason Wang &lt;jasowang@redhat.com&gt;; David Hildenbrand &lt;davi=
d@redhat.com&gt;;
 Gerd Hoffmann &lt;kraxel@redhat.com&gt;; Peter Maydell &lt;peter.maydell@l=
inaro.org&gt;; Li Qiang &lt;liq3ea@gmail.com&gt;; Thomas Huth &lt;thuth@red=
hat.com&gt;; Laurent Vivier &lt;lvivier@redhat.com&gt;; Bandan Das &lt;bsd@=
redhat.com&gt;; Edgar E . Iglesias &lt;edgar.iglesias@gmail.com&gt;; Darren
 Kenny &lt;darren.kenny@oracle.com&gt;; Bin Meng &lt;bin.meng@windriver.com=
&gt;; Paolo Bonzini &lt;pbonzini@redhat.com&gt;; Stefan Hajnoczi &lt;stefan=
ha@redhat.com&gt;; Daniel P. Berrang=E9 &lt;berrange@redhat.com&gt;; Eduard=
o Habkost &lt;eduardo@habkost.net&gt;<br>
<b>Subject:</b> [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO l=
evel</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Here's my shot at fixing dma-reentracy issues. Thi=
s patch adds a flag to<br>
the DeviceState, which is set/checked when we call an accessor<br>
associated with the device's IO MRs.<br>
<br>
The problem, in short, as I understand it: For the vast majority of<br>
cases, we want to prevent a device from accessing it's own PIO/MMIO<br>
regions over DMA.<br>
<br>
This patch/solution is based on some assumptions:<br>
1. DMA accesses that hit mmio regions are only dangerous if they end up<br>
interacting with memory-regions belonging to the device initiating the<br>
DMA.<br>
Not dangerous:&nbsp; sdhci_pio-&gt;dma_write-&gt;e1000_mmio<br>
Dangerous:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sdhci_pio-&gt;dma_write-&gt;sdhci_=
mmio<br>
<br>
2. Most devices do not interact with their own PIO/MMIO memory-regions<br>
using DMA.<br>
<br>
3. There is no way for there to be multiple simultaneous accesses to a<br>
device's PIO/MMIO memory-regions.<br>
<br>
4. All devices are QOMified :-)<br>
<br>
With this patch, I wasn't able to reproduce the issues being tracked<br>
here, with QTest reproducers:<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/556">https://gitla=
b.com/qemu-project/qemu/-/issues/556</a><br>
<br>
This passes the i386 qos/qtests for me and I was able to boot some linux/wi=
ndows<br>
VMs with basic devices configured, without any apparent problems.<br>
<br>
Cc: Philippe Mathieu-Daud=E9 &lt;philmd@redhat.com&gt;<br>
Cc: Mauro Matteo Cascella &lt;mcascell@redhat.com&gt;<br>
Cc: Qiuhao Li &lt;Qiuhao.Li@outlook.com&gt;<br>
Cc: Peter Xu &lt;peterx@redhat.com&gt;<br>
Cc: Jason Wang &lt;jasowang@redhat.com&gt;<br>
Cc: David Hildenbrand &lt;david@redhat.com&gt;<br>
Cc: Gerd Hoffmann &lt;kraxel@redhat.com&gt;<br>
Cc: Peter Maydell &lt;peter.maydell@linaro.org&gt;<br>
Cc: Li Qiang &lt;liq3ea@gmail.com&gt;<br>
Cc: Thomas Huth &lt;thuth@redhat.com&gt;<br>
Cc: Laurent Vivier &lt;lvivier@redhat.com&gt;<br>
Cc: Bandan Das &lt;bsd@redhat.com&gt;<br>
Cc: Edgar E. Iglesias &lt;edgar.iglesias@gmail.com&gt;<br>
Cc: Darren Kenny &lt;darren.kenny@oracle.com&gt;<br>
Cc: Bin Meng &lt;bin.meng@windriver.com&gt;<br>
Cc: Paolo Bonzini &lt;pbonzini@redhat.com&gt;<br>
Cc: Stefan Hajnoczi &lt;stefanha@redhat.com&gt;<br>
<br>
Signed-off-by: Alexander Bulekov &lt;alxndr@bu.edu&gt;<br>
---<br>
&nbsp;include/hw/qdev-core.h |&nbsp; 1 +<br>
&nbsp;softmmu/memory.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 15 +++++++++++=
++++<br>
&nbsp;softmmu/trace-events&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;3 files changed, 17 insertions(+)<br>
<br>
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h<br>
index 20d3066595..32f7c779ab 100644<br>
--- a/include/hw/qdev-core.h<br>
+++ b/include/hw/qdev-core.h<br>
@@ -193,6 +193,7 @@ struct DeviceState {<br>
&nbsp;&nbsp;&nbsp;&nbsp; int instance_id_alias;<br>
&nbsp;&nbsp;&nbsp;&nbsp; int alias_required_for_version;<br>
&nbsp;&nbsp;&nbsp;&nbsp; ResettableState reset;<br>
+&nbsp;&nbsp;&nbsp; int engaged_in_direct_io;<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;struct DeviceListener {<br>
diff --git a/softmmu/memory.c b/softmmu/memory.c<br>
index 7340e19ff5..255c3c602f 100644<br>
--- a/softmmu/memory.c<br>
+++ b/softmmu/memory.c<br>
@@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr add=
r,<br>
&nbsp;&nbsp;&nbsp;&nbsp; uint64_t access_mask;<br>
&nbsp;&nbsp;&nbsp;&nbsp; unsigned access_size;<br>
&nbsp;&nbsp;&nbsp;&nbsp; unsigned i;<br>
+&nbsp;&nbsp;&nbsp; DeviceState *dev =3D NULL;<br>
&nbsp;&nbsp;&nbsp;&nbsp; MemTxResult r =3D MEMTX_OK;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; if (!access_size_min) {<br>
@@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr ad=
dr,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; access_size_max =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp; /* Do not allow more than one simultanous access to a d=
evice's IO Regions */<br>
+&nbsp;&nbsp;&nbsp; if (mr-&gt;owner &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !mr-&gt;ram_device &amp;&amp; !=
mr-&gt;ram &amp;&amp; !mr-&gt;rom_device &amp;&amp; !mr-&gt;readonly) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev =3D (DeviceState *) object_=
dynamic_cast(mr-&gt;owner, TYPE_DEVICE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dev-&gt;engaged_in_direct_i=
o) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_m=
emory_region_reentrant_io(get_cpu_index(), mr, addr, size);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
MEMTX_ERROR;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev-&gt;engaged_in_direct_io =
=3D true;<br>
+&nbsp;&nbsp;&nbsp; }<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* FIXME: support unaligned access? */<br>
&nbsp;&nbsp;&nbsp;&nbsp; access_size =3D MAX(MIN(size, access_size_max), ac=
cess_size_min);<br>
&nbsp;&nbsp;&nbsp;&nbsp; access_mask =3D MAKE_64BIT_MASK(0, access_size * 8=
);<br>
@@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr add=
r,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acces=
s_mask, attrs);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp; if (dev) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev-&gt;engaged_in_direct_io =
=3D false;<br>
+&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&nbsp;}<br>
&nbsp;<br>
diff --git a/softmmu/trace-events b/softmmu/trace-events<br>
index 9c88887b3c..d7228316db 100644<br>
--- a/softmmu/trace-events<br>
+++ b/softmmu/trace-events<br>
@@ -13,6 +13,7 @@ memory_region_ops_read(int cpu_index, void *mr, uint64_t =
addr, uint64_t value, u<br>
&nbsp;memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint6=
4_t value, unsigned size, const char *name) &quot;cpu %d mr %p addr 0x%&quo=
t;PRIx64&quot; value 0x%&quot;PRIx64&quot; size %u name '%s'&quot;<br>
&nbsp;memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, =
uint64_t value, unsigned size) &quot;cpu %d mr %p offset 0x%&quot;PRIx64&qu=
ot; value 0x%&quot;PRIx64&quot; size %u&quot;<br>
&nbsp;memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset,=
 uint64_t value, unsigned size) &quot;cpu %d mr %p offset 0x%&quot;PRIx64&q=
uot; value 0x%&quot;PRIx64&quot; size %u&quot;<br>
+memory_region_reentrant_io(int cpu_index, void *mr, uint64_t offset, unsig=
ned size) &quot;cpu %d mr %p offset 0x%&quot;PRIx64&quot; size %u&quot;<br>
&nbsp;memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr,=
 uint64_t value, unsigned size) &quot;cpu %d mr %p addr 0x%&quot;PRIx64&quo=
t; value 0x%&quot;PRIx64&quot; size %u&quot;<br>
&nbsp;memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr=
, uint64_t value, unsigned size) &quot;cpu %d mr %p addr 0x%&quot;PRIx64&qu=
ot; value 0x%&quot;PRIx64&quot; size %u&quot;<br>
&nbsp;memory_region_sync_dirty(const char *mr, const char *listener, int gl=
obal) &quot;mr '%s' listener '%s' synced (global=3D%d)&quot;<br>
-- <br>
2.33.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PN0PR01MB6352C2E496E5723275EB1878FC789PN0PR01MB6352INDP_--

