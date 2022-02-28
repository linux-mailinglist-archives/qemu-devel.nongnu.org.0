Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EE04C6388
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 08:04:21 +0100 (CET)
Received: from localhost ([::1]:52162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOa4y-0007dO-5x
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 02:04:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eugeneh@nvidia.com>)
 id 1nOa2H-0005Vy-GO
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:01:33 -0500
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com
 ([40.107.93.51]:26464 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eugeneh@nvidia.com>)
 id 1nOa2B-0002Wg-Ed
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:01:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lw1UIfeCZ5dAZ/SVNh/k+JOEs01YxsRaNTuIPhrChEk3krLGKQLJrTYy8M33ECoYX2a/sxfq7dfgdwgzjzurrgXOC3fUR8koKRUc5uIZagF4Slul4lw5XRiXm6e+VUMJBfyJaTNBUWcO3UC6ySRO9GVk9YuFaOs4ptGOOUimtmcGXrpsqa4L6y/9yYJU/bzHXautDrSsHiv1hl0hn4n/aDtPUls4d+b4iwOEIk7QanlGegoc6kLHRTfr6QnAl83yf6upgfYlgAMEeVFmFkR1j2vcrXxRrDKvW2X5p2MYsZdILYS3NIZctdItTog+NpP+JBY7KvKiOW9kfx/vLJCAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPrNqKl5oLE0EcOu+xtbL+7AyIjEQEKN1OWygfjNtQ4=;
 b=impIPo+tkYBBq50AwDXAUOsGkdXDBTFid2pz5CS9nakJExty9hNkJpFegovOChGAu3DCxumwxTWxk096W2PUFa6xmyozdDIe7syhCltm3XVTiBK7ZdNtyMrj6lgDM8MqbmVS7DfjDxMUaTfizYF3/M8+joZsTFyFoAfC5xlUCR3/KRG0k2dIT49NpoyTKL2CgnTAhUiqcHhcsDBtc35BHtl1OlRD4qPcUhNUBJ64+5T3sux756A4XIasdshwKluNJ9S4juQobgeku1fV9cVhinQfB14sQN8KgpG+L5O0r2M2dmNAh14uGdDV4E1StFF9H2dt0nIdIKasp95ShlqwaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPrNqKl5oLE0EcOu+xtbL+7AyIjEQEKN1OWygfjNtQ4=;
 b=UEGew4SYyCNd8xRMCCUrvOglvySI3Q6C0NztkzZJNzbN/Z2nOLajf9x2SsjwkdmFtqLNdMCEu4fjBXVXIAxvwLDviIN9+QIbKmxFEtDFaz35txEIMYzv0hgFZQdsVaoHDY+5f31GHaetVYM0c+bNfWFsADEHAN0luL6NKtyvjrrbEtWdMz2aYG4wZCQ1Q64t4tBUX0tlT24W+z1ZZJSCjHDcZ39MTn0tFCjcaTfUSfyisyqa9BJPvq3kNLAVmVI/MbTIepPYWFjHLS5DfpU/vw4bFpy6QVkn/0VwycQ4Z7oAhOZCJ7XdRRFEAiQS31Ic6NwYCSTWyWpVGo/I9ip87w==
Received: from BYAPR12MB3192.namprd12.prod.outlook.com (2603:10b6:a03:139::14)
 by BN6PR12MB1682.namprd12.prod.outlook.com (2603:10b6:405:4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 06:22:35 +0000
Received: from BYAPR12MB3192.namprd12.prod.outlook.com
 ([fe80::fdf5:3159:a592:7d32]) by BYAPR12MB3192.namprd12.prod.outlook.com
 ([fe80::fdf5:3159:a592:7d32%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 06:22:35 +0000
From: Eugene Huang <eugeneh@nvidia.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Timer delays in VM
Thread-Topic: Timer delays in VM
Thread-Index: Adgsa5CaeBeekv16QLaiwwpCMOnvXw==
Date: Mon, 28 Feb 2022 06:22:35 +0000
Message-ID: <BYAPR12MB3192248D73D9C8AF64076A62D9019@BYAPR12MB3192.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6862a138-2bed-4b51-62f1-08d9fa82b608
x-ms-traffictypediagnostic: BN6PR12MB1682:EE_
x-microsoft-antispam-prvs: <BN6PR12MB16821D3F84D55CEC10C9BCE9D9019@BN6PR12MB1682.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6oatD1OzkLubttr6no9RUB20uH22kFAi8lN8wfQlLxWuQbSw2VeOQrk7q6ZVgr1xECGgCsnCpBGy7PiAvjPa/tL653jRw6dkMNLj5zVOLOTYISj7sLk6Em4/k3StU9CLs0NfaJrwntOXQ3/FvdbAK7jzoP2YoaIhQwEghiswf58Fezi9tDlKlB+1UeDDOyXCOeUeX+TReK0pe4MUgUrq3CZZfyA/5BAqtZqR+2X6k3oVyIrulC2DHTOGufBISby37lAYKXfBbqhbkk6NNGbj1/Tk/WTYXcN1Sms1LDWUidssbNJMDJFE28hsBPOzHJ4JxdqO7ZxwHDGC3UKDumBvrjJF+RxJ7grYzDdRe5oQl2boVgG7AvDmv7HtDX79k7nz0HPTKEKfyOfJaDAjelWzoH4ITX7talJSzLbBw6nd176b64wE2pQsTNBddnDBJ5ZWd3ikzRGtkt0VGmUN/JikF17cioJHqzk+hdy7mjem24s2NAKFW03mv1BIN9qYTLBi8yDARTrD3mpYkSheLOMhBK7FjzTbkICqzLHGIpe7xPc+3z7oGlnnUOL5BNqiuMsQ+a0Ed0G9RiSUJ4/7PP2ot2WJODboZzRHsxpwdvngk0gL13hPXJ0dVRgJYpOe9qzCazkQW+wg8se71mUWznfsQC2pLAm/zYlUzifQfGthl5vK+MTz1GNZoPCZUT6zJW2ZFQAJTnqV2VBa3J7Rv9t22w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66556008)(76116006)(64756008)(66446008)(66476007)(83380400001)(38100700002)(33656002)(55016003)(4744005)(9326002)(38070700005)(71200400001)(316002)(2906002)(6916009)(186003)(5660300002)(508600001)(52536014)(26005)(7696005)(8936002)(3480700007)(86362001)(6506007)(8676002)(9686003)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?afEDxZUwiijzVCeMZonMAUSa0wLSrLPy7eI2zOU+mJ+0qAsxTyQRBCAS/6hQ?=
 =?us-ascii?Q?Qu2ftw2U3alVDRsyROyKvpDqLSsQIrSlwEaTkZZLHjxNQBKbQ7a894eyyLJy?=
 =?us-ascii?Q?D8EhvMIJZni2j8E1axq1YpvuQyHD/+0divQwkBMofeCGYVUbIFuFROov1+UY?=
 =?us-ascii?Q?ow8thkIe5DvhiKaVHD386LVBWyZhNMQjY0tdoqzykG/xpDmhefzF6JLbeD7i?=
 =?us-ascii?Q?enfCJjK04W77UmeFc2DgEQYcrn5ZiDH17KbMt7qvJTeObrazhEOgahsrQ1dO?=
 =?us-ascii?Q?PF6aMF6VfwOvDOOmqJCOHCD5CggX2tyOlWQlJO23YpdvgXBA/8yrW2PwmZ2H?=
 =?us-ascii?Q?4MHFzMW7E+0nC3I0Q6M/2mHx9rNkoM/8GC0yVtZkJ5xKKwbBA+Q6a8juU7j3?=
 =?us-ascii?Q?eCnb0qC7CsGDsyEDXHUt9itEVslyQ/k24mxih1mljA5KjhINtaYZA+4vF2Nf?=
 =?us-ascii?Q?Cf5f6tBAmgFUsyejhRd8qcxqd3N+arpiYFQ1NR5oZK+qf6RT7VFgSiG00/Y8?=
 =?us-ascii?Q?5TEw1tQYus8Jpo+PZ+WjLd4I1JpfOj5ok1sFKu6nlR+clNOzCO0lTSiZTGzs?=
 =?us-ascii?Q?QDT3xUGgEDPMHp0V5AdjOlw6p/cqmLaKm/4OWf/fAkfCnJfZ3T/T/Uy0cp11?=
 =?us-ascii?Q?fec5KtVkb3SuN2xIGjfcgcUasKECdHg0aDWE7xlJrNaPtOC8ygaYKxzWq3Y4?=
 =?us-ascii?Q?FSI8ieqXXamf7qif8L+QqzPIIdFXA/acXhD02zez7BVg6tsFIcSOHFl8ROXI?=
 =?us-ascii?Q?u+6ytmqy57pe0K9rfuz87+DmnM2PBJLSTLNsOSAoVrph0cQ6N/49o9F3vQDj?=
 =?us-ascii?Q?D0wfpWcf9TmnYyS14uwAUkasPG/3VEkRauF7r2h7/yX9EM7StInvmYZPtKzw?=
 =?us-ascii?Q?DC+RctSNwQeH9pzfDE3r3UhJDMgzD4rdh/OMWckK94xnZgBkbeLzDndQ8ZTi?=
 =?us-ascii?Q?r+bbw7Paux9PS0ZoNKnBpvqZ/0KR7SAfHu3LzwDq5vFCcXNIT2GKr4/xuTaJ?=
 =?us-ascii?Q?JVIAXLxKdFJgPZcu7Spwd67sVvtwusKm7/U1SNkd7Q8050Af41aeQh8NsksH?=
 =?us-ascii?Q?4QGebDk6CTeM578r0i2AsrDOasI7p48yFu+moRbPEfkhwe+dyFs9kT60tTvJ?=
 =?us-ascii?Q?3+heC8GWHjj7kS4f4AFsBLhiThy9n7PJ41aPUS1ejmpB2+U8NIx7mSWGEmyJ?=
 =?us-ascii?Q?rUYHoKJZDXS998B9gvhOsCQwqcqdyzB9Zyk6TfTQe3H81WRLGkxlP65Wjchl?=
 =?us-ascii?Q?4QkzT9hezlpp+lZO5F0XAWTYh2c0X9DmuJXog2dXFRNGhaPaFjHGHWiqaa9s?=
 =?us-ascii?Q?pFrPCrRl61sjNchWgrzKJEWl93x1NPUwRhD2yo2L+F6ernHUKsK+EqMCMyCV?=
 =?us-ascii?Q?acMFtbLplrGJuMKT4/mSBh2L8hkGURrzylzEyNQrmyLOLfP+1nYDPvdVx+Kw?=
 =?us-ascii?Q?lwHkdVUwCc3H6vJPPvR4BAJ60jxRQ4IdJqBZk2nnoJZQNEUTa5tLKGfOejGJ?=
 =?us-ascii?Q?+78DFLhRC3Co7rUIlXik0znJ5vtlTN0a6XjmCY4a7wUkgcSvGqpT+IiKbOB8?=
 =?us-ascii?Q?jhw8vQUYilhF8y+Hd6zOU6f+rWwX9rU1pFGBuXNdxXj4Qj2akyxI8naFTyPa?=
 =?us-ascii?Q?5r+mTYYd59aSNq9F1QmIKM4=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB3192248D73D9C8AF64076A62D9019BYAPR12MB3192namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6862a138-2bed-4b51-62f1-08d9fa82b608
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 06:22:35.5393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x47mfzGgqH3h/P+zbVC/jR1QgLFLL6hIV5ZZHz+uW+DSZg+5sSPAbdRXl920sRCxp9Ob6VJLu8kec0cGONBpAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1682
Received-SPF: softfail client-ip=40.107.93.51; envelope-from=eugeneh@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

--_000_BYAPR12MB3192248D73D9C8AF64076A62D9019BYAPR12MB3192namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am running qemu on an arm64 CentOS host. Inside a ubuntu VM, a process ru=
ns a timer created using timer_t:
ev.sigev_notify_function =3D m_callback;
...
timer_create(CLOCK_MONOTONIC, &ev, &m_timer_t);

This timer sometimes has significant delays. For example, the 50 ms timer c=
an have a callback delay of 100ms.

I did a host kernel trace and see a lot of WFx kvm_exits, and  the followin=
g events between kvm_exit and kvm_entry:
kvm_exit
kvm_wfx_arm64
kvm_get_timer_map
sched_switch
kvm_timer_save_state
kvm_timer_update_irq
vgic_update_irq_pending
kvm_timer_restore_state
kvm_vcpu_wakeup
kvm_arm_setup_debug
kvm_arm_set_dreg32
kvm_entry

I have the following questions:

1.       Why there are a lot WFx exits? Is the timer dependent on it?

2.       Does this timer rely on kvm timer irq injection?

3.       What can be any possible causes for the timer delay? Are there som=
e locking mechanisms which can cause the delay?

4.       What parameters can tune this timer?

Thanks.

--_000_BYAPR12MB3192248D73D9C8AF64076A62D9019BYAPR12MB3192namp_
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
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1164781690;
	mso-list-type:hybrid;
	mso-list-template-ids:-1218272158 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am running qemu on an arm64 CentOS host. Inside a =
ubuntu VM, a process runs a timer created using timer_t:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;">ev.sigev_notify_function =3D m_c=
allback;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;">&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;">timer_create(CLOCK_MONOTONIC, &a=
mp;ev, &amp;m_timer_t);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This timer sometimes has significant delays. For exa=
mple, the 50 ms timer can have a callback delay of 100ms.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I did a host kernel trace and see a lot of WFx kvm_e=
xits, and &nbsp;the following events between kvm_exit and kvm_entry:<o:p></=
o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:black">kvm_exit<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:black">kvm_wfx_arm64<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:black">kvm_get_timer_map<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:black">sched_switch<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:black">kvm_timer_save_state=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:black">kvm_timer_update_irq=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:black">vgic_update_irq_pend=
ing<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:black">kvm_timer_restore_st=
ate<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:black">kvm_vcpu_wakeup<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:black">kvm_arm_setup_debug<=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:black">kvm_arm_set_dreg32<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
9.0pt;font-family:&quot;Courier New&quot;;color:black">kvm_entry<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">I have the following questions:<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">1.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Why there are a lot WFx exits? Is the timer depende=
nt on it?<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Does this timer rely on kvm timer irq injection?<o:=
p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">3.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>What can be any possible causes for the timer delay=
? Are there some locking mechanisms which can cause the delay?<o:p></o:p></=
p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">4.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>What parameters can tune this timer?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
</div>
</body>
</html>

--_000_BYAPR12MB3192248D73D9C8AF64076A62D9019BYAPR12MB3192namp_--

