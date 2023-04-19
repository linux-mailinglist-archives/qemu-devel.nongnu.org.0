Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F26E8256
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 22:06:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppE2l-0005Pu-15; Wed, 19 Apr 2023 16:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinesh.tyagi@prodapt.com>)
 id 1ppCcf-0004Md-Ac
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 14:33:41 -0400
Received: from mail-bmxind01on2118.outbound.protection.outlook.com
 ([40.107.239.118] helo=IND01-BMX-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinesh.tyagi@prodapt.com>)
 id 1ppCcc-0008Ok-KF
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 14:33:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCin4H4dY/CyfOUTlQI3xKFMmg2YtKI+ZhuWa6Xd8kLI6IsY665Gv3543fSfzab/qnTZkaf5cSsNnLRIZ3KAwzOI9K76nNbL3/CW11EZ5msMEYESvTDkOTn2ZbLPZ4i6Lmqi8bqpFs51QknPK6ilNFcFHGKsBXTPjCersnaPMGGwF5Le2Ewc5gmbCh/m7zfUPNMLyHgQL9i1tyd6iELBiz5BWzwV8xHK9S1oIzTV7/fLRqWIYA/BaZgzEdCfh2RoWCHE06heGo/P4viTXLLPH1ygrHD74T/bRmkPyadCPf1B2h6RmsSTJ4cKoSJ5fID+AQfEqZ1Nf9/7hf+tx7/9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLkDgZ4tHNVNu8Pocq57faomnovmkCJG90knnRbSUQY=;
 b=SBTBLV5RflMji6WQFnnbyB0MpYRo4HduV/9Tf6bIsAx2tOcMIB1Sr1GKB5RESERreFtv2MnlDZKuGXxeMbAmkGPFT5w6t766OxxlllsrOK2fOrcr864KUx9dgpHuCd2ClVcVW8nN7HLt6/DENvqYN5COoJlJ14+hhBKGiVgO3H6Dn6f+9R4d+4RjiLR367CCjpLTDk4CkvTlGijpwEMdnUXQBFMbl0xXOOuxpLSlBDAj8ZX1vxYkSYP++15F74yfqp9fEU43OLCynArMqnlY0RPQg/x8dAypw3dANlVSSYPdr3fFhH1y5r5LjbFTkqCocQA2nEXCazHOlwYJMZIEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodapt.com; dmarc=pass action=none header.from=prodapt.com;
 dkim=pass header.d=prodapt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prodapt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLkDgZ4tHNVNu8Pocq57faomnovmkCJG90knnRbSUQY=;
 b=tg2hrfhyfCbSnNrAlPXY5wNU1sFI1d7i9TjkGQVpujVgiz4H6hPyMXnkEPvSlqq22QE2ouRW29b8roo4+Nsb+/2RwMYOILE2ZZxV9VuDc3crkPo/n96oTcDjM2ymzPlmxjanMw5Hc5/2jbmTyrIGfsamMvXwxnwjf3g1uL/VSUU=
Received: from MA1PR01MB3897.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:79::13)
 by MAZPR01MB6578.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:71::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 18:28:25 +0000
Received: from MA1PR01MB3897.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::54c2:8e81:b988:eb5a]) by MA1PR01MB3897.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::54c2:8e81:b988:eb5a%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 18:28:25 +0000
From: Dinesh Tyagi <dinesh.tyagi@prodapt.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Looking for QEMU integration expert..
Thread-Topic: Looking for QEMU integration expert..
Thread-Index: AQHZcuvsTwtCCHsyoUek53Na3lWEdw==
Date: Wed, 19 Apr 2023 18:28:25 +0000
Message-ID: <MA1PR01MB3897577EEEFA584CF75C33F888629@MA1PR01MB3897.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prodapt.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB3897:EE_|MAZPR01MB6578:EE_
x-ms-office365-filtering-correlation-id: 522b7cc8-bdc4-48f1-c2fa-08db4103dd28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2bLEv7ejd3RJiGnfkmzoMGB3s5L9WWs18vE3zYOkHRX5uA8/RKm5p183TMi0Z8/lJtgHoodUoOaZIqnR+AN+EOJzqB3k1mUVOOVy13EJQM3iPzI9lFIbmpzJkJl6iDOZ3qcK08X4ynFnbr6tXmQ5hUBu1JQ0bh2X8+JbjtVd0hkx61a+9j7AGqaaOhMK/R9upxvq+9+cDxD+JUi2jclNTzJOIS25lcomk0FRuyz8ZSj1QWPuBeaVaTXeuzVOs7EwfPb9DK/NvPmUre2fa/I/q2mDwrK2SLqb7Ddfou4C3c4YJD+Smx90UyRJ84WJMj2f6peO8QaU6YqCqmIP5IH736Pq7HJvwOh+wqnw3CSU6Oj9maXEk9o0ncCRDJSirtTiQBCGLK1QPZRmLMpR9g31zpLlumD1OhE76Rl0xXUCwT+bLkYVpo13p3QU4SRVhhHsGs79v9ZUrpZ+faQicBvUZQ4ZqxYFSGJi2zhEwAJGWWa7JVrZY7+0vM/4mZUBAUn17Gi/3w49Sd3+lheAo9hOlM5kouOI313yvhYrHTezrZzpc1qcRkU6dJ3ZzPwuDPIesi8/XskvkNo4dl1c/TVCoudzrwT/dSbmQFpL/hYOiQqPPJeg/8XbqG02EY7DV1wV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA1PR01MB3897.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(39840400004)(346002)(136003)(396003)(451199021)(19627405001)(66899021)(7066003)(6916009)(316002)(91956017)(66446008)(66556008)(66476007)(66946007)(64756008)(19627235002)(76116006)(186003)(26005)(9686003)(6506007)(66574015)(166002)(83380400001)(38100700002)(5660300002)(55016003)(41300700001)(8936002)(7696005)(478600001)(71200400001)(8676002)(33656002)(52536014)(86362001)(38070700005)(40140700001)(2906002)(122000001)(44832011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7Z7XbXVcY0NBXXCzaT0bgm0eflmOt3jiorhNcuPf5knXNDzeKvNSzbgs7J?=
 =?iso-8859-1?Q?HkASNYVAiq/esUGVR7uhkjvwHTprlravCjXoZ3LRkkXnbTw2VXpUIob5pb?=
 =?iso-8859-1?Q?2LAEt06KZ93T5R9wcBnOvMBNfMzHDRT29Zsz0FcRRqKMhssz3MUlB1WkyZ?=
 =?iso-8859-1?Q?WlSY2y7FXbYa7vwJXr3SA8kRYODDHywq+WY02dTVwnB9v5W04Y56VBNc1M?=
 =?iso-8859-1?Q?1+zOIFaCswai9fWAYyij5Asw+EdohziLaBY9qVjb2vsVLtRaSPBF1nGvEX?=
 =?iso-8859-1?Q?0rI9uz9F/TWuHIT9VkJmINoNOU5tdRt4A6y8zJBC4Z63JWhJj5CIXMisEx?=
 =?iso-8859-1?Q?qiIvzZx2m967N8euIF/3LWZYdpXQlzqDS2ST6AKbh2mZIDBc3e3BJq/zjC?=
 =?iso-8859-1?Q?L/DZ54dAXvQSXKSJui4uVaVbq4V+lDJoXZDSY8cpCqIn9QSApY8ofP3v+W?=
 =?iso-8859-1?Q?RVor8bUK1YkbNYi3FqKQ59u+WDlPKTmFA/yGH7ovG4CVlcHvFyoOT2jx6H?=
 =?iso-8859-1?Q?25x2VGf3BOQ0xuASYUZeSHSCHv4AxFG0UAH5U1AdJauFyJWmtY6YZPKJQp?=
 =?iso-8859-1?Q?Hw466Z6jFO7A5H2r0lOLVZ3VadvaiHfufllN/ynj8BhUWwSboGbQ65H/IE?=
 =?iso-8859-1?Q?4ACoQ1LM9YZJFcTFVQn7f52OflwAgWf1rZgW+VcSPlsRfog5T+0ZWxbkNH?=
 =?iso-8859-1?Q?vWahneVTUKF8hhZHQH2NLamIVLNTN+CPMlVALxPdZdT+ezeQD2U0Yewias?=
 =?iso-8859-1?Q?MGwC6dZ4ec1FR2+Ib2oqDzOpo86xesEyyUCMZP0oL3hfmEysYgLsQOB+oI?=
 =?iso-8859-1?Q?qGk6wAjhAIqEID5T2kpDw2dYmEmCKSTphPPwKyXCOEPsbkFvGcItB04iie?=
 =?iso-8859-1?Q?U0KbAg9n1k3Y9jlEVGEDwcvvF2MiAcEHXRBg1FFgSFbnSQdyEY0uu8OW18?=
 =?iso-8859-1?Q?s3y69g2EWdDlePOrM4Mc4nazCSxgo3GYtoKDiFBWGqsbgc7+MGhG3+K38V?=
 =?iso-8859-1?Q?nfA3WU66U7ikTyoYODiLzRRtSumVeLwq8b6BrwFr2MjVT/GVFMXTpOZNLR?=
 =?iso-8859-1?Q?CvZAbZx2D6jYwzgInWWwnPLoAYwd3glHwAWqMVJeLjad9UkLkdHegggzsE?=
 =?iso-8859-1?Q?q1qH41eCvC01cIiqdwuWL2TgGGqNi2aXs2DiJ7FvGNXolpcHYKT7T96HnS?=
 =?iso-8859-1?Q?yzX3BdS6IH9sG9/qYETyaZNx2JGUHowACv6tFQJryxm2wypBfPeyvs/VMI?=
 =?iso-8859-1?Q?6pGl8l5OV62dzc3iOk6fFmy+nFOeu/UXL16WHguOEtFovjy41HVlDoDTZU?=
 =?iso-8859-1?Q?kzRzAf5qA6HsquwnusNm4ljBlTXIYnk0B8eb6IkZh9jIZJUJ6/tWDhWTjW?=
 =?iso-8859-1?Q?45tmRDLzLsXxRgm1ow07waFk+SwAGkffHJhAdgfZZ2vKxGGyfREveqN9/f?=
 =?iso-8859-1?Q?fg4OyGK3/+LUi75D76CrcfAYoBpGkcqLe9Mwobv0QsNlThz3S4Oi7eOjSI?=
 =?iso-8859-1?Q?bPGlUXDAZ/0vbFkxow+TTzPkdwk/zWMMGI188jK/s1rQO1VeQQGxud3HPT?=
 =?iso-8859-1?Q?gaui9ECLkMrY+ZhDveYjv5qaDwku0V+VYG9/eJ9xZXUQ8a1myIF6c1ZpuL?=
 =?iso-8859-1?Q?II8enDd2Sb+S/vpwnWZ9gcd0zJG/qr4/UQ?=
Content-Type: multipart/alternative;
 boundary="_000_MA1PR01MB3897577EEEFA584CF75C33F888629MA1PR01MB3897INDP_"
MIME-Version: 1.0
X-OriginatorOrg: prodapt.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3897.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 522b7cc8-bdc4-48f1-c2fa-08db4103dd28
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 18:28:25.4034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b85de5b8-3fd3-4b20-9328-0d268db1282f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lSxxQQPKc4KaiEOprvINDvhXrLP9HPPJUV7uJmwBNt7DgF9z5TO3E96KThlyt9c4hQ9zIDBWy5SyGthWFZK4eFGlAvS8JjjI8339+/Lnb8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6578
Received-SPF: pass client-ip=40.107.239.118;
 envelope-from=dinesh.tyagi@prodapt.com;
 helo=IND01-BMX-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 19 Apr 2023 16:04:40 -0400
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

--_000_MA1PR01MB3897577EEEFA584CF75C33F888629MA1PR01MB3897INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Qemu members,

   I apologize for sending this email, but I need some help to find a QEMU =
expert for our client in Silicon Valley. We are looking for someone who can=
 integrate QEMU with simulators and preferably some experience in RISC-V CP=
U.

    Please let me know if you can connect me to someone. Please see below t=
he position details. The client is OK with remote.


  *   Experience in QEMU integration with other simulators

     *   Processing thread synchronization

     *   Time synchronization

     *   MMIO peripheral development

     *   In-process shared memory (QEMU and other simulator)

     *   Interrupt forwarding

  *   Experience setting up QEMU processors in non-uniform memory architect=
ure.

  *   Experience with QEMU instruction-set customization and extension

     *   In particular for RiscV64

  *   Experience interfacing QEMU with graphical debugger, Eclipse CDT or s=
imilar.

  *   Experience producing memory and instruction traces from QEMU in diffe=
rent formats.

  *   Experience integrating QEMU in CD/CI environment



Regards

Dinesh Tyagi

Head - ASIC Business

Prodapt ASIC services

Mobile: (408)623-1485

________________________________
Disclaimer

This email contains proprietary, confidential and privileged information of=
 Prodapt Solutions Private Limited and its affiliates ("Prodapt" or "We") a=
nd is intended for the exclusive use of the named recipient ("Recipient"). =
If you are not the intended Recipient and have received this email by mista=
ke, please reply to this email and follow with its deletion, so that we can=
 ensure such a mistake does not occur in the future. It is strictly prohibi=
ted to share any part of this email with any third party, without an expres=
s written confirmation by Prodapt. All e-mail, if permitted by applicable l=
aw, sent to and from Prodapt is subject to archiving and review by someone =
other than the Recipient. We do not accept any liability for any errors or =
omissions in the contents of this e- mail nor do we represent that this ema=
il and any attachments is without any errors and virus free. In the event t=
his email contains Personal Data of the Recipient, we would like to inform =
that we process Personal Data in accordance with our Privacy Policy<http://=
www.prodapt.com/privacy-policy/>.No employee/contractor is authorized to co=
nclude any binding contract on behalf of Prodapt without an express written=
 confirmation by an executive officer of Prodapt. Please do not print this =
email unless it is necessary. Every unprinted email helps the environment. =
Thank you for your co-operation

www.prodapt.com<http://www.prodapt.com>

--_000_MA1PR01MB3897577EEEFA584CF75C33F888629MA1PR01MB3897INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Dear Qemu members,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
&nbsp; &nbsp;I apologize for sending this email, but I need some help to fi=
nd a QEMU expert for our client in Silicon Valley. We are looking for someo=
ne who can integrate QEMU with simulators and preferably some experience in=
 RISC-V CPU.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
&nbsp; &nbsp; Please let me know if you can connect me to someone. Please s=
ee below the position details. The client is OK with remote.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<ul style=3D"margin-top: 0px; margin-bottom: 0px; background-color: rgb(255=
, 255, 255);">
<li dir=3D"ltr" style=3D"font-size:11pt;font-family:Arial;text-decoration:n=
one">
<p dir=3D"ltr" style=3D"margin-top:0pt;margin-bottom:0pt;line-height:1.38">=
<span class=3D"x_x_x_ContentPasted0 x_x_ContentPasted0 ContentPasted0" styl=
e=3D"margin:0px;text-decoration:none">Experience in QEMU integration with o=
ther simulators</span></p>
</li><ul style=3D"list-style-type:circle">
<li dir=3D"ltr" style=3D"font-size:11pt;font-family:Arial;text-decoration:n=
one">
<p dir=3D"ltr" style=3D"margin-top:0pt;margin-bottom:0pt;line-height:1.38">=
<span class=3D"x_x_x_ContentPasted0 x_x_ContentPasted0 ContentPasted0" styl=
e=3D"margin:0px;text-decoration:none">Processing thread synchronization</sp=
an></p>
</li><li dir=3D"ltr" style=3D"font-size:11pt;font-family:Arial;text-decorat=
ion:none">
<p dir=3D"ltr" style=3D"margin-top:0pt;margin-bottom:0pt;line-height:1.38">=
<span class=3D"x_x_x_ContentPasted0 x_x_ContentPasted0 ContentPasted0" styl=
e=3D"margin:0px;text-decoration:none">Time synchronization</span></p>
</li><li dir=3D"ltr" style=3D"font-size:11pt;font-family:Arial;text-decorat=
ion:none">
<p dir=3D"ltr" style=3D"margin-top:0pt;margin-bottom:0pt;line-height:1.38">=
<span class=3D"x_x_x_ContentPasted0 x_x_ContentPasted0 ContentPasted0" styl=
e=3D"margin:0px;text-decoration:none">MMIO peripheral development</span></p=
>
</li><li dir=3D"ltr" style=3D"font-size:11pt;font-family:Arial;text-decorat=
ion:none">
<p dir=3D"ltr" style=3D"margin-top:0pt;margin-bottom:0pt;line-height:1.38">=
<span class=3D"x_x_x_ContentPasted0 x_x_ContentPasted0 ContentPasted0" styl=
e=3D"margin:0px;text-decoration:none">In-process shared memory (QEMU and ot=
her simulator)</span></p>
</li><li dir=3D"ltr" style=3D"font-size:11pt;font-family:Arial;text-decorat=
ion:none">
<p dir=3D"ltr" style=3D"margin-top:0pt;margin-bottom:0pt;line-height:1.38">=
<span class=3D"x_x_x_ContentPasted0 x_x_ContentPasted0 ContentPasted0" styl=
e=3D"margin:0px;text-decoration:none">Interrupt forwarding</span></p>
</li></ul>
<li dir=3D"ltr" style=3D"font-size:11pt;font-family:Arial;text-decoration:n=
one">
<p dir=3D"ltr" style=3D"margin-top:0pt;margin-bottom:0pt;line-height:1.38">=
<span class=3D"x_x_x_ContentPasted0 x_x_ContentPasted0 ContentPasted0" styl=
e=3D"margin:0px;text-decoration:none">Experience setting up QEMU processors=
 in non-uniform memory architecture.</span></p>
</li><li dir=3D"ltr" style=3D"font-size:11pt;font-family:Arial;text-decorat=
ion:none">
<p dir=3D"ltr" style=3D"margin-top:0pt;margin-bottom:0pt;line-height:1.38">=
<span class=3D"x_x_x_ContentPasted0 x_x_ContentPasted0 ContentPasted0" styl=
e=3D"margin:0px;text-decoration:none">Experience with QEMU instruction-set =
customization and extension</span></p>
</li><ul style=3D"list-style-type:circle">
<li dir=3D"ltr" style=3D"font-size:11pt;font-family:Arial;text-decoration:n=
one">
<p dir=3D"ltr" style=3D"margin-top:0pt;margin-bottom:0pt;line-height:1.38">=
<span class=3D"x_x_x_ContentPasted0 x_x_ContentPasted0 ContentPasted0" styl=
e=3D"margin:0px;text-decoration:none">In particular for RiscV64</span></p>
</li></ul>
<li dir=3D"ltr" style=3D"font-size:11pt;font-family:Arial;text-decoration:n=
one">
<p dir=3D"ltr" style=3D"margin-top:0pt;margin-bottom:0pt;line-height:1.38">=
<span class=3D"x_x_x_ContentPasted0 x_x_ContentPasted0 ContentPasted0" styl=
e=3D"margin:0px;text-decoration:none">Experience interfacing QEMU with grap=
hical debugger, Eclipse CDT or similar.</span></p>
</li><li dir=3D"ltr" style=3D"font-size:11pt;font-family:Arial;text-decorat=
ion:none">
<p dir=3D"ltr" style=3D"margin-top:0pt;margin-bottom:0pt;line-height:1.38">=
<span class=3D"x_x_x_ContentPasted0 x_x_ContentPasted0 ContentPasted0" styl=
e=3D"margin:0px;text-decoration:none">Experience producing memory and instr=
uction traces from QEMU in different formats.</span></p>
</li><li dir=3D"ltr" style=3D"font-size:11pt;font-family:Arial;text-decorat=
ion:none">
<p dir=3D"ltr" class=3D"x_x_x_elementToProof" style=3D"margin-top:0pt;margi=
n-bottom:0pt;line-height:1.38">
<span class=3D"x_x_x_ContentPasted0 x_x_ContentPasted0 ContentPasted0" styl=
e=3D"margin:0px;text-decoration:none">Experience integrating QEMU in CD/CI =
environment</span></p>
</li></ul>
<br>
</div>
<div class=3D"elementToProof">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div dir=3D"ltr" style=3D"margin: 0px; text-align: start; background-color:=
 rgb(255, 255, 255);">
<div style=3D"margin:0px">
<div style=3D"margin:0px">
<p style=3D"font-size: 12pt; margin: 0px; background-color: white;"><i><spa=
n style=3D"font-size: 9pt; font-family: Arial, sans-serif; margin: 0px; col=
or: blue;">Regards</span></i></p>
<p style=3D"font-size: 11pt; font-family: Calibri, sans-serif; margin: 0px;=
 background-color: white;">
<i><span style=3D"font-size: 9pt; font-family: Arial, sans-serif; margin: 0=
px; color: blue;">Dinesh Tyagi</span></i><span style=3D"font-size: 9pt; fon=
t-family: Arial, sans-serif; margin: 0px; color: rgb(80, 0, 80);"></span></=
p>
</div>
</div>
</div>
<div dir=3D"ltr" style=3D"margin: 0px; text-align: start; background-color:=
 rgb(255, 255, 255);">
<div style=3D"margin:0px">
<div style=3D"margin:0px">
<p style=3D"font-size: 11pt; font-family: Calibri, sans-serif; margin: 0px;=
 background-color: white;">
<span style=3D"font-size: 9pt; font-family: Arial, sans-serif; margin: 0px;=
 color: rgb(194, 36, 31);">Head - ASIC Business</span><span style=3D"font-s=
ize: 9pt; font-family: Arial, sans-serif; margin: 0px; color: rgb(34, 34, 3=
4);"></span></p>
</div>
</div>
</div>
<div dir=3D"ltr" style=3D"margin: 0px; text-align: start; background-color:=
 rgb(255, 255, 255);">
<div style=3D"margin:0px">
<div style=3D"margin:0px">
<p style=3D"font-size: 11pt; font-family: Calibri, sans-serif; margin: 0px;=
 background-color: white;">
<span style=3D"font-size: 9pt; font-family: Arial, sans-serif; margin: 0px;=
 color: rgb(194, 36, 31);">Prodapt ASIC services</span></p>
<p style=3D"font-size: 11pt; font-family: Calibri, sans-serif; margin: 0px;=
 background-color: white;">
<span style=3D"font-size: 9pt; font-family: Arial, sans-serif; color: rgb(1=
94, 36, 31);">Mobile:&nbsp;</span><span style=3D"font-size: 9pt; font-famil=
y: Arial, sans-serif; color: rgb(194, 36, 31);">(408)623-1485</span><br>
</p>
</div>
</div>
</div>
<br>
</div>
</div>
</div>
</div>
<hr style=3D"color:black">
<h5><b><u><i>Disclaimer </i></u></b></h5>
<p style=3D"font-family:Arial; font-size:10.5px; color:#808080">This email =
contains proprietary, confidential and privileged information of Prodapt So=
lutions Private Limited and its affiliates (&#8220;Prodapt&#8221; or &#8220=
;We&#8221;) and is intended for the exclusive use of the named
 recipient (&#8220;Recipient&#8221;). If you are not the intended Recipient=
 and have received this email by mistake, please reply to this email and fo=
llow with its deletion, so that we can ensure such a mistake does not occur=
 in the future. It is strictly prohibited to
 share any part of this email with any third party, without an express writ=
ten confirmation by Prodapt. All e-mail, if permitted by applicable law, se=
nt to and from Prodapt is subject to archiving and review by someone other =
than the Recipient. We do not accept
 any liability for any errors or omissions in the contents of this e- mail =
nor do we represent that this email and any attachments is without any erro=
rs and virus free. In the event this email contains Personal Data of the Re=
cipient, we would like to inform
 that we process Personal Data in accordance with our <a style=3D"font-fami=
ly:Arial; font-size:10.5px; color:#0000FF" href=3D"http://www.prodapt.com/p=
rivacy-policy/">
Privacy Policy</a>.No employee/contractor is authorized to conclude any bin=
ding contract on behalf of Prodapt without an express written confirmation =
by an executive officer of Prodapt. Please do not print this email unless i=
t is necessary. Every unprinted
 email helps the environment. Thank you for your co-operation <br>
<br>
<a style=3D"font-family:Arial; font-size:10.5px; color:#0000FF" href=3D"htt=
p://www.prodapt.com">www.prodapt.com</a></p>
</body>
</html>

--_000_MA1PR01MB3897577EEEFA584CF75C33F888629MA1PR01MB3897INDP_--

