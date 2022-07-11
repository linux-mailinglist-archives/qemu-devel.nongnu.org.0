Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BA75703DD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 15:09:42 +0200 (CEST)
Received: from localhost ([::1]:45998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAtAT-00039q-Sg
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 09:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaidehi.deshpande@nio.io>)
 id 1oAnoj-0000eF-PG
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:26:53 -0400
Received: from mail-bn8nam12on20721.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::721]:45632
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaidehi.deshpande@nio.io>)
 id 1oAnog-0000Ll-Q1
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:26:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0p65xevSHELlWGBBKekLWEPb4okkh5dYhT1jN4h4GbXXg16nyOximtR8gD3KIStQl4LRo2pKdauXcZGzL6yuD6IvgW0rRAzjC5qxMwCGEJJwX+e9ImcZGpV2Lpvgv5yAdmSr3MhlKLwrFfmRx45FPodY/qVgD6tP/HG67CHP58MmkJITaGdZX4ANGoEH4TK+hu78o6O4lAoncytr7LD1IA+I83+PqIv+C2UQw7yEDZza2Q1XzRQQCkWHbeDdz3HTPpU41eb8TtOwhFEZ7/1XPQItj9Oj5i5ksnlYD8HYqysPSiveVQROuZ11s8zCpAbAlBFq/LMeQzvrIQes9ceVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQDMLh/yed9RgYWnOCRkM4QNVsq6/KGhe/2vGsT+zLk=;
 b=eG1SkmClZtg2KsbdHgeHAb6+tocBUoEVaa4WpRh6QhFRq7WyTQp4yc7vWAtRw3WPJ2mTmpTVvUwJrxJnvrRvUPog1b39w1Aw89I7CoFEl7HXcRGgkDsh9bKQAhdNIL/ObX0OqncO5ejtaF5YKe5OSvjWQ0qltF0Z/QRsNomVFDB2Y3jTw0a6CRZS8F9O9xvZax1WL+Ua6up1f8Nl9rPkt2kMGLVDeOgzbOFsvwT2wIYEK5+ecRrASfe2pyxGdNQfkf8zOtu9Pl7SVjB4DPOj/Rlngw/Zzcy3BCMU1po47Ue4jr0J6vNCOu85is/2WpFZhBcdkF4BsOkuQKmZG3j7TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nio.io; dmarc=pass action=none header.from=nio.io; dkim=pass
 header.d=nio.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nio.io; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQDMLh/yed9RgYWnOCRkM4QNVsq6/KGhe/2vGsT+zLk=;
 b=MJr5+9Obq/kl+8CuIO2aoBaj+ONNQMhzpLNLcxn96J9Uf275qO6LXCYSSRoHsiSfZknAgCpWeGV81L7nB+3061+JjvMdmpOwNELw4d9SkHZ6tabGwYqccwCXQJI7/xSUlcewNfpgLlcrPvgih4L06CZcxsfyLgr+Cy2/c8EBmIo=
Received: from DS0PR14MB5592.namprd14.prod.outlook.com (2603:10b6:8:c4::11) by
 MW4PR14MB4603.namprd14.prod.outlook.com (2603:10b6:303:bc::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.23; Mon, 11 Jul 2022 07:21:44 +0000
Received: from DS0PR14MB5592.namprd14.prod.outlook.com
 ([fe80::5d5a:b68:b079:d3a9]) by DS0PR14MB5592.namprd14.prod.outlook.com
 ([fe80::5d5a:b68:b079:d3a9%5]) with mapi id 15.20.5417.020; Mon, 11 Jul 2022
 07:21:43 +0000
From: "Vaidehi Anant Deshpande (i)" <vaidehi.deshpande@nio.io>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Information needed regarding gnu-arm-eclipse version:
Thread-Topic: Information needed regarding gnu-arm-eclipse version:
Thread-Index: AQHYlPZ0EE28hS6lJUiNpHQn1GfNLA==
Date: Mon, 11 Jul 2022 07:21:43 +0000
Message-ID: <DS0PR14MB5592DD9ACC1CC45554386FE18E879@DS0PR14MB5592.namprd14.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nio.io;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ee93f11-5aa1-4491-bf9a-08da630e01d0
x-ms-traffictypediagnostic: MW4PR14MB4603:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ah66DuGiq407qScmCJ2zsd+FCw/OXUOCzVdLu13ZQXhDjEBdrPPEQWE6S1iu0Hw0HN8av6FtMov2FpEPquTTWjJVM336npK8s1c/SRt98Qs54gHxVpCsxcMxX79HWoHpIBvTnroht+NoOn3VaflZgeT2x1/QCoUsW+/dMiKUJVgsqlbOhv7aKW7jLsa1iGBZbRJOoN7KOhX90nhVEm8u7YHdCfdqPJCAhzJ861QovczZGXMNX7xH3k4vmEKImBnAmaOpTHmzHJi162j7kSBcenOGFml53pzfYGiGspZJMwDCKOUtGGJjIGJQ2zsj7Kid//r1mdYy0cPz0rB2J77F0QwJsNVg2n6k44ebyZfSLiHXS7h2yawAsvZbRKxUXwSTMXqHzcqOLap36ns9LQVqAtaII0l3TEB65R+KoEtPAVf8FeIzMGJbRHe2jP5h7v7n/JV2tUdLQclV3/3l00kS+B3hYxgdwInXAHtXI5xy829tcCdzCZHDdttdTeMcFzQpKC12rfmwBnuZjB77aCmqYW/LlIbUo04UNXMjEMKPEAZPHNWn/F4u58xzpHNXfU7E2wmv8eTSyQb4lS0AfSQHZu959ZqLn0jp0mtE6vmymApFaNzAQK30ZRzpOsxHRHLKXAUXJq0v9i18z26B7EZCcyABEpEzaRMS14u00oj362EsifrimJm5Mn/cdXr6Mx4OcjcK04dvxxXpEKEG75OxVwEulmZljNiow0MgZo1bWoyFxUi9nB5cnFcPJ1DILRHkmIc8lv0o5sbsW8dlHjUNp98pWzOeKL9sU8LddNOj6O42x6DW9vQCfA6sj3bvsCGESbOlqRi/FGz9C+nmiJC7vw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR14MB5592.namprd14.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(83380400001)(52536014)(91956017)(5660300002)(66574015)(186003)(41300700001)(76116006)(19627405001)(33656002)(478600001)(2906002)(66946007)(8936002)(55016003)(122000001)(86362001)(166002)(316002)(6916009)(71200400001)(38070700005)(64756008)(8676002)(26005)(66556008)(9686003)(6506007)(38100700002)(7696005)(66476007)(66446008)(554374003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?9Eom7UsMhYILFr8jMK020BMjydYSr1QaM7sGsCKUvJlZysvCbl9AI1MJlX?=
 =?iso-8859-1?Q?6aZq7mkPp1MFF9qpxjoDcgKYsScJnez59WTEjIH2RaO4FT7A6Iaj5pSbwQ?=
 =?iso-8859-1?Q?zotYVjTzFW6s3fWpuqpj4iEA3o/O7F5fHCa/Vpb+ehKjWHM/x5y9RN6X4a?=
 =?iso-8859-1?Q?mBfFPNWx1adERQ6Quy7rsp8Vu7R+tOjQnVX5HGL7rpHU/d/6zPKX66hfRv?=
 =?iso-8859-1?Q?KYFHiTcf681Lh6j1n6KfKxUr44AI62OyrIpdYij0OtvCb6CR9rlSCeYn9b?=
 =?iso-8859-1?Q?I5OF1OH48sVtV6qVm0AI15Zo3EOP+fJ0g0zI9eZJUe3VsMJy/MT50pYrq2?=
 =?iso-8859-1?Q?I+u/QTvL7wrEBwvCeV5tF/TnOJsbb9Erqy8ofdHyJCq40mp9PKh8DwO6/H?=
 =?iso-8859-1?Q?dlMVZz9wHZugVjbrQeh5issRxymNCqAn2AkVhMsJaKl8q6jSg1spTdk8iZ?=
 =?iso-8859-1?Q?fYguoSnfHbpuZndcpdDsiNb5ote+oTIUDILXlvIW0axGk8Sq6Tmse+4aYx?=
 =?iso-8859-1?Q?gAZtWhlLV4oHNtT8W/HZmBjDtR5T9gMeT5MLPhgDuHcEbVQQUae4vGrNLo?=
 =?iso-8859-1?Q?JC7W9WLkZuAflr4jVvPw+ZJTRIMaGCX2HFl6lzniRZJ05ufk5sodGuxkWz?=
 =?iso-8859-1?Q?fJBYfQ8zvXLCv2aR+dBskHRGYaSXAbEllt1qxrDafcnuOh/Q8BAMuTPGYG?=
 =?iso-8859-1?Q?UJ16t31oQ/7V7UuIYogCJmPbjZ38xGrUSRNykQCWIXkDIr9HFLM1x3/Osa?=
 =?iso-8859-1?Q?enmN0jIMPiLH/+gRrUGykrqhA41HV5EJ95mK4fAbPZN+sJFXgyc/l2ZJAK?=
 =?iso-8859-1?Q?Qi9zyiOz483YkDvVzHB0OozXgc5GAL0uJ8NIkjAY8Nru7dlPFIWZkZSjd6?=
 =?iso-8859-1?Q?oOA+05t/ocaoKLc/hN78vuZfYq6wPi2aOZSSATgC1Yzi/yWSBPG303Dxp9?=
 =?iso-8859-1?Q?M51oa7V47OJHBGOXFAQ+pFG8wfavcg6xPCOS0ZVxWMB6/Ryyxx3hKtB79Z?=
 =?iso-8859-1?Q?x+OaJoWM0RmuyOAKhXZcvdfncc2Eb3+uVBb/pvTUTZ5yg4HO8HGFVns1eR?=
 =?iso-8859-1?Q?dkomdp+kHynpM8FruYQTHPPrOZtNFJxYhn8R9lCi4t4JcOTu5p5oMugB8b?=
 =?iso-8859-1?Q?fajgffLbSBSahhSc5AHcECf4ziU+4PR0q+RwxEG607cIWxZJ9rk3LakYmb?=
 =?iso-8859-1?Q?ummImLekO6EtW9YdyhaoZUMVW52Vp49fGmvU/BpVSUnxdmlth+mr2zkhOZ?=
 =?iso-8859-1?Q?UAWDBQ1udzUK9Mts+njL+DZHLhBPCuy6p0Wgq5NgiMwAyh+CJ+gOxkELFn?=
 =?iso-8859-1?Q?0riPLF/PbfAVfpULsXy0bbvoPzXg8eFLOkr20Mh3k5nTj0LciBUvgofLju?=
 =?iso-8859-1?Q?e0XxJF3+Ez3tfh9gz7eyE5/S7nrulbZyumaQEbI9z1zhTMdPW7F7FJu39n?=
 =?iso-8859-1?Q?A33SZkbzR1Remmi+47l02CabQSCVBEDFTsQNqNYONP1xrrel/PlAXigMAG?=
 =?iso-8859-1?Q?14/9Kba7x2gIyOphmwZTsQTSkH+9fI4qbSoewzP1bJ6i3+7JS86ccyc5zQ?=
 =?iso-8859-1?Q?M2HBSDe2SKplQwsWAP0+93Ksu6yl5cZbPzJQ7tbfcLywuNzrvTA4oUFy9J?=
 =?iso-8859-1?Q?KP7EYpd7faB/XnGPYynUdT7B1IuCFK8Tb1?=
Content-Type: multipart/alternative;
 boundary="_000_DS0PR14MB5592DD9ACC1CC45554386FE18E879DS0PR14MB5592namp_"
MIME-Version: 1.0
X-OriginatorOrg: nio.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR14MB5592.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee93f11-5aa1-4491-bf9a-08da630e01d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 07:21:43.6871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ea1b2f97-423f-4ab3-bf6d-45a36c09ce34
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vu9Sq/R8zAi4zqkBWMiP9+PbBIY61aNBpxXuHhPaqVYnE3qOFLPvvdf4hG+IRVahXRCVjJCSY6HUu4Vky9kY+xtmGecXC8fIbVnjuY6Y52c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR14MB4603
Received-SPF: pass client-ip=2a01:111:f400:fe5b::721;
 envelope-from=vaidehi.deshpande@nio.io;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001, T_REMOTE_IMAGE=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 11 Jul 2022 08:58:11 -0400
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

--_000_DS0PR14MB5592DD9ACC1CC45554386FE18E879DS0PR14MB5592namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I am Vaidehi and I am currently trying to run a code on QEMU emulator using=
 eclipse IDE. However, I came across some documentation regarding the depre=
cation of qemu-system-gnuarmeclipse and I need to know if there is v7.0.0 a=
vailable for qemu-syetem-gnuarmeclipse.
Please let me know the links for the same if available.

Best regards,
Vaidehi. D
[Banner]<http://www.nio.io>
This email and any files transmitted with it are confidential and intended =
solely for the use of the individual or entity to whom they are addressed. =
You may NOT use, disclose, copy or disseminate this information. If you hav=
e received this email in error, please notify the sender and destroy all co=
pies of the original message and all attachments. Please note that any view=
s or opinions presented in this email are solely those of the author and do=
 not necessarily represent those of the company. Finally, the recipient sho=
uld check this email and any attachments for the presence of viruses. The c=
ompany accepts no liability for any damage caused by any virus transmitted =
by this email.

--_000_DS0PR14MB5592DD9ACC1CC45554386FE18E879DS0PR14MB5592namp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I am Vaidehi and I am currently trying to run a code on QEMU emulator using=
 eclipse IDE. However, I came&nbsp;across some documentation regarding the =
deprecation of qemu-system-gnuarmeclipse and I need to know if there is v7.=
0.0 available for qemu-syetem-gnuarmeclipse.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Please let me know the links for the same if available.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Best regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Vaidehi. D</div>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<title>Email Signature</title>
<div style=3D"FONT-SIZE: 10pt; FONT-FAMILY: ARIAL">
<table>
<tbody>
<tr>
<td style=3D"FONT-SIZE: 10pt; BORDER-TOP: #000e58 1px solid; HEIGHT: 10px; =
FONT-FAMILY: Arial;  PADDING-TOP: 10px; vertical-align:top;" valign=3D"top"=
 colspan=3D"2">
<font color=3D"#2c2c2c"></font></td>
</tr>
<tr>
<td style=3D"FONT-SIZE: 10pt; HEIGHT: 25px; FONT-FAMILY: Arial; PADDING-BOT=
TOM: 2px; PADDING-TOP: 2px; vertical-align:top;" valign=3D"top" colspan=3D"=
2">
<a href=3D"http://www.nio.io" target=3D"_blank"><img border=3D"0" alt=3D"Ba=
nner" width=3D"112" hight=3D"40" src=3D"https://www.nio.io/prod/s3fs-public=
/images/logo-desktop-en-black.png"></a>
</td>
</tr>
<tr>
<td style=3D"FONT-SIZE: 10pt; HEIGHT: 25px; FONT-FAMILY: Arial; PADDING-TOP=
: 10px; vertical-align:top;" valign=3D"top" colspan=3D"2">
<div style=3D"FONT-SIZE: 9pt; FONT-FAMILY: Arial; text-align:justify;" alig=
n=3D"justify">
<font color=3D"#454545">This email and any files transmitted with it are co=
nfidential and intended solely for the use of the individual or entity to w=
hom they are addressed. You may NOT use, disclose, copy or disseminate this=
 information. If you have received
 this email in error, please notify the sender and destroy all copies of th=
e original message and all attachments. Please note that any views or opini=
ons presented in this email are solely those of the author and do not neces=
sarily represent those of the company.
 Finally, the recipient should check this email and any attachments for the=
 presence of viruses. The company accepts no liability for any damage cause=
d by any virus transmitted by this email.</font>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</body>
</html>

--_000_DS0PR14MB5592DD9ACC1CC45554386FE18E879DS0PR14MB5592namp_--

