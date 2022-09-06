Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22495AEA01
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:41:51 +0200 (CEST)
Received: from localhost ([::1]:41530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYpq-0005SN-RN
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ruili.Ji@amd.com>) id 1oVTH6-00008i-U8
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:45:37 -0400
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::601]:49024
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ruili.Ji@amd.com>) id 1oVTH3-0005C6-Ry
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 03:45:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiY8XcmERXaBvWmyPx2/zQ9I9czfHDdHpQyKpGiRDGo0Q82rej6TRbj4/cX+tIOYevYMa4nipdPtDfy4ZL4Whpt193oGf+aIembGDKobquFZGvuOE7GUAwXG5oidvEOETRHvf1Y+Bxu0zg9Z0Ir/r5mHZuwoGcnM/U1zb5X4ms9fM26pTNgYdhx2B1VNNfzj28Bo/DF0/wIcZt7VqiioYWdo9uf/aX3Yzh+lLZ79SJVMs0Xc1mmdONxZ+MQpqq21rxyXvzV33idzbU/OY0SxDNMjRvjqidEZgk5oxBFHj2JFVhtxrv8wpF2Xl/6LNS5QAakzITLcg/nNzo7paZSjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7o7fuXE9IipmUVFCzcZNaSkrZB/doORWrX8Wx7vk2Y=;
 b=FPbifK7LL3oZm1LQ1/iirfmSa8wdcjPER9ViMZQlmsGIXg6BGy7bmfv1sZPUqlffwQSniKMexDMSgFHHH5j5tiaoJssU05dBzXQ7WqD7EfQKQzt/GTVqUHPXFTMI+RBMVRFRY25Aj7qKC3JpFmbo2W8bMzUmCPOaRDFBBQmxTrefk1BOsZ8wGhLikX+/ZNyQxnmcz7dRYR17Sv0c3wbqvqdA4T+wPNz9LiO+GQRNPJzdxO45t2CiNny1BYW6DvslcUTaVQr1Cnd/8eeHHxX2fvF8IRvYJV04EIA0XXbmw0u2x/sWWt70NvTwJa74f/n86i0WrbIysNx2F7xHA0khOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7o7fuXE9IipmUVFCzcZNaSkrZB/doORWrX8Wx7vk2Y=;
 b=IpVHJE3hYQqucKqrroVMh5jTY1LFEDS3vUSfdntbjxR5fvA1iYmrHS9ud4nZLFIAKBh4Cd18JhwAnkxAOnER+/ntXWS4vMfntSwoU2a15iVp/MLBQljpdsxlJU55TLupMpvjmeTQcz4zdqoesedX2px+oAO4zX+3QgGXmKPeFYg=
Received: from BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 by PH7PR12MB5653.namprd12.prod.outlook.com (2603:10b6:510:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 07:40:25 +0000
Received: from BL1PR12MB5993.namprd12.prod.outlook.com
 ([fe80::7927:cab5:fb94:1a50]) by BL1PR12MB5993.namprd12.prod.outlook.com
 ([fe80::7927:cab5:fb94:1a50%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 07:40:25 +0000
From: "Ji, Ruili" <Ruili.Ji@amd.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Liu, Aaron" <Aaron.Liu@amd.com>
Subject: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device
Thread-Topic: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
Thread-Index: AdjBw9S5XjagBB9xT0W01YXm2Fq4yQ==
Date: Tue, 6 Sep 2022 07:40:25 +0000
Message-ID: <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=149f7e60-4d0f-4975-8ab3-8497009eb09c;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-06T07:36:17Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a93cc8fd-3a11-483c-8885-08da8fdb1019
x-ms-traffictypediagnostic: PH7PR12MB5653:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CQj75QgR3FiFLpJHipwLfkdxvaWZ9l+JS7IgBW2J0M9Y92fnixHWll9e4Gr0Tu2lclD9OaHIy908U+EaxpxjIPyEXF8qR32/bVDrloim+r32iElHUZhmbsu8ANfqSHrHwDSR/89RsfG78AtuWZSbq3rfifum6H/ek2bm5ZyppQjsiyjVNUK+sACJb9il1FkqPEzK5aSnU45VoJsCA87IwrQmtpinpUk9tCBRIaKbayrVgNKsLhEvBlbEGLnVBbNAHd/dVLbjRldJt+0TzNQfVB3OwCTv5SUjyss8U3lgG41kW5m69RKfDYJMyxX+T9IUiEiwZe8MLiwo9Zv8M3Fa8dL41F/4RfnFjgVBdoXyITEQuoNch3jHEppnqby1vW36DQHWkREguPaA0NrdxAkga1Ot2VKrlXRXDQkz+5QaPFrXU/wiu0l8VW6u3fLfFm9AdXFnivpynXcbKOGeI9W9mEaFOs8lKTgzpYJJiobjvT8+WteN8//nLZ7qpnJ4Tm0J9OSzsT6fcP6BjGtdYVMQnGO9QWsKUOaUVA/bqQY0P+FWP7t/kSKIGhwC1aHrNvIoXRx5CCltFTVR8taAPHrfb5YaiBD4+j8qT2p3QHgIx37HuENqQ7QesMrx6kSLK09WCzjP5+NejVoyBB1JeJGXTtHMGGEZ4FDJkBO6KWqMv9yObnS2/X31OhmGj9VzLq+CdLsGjk0SyHsn1O/9QmtN03KW+xnOO27z6v1G1cjSiC/ZfJuMk0YAnzNNzLnAZoqzZYiRkl2vKIuXqQo+GRfh95jewwb0Es7PGEQ/SmjUADM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5993.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(316002)(478600001)(6916009)(83380400001)(7696005)(26005)(9686003)(6506007)(53546011)(52536014)(38070700005)(55016003)(8936002)(33656002)(5660300002)(86362001)(2906002)(66446008)(122000001)(64756008)(76116006)(66556008)(66476007)(4326008)(8676002)(166002)(66946007)(186003)(966005)(41300700001)(71200400001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?25brkHcBFErR8XDBKPK0dlrm0RuyGVDtkKt7/4WJovYZyBrt5CeqFms4PPRJ?=
 =?us-ascii?Q?VbxDdPR326J5LRV30Fa/xVSpARDhFITYamci50CaPy05E6BQJxLZ9jKZyMx2?=
 =?us-ascii?Q?ZIGO9H4L6XZxvhqb21uWWai3JszEPwKvJkMD0IHCvPkCecXkjz86UBdoJ5wT?=
 =?us-ascii?Q?8D7K0PVKSrkHSQF5D4iVPe5Em3sFpsujAbAYl7qwpGp/xk/pjx2TSme9QCQs?=
 =?us-ascii?Q?h7WDq0DX3mt8z03om0FeaGPSLetMzjTADHhM2h3v+AohwYQmkhGD/5FrJ3qp?=
 =?us-ascii?Q?r4zfiRrfSGIqPMj2mHL00cODJSdAupOswZwp3h/KMr/fGDz8nNpDXIotv5HT?=
 =?us-ascii?Q?8idmeCb6sssv5YmD5IW0REoWw4vi+X3ilLOeZUSlkA/t2WhcbYDlFfI3b/UO?=
 =?us-ascii?Q?a3dLCay5i53/15ybcOiEZ25PUhZHDgl2fmdzemb6GGu3J8lhaNQIxEdFzQeK?=
 =?us-ascii?Q?kgF6Dm2ELV9X/pYdJCilE3Q+TIsPtHW7G3+BlbRoWCH9jp9q/AYjcM+qWnj5?=
 =?us-ascii?Q?aktZmWdPAETYXnRCV/poLLLEDeAXVBLp6WuUPyAwIfCkontJ15yx4599Bkit?=
 =?us-ascii?Q?zu8e3eid1hSUfLvg0KcP+b8uYsMlAIfXwz8BiWnAhEV9n5CKVxuSXBHL6fxv?=
 =?us-ascii?Q?IaX420rnXcRGDYeqTgq+PAK+o+aVh6ka0oz0csZ+4DRp/rc3YmyqqM40NvO4?=
 =?us-ascii?Q?y4IUcJbu7j4WdDXr0evzTRspctNN2aZkejf29Q5JN2Vk75SG5srCa/OG4RH8?=
 =?us-ascii?Q?F/i1b8H1SN5zxqxk3LdgwnaP9lEtpcU3rhjFJK+civ6J0wOhWtFXHv04MfRb?=
 =?us-ascii?Q?U+UD5Rhbsiu+3SMs4ngGijw2zvn473zVrLsdTzv93vyW0aN5n3oMfvCUB5eF?=
 =?us-ascii?Q?5hs9WlTRNv3JTRWM88R+kMHsXMp+vLqiry7alcnOeHbNZ9IUxFkBLfFn8GCu?=
 =?us-ascii?Q?L7HAzR3meG9KJ9bi3mgZczSZ5Algdy2ImBjgo8BX9sHGECljFEhGNRwoR2L0?=
 =?us-ascii?Q?YnP7FY1AU8XrEG6DhsLeh31eg8TK2BtEQTsOmOetMeskqJWZsS1A2nEWXLUK?=
 =?us-ascii?Q?/OEMXHWtYhaC3B+IJwyoI1kEX04uJpb3TEtdzeM56YB0TNpYXh/niT+AmkUw?=
 =?us-ascii?Q?R2VYbq8XcUiAibpkYLONNWGNi7gkf4lAUmFvMbmyEY1Q/jVEVAkqAZIpk4Ha?=
 =?us-ascii?Q?I1ksUm+l9l45VZeVOxCpVElY174S0SgV5YIGe7Q0G0dzBRKihTnfyb4pK+Z3?=
 =?us-ascii?Q?KwTc5P9y4DOIPKqMYSDJxtx4wMxdGPl1FKyA6xbfWFEjl0MY8EnlUKe4BrvL?=
 =?us-ascii?Q?vrshk4Skb5qxc0iiFo7qZOnMfhrUjfQu5eg9c7vcRa2/VybJ09nyFon+2jHi?=
 =?us-ascii?Q?wlfqIC8xGaKgVYfMlqDdu2rIaf3LKir1IDV6yccEcFN2aTPZNuYyt2y/TMrY?=
 =?us-ascii?Q?dac4dXw9QySmrX3hWBN0KBbLbQqcC5q/6ZcgkrkaKS5Z1si8zFvIgiS+VBqX?=
 =?us-ascii?Q?OENGTauHdAmTmXNvMChmbZyDPsdxjY0kcOsN3GDs11iUCX8+WzdFoWwUCwVQ?=
 =?us-ascii?Q?Uy2yVJQApyBZ7wsuETpRLOe+6lZUkwbmD/nu5+Vj?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB599341DC55BA53FE588DE14E9B7E9BL1PR12MB5993namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5993.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93cc8fd-3a11-483c-8885-08da8fdb1019
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 07:40:25.6908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wVaRNBAB9y4NW2Tld8dKvZYV0WvaK+bta81vNlLXnG3veCgesAPP2Dh2PPxPymugfKyurLldvg+pfl8H1xiL2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5653
Received-SPF: softfail client-ip=2a01:111:f400:7eae::601;
 envelope-from=Ruili.Ji@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Sep 2022 08:51:09 -0400
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

--_000_BL1PR12MB599341DC55BA53FE588DE14E9B7E9BL1PR12MB5993namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

From c54e0714a1e1cac7dc416bd843b9ec7162bcfc47 Mon Sep 17 00:00:00 2001
From: Ruili Ji ruili.ji@amd.com<mailto:ruili.ji@amd.com>
Date: Tue, 6 Sep 2022 14:09:41 +0800
Subject: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device

Make guest os access pci device control 2 reg for passthrough device
as struct XenPTRegInfo described in the file hw/xen/xen_pt.h.
/* reg read only field mask (ON:RO/ROS, OFF:other) */
uint32_t ro_mask;
/* reg emulate field mask (ON:emu, OFF:passthrough) */
uint32_t emu_mask;

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1196
Signed-off-by: Aaron.Liu@amd.com<mailto:Aaron.Liu@amd.com>
Signed-off-by: ruili.ji@amd.com<mailto:ruili.ji@amd.com>
---
hw/xen/xen_pt_config_init.c | 4 ++--
1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index c5c4e943a8..adc565a00a 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -985,8 +985,8 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] =3D {
         .offset     =3D 0x28,
         .size       =3D 2,
         .init_val   =3D 0x0000,
-        .ro_mask    =3D 0xFFE0,
-        .emu_mask   =3D 0xFFFF,
+        .ro_mask    =3D 0xFFA0,
+        .emu_mask   =3D 0xFFBF,
         .init       =3D xen_pt_devctrl2_reg_init,
         .u.w.read   =3D xen_pt_word_reg_read,
         .u.w.write  =3D xen_pt_word_reg_write,
--
2.34.1


--_000_BL1PR12MB599341DC55BA53FE588DE14E9B7E9BL1PR12MB5993namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">From c54e0714a1e1cac7dc416bd843b9ec7162bcfc47 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: Ruili Ji <a href=3D"mailto:ruili.ji@amd.com">r=
uili.ji@amd.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">Date: Tue, 6 Sep 2022 14:09:41 +0800<o:p></o:p></p>
<p class=3D"MsoNormal">Subject: [PATCH] hw/xen: set pci Atomic Ops requests=
 for passthrough device<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Make guest os access pci device control 2 reg for pa=
ssthrough device<o:p></o:p></p>
<p class=3D"MsoNormal">as struct XenPTRegInfo described in the file hw/xen/=
xen_pt.h.<o:p></o:p></p>
<p class=3D"MsoNormal">/* reg read only field mask (ON:RO/ROS, OFF:other) *=
/<o:p></o:p></p>
<p class=3D"MsoNormal">uint32_t ro_mask;<o:p></o:p></p>
<p class=3D"MsoNormal">/* reg emulate field mask (ON:emu, OFF:passthrough) =
*/<o:p></o:p></p>
<p class=3D"MsoNormal">uint32_t emu_mask;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Resolves: <a href=3D"https://gitlab.com/qemu-project=
/qemu/-/issues/1196">
https://gitlab.com/qemu-project/qemu/-/issues/1196</a><o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: <a href=3D"mailto:Aaron.Liu@amd.com">=
Aaron.Liu@amd.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">Signed-off-by: <a href=3D"mailto:ruili.ji@amd.com">r=
uili.ji@amd.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">hw/xen/xen_pt_config_init.c | 4 ++--<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 2 insertions(+), 2 deletions(-)<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xe=
n_pt_config_init.c<o:p></o:p></p>
<p class=3D"MsoNormal">index c5c4e943a8..adc565a00a 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/hw/xen/xen_pt_config_init.c<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/hw/xen/xen_pt_config_init.c<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -985,8 +985,8 @@ static XenPTRegInfo xen_pt_emu_r=
eg_pcie[] =3D {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .of=
fset&nbsp;&nbsp;&nbsp;&nbsp; =3D 0x28,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .si=
ze&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D 2,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in=
it_val&nbsp;&nbsp; =3D 0x0000,<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ro_mask=
&nbsp;&nbsp;&nbsp; =3D 0xFFE0,<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .emu_mas=
k&nbsp;&nbsp; =3D 0xFFFF,<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ro_mask=
&nbsp;&nbsp;&nbsp; =3D 0xFFA0,<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .emu_mas=
k&nbsp;&nbsp; =3D 0xFFBF,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in=
it&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D xen_pt_devctrl2_reg_init,<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .u.=
w.read&nbsp;&nbsp; =3D xen_pt_word_reg_read,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .u.=
w.write&nbsp; =3D xen_pt_word_reg_write,<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.34.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_BL1PR12MB599341DC55BA53FE588DE14E9B7E9BL1PR12MB5993namp_--

