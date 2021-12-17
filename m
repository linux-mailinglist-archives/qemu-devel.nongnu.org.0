Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED64478693
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 09:54:20 +0100 (CET)
Received: from localhost ([::1]:34770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my90L-0005aA-LM
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 03:54:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1my8y8-0004mc-Ex
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 03:52:00 -0500
Received: from [2a01:111:f400:fea4::80a] (port=58944
 helo=IND01-MA1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1my8y5-00009M-3N
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 03:51:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vnbd7sWxZOVjyI3S9renH/wjJhpKw/Ke2WIIEhqWLzCNd1gYEHnV0Qo5gCIitCzDfLtB6gjKza+cem1yLd3G58m+/lkBCVgc9gEppsCR3/Aq+G9r0JY/kPrVFjdJBisC/LRlogNVGgzaRW8oEj4XsO1lMYnoVjnpykZUiF2vTVUJMz+IvF1cFTEio9LkOP1Sq1SarNP6kv8edlmtAe3ROxncrlgq6Z2v4fb0vl+7VX+rkG+EdJvlydyRh7Gz1bDa5FfHYk4Asxw5rVVaajQZEKntBCvGa8YVacjusq4QrTc8o0I+KdeBj6a0lr6BwUUQfXpzsN8G5074WMy1mG66rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ia27xDVLJvQHXl4LIbsTY3WKz2CJn0dL9mhXW0S5BpA=;
 b=Ks8dhIR+z1zWlsW4fIHXjFabTrYMwKfxr+HLFeEISbcOJ+Ry8I/oUTI51k/TtErHEVh/x7cVcO/2MUyc9qBvS5KkgrUiC7N/IXT78s22F1F/nUpYEEnMEd/IHpl2gNIezhM7FIhIB3xU5CX7YLO/HC95SdstBZuWoSZlGDA129tyHbHrqkRBNxkYuLtUyZ8w1cRwVVyrzDZ2GrDsLNaveoIyjyvUSMTWMhPVcDRNk3qMWXfXtjq/zjSik02aPGPbbHL+TkIEIuMge3EWsqDa6DsCMzFT/8awQVSwZ7Ssf2UIUKJMusO95CXKISizrBgmAggBzBuDLURYX++EFQ0MJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ia27xDVLJvQHXl4LIbsTY3WKz2CJn0dL9mhXW0S5BpA=;
 b=RQxOc3OitJsA1lw1EFAtW0yDCezJioj3houzImV7YprBEgRCCePRcZPczlKMPqxdAK25vohjzedmuyU4snEh4ZkHdq1nNLAabbAGJfQl8TH01GfjaCnLOhRu7NIlzZRvFcmwl2+X55Z9ovK3qaQqILRAeO8P3QE5/qxTHPeGgtaUVGSzxnpzc+2nKkwIOVPkDPW2fzo/tMvTvKRYZ5lhPiBFf3xEtmO7I+Jud/X9oI1Ny4kwzsU8AqigrwB2IdRRY6U8xjYxydf41Djj6lFW17AYMlTQUwbZ/fERJvA8vwYBCp8FKgDWn4dGLJtbO1dsPArTgi8ycLkWdJlKTSqunQ==
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:72::9)
 by PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 08:51:47 +0000
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b943:a630:da36:19ad]) by PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b943:a630:da36:19ad%5]) with mapi id 15.20.4801.015; Fri, 17 Dec 2021
 08:51:47 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
Thread-Topic: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
Thread-Index: AQHX8yJzW7Qsk4XPNkO4mOHYRudByg==
Date: Fri, 17 Dec 2021 08:51:47 +0000
Message-ID: <PN0PR01MB635246E81DA6BAF758E36E29FC789@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 6bb6cb46-4c3c-44de-ddcb-8608060a4796
x-tmn: [p39k0ACvulYzqwT18tpJjzccCQnp0oxC]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 054369fd-e2cf-4c25-98dc-08d9c13a755c
x-ms-traffictypediagnostic: PN0PR01MB5283:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UIKUPbefHIh8dDuluNHBijwVOJYRB1T5JZ1aBd7Bottym+AOsPMclQt8zSHtx0tuN0TkF14flW45G4zfNbqiUKGVR6JvESutzvaiSTGVFYdsYggixyzb/0Z4kGgXhMG86SpEkp7F3+t5HuD/euFdCubuk8z2IJwYJt8A1Icn5t1wnSecFNC5b1Sxrd+BAkyCBkaoG4O9mBfr6sDikuUmzygHDwVsDj6Sc6RIfrkaTrLC9EiI4ALVp+Y6Bid/YfjYeXkzPA7tYfSjLPoqP8ReFyAMAcMv80w2HCd2tvkTiIl3X2YRGYQ2Kd8zyDYbm2cDuQrItEDZGgtIACNFr05zJNgiOUPQtDMZrDrarbHR4qc1raLhZOV1PmJct7qFMgsqm0LLNncPTaDgX7TeDdwPngm3KkWDE3HDKXVf8vzbergxLUflBSuNdJF0PIJ4hzwXZMQIaztBsPrv0aSYjlg6jWX/FhnGhbyIU7C+jcSuSO1x0L5BboJi/OJOOu0CN0HxCwVojugIObVuPG5gQovDVHTxGbhwFzxgmsKqEo3rietdTE3q5GQC5ChF/rkyZ/sH+EWIwienS/n1JatNOjg2BeVElTc+UNeORWxLwDWgNMcjC+tlRWap7q0pSadXshDh6KSw+cu5CKwpJAem064Erovkv+EdiAqHO5SJ0ClJB4M=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 6yVTnnD9imwkTsClgm+fWeNRaiOIGm2XYWXcdEKiA3sh1/mp6I8Pajl3jV2rfj94Np5CbUP7ZGJGJtTABcLx9gAQkmCAZB72xBRn51JLkJGVM/4bvBGQO5WAQvw7JM91v0aDCOfI2/xV4uDauxw4jH/VnNoFCA9iAbn+pmcQ+4l5g2m0MEUEmZoG21tQ5EgD3uSWcxfy7zukgecu5hMq3aTKEbroww4+SuAx8JiBV9ddBjPoF746CT2PK4Oh/tAtv6b/8JaZtvRPcRd/v9ovTgRyxNZFS8/yVNXsYv9ziNIqHM2R4+maKh6v3hLu9CUKdJpQnt5841nVmRHWZLkfVtgtZqFT+LvD8bZroqA/qpV8ktstOLl1V8f33yfs4pque0fy16aDQwcq9+xHVvTBmuD2RE5up8go1HLIIn/LAQaOn1AyyuXwFYwMs81NgLrS5KlIuFvL4RRdF4tc8zryvPKcM5vqEiLNMBjtPQMMwa4iMJ9a6PXlkZ9scC1a6kNUf3VXyyQEF9o5bwvtt8hg54hca+vUS+ONf6F5YLEr3GZpa84cAWZi2Bh+xCMzp9VgKCQtgMx7DDzui9+VLcDkurAIM/p3YSM3bMSHRaWMsy6qF3pOWQLRPtGOhprlCs1srSvMwlpgo5AYWC0pwaRJZXkorR5N3iFZnOoYojSqjp6IxYCnr83upOfRrcAJWAF7NXaBGvJjlDwEuyMNm/UcviYxeuCVrSvyCgkm9HVJAlKlEuJ7RKCx7L1/aEU/xZMqnkN1DCYerDnm9gqCJaFzx9kkZAfiRrpOBGuu9uSXpV05PoyqGRQ1vw2M8ta+5dT+kBGkFzARcCZGz4cwij+K+ikr8MU/6v+n566Zb1UKtpcYmUPz1CVh/4sJJpGuDKV8PR13u3ahTHbPEwMqQvmFYjCcjzcfo9KAPV8PWKUwea1PHU5dk55I2OrrBHoFancB
Content-Type: multipart/alternative;
 boundary="_000_PN0PR01MB635246E81DA6BAF758E36E29FC789PN0PR01MB6352INDP_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 054369fd-e2cf-4c25-98dc-08d9c13a755c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 08:51:47.0433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5283
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fea4::80a
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fea4::80a;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=IND01-MA1-obe.outbound.protection.outlook.com
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
 Darren Kenny <darren.kenny@oracle.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E .
 Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?Windows-1252?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_PN0PR01MB635246E81DA6BAF758E36E29FC789PN0PR01MB6352INDP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Yes, it still works. Now it looks orthodox:

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
write 0x1000 0x1 0x02               /* cmd->opcode, NVME_ADM_CMD_GET_LOG_PA=
GE, nvme_get_log() */
write 0x1018 0x4 0x140000e0         /* prp1 =3D 0xe0000014, NVME_REG_CC, nv=
me_ctrl_reset() */
write 0x1028 0x4 0x03000004         /* cmd->cdw10, lid =3D 3 NVME_LOG_FW_SL=
OT_INFO, nvme_fw_log_info, buf_len =3D 4 */
write 0x1030 0x4 0xfc010000         /* cmd->cdw12 =3D 0x1fc, Log Page Offse=
t, trans_len =3D sizeof(fw_log) - 0x1fc =3D 4 */
write 0xe0000024 0x4 0x02000200     /* [3] 3.1.8, Admin Queue Attributes */
write 0xe0000028 0x4 0x00100000     /* asq =3D 0x1000 */
write 0xe0000030 0x4 0x00200000     /* acq =3D 0x2000 */
write 0xe0000014 0x4 0x01004600     /* [3] 3.1.5, Controller Configuration,=
 start ctrl */
write 0xe0001000 0x1 0x01           /* [3] 3.1.24, SQyTDBL =96 Submission Q=
ueue y Tail Doorbell */
clock_step
EOF

I also wrote a PoC in the guest OS which led to worse result, but the QTest=
 reproducer may be enough.


________________________________
From: Klaus Jensen
Sent: Friday, December 17, 2021 16:37
To: Qiuhao Li
Cc: Alexander Bulekov; qemu-devel@nongnu.org; Laurent Vivier; Peter Maydell=
; Mauro Matteo Cascella; Daniel P. Berrang=E9; David Hildenbrand; Jason Wan=
g; Bin Meng; Li Qiang; Thomas Huth; Peter Xu; Eduardo Habkost; Darren Kenny=
; Bandan Das; Gerd Hoffmann; Stefan Hajnoczi; Paolo Bonzini; Edgar E . Igle=
sias; Philippe Mathieu-Daud=E9
Subject: Re: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO leve=
l

On Dec 17 06:27, Qiuhao Li wrote:
> Thanks Alex. It seems this patch sets and checks if the destination devic=
e is busy. But how about the data transfers not triggered directly by PMIO/=
MMIO handlers? For example:
>
> 1. Device A Timer's callback -> Device A MMIO handler
> 2. Device A BH's callback -> Device A MMIO handler
>
> In these situations, when A launches a DMA to itself, the dev->engaged_in=
_direct_io is not set, so the operation is allowed. Maybe we should log the=
 source and check the destination when we launch data transfers. Is there a=
 way to do that?
>
> Below is a reproducer in NVMe which triggers DMA in a timer's callback (n=
vme_process_sq). I can still trigger use-after-free exception with this pat=
ch on qemu-6.1.0:
>
> cat << EOF | ./qemu-system-x86_64 -display none -machine accel=3Dqtest \
> -machine q35 -nodefaults -drive file=3Dnull-co://,if=3Dnone,format=3Draw,=
id=3Ddisk0 \
> -device nvme,drive=3Ddisk0,serial=3D1 -qtest stdio \
>
> outl 0xcf8 0x80000810               /* MLBAR (BAR0) =96 Memory Register B=
ase Address, lower 32-bits */
> outl 0xcfc 0xe0000000               /* MMIO Base Address =3D 0xe0000000 *=
/
> outl 0xcf8 0x80000804               /* CMD - Command */
> outw 0xcfc 0x06                     /* Bus Master Enable, Memory Space En=
able */
> write 0xe0000024 0x4 0x02000200     /* [3] 3.1.8, Admin Queue Attributes =
*/
> write 0xe0000028 0x4 0x00100000     /* asq =3D 0x1000 */
> write 0xe0000030 0x4 0x00200000     /* acq =3D 0x2000 */
> write 0xe0000014 0x4 0x01004600     /* [3] 3.1.5, Controller Configuratio=
n, start ctrl */
> write 0xe0001000 0x1 0x01           /* [3] 3.1.24, SQyTDBL =96 Submission=
 Queue y Tail Doorbell */
> write 0x1000 0x1 0x02               /* cmd->opcode, NVME_ADM_CMD_GET_LOG_=
PAGE, nvme_get_log() */
> write 0x1018 0x4 0x140000e0         /* prp1 =3D 0xe0000014, NVME_REG_CC, =
nvme_ctrl_reset() */
> write 0x1028 0x4 0x03000004         /* cmd->cdw10, lid =3D 3 NVME_LOG_FW_=
SLOT_INFO, nvme_fw_log_info, buf_len =3D 4 */
> write 0x1030 0x4 0xfc010000         /* cmd->cdw12 =3D 0x1fc, Log Page Off=
set, trans_len =3D sizeof(fw_log) - 0x1fc =3D 4 */
> clock_step
> EOF
>
> CC: Mauro Matteo Cascella and Philippe Mathieu-Daud=E9. Should we put the=
 reproducer above to https://gitlab.com/qemu-project/qemu/-/issues/556?
>

This is a good reproducer. Does it still work if you do the `write
0xe0001000 0x1 0x01` at the end instead? It looks weird that you ring
the doorbell prior to writing the command in the queue.

--_000_PN0PR01MB635246E81DA6BAF758E36E29FC789PN0PR01MB6352INDP_
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
Yes, it still works. Now it looks orthodox:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
cat &lt;&lt; EOF | ./qemu-system-x86_64 -display none -machine accel=3Dqtes=
t \
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
<div>clock_step</div>
EOF<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I also wrote a PoC in the guest OS which led to worse result, but the QTest=
 reproducer may be enough.</div>
<div>
<div><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>From:</b> Klaus Jensen<br>
<b>Sent:</b> Friday, December 17, 2021 16:37<br>
<b>To:</b> Qiuhao Li<br>
<b>Cc:</b> Alexander Bulekov; qemu-devel@nongnu.org; Laurent Vivier; Peter =
Maydell; Mauro Matteo Cascella; Daniel P. Berrang=E9; David Hildenbrand; Ja=
son Wang; Bin Meng; Li Qiang; Thomas Huth; Peter Xu; Eduardo Habkost; Darre=
n Kenny; Bandan Das; Gerd Hoffmann;
 Stefan Hajnoczi; Paolo Bonzini; Edgar E . Iglesias; Philippe Mathieu-Daud=
=E9<br>
<b>Subject:</b> Re: [RFC PATCH] memory: Fix dma-reentrancy issues at the MM=
IO level
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Dec 17 06:27, Qiuhao Li wrote:<br>
&gt; Thanks Alex. It seems this patch sets and checks if the destination de=
vice is busy. But how about the data transfers not triggered directly by PM=
IO/MMIO handlers? For example:<br>
&gt; <br>
&gt; 1. Device A Timer's callback -&gt; Device A MMIO handler<br>
&gt; 2. Device A BH's callback -&gt; Device A MMIO handler<br>
&gt; <br>
&gt; In these situations, when A launches a DMA to itself, the dev-&gt;enga=
ged_in_direct_io is not set, so the operation is allowed. Maybe we should l=
og the source and check the destination when we launch data transfers. Is t=
here a way to do that?<br>
&gt; <br>
&gt; Below is a reproducer in NVMe which triggers DMA in a timer's callback=
 (nvme_process_sq). I can still trigger use-after-free exception with this =
patch on qemu-6.1.0:<br>
&gt; <br>
&gt; cat &lt;&lt; EOF | ./qemu-system-x86_64 -display none -machine accel=
=3Dqtest \<br>
&gt; -machine q35 -nodefaults -drive file=3Dnull-co://,if=3Dnone,format=3Dr=
aw,id=3Ddisk0 \<br>
&gt; -device nvme,drive=3Ddisk0,serial=3D1 -qtest stdio \<br>
&gt; <br>
&gt; outl 0xcf8 0x80000810&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* MLBAR (BAR0) =96 Memory Register Bas=
e Address, lower 32-bits */<br>
&gt; outl 0xcfc 0xe0000000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* MMIO Base Address =3D 0xe0000000 */<=
br>
&gt; outl 0xcf8 0x80000804&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* CMD - Command */<br>
&gt; outw 0xcfc 0x06&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bus Ma=
ster Enable, Memory Space Enable */<br>
&gt; write 0xe0000024 0x4 0x02000200&nbsp;&nbsp;&nbsp;&nbsp; /* [3] 3.1.8, =
Admin Queue Attributes */<br>
&gt; write 0xe0000028 0x4 0x00100000&nbsp;&nbsp;&nbsp;&nbsp; /* asq =3D 0x1=
000 */<br>
&gt; write 0xe0000030 0x4 0x00200000&nbsp;&nbsp;&nbsp;&nbsp; /* acq =3D 0x2=
000 */<br>
&gt; write 0xe0000014 0x4 0x01004600&nbsp;&nbsp;&nbsp;&nbsp; /* [3] 3.1.5, =
Controller Configuration, start ctrl */<br>
&gt; write 0xe0001000 0x1 0x01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /* [3] 3.1.24, SQyTDBL =96 Submission Queue y Tail Doorbell=
 */<br>
&gt; write 0x1000 0x1 0x02&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* cmd-&gt;opcode, NVME_ADM_CMD_GET_LOG=
_PAGE, nvme_get_log() */<br>
&gt; write 0x1018 0x4 0x140000e0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* prp1 =3D 0xe0000014, NVME_REG_CC, nvme_ctrl_reset() */<br>
&gt; write 0x1028 0x4 0x03000004&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* cmd-&gt;cdw10, lid =3D 3 NVME_LOG_FW_SLOT_INFO, nvme_fw_log_info, =
buf_len =3D 4 */<br>
&gt; write 0x1030 0x4 0xfc010000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* cmd-&gt;cdw12 =3D 0x1fc, Log Page Offset, trans_len =3D sizeof(fw_=
log) - 0x1fc =3D 4 */<br>
&gt; clock_step<br>
&gt; EOF<br>
&gt; <br>
&gt; CC: Mauro Matteo Cascella and Philippe Mathieu-Daud=E9. Should we put =
the reproducer above to
<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/556?" target=3D"_b=
lank" rel=3D"noopener noreferrer" data-auth=3D"NotApplicable">
https://gitlab.com/qemu-project/qemu/-/issues/556?</a><br>
&gt; <br>
<br>
This is a good reproducer. Does it still work if you do the `write<br>
0xe0001000 0x1 0x01` at the end instead? It looks weird that you ring<br>
the doorbell prior to writing the command in the queue.<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_PN0PR01MB635246E81DA6BAF758E36E29FC789PN0PR01MB6352INDP_--

