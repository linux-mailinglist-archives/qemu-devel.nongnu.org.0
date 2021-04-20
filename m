Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A82365D30
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 18:22:46 +0200 (CEST)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYt9B-0002YI-BA
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 12:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Aleksandar.Rikalo@syrmia.com>)
 id 1lYt85-00027L-4n
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 12:21:37 -0400
Received: from mail-db8eur05on2092.outbound.protection.outlook.com
 ([40.107.20.92]:20320 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Aleksandar.Rikalo@syrmia.com>)
 id 1lYt82-0004Xd-PO
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 12:21:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDUlJhGHglFOz/x575GwU+eqaWy0HGULVna8L+1/jnkZIUgZQIuxDBL6aVtT9r8Uo0bv/eKgPWg29Oq0d+AiypoXeP5XM8KthCcB4Uq7bHu+5SgLvOB2Pidfcg0v2RxlrzuS3DvFu2PYlmTD+66xO3gRLrz/bY5Sm//F2clSBZlLdGaa7WvMa/ZusULcmxEDqnVc+tfrT/iAxfuc4dCNr/VLOrPb3gkqkmuQHwObDiW6x+rex3ct5jlZl6boAwADbl9Zs1ZekDb0Dqeh5v8H0wgkmfVWIDFgMKrq3lS5xDvap6Eb4cSUCiuiGYtGv+6zYL00qkSQpILuqHhkxJrktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6aWTRrDPJfLJxGFTCBr8APJuUTHK5pR46I8cqI6hRE=;
 b=NfAuWzdQPTzfcGThhD17ZwekAS6KmxRckdalmhdrDEsOUw5wzl4q9lN1p1KIrdbEkEl/mmCR4eQXOVrUJd/LVcrXz85/NyQcHEglv/Q7b37S8fIVBeCeLpiZqxOC+T5dT0NwaLoZAlJJMuFEisEDeMTm8JdZAQGxiX/4hCG21H1UXvMMtUzRfe2izXZLrOXTRs8NAl7DO/R8seXE4JbOqVyaUJ6JWqm6t/6fUYn1/HJAJICTGEMZPAAZADsmeJQ7XP/aPfjnFCmaAnZiM1gby8sDlI+nvm6cWbbGG62RUyHHkB7dP0FOOzQCq4cXQmeAVQRL/zOrt5/fyD+VD9N5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6aWTRrDPJfLJxGFTCBr8APJuUTHK5pR46I8cqI6hRE=;
 b=OVQeu5J+i+sD4Es00VUYKprTQpzTAFhs8fTsf1fsE0tFPXuMPu259BySPMHry8o4MKcH3TO1p51G7rtz2qOynD2Ews6pw9dwxjkQLEOmIkU/EDxEZwTbSVq+OXK24vu1Uq/GL8HZctJDrLvaZBzpJC6OV1A/F4f86g1fGwqnI98=
Received: from VI1PR0302MB3486.eurprd03.prod.outlook.com
 (2603:10a6:803:1e::32) by AM0PR03MB3554.eurprd03.prod.outlook.com
 (2603:10a6:208:42::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 16:06:28 +0000
Received: from VI1PR0302MB3486.eurprd03.prod.outlook.com
 ([fe80::78bc:f514:ba61:78bf]) by VI1PR0302MB3486.eurprd03.prod.outlook.com
 ([fe80::78bc:f514:ba61:78bf%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 16:06:28 +0000
From: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, Vince Del
 Vecchio <Vince.DelVecchio@mediatek.com>, Richard Henderson
 <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] Revert "target/mips: Deprecate nanoMIPS ISA"
Thread-Topic: [PATCH v2] Revert "target/mips: Deprecate nanoMIPS ISA"
Thread-Index: AQHXLFVcDWm9FQ9LmUmRmYmlgVEYZaqq1qRYgAAXXwCAAHOMAIAQ1IEAgAFlP+Y=
Date: Tue, 20 Apr 2021 16:06:28 +0000
Message-ID: <VI1PR0302MB3486B078E5E08DF7EC15792C9C489@VI1PR0302MB3486.eurprd03.prod.outlook.com>
References: <20210408085810.10567-1-Filip.Vidojevic@Syrmia.com>
 <VI1PR0302MB34862F042D9B1C72C7E4AD239C749@VI1PR0302MB3486.eurprd03.prod.outlook.com>
 <bfe8c0d2-ac10-a302-b364-91df7e0660c1@linaro.org>
 <b858a20e97b74e7b90a94948314d0008@MTKMBS62N2.mediatek.inc>,
 <7c630c72-580f-ab67-be62-aaf01768c5a6@amsat.org>
In-Reply-To: <7c630c72-580f-ab67-be62-aaf01768c5a6@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=syrmia.com;
x-originating-ip: [109.245.39.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d6c828e-ef73-494c-2c9e-08d90416417a
x-ms-traffictypediagnostic: AM0PR03MB3554:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB355453513A07394392FDCCFE9C489@AM0PR03MB3554.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xDHZqxTzyfeQ4tKZ7CKjw76c9f8mCFCWeLweCSLWTfc2ytm9tNICShpA9Alp4m07wTOZSJ/R6ubjoHVAeeHqmjl0WpuJrqmom2nJKJ0sdXIX2o56mw5MB/7OL4lJEyGJwNf0VZALo25eDQ6/fdy6QY7Mc+du3KOV3lcmkfo98KfzPPYDcrIBjWG6eN9G68KL1c2FKES9pOZqU1pt++QblG65BV7Rv0Syx4qzazDoQr/7jrZPZET+JgeoLahq5/ARy17zruh4K9wFCs83v0wEzn3yPTzaeJSN/TZMAryeX9Oy/pTU5GfWA0Zhs9/pS1QRvYjcjta+sikH+9zAQPOH85AlFA1Mx6n/5jLPaZRc8UaSZGw8Mt2qrdz/rtkobN2WY9zCr9saE/oCOiptQuryrxcEzqZz7SPJu4Rzi+eyBtbG6tz/kS2/HTPPXbBjvXrG0uKxAbEX6+7OUripzoMbgryHrYRO4LUHeMIhA9cSt34ALtFQ0WBmDlBHnUkx6FudAuVvxB8Y0/jmnEEOpQUPh5gkdO+XuO7v79KO8GkkCU/fVSza16pk6Pwr7CYStvZkPwJ2N2Wrvost/wNxDTf/ZHT6NMh7PA6QxrOdYP86yT5EFtNxEj/RE92SUL9CNW0T2D0qoHPRKEOaekdtLtlzs2rt8ebkBGpSMGXYFaNWiXc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3486.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(39830400003)(136003)(346002)(478600001)(33656002)(71200400001)(19627405001)(4744005)(52536014)(7696005)(55016002)(38100700002)(316002)(2906002)(86362001)(9686003)(5660300002)(8676002)(110136005)(54906003)(6506007)(66446008)(966005)(107886003)(26005)(64756008)(8936002)(66556008)(66946007)(66476007)(76116006)(122000001)(186003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?y73XE9LZHOWth0M9gvSTdilkrMBR/UyJAeRb5D3kTpcZy48YIyDndD/d11?=
 =?iso-8859-1?Q?aGF5fSvCwA8LQZw/SeKPT1q+gI2Lt3UICLfrqqCX8Fp0mmE+/EkHeXiuY9?=
 =?iso-8859-1?Q?A6fT4XOWLA+b0yosWQTl5s9uUqd2aO+S9M1ojF22/MguJA5EOJZN6e4s9S?=
 =?iso-8859-1?Q?NWyJwD2zuA8XVljxbGzrJx0kGWrkM1McOlFjQoJ4KZhIVW27wqUI7RH9D+?=
 =?iso-8859-1?Q?45oV6WZRVb1Ifq7df2icX6Z2Lv1QxEr3FFTH7RnAn+mDN4FJupVK6DQb/L?=
 =?iso-8859-1?Q?iG7t6A+4ZGkZKuuX2GjcDHefpJFdWIcJygHV736iUUTCu1PGlZI/WAuEer?=
 =?iso-8859-1?Q?YSCzDpLHj6juMazNoF6hWg0lkAVBbZTDhi2cWYb3CU0H+Y0YvHFNwwYqHz?=
 =?iso-8859-1?Q?n185n9xTRck+HEQeh/vKigQEWebu/Knp8Lx7bVQvB5hA3QsnHeNzXLP4y5?=
 =?iso-8859-1?Q?yrus0EBlCMp66f7w/cgIQVD3C7XVMvU5J71CHQduAKXSXtKcC3jC6OmMIz?=
 =?iso-8859-1?Q?9+frgiJTqaJ5xhRf+IfD9eI4/QddI0OElk7QxOCW/DLfdDoM9xBks96ya6?=
 =?iso-8859-1?Q?/YsqtQB930TQ3iNA8zsp19gR28uBNMJyb5YpuFJrOs98L1gv3mLRVvjZ85?=
 =?iso-8859-1?Q?Qp/3yah07CDNHyVtX4ZrpA7JD2toZHX2xkLBGCegES90Q2LQvJ8kKkXAUq?=
 =?iso-8859-1?Q?3LZ/V1tkHQ6EjTdo1IflnrEIXWbBmh/kLDaX+MlaYtMkXYPUz2kWgFjMIO?=
 =?iso-8859-1?Q?4bG2yM/of/FVBhFYVuAsc4lR1hW6T9kVM3nIvQnpb0NWIoPtvYynyV2wDG?=
 =?iso-8859-1?Q?sf+8Td5/K+nvacrrO+9Ye8TljhKRA7u6/ot7W64ZZDLU0gumNhVxYSQ6H7?=
 =?iso-8859-1?Q?NoJOrK9qSoLPKMFf1Os2EV17B/MNWUi0oGonOJIY6OflULw6+XNjyYNSmG?=
 =?iso-8859-1?Q?5qZW+zzlBK8TGeMNqDr7osNa2LZ/ZdiIC/XWtap1US6wS+pOhjWWLrQ0O7?=
 =?iso-8859-1?Q?nZCDyjSDAicJzBIILgjLJZwI/DFkwswZV+4LMLKxGMPeYtWLxwNt4sw3GX?=
 =?iso-8859-1?Q?E3BhiJ5HWbBTVCC+yv8r/Q3UwoL0PmsDQ+SP6+N7g1dOdK7rK5UuRXObvU?=
 =?iso-8859-1?Q?12fBoi/hD2Nb9MMzH2xRwcukvy3XWBz4RsxWoPcuHQp5Wt+dC45Uq/Ot3J?=
 =?iso-8859-1?Q?urtchqIUlkpHt95o4P7TPAF1LG0fhCup6oC8bFMjMvh62PDtl37vDQWl6T?=
 =?iso-8859-1?Q?CvuRzTlb9PCYmtACv9kbf/nm1hEW1IA1k8fMoxk9k/KEvzNtXEP2zSXneL?=
 =?iso-8859-1?Q?WkfDNMkVbjikbzy0uuj4a4hHZMU2bTuIxFNYSg6x6iU03Qo=3D?=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0302MB3486B078E5E08DF7EC15792C9C489VI1PR0302MB3486_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0302MB3486.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6c828e-ef73-494c-2c9e-08d90416417a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 16:06:28.3013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1v5kj/x/TUrvVE5yiiiovEBa3wtSiD2JgZTIYhfYwouBxAwTHXQ5wTAX7T3RwB3dBcTauWs+Vei0OcPRMLAu45luiyf5C/L6eW8DJeE6BCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3554
Received-SPF: pass client-ip=40.107.20.92;
 envelope-from=Aleksandar.Rikalo@syrmia.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 "paulburton@kernel.org" <paulburton@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_VI1PR0302MB3486B078E5E08DF7EC15792C9C489VI1PR0302MB3486_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

> The plan is to drop the nanoMIPS disassembler because it is broken
> since more than 2 years and nobody ever cared to fix it after Stefan's
> attempt in Nov 2018:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg576504.html
> So it is certainly unused. Unused unmaintained code has a cost and
> negative impact to the generic project development.

How do you conclude it is broken ? It seems to work well.
Aleksandar Markovic did few fixes during 2019.

NanoMIPS needs disassembler, like other architectures...

Thank you,
-- Aleksandar


--_000_VI1PR0302MB3486B078E5E08DF7EC15792C9C489VI1PR0302MB3486_
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
<div>Hi Philippe,</div>
<div><br>
</div>
<div>&gt; The plan is to drop the nanoMIPS disassembler because it is broke=
n</div>
<div>&gt; since more than 2 years and nobody ever cared to fix it after Ste=
fan's</div>
<div>&gt; attempt in Nov 2018:</div>
<div>&gt; https://www.mail-archive.com/qemu-devel@nongnu.org/msg576504.html=
</div>
<div>&gt; So it is certainly unused. Unused unmaintained code has a cost an=
d</div>
<div>&gt; negative impact to the generic project development.</div>
<div><br>
</div>
<div>How do you conclude it is broken ? It seems to work well.</div>
<div>Aleksandar Markovic did few fixes during 2019.</div>
<div><br>
</div>
<div>NanoMIPS needs disassembler, like other architectures...</div>
<div><br>
</div>
<div>Thank you,</div>
<div>-- Aleksandar</div>
<br>
</body>
</html>

--_000_VI1PR0302MB3486B078E5E08DF7EC15792C9C489VI1PR0302MB3486_--

