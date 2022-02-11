Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066124B248D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:39:28 +0100 (CET)
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIUGs-00009K-A9
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:39:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nIUCV-0006CW-7G
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:34:59 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:63194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nIUCQ-00043S-LK
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1644579290; x=1645184090;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=9A8fIIwAz2Ul3JWeGT/owAYzo9glr7gQliIJQcyLKL0=;
 b=HTt4gb4aRf+oSqqFoDQTBKe86/N/IeVFZGGzD5PJT1jYszwejp2/Z793
 m1K4pIoEjnhydB9tkNMDhlPN8XjLIMyq7Uxof8VaIMPTw7yRXJ6bOJO0x
 EyTUbGPOVnOqmWxmDeYhyoI+8kJlvfGmG2gNCjwvRl5rJ0b1WMjqX2iTm Y=;
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 11:34:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCR4rHCAYipZ/flwctgfZlNPsEPv9P50go9YyD3C7niZnP1iEY0yUdNRuikEnaiGvkzYe9RgSJX6GIUIZqM/YY2WcXd3Yjf2M/+0yfB1c1OIAT4MGoJBTX3AIQdQxRGIjrBLLwclBSXm93lAEuNMj1q2xSDaFLMAXJ49gcZiqAxSaze6ShSZvHhB1K61TcXAZ7lr/bepDU57l6PsoXkfN9yWRJvBQXysDJD0qzm+szYktM4TaKAPpiB3LE7ahj+m1j0uR9T8xJKuResK62swyLD2rKR4VFqahM5lsFYA6HlwLYwSnSlVd61S9IGge06QTWIb3QCSw0nrtae5sJf5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9A8fIIwAz2Ul3JWeGT/owAYzo9glr7gQliIJQcyLKL0=;
 b=DE3/ilmk4UhVRLzI3JLhy3rkFPDBQK9QxPKtaWtPHK9j+JJnHinuJcuY6wWsUMSjRwrQaPhAfzLflHKqU4jNwUyj72jdIQROCS9IWvXethZdBav/4gVVEWHGxfCLzJrdlh4WnwtNts/XvnXqd/Uki/bWbcVGsw4LTuPU/7pXgUh8AJm+mCgF3/VES8Xaev2rZU9UE4/O0ukgz7mDrdssKaQF9FpwCIDAtzHh8eppXxVoeZjh0RJSlZhPra7rlHVP4EMV0l72Koph/OxRReh2YRJhztSXPKwmlP3X6/EosFNtk3+KXKls+L0IIP3dcAx4uMXhFaUjc+qM50y6jsE5rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA0PR02MB7434.namprd02.prod.outlook.com
 (2603:10b6:806:e5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 11:34:43 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10%9]) with mapi id 15.20.4951.014; Fri, 11 Feb 2022
 11:34:43 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PULL 00/12] Hexagon (target/hexagon) queue
Thread-Topic: [PULL 00/12] Hexagon (target/hexagon) queue
Thread-Index: AQHYHzkBtbhkjxXElUu8qxU9rpyZ6qyON9jt
Date: Fri, 11 Feb 2022 11:34:43 +0000
Message-ID: <SN4PR0201MB8808CDEC2DE881C440E0D5AFDE309@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220211111722.31036-1-tsimpson@quicinc.com>
In-Reply-To: <20220211111722.31036-1-tsimpson@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef4f9c30-c153-43d5-b685-08d9ed527fa3
x-ms-traffictypediagnostic: SA0PR02MB7434:EE_
x-microsoft-antispam-prvs: <SA0PR02MB74345663BC3350D7981B65E1DE309@SA0PR02MB7434.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XEn1fGBOWyDgML3HV3DozWumrgtF9ZVaEzHcGbsr9GFxpqjXQHy9dT35Ox/6sTOQcfVBZyl1N7LyXgwvyMtCuCsL3XyZVi5gXmh3OkS/Q8EvWHbkZwxdfFMi+Tf3FikUDRI1QavhUabS7OJX3HekRdtsb2KtnjvaFD19T4kuPoZwtP7YX48RLh2Fv4BHWmrizCFp3w8No9yvk+P983OiVHLB0c2bAHJQMlKHZOnSlQQ1NDw3On8OGyEPZAw6kjNA13i1AMGlc6Dwsfzywsi8V5vuX8Yfra8LIxehsDHOfsE/qDityV6EsWWywoKd5HmnsSorMxcXZJ2ZK7KQMmtQr0CgW/sfvMtIVEo25+SfEwR8VdALUD6zcHER1F9ks914P8T9G3mR7URJLluL3+dZEZk0j/G7Z4gmaf+RnH04Ulqe39+HxnE3DoiYyQ4mJLoN+tTxgYlektpHUtth7Gi8YV4hFx3BzQfCNd3YyPsZf+SGiy+wiurbnRsSeh/lH5ek+xu9ECJrlnSP9u0OW8gTgnWPDGwTKi4l7oFoejD2FQKZxHf5/GZ/iY4E/IfULd1LUWQTr3QUl3vi1hCTpZ+OTVxFaFMqL32qCRomdW5Hk2NZbtZGdOKnfWZzdeAlCE5682wQqK14/E5Jv3+8qaY9UPPeE6h/eGvNTlDMw0iqpR+A4bTdtrAqaHVInTyF2VCag+0+md6utn1mNQ+5c8cr8FkmAkQmv0X4w1k4FEzrCVxhN1vantJdrwHhC+jbChMkREWqk0puErtlGv9dEhOiiaCpKg5jjR4TYXYHK1uGiFY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(53546011)(66556008)(66946007)(8676002)(76116006)(54906003)(66446008)(52536014)(7696005)(316002)(9686003)(5660300002)(83380400001)(55016003)(508600001)(33656002)(4326008)(66476007)(6916009)(64756008)(966005)(86362001)(8936002)(186003)(122000001)(38070700005)(71200400001)(2906002)(38100700002)(166002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RJ1DQAfCBRLXDa7vITdqxy69HAC0sYagMXZ5EmAwyu2zRGJbV+5m19JktYq5?=
 =?us-ascii?Q?Ip1L9YVpAgUMxZJqVn1/ppBJWvwnGfoc/KjCxdOH5NSD/B7nE5ZvpEaVarmY?=
 =?us-ascii?Q?XCjM7qi6HIfacZZuZZdhl9COh1dmd6P9EabI9BQpJ6iD59ZZoC6gmIEtiPLX?=
 =?us-ascii?Q?HFdWJvmGJPFpW4XSGY5EIBgDs4PNT+GQ88XOFGt3vllIsnlQS33E1BXqOVC/?=
 =?us-ascii?Q?7+u5LFlN4T70rYRYPMg2NaPzxMSX1hMiD/O+9GHySJcrnp5wYGDsEuSseysW?=
 =?us-ascii?Q?87vrclPMlPJnNYqvF8Uuj73UkX2SGTICLFQ64M48puZez6SXy5gDEuAX39eW?=
 =?us-ascii?Q?B7NdS8wkid3S2nPIRFrbuVe7hTvwKXkt7MvlEbvsKBHCXRGMVqtR8IwCcw60?=
 =?us-ascii?Q?Nwy1LcRr03Sro/OHgNlhqGuSYZzS0t6uQWpl/mPWBjB/UVWaOzccw8PzTSBk?=
 =?us-ascii?Q?Yui0k4iBDAnM5aj+dj+JM8Rwjluq4/fZbQvfjbOw++1cGmAL/WojSB85vSnN?=
 =?us-ascii?Q?5EZX/4X5vGG/lJya79BsZj+U0UuA77aaSOThU6+QwcwXf3iYf7LCST2j20aR?=
 =?us-ascii?Q?PARxzQmBHftJW2LUweln6BoIDo/TPxgydWC98YM6/bdGRBCMorvqc3e8rCcN?=
 =?us-ascii?Q?CHT2zgyLC0qjOPDcoS/q7a2DkQxiXns62ehK5FpRmyEklcmcYaJMlABNzDqz?=
 =?us-ascii?Q?SbIAP6UK3HsrX3BgxjI30cFh37qYh/83HRci0Ly1DUzSZRQmg7WPLEp/v7U0?=
 =?us-ascii?Q?dXXVDWbpt4fe5a0BO1Y4iRqOkz2YM7I6mVz5y27HN1fE/6Ies7JgQo1sTc0g?=
 =?us-ascii?Q?FgMyQKYrgjY+6CdTKql7L0Ffxab/q0Q4JqDy0l728phsxRjgzBHA7TNHNuD1?=
 =?us-ascii?Q?ES6YS774IRcRek+jcLSwXp/naeQvxGHDErZW3s89Akh+Ux1jT5rfr9TDLSLu?=
 =?us-ascii?Q?/SefEewdNlqto+OOUXuotj3bRXVIRpAUo6ZpJH1vprdku106n6X7TgpOvi+A?=
 =?us-ascii?Q?x7Qgj2oCRXEFjPI/SWWxag4pN6xEreWWT2VgJQOifCe76SX2ccQawI1n/Wdl?=
 =?us-ascii?Q?z7yaPj5EvBGiiCNNAklUUFxYZIU/yNegqLY6K7u4P9/C/2VxzOuGbwi68wf/?=
 =?us-ascii?Q?qXDt88bnbYSkZo18vM0qJEXkm7BSVT5zBxav2LNIQ6Q4lnQn/d8OXqXVrYiz?=
 =?us-ascii?Q?XvcHomCypgLvfov2MHOg3G7hWw7RiSYZWZZ6tC8Mgx6EWHpIPIqbCigYEtxm?=
 =?us-ascii?Q?UYcb/LnZdbfzNoQFsMa4Phuoh8nnLVrh1mug8UHBr8G3wJ3P2qAQysfN0aoQ?=
 =?us-ascii?Q?oFs14lNMm60Y8cHbKUmf6qNSx9usmbIHmI65z8OfhPOuLGQbAVrCH87BYvzT?=
 =?us-ascii?Q?XJhngMjSpVxwem0TFjTyyAaI5srAjiEj7I5FDeAldSKJBbHjIXNS7Rvl0c/N?=
 =?us-ascii?Q?C/mr4ko8Za6b76Vlw3680z63wBlahekdZ74RuccHDf8EEkhwHLzGvZHlAe4D?=
 =?us-ascii?Q?9rgiuvxWdvE2OnGaqe5+Jnd+n2jRVkQ+cya5+UceNvu1YbjhslXfK5eRERp4?=
 =?us-ascii?Q?uP6dKfBLvHGo6U+CDk5bZkDupT9qfGAUK1h2/U0jfjnwMQRUS5+o6+IScM4q?=
 =?us-ascii?Q?pb70PQuKa3h8z479tVKlvA9+wbJYU8nGAGUfp98arTKs?=
Content-Type: multipart/alternative;
 boundary="_000_SN4PR0201MB8808CDEC2DE881C440E0D5AFDE309SN4PR0201MB8808_"
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4f9c30-c153-43d5-b685-08d9ed527fa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 11:34:43.3219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BAkCdpeYykc/mR4e5OkVy+mv89Yg3ZTgChXKkoKzdQjcy1EpkTOgkni/d6frK4DZFic3PUaCuL4qOwlQQau2Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7434
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "zongyuan.li@smartx.com" <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_SN4PR0201MB8808CDEC2DE881C440E0D5AFDE309SN4PR0201MB8808_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please disregard.

I pulled 2 patches that haven't been reviewed but realized they are needed =
for the new test case to pass.

My apologies,
Taylor

________________________________
From: Taylor Simpson <tsimpson@quicinc.com>
Sent: Friday, February 11, 2022 5:17:10 AM
To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Cc: Taylor Simpson <tsimpson@quicinc.com>; richard.henderson@linaro.org <ri=
chard.henderson@linaro.org>; f4bug@amsat.org <f4bug@amsat.org>; peter.mayde=
ll@linaro.org <peter.maydell@linaro.org>; zongyuan.li@smartx.com <zongyuan.=
li@smartx.com>
Subject: [PULL 00/12] Hexagon (target/hexagon) queue

The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af=
:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220=
208' into staging (2022-02-08 11:40:08 +0000)

are available in the Git repository at:

  https://github.com/quic/qemu tags/pull-hex-20220211

for you to fetch changes up to effdede7a4b04cacea14618010ccc7775bb19196:

  target/hexagon: remove unused variable (2022-02-11 02:17:54 -0800)

----------------------------------------------------------------
Hexagon bug fixes and additional tests

Also includes a patch from Zongyuan Li <zongyuan.li@smartx.com>
to remove an unused variable

----------------------------------------------------------------
Michael Lambert (1):
      Hexagon (target/hexagon) fix bug in circular addressing

Taylor Simpson (10):
      Hexagon HVX (target/hexagon) fix bug in HVX saturate instructions
      Hexagon (target/hexagon) properly set FPINVF bit in sfcmp.uo and dfcm=
p.uo
      Hexagon (target/hexagon) properly handle denorm in arch_sf_recip_comm=
on
      Hexagon (tests/tcg/hexagon) test instructions that might set bits in =
USR
      Hexagon (tests/tcg/hexagon) add floating point instructions to usr.c
      Hexagon (tests/tcg/hexagon) update overflow test
      Hexagon (tests/tcg/hexagon) fix inline asm in preg_alias.c
      Hexagon (target/hexagon) fix bug in conv_df2uw_chop
      Hexagon (target/hexagon) assignment to c4 should wait until packet co=
mmit
      Hexagon (target/hexagon) convert to OBJECT_DECLARE_TYPE

Zongyuan Li (1):
      target/hexagon: remove unused variable

 target/hexagon/cpu.h              |    9 +-
 target/hexagon/fma_emu.h          |    6 +-
 target/hexagon/macros.h           |    4 +-
 target/hexagon/mmvec/macros.h     |    4 -
 target/hexagon/arch.c             |    6 +-
 target/hexagon/genptr.c           |   14 +-
 target/hexagon/op_helper.c        |   14 +-
 tests/tcg/hexagon/circ.c          |    5 +-
 tests/tcg/hexagon/fpstuff.c       |   44 +-
 tests/tcg/hexagon/hvx_misc.c      |   71 ++-
 tests/tcg/hexagon/overflow.c      |   61 +-
 tests/tcg/hexagon/preg_alias.c    |   84 ++-
 tests/tcg/hexagon/usr.c           | 1141 +++++++++++++++++++++++++++++++++=
++++
 tests/tcg/hexagon/Makefile.target |    8 +-
 14 files changed, 1409 insertions(+), 62 deletions(-)
 create mode 100644 tests/tcg/hexagon/usr.c

--_000_SN4PR0201MB8808CDEC2DE881C440E0D5AFDE309SN4PR0201MB8808_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto" style=3D"color: rgb(33, 33, 33); background-color: rgb(25=
5, 255, 255);">
Please disre<span>gard.</span></div>
<div dir=3D"auto" style=3D"color: rgb(33, 33, 33); background-color: rgb(25=
5, 255, 255);">
<span><br>
</span></div>
<div dir=3D"auto" style=3D"color: rgb(33, 33, 33); background-color: rgb(25=
5, 255, 255);">
<span>I pulled 2 patches that haven't been reviewed but realized they are n=
eeded for the new test case to pass.<span></span></span></div>
<div dir=3D"auto" style=3D"color: rgb(33, 33, 33); background-color: rgb(25=
5, 255, 255);">
<span><br>
</span></div>
<div dir=3D"auto" style=3D"color: rgb(33, 33, 33); background-color: rgb(25=
5, 255, 255);">
<span>My apologies,<span></span></span></div>
<div dir=3D"auto" style=3D"color: rgb(33, 33, 33); background-color: rgb(25=
5, 255, 255);">
<span>Taylor<span></span></span></div>
<div dir=3D"auto" style=3D"color: rgb(33, 33, 33); background-color: rgb(25=
5, 255, 255);">
<span><br>
</span></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Taylor Simpson &lt;ts=
impson@quicinc.com&gt;<br>
<b>Sent:</b> Friday, February 11, 2022 5:17:10 AM<br>
<b>To:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Cc:</b> Taylor Simpson &lt;tsimpson@quicinc.com&gt;; richard.henderson@l=
inaro.org &lt;richard.henderson@linaro.org&gt;; f4bug@amsat.org &lt;f4bug@a=
msat.org&gt;; peter.maydell@linaro.org &lt;peter.maydell@linaro.org&gt;; zo=
ngyuan.li@smartx.com &lt;zongyuan.li@smartx.com&gt;<br>
<b>Subject:</b> [PULL 00/12] Hexagon (target/hexagon) queue</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The following changes since commit 0a301624c2f4ced=
3331ffd5bce85b4274fe132af:<br>
<br>
&nbsp; Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-=
20220208' into staging (2022-02-08 11:40:08 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
&nbsp; <a href=3D"https://github.com/quic/qemu">https://github.com/quic/qem=
u</a> tags/pull-hex-20220211<br>
<br>
for you to fetch changes up to effdede7a4b04cacea14618010ccc7775bb19196:<br=
>
<br>
&nbsp; target/hexagon: remove unused variable (2022-02-11 02:17:54 -0800)<b=
r>
<br>
----------------------------------------------------------------<br>
Hexagon bug fixes and additional tests<br>
<br>
Also includes a patch from Zongyuan Li &lt;zongyuan.li@smartx.com&gt;<br>
to remove an unused variable<br>
<br>
----------------------------------------------------------------<br>
Michael Lambert (1):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hexagon (target/hexagon) fix bug in circular=
 addressing<br>
<br>
Taylor Simpson (10):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hexagon HVX (target/hexagon) fix bug in HVX =
saturate instructions<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hexagon (target/hexagon) properly set FPINVF=
 bit in sfcmp.uo and dfcmp.uo<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hexagon (target/hexagon) properly handle den=
orm in arch_sf_recip_common<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hexagon (tests/tcg/hexagon) test instruction=
s that might set bits in USR<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hexagon (tests/tcg/hexagon) add floating poi=
nt instructions to usr.c<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hexagon (tests/tcg/hexagon) update overflow =
test<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hexagon (tests/tcg/hexagon) fix inline asm i=
n preg_alias.c<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hexagon (target/hexagon) fix bug in conv_df2=
uw_chop<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hexagon (target/hexagon) assignment to c4 sh=
ould wait until packet commit<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hexagon (target/hexagon) convert to OBJECT_D=
ECLARE_TYPE<br>
<br>
Zongyuan Li (1):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; target/hexagon: remove unused variable<br>
<br>
&nbsp;target/hexagon/cpu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 9 +-<br>
&nbsp;target/hexagon/fma_emu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp; 6 +-<br>
&nbsp;target/hexagon/macros.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 4 +-<br>
&nbsp;target/hexagon/mmvec/macros.h&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&n=
bsp; 4 -<br>
&nbsp;target/hexagon/arch.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 6 +-<br>
&nbsp;target/hexagon/genptr.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; |&nbsp;&nbsp; 14 +-<br>
&nbsp;target/hexagon/op_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp; 14 +-<br>
&nbsp;tests/tcg/hexagon/circ.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp;&nbsp; 5 +-<br>
&nbsp;tests/tcg/hexagon/fpstuff.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p;&nbsp; 44 +-<br>
&nbsp;tests/tcg/hexagon/hvx_misc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nb=
sp; 71 ++-<br>
&nbsp;tests/tcg/hexagon/overflow.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nb=
sp; 61 +-<br>
&nbsp;tests/tcg/hexagon/preg_alias.c&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 84 ++-=
<br>
&nbsp;tests/tcg/hexagon/usr.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | 1141 +++++++++++++++++++++++++++++++++++++<br>
&nbsp;tests/tcg/hexagon/Makefile.target |&nbsp;&nbsp;&nbsp; 8 +-<br>
&nbsp;14 files changed, 1409 insertions(+), 62 deletions(-)<br>
&nbsp;create mode 100644 tests/tcg/hexagon/usr.c<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN4PR0201MB8808CDEC2DE881C440E0D5AFDE309SN4PR0201MB8808_--

