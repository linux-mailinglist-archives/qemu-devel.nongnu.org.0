Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D9F4183D5
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 19:56:48 +0200 (CEST)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUBup-0007SM-9t
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 13:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shitalkumar.gandhi@seagate.com>)
 id 1mUB9e-0004z0-Pl
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:08:02 -0400
Received: from esa.hc4959-67.iphmx.com ([216.71.153.94]:61377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shitalkumar.gandhi@seagate.com>)
 id 1mUB9a-00021d-S6
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 13:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=seagate.com; i=@seagate.com; q=dns/txt; s=stxiport;
 t=1632589678; x=1664125678;
 h=from:to:subject:date:message-id:mime-version;
 bh=XbYn6I5y9Dommvr5c2dTduS+t3LfqxL8hkL+FSBz1Ck=;
 b=jbcwS/Ljab5szNfg9RnuIQw2HQ8ZXbnu5THqLQVXpKt2tCLPs2XQPjwA
 d5flyO5xqU9lDBCReur3XTCJAR4Z9fZkrb67+C2PeEq5o6EA/ylUorIpw
 dMT5vG2YgwSQJLYnWrWZgR45fHB0wZiWoxpqN2pekbPf6+qLblKalrghY 8=;
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc4959-67.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2021 10:07:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1mK6UT7h7zqkp8UJZYVeDfMAADL0Oj7Lk1y67Aw11PAdyGivIOQqjN4EV/3VDjI+RTRgSQXegvhLmbkyY45JvbTxghNTgJXeKAWBdXf1J8jpJlkP72fe0xSOqWyLi9QyWRGXKpe8dx0zzVz57KIfoo0yYOOe/Af0yJi7u8xd1bUiSyRt+jws0HsUcVLyyKJ3JrDzrS4sOBR+/crdk4mcvAFX9pJ4saslHE0R7SVPs6idfGGAieefVn47LHzwvA3gZSfr/KF1URGXMIn1vIr0EBbMULHTq0VG/PjyQ2GRemdOY2G0VROzL3dU/tcTI7DfCTGM5kKTYBvTIF2Y3JfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=14gEZTjUaVfh1t+AsGt1vHeAY9g0iwp09LBJb+uzJh8=;
 b=VjWyddDRm7zdKaGwHreuJuxei0wvkDekBlf3Gcy1VKJ6ENxT7sSz9J1CcpjF4YEkFlRr/X6AbP+urqAw8C8/IJ7yul61CpdWJxQ+w1MfgwutDDWyulEUMvDn/RWjCjgjGiPFvcpHnBanI02M+E7Zfpt8a2P4K8ezd9aQb6dRjhPI64jc8Dpst/yBWDKac8U68xw3NRoSWFSKiFnqBVZbG37US/cSKySTSBumfOWBVZz5o+Kf2KNC35kVJv+Sci32FIuEc3Yv+iLBBnRkKwsn+VY43G52gDXQP1I2zUldBS7HQjpcs18hVjKj+FGG7vAU8TR+/bcdNG9ISF6x0ZcZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seagate.com; dmarc=pass action=none header.from=seagate.com;
 dkim=pass header.d=seagate.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seagate.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14gEZTjUaVfh1t+AsGt1vHeAY9g0iwp09LBJb+uzJh8=;
 b=NzrcrPPRK1As0hsqIX5SLUEiyA2NN5wXBKPK2DeHs4KtcKdFnWDGMzJoEFIh/WF9LUvj6tnUeT5s12Qt+gPDZuqXxFSMJxLBpw1WHiT+tIHdqX+1zxAPg/hJdMZmQ2dgPUJcnDwXMoEEMiiRn6SCX5KohuaIjSKl3sqeV8FXrds=
Received: from SJ0PR20MB3643.namprd20.prod.outlook.com (2603:10b6:a03:2e1::14)
 by BYAPR20MB2408.namprd20.prod.outlook.com (2603:10b6:a03:150::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Sat, 25 Sep
 2021 17:07:48 +0000
Received: from SJ0PR20MB3643.namprd20.prod.outlook.com
 ([fe80::94f7:7038:a27c:5e55]) by SJ0PR20MB3643.namprd20.prod.outlook.com
 ([fe80::94f7:7038:a27c:5e55%9]) with mapi id 15.20.4544.020; Sat, 25 Sep 2021
 17:07:48 +0000
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Need to merge - QEMU patch for booting eMMC image for AST2600 machine
Thread-Topic: Need to merge - QEMU patch for booting eMMC image for AST2600
 machine
Thread-Index: AQHXsi8RpibRV/Qva0WR6yL4MOIGOQ==
Date: Sat, 25 Sep 2021 17:07:47 +0000
Message-ID: <SJ0PR20MB3643750F8FF71E838A750F9B9DA59@SJ0PR20MB3643.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_Enabled=True;
 MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_SiteId=d466216a-c643-434a-9c2e-057448c17cbe;
 MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_SetDate=2021-09-25T17:07:47.203Z;
 MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_Name=Seagate
 Internal; MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_ContentBits=0;
 MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_Method=Standard; 
suggested_attachment_session_id: 076554f9-e81b-170d-121d-f90d1335aa4f
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=seagate.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d6b7872-b863-463d-1364-08d98046ffff
x-ms-traffictypediagnostic: BYAPR20MB2408:
x-microsoft-antispam-prvs: <BYAPR20MB2408019D18F66D606DC812789DA59@BYAPR20MB2408.namprd20.prod.outlook.com>
stx-hosted-ironport-oubound: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eWuljzaw+AoXu7mkEvyssmCm4CzIAjRZXn9ozrN9+BNJ7bQW2S+Mwl7qtYfrruaDj2J+zlGXA5pOqSNba7yzBWI/jfKyH/8WTKYoR2/4wj5j00m16TztCE7whZx/R6OzgG2O5W2x08k45uq852LeAxZx0I9asXkyPg7RXD1UZEktRE5QXxHni0ZUpHIvwQHW772qRjmBdmFpdh0Kw1IhTdWe/w3rmCX/tdvDmQNxWbzNfU7j3TS7M+zvxC4I0wp+1Mim8wSwlQunajmgDZsfscVWW1MGYU1xiwcsRc17W4fCF3ZB1GZySbz2kqo/5+9XiPn/OlRhSCsW9qbg0hEUwSitUD0uVkVisle1pF/DECYJEvbSQzgQzuw90LvDtlElTCyIBka085oYeHkUasnY+7x0ENFhUuhG9Nj+ezxfa/UD4kDNLFV69pA0xcJ7zEZHgvytrg7lTHFeB+oU2EuAVxgVNruZGORTDWyqVT+cVW4+mwyQki3KsQD+xTGqFuXRn1SKayBxOQ+N9RhbN6ArwJreUkh6Bn2KTk1NPiE7di+dDo52zvteoMT0wp0DnnWusbd8GVHiRTyhxaT4EcMPmveNegnKGInWJseQVUP1niNKLk0CTtC7pnBQLY0nAmfdXnocS4Negq1+xQZrHlq/dco6v3th02vNIku7XMzEK2w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR20MB3643.namprd20.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33656002)(122000001)(38100700002)(186003)(19627405001)(38070700005)(26005)(6506007)(86362001)(71200400001)(99936003)(2906002)(8936002)(6916009)(66946007)(64756008)(66476007)(66446008)(66556008)(66616009)(76116006)(91956017)(5660300002)(316002)(8676002)(55016002)(7696005)(508600001)(52536014)(9686003)(44832011)(558084003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sTF1piWsuXxKg6y/ORC9CQOsT9Ndj5UEBTyLSkmyl1xYXDgYuq2kYT5E84?=
 =?iso-8859-1?Q?Uo1MKdjY2Rqpy+5II4wgsmwjek6oecM4tHVmX3SyxEhpyO3TlFryjmTVYP?=
 =?iso-8859-1?Q?OVIohPKfPXEpG3EF+m7gNPsOGRHTwSNz3suSbpqwiw3kBacMX6lUiIZvHl?=
 =?iso-8859-1?Q?hUIOtE1I7uJ2dBeWf8hfAMD5OhJmrTa5NiQaSTE6hac02MkPJoB5p5eNJ1?=
 =?iso-8859-1?Q?GOcp3rq628ZYg0TvHTJq03Mpbas8hMOasoJiqy+HouEVGXIdLCpFSoRAYq?=
 =?iso-8859-1?Q?0BJ5kWrPIhtwaZFsWiMlrUy2KEnotNbpby+3oEfr60B56cWQYq5rxj2wJ5?=
 =?iso-8859-1?Q?1tRlc1lIzztkRRFy+qs3IVARdVEylTe+E6Ovr9MrE+/309R2IfabWJNLIp?=
 =?iso-8859-1?Q?VRCl1TUZDk2OV3utwII+Gtwaf8lfGyVQsXxDTfUEj9jVXZU2duXgWR8QLG?=
 =?iso-8859-1?Q?9KZplq34GL2g6HRixkjvlWGlV+JDJiU9/HoY7EtjxwXTIax23xldyTEPSO?=
 =?iso-8859-1?Q?LY0wvM1ht2QufXX2ixPEl9nkD5dy4N3bHzJ8sadEycbWxG5FdvJh/B8hkC?=
 =?iso-8859-1?Q?JDRL3RjYfxyTW8yqViB9vU+9Ptb+LuRTbhL9i9R9M4CxeloOPc8EASHf2M?=
 =?iso-8859-1?Q?8Eixi91MFPjC2r15wmzJ/rHGbHMo96TWDApyyM8DTTwX7Ta8AxDfbNSCS4?=
 =?iso-8859-1?Q?OuLbKPMdP6mD6tcj5tQ1kMTF725iwyB2m+J4Yyv+bYzBIQlA3OD9HXuY+I?=
 =?iso-8859-1?Q?rHlkUQxKvp5iLvT9o3tgZ5YwERBcKZD1dlHVXhqIqch7h5VODATZYs1dmN?=
 =?iso-8859-1?Q?wv2SBIwFI3k7o7/rY+20qP05QIyQaYFwHemYAfctCyCM4mJVNy2NSQOhu9?=
 =?iso-8859-1?Q?YNkK4nCkEsa2C8b7xZQWvs529ul0kQdfBsF0/yK5DR9K+qX+t81xj6gcmg?=
 =?iso-8859-1?Q?m0LvBPlbUUOuc+S80v6Ymx84ZeHv2evpxlK+0S8+unNytB8wIcNVU1KqGM?=
 =?iso-8859-1?Q?EMc9MdO1IMmJ9a7yhI/WahZjATXF3FH/VjwmEzRonxbwPAuqECG6ZFM3Hd?=
 =?iso-8859-1?Q?sGHP0mD6nAYiA7B+GkOF7M9zrLH/suc4FXSdpb28E0IB+oBgU8zj4K0Y2Q?=
 =?iso-8859-1?Q?Xi5ld4iaOHN56B6m41kIfZZJJR078GK+ccS5/VMW+NDtxq1KqqQm/Ld45K?=
 =?iso-8859-1?Q?qWNYK7c1jh1oNOke9ZPwsId8OqM7/MszYHpuxfU9zw/kdVOGBM57ZEc40H?=
 =?iso-8859-1?Q?liJGse2FScJFsTwRbx9E62NFgPFmsVUDh33y8pLpbxdG1LJajb0T5i1/dV?=
 =?iso-8859-1?Q?Wd6b6IcvHPjDE/OKNCiuojVAYnfFvnSLyXmW78abZsR5/Vw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_004_SJ0PR20MB3643750F8FF71E838A750F9B9DA59SJ0PR20MB3643namp_"
MIME-Version: 1.0
X-OriginatorOrg: seagate.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR20MB3643.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6b7872-b863-463d-1364-08d98046ffff
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2021 17:07:47.9593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d466216a-c643-434a-9c2e-057448c17cbe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LsIn8R0daJJVzcx0KRxleQMtxnGDawIhPB1gpBBU15xsdIArFs0QSeER2wIZNGvlGWcYnf6RDDw9OKTk7lgTf+YqrxVOrVrTsgXFQdDuiPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR20MB2408
Received-SPF: pass client-ip=216.71.153.94;
 envelope-from=shitalkumar.gandhi@seagate.com; helo=esa.hc4959-67.iphmx.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_20=-0.001, DKIMWL_WL_HIGH=-1.482,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 25 Sep 2021 13:38:39 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Shitalkumar Gandhi <shitalkumar.gandhi@seagate.com>
From:  Shitalkumar Gandhi via <qemu-devel@nongnu.org>

--_004_SJ0PR20MB3643750F8FF71E838A750F9B9DA59SJ0PR20MB3643namp_
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR20MB3643750F8FF71E838A750F9B9DA59SJ0PR20MB3643namp_"

--_000_SJ0PR20MB3643750F8FF71E838A750F9B9DA59SJ0PR20MB3643namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am attaching a patch that will fix eMMC image booting on QEMU for AST2600=
 machine, without this patch it will be stuck after SPL saying, "booting fr=
om RAM".

Please review and merge, thanks.

Let me know in case of any concern.

Thanks.

BR,
Shitalkumar


Seagate Internal

--_000_SJ0PR20MB3643750F8FF71E838A750F9B9DA59SJ0PR20MB3643namp_
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
: 12pt; color: rgb(0, 0, 0);">
Hi,<br>
<br>
I am attaching a patch that will fix eMMC image booting on QEMU for AST2600=
 machine, without this patch it will be stuck after SPL saying, &quot;booti=
ng from RAM&quot;.<br>
<br>
Please review and merge, thanks.<br>
<br>
Let me know in case of any concern.<br>
<br>
Thanks.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
BR,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Shitalkumar</div>
<br>
<p style=3D"font-family:Calibri;font-size:10pt;color:#008000;margin:5pt;" a=
lign=3D"Center">
Seagate Internal<br>
</p>
</body>
</html>

--_000_SJ0PR20MB3643750F8FF71E838A750F9B9DA59SJ0PR20MB3643namp_--

--_004_SJ0PR20MB3643750F8FF71E838A750F9B9DA59SJ0PR20MB3643namp_
Content-Type: application/octet-stream;
	name="0001-hw-arm-aspeed-Added-mmc-boot-support-for-AST2600-eMM.patch"
Content-Description:  0001-hw-arm-aspeed-Added-mmc-boot-support-for-AST2600-eMM.patch
Content-Disposition: attachment;
	filename="0001-hw-arm-aspeed-Added-mmc-boot-support-for-AST2600-eMM.patch";
	size=1366; creation-date="Sat, 25 Sep 2021 17:07:05 GMT";
	modification-date="Sat, 25 Sep 2021 17:07:35 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5MmI4ZWM5M2M3YWQ0OGMzZWJkZDUwMmI2NzlhODAzOThjMDZiYzNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGl0YWxrdW1hciBHYW5kaGkgPHNoaXRhbGt1bWFyLmdhbmRo
aUBzZWFnYXRlLmNvbT4KRGF0ZTogRnJpLCAyNCBTZXAgMjAyMSAyMDo0NjoyMiArMDUzMApTdWJq
ZWN0OiBbUEFUQ0hdIGh3L2FybS9hc3BlZWQ6QWRkZWQgbW1jIGJvb3Qgc3VwcG9ydCBmb3IgQVNU
MjYwMCBlTU1DIGltYWdlLgpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxh
aW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKVGhpcyBw
YXRjaCBoYXMgYmVlbiBhZGRlZCB0byBib290IGVNTUMgaW1hZ2UgZm9yIEFTVDI2MDAgbWFjaGlu
ZSBvbgpRRU1VLgoKUnVuIHF1ZW11IGFzIGZvbGxvd3M6CgouL3FlbXUtc3lzdGVtLWFybSAtbSAx
RyAtTSBhc3QyNjAwLWV2YiAtbm9ncmFwaGljIC1kcml2ZQpmaWxlPW1tYy1ldmItYXN0MjYwMC5p
bWcsZm9ybWF0PXJhdyxpZj1zZCxpbmRleD0yCgpUZXN0ZWQ6IEJvb3RlZCBBU1QyNjAwIGVNTUMg
aW1hZ2Ugb24gUUVNVS4KU3VnZ2VzdGVkLWJ5OiAgPHZlbnR1cmVAZ29vZ2xlLmNvbT4KUmV2aWV3
ZWQtYnk6IEhhbyBXdSA8d3VoYW90c2hAZ29vZ2xlLmNvbT4KUmV2aWV3ZWQtYnk6IEPDqWRyaWMg
TGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ck1lc3NhZ2UtSWQ6IDwyMDIxMDQxNjE2MjQyNi4zMjE3
MDMzLTEtdmVudHVyZUBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRl
ciA8Y2xnQGthb2Qub3JnPgotLS0KIGh3L2FybS9hc3BlZWQuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2h3L2FybS9h
c3BlZWQuYyBiL2h3L2FybS9hc3BlZWQuYwppbmRleCBiYTVmMWRjNWFmLi42YTg5MGFkYjgzIDEw
MDY0NAotLS0gYS9ody9hcm0vYXNwZWVkLmMKKysrIGIvaHcvYXJtL2FzcGVlZC5jCkBAIC0xNDgs
NyArMTQ4LDcgQEAgc3RydWN0IEFzcGVlZE1hY2hpbmVTdGF0ZSB7CiAgICAgICAgIFNDVV9BU1Qy
NDAwX0hXX1NUUkFQX0JPT1RfTU9ERShBU1QyNDAwX1NQSV9CT09UKSkKIAogLyogQVNUMjYwMCBl
dmIgaGFyZHdhcmUgdmFsdWUgKi8KLSNkZWZpbmUgQVNUMjYwMF9FVkJfSFdfU1RSQVAxIDB4MDAw
MDAwQzAKKyNkZWZpbmUgQVNUMjYwMF9FVkJfSFdfU1RSQVAxICgweDAwMDAwMEMwIHwgQVNUMjY1
MDBfSFdfU1RSQVBfQk9PVF9TUkNfRU1NQykKICNkZWZpbmUgQVNUMjYwMF9FVkJfSFdfU1RSQVAy
IDB4MDAwMDAwMDMKIAogLyogVGFjb21hIGhhcmR3YXJlIHZhbHVlICovCi0tIAoyLjMwLjIKCg==

--_004_SJ0PR20MB3643750F8FF71E838A750F9B9DA59SJ0PR20MB3643namp_--

