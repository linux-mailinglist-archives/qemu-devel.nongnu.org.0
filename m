Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D83E4C340C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 18:52:33 +0100 (CET)
Received: from localhost ([::1]:48242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNII4-0001Uw-8Q
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 12:52:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1nNIFD-0007BA-L1
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:49:35 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:12542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1nNIFA-0002xe-Li
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:49:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1645724972; x=1646329772;
 h=from:to:subject:date:message-id:mime-version;
 bh=RzsluLvefCyV7cP65NZ59hhdAUPWT9RHF4RUE2GNpuc=;
 b=vasGKxpPwh/mTGg6BvEmon1gzFlujL7vQOKrEpW8ndi/OICmzVDWkwuo
 EYGEPJjpRQ0ZwpCKGd4btuiL655InfVUkpBzbN42+mnE+fz3B5zHXhSUI
 Eqtmw6LP5Ydaxq4fxOMDzVAJ9luQ5C+CPEWmZxehBAXHBwPp8OqjXRyC+ Q=;
Received: from mail-sn1anam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 17:49:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yc8LcwCNT3FdvWhyt98mOqVmzIOWKC5deHnbM/4xMdROgmeAznpG9q1aOQRM30Y0x/b28TgyxRp5tUT0tXRgKUYL0Q+HaIWAamB8DtuQ+i0aHOCSScOWHsX016VR2pplOE16lw/d7cl6okyAGPk8HZ77Ap2FiMM0i7EoFQm9YIShl4j2Yv0smW4TqLw4MkPnpadyfTIMdkxiqEH532hzq7KE467zmKmIcCOmPWC1oMEZ5PYLDJS9JBIElxjrJp3XXWvt4XpJIqCO+3xyunWJzulyS72tW527h2AwB4lTkyx8FOUj2MxIeADu84EsXxCLx6F48Xq5ejBJiqRW2HyVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzsluLvefCyV7cP65NZ59hhdAUPWT9RHF4RUE2GNpuc=;
 b=dNKdtrN1ulyyqBVPJx30ZA8CybNrVZnQ8TSFVSgwrfdwKlk5meJSUpx82aUzoV1zUuIygwRvsni1wHkMH039725ovice8iSf7UZOR2gyqLFGNPJjSxNcn2H0/LyTOvtEAaxXR8DnObgZdSWAcjqjzzzIuVnPKX7PcOL6atx1BxttBK99mPV1RZcUlNHbuUZS26bZSBzkXvo9X2SsBNq12qX2YW/epatXdS8nfCz3WJBajQWU//S2tcrlGaqR6cqq7r3oIdBn1VhdrxafLlYhtZq7NX28Q1Bb0PygQvxrWO/ebuN3h5KcHXIb8S4IO9NkqXoMGA91IVW64eg0g9iUEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by BL3PR02MB8115.namprd02.prod.outlook.com (2603:10b6:208:35e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 17:49:26 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::98ec:4683:f30d:804f]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::98ec:4683:f30d:804f%5]) with mapi id 15.20.4995.028; Thu, 24 Feb 2022
 17:49:26 +0000
From: Brian Cain <bcain@quicinc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [ Job Ad ] Qualcomm hiring developers to work on QEMU
Thread-Topic: [ Job Ad ] Qualcomm hiring developers to work on QEMU
Thread-Index: AdgppmD4I6snQBFjSB6jcwITsqbHHg==
Date: Thu, 24 Feb 2022 17:49:26 +0000
Message-ID: <SN6PR02MB42051534457B0D8568470B9EB83D9@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b9a92da-f30e-4645-8e3b-08d9f7bdfff6
x-ms-traffictypediagnostic: BL3PR02MB8115:EE_
x-microsoft-antispam-prvs: <BL3PR02MB8115C19DBC899BB1A190A958B83D9@BL3PR02MB8115.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eJ19UMe5v1xH3Itffsuu0PZOaWQn7ckQTnh7vIpWI+YoqUvei6rcmf7W1AM+8niidlRfU3RydnWWeUahaODNskuye0uBIrioyv3ktqd0gYp/Q5WCInkrCRjGSdN7TBUvLPM8RBvG+C921o3mTTp5eIM6sjjHq/4dgEmr1xfIxDoYfH8CsNSTOz/TCfJWc4TwaOL67+cfktDOrIxGFd7HUI8VVc5+mhkH/6VriGIy4lY/g7mQEkIes34mfcsymRsm3rym6WcnMCPhnDCxeWxJOyYTA7WFXrtsv+Cd5bF6emA4F5eq9AFtwDYIYCb7xwygpR1SEejzCadispiPBKrfd4EwIMfA8YvNJn4TE+3uRoGudOhtjviXnvtSImSsqFp+QvQ9HVeLAMMurQBNf4LRv5z82UtBHdWRNlJfYybiEF8f78KDsJLNMhhz+HJLgQKn0ZFolJLj/8hZjf4Pyv9kDUWkwyWEmrAodpcCHr4YVKU0dSUeJ4ASMBn8j2RvdWhZVWxVaVxH4MHm4SmKyrPBsL78Hg2Rvoy4vEiQ9U7XeLo44lX8nXrPTAew3aPfIl9DYL80s3zXqqE2bHuXk7Nw9scUHjMJRRNxKmlebPZ1kk9f9q6m6g+q84YE9b1AuE3VIRQmEcU5ZMUJY3b5WfJEO6BSgw8qxCSUix/HAt5yA64GqR89HIuGAPPI1afY/8PAwqsoq3KzHKtWtW422GY2sjeAmV5FYBAS3FKjDZVJeX1DrPvbo/26CW1zSZPc6g+UySXS95RmheQMpqxinIaeZXsI6W7GkMBHl2/gTQnBJ+k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(66446008)(66476007)(66556008)(66946007)(316002)(122000001)(76116006)(38070700005)(166002)(64756008)(6916009)(86362001)(2906002)(33656002)(8676002)(4744005)(5660300002)(8936002)(52536014)(55016003)(6506007)(186003)(7696005)(38100700002)(9686003)(71200400001)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tkLJnvybFvR6J+DvsXOhkp1DB59xgtsqtm0Gnb3wwf0KL3q6a6FsBR3tY3FE?=
 =?us-ascii?Q?dVezgB/8ZFTlazmhC9h0oRa6PIpl9c6uC02p/4wXXzdjdTgaxOhmXdNFKwkz?=
 =?us-ascii?Q?uyyHoo7QTrBF3rczdsVhOY88mNYFpEAO1kIDV1qxpnz+MPtlDRFdJnfrjast?=
 =?us-ascii?Q?JSCZsa9HUUJZNZ5BSv3MFkHPUQGERWBvN95PmNSzAT5oxqM3sdbVMJsWCeH+?=
 =?us-ascii?Q?9XgaN0aWCNlWpIY3NjneNWz6ATd+1Ra5jRhG89aldB1P8FWNHjSUS/kG6Y02?=
 =?us-ascii?Q?Q2Ft51I+JPwHVM/uighnNpU9Ez0palEq4xz9tzq1Lrrv69zsHG1ZDLrtqRhT?=
 =?us-ascii?Q?eLYMFoc94QUUWEcIoHSBFEHy7z+FijlbTf66Svn2byo62NiVoLi01B56H4em?=
 =?us-ascii?Q?X1stgQE5wNEG2RJrCHUXcj7eU9dqGOce7AMdkD4kTQRJGTD4LPIF9IfT1SXR?=
 =?us-ascii?Q?ZwDoF2dHBCO+2yRDg7rNoXqujhM5VfvGOv4VIF9QPFih1bMR6aifTgdQbiJx?=
 =?us-ascii?Q?7n4/ts533D1K8zzMUQtYgJuR3qEWKANQoWTzlK4Iil98Vq1CzmG10L5YjE7s?=
 =?us-ascii?Q?GBkkBRATqPILYQXiK/p7HaSMHvXudyAitQcB0i2igi91xkchxiiCZ4wHGLa1?=
 =?us-ascii?Q?zakPurtnX6ntT3jZgOseg1OOjh2gBdPzm+J75MA5BbAAvbnR8pYQfOVTwrNJ?=
 =?us-ascii?Q?8QVH6a9HFdcm1PU2A4UUDQJq/BYDTmhseoPZhHmixGox2+0pptCQ2u8cGrAb?=
 =?us-ascii?Q?4u2C5ahQT1GZY7vxcbbccs7H0zUJnJclI3vD4NwCY/h2GA9st3fS7Mytcn6a?=
 =?us-ascii?Q?fN7jyMxFFk6ieOGQOm+OOt2oP5aGJYYH9IVMcEcyqYBRsrQdv2+32y246RTH?=
 =?us-ascii?Q?PDh7GDd0NWGXLNkIyopa9Y/+MsGrRR4SIRCZhDllC914jpodNBHHTjOmdJh+?=
 =?us-ascii?Q?g0HsI/7E9UodZ1Ue5Oze+0SpYjvqXCYxKOfPLgXGCpIPDeIJMHzcSXqbz5uF?=
 =?us-ascii?Q?px/4sqQx+eudtw5WcOK+mVHkuEx4T1lOmMByhs+gNNCJ+/3hLCA8jtODMHOX?=
 =?us-ascii?Q?xQyOcWjBKKa7cNF+8Y7KksnyMsBcruYo24kMC8hhPzeMVfK0YMPRm9sdvCwI?=
 =?us-ascii?Q?Wmyk0bEZngjDlYbIx0l9Fa9YqkGp7fXtNTedMY7TsWLKyIurhrakeIEj/2nP?=
 =?us-ascii?Q?z87tluK5ZGiGE4orMnPwXEz8BckMQEoIWz/rBihtKamI1rdcZnyhKN84k5Pr?=
 =?us-ascii?Q?LsSAJK+qFOlxHFHkD72R6cRKs9lklOm055AFCgRPGl6MsGK0y4VUG5mioX4p?=
 =?us-ascii?Q?6oI4ps+5GkQOiEutq7JMbn7PcT9Xz1B2AK85pqqRxTInGpwD7LYAxxsHtbEO?=
 =?us-ascii?Q?6HsgYobiMomOaODUvbTgCImIu1uNe0/2deF8W6yIPMuzKL9T/ui8xXG3Ivtp?=
 =?us-ascii?Q?mFTzGsTOYROTFo5xjt7jEf1lZsXKcr749EFW19LgnPCPulUGDgk9oZCxsB9C?=
 =?us-ascii?Q?HddzmHVSh9SyegDahciE4kdlRphRCzi4bK2Pvf/O/lRVac8w9nL9/vLTNko2?=
 =?us-ascii?Q?lZmmHXj3t2vStE7pMLcpW2NtrTxbP1L0AP5uF9LOQ5R61IP1WrQAN/0mLcsS?=
 =?us-ascii?Q?YHR0oYnlfMpolVsAZlmepmIfQ/2A2UPioS7st9Jfg6cg6ImLbkyx6j1+hH49?=
 =?us-ascii?Q?o2O73L/ql4+1y3HXf56gzeso+MM=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR02MB42051534457B0D8568470B9EB83D9SN6PR02MB4205namp_"
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9a92da-f30e-4645-8e3b-08d9f7bdfff6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 17:49:26.4082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S1XozL2/LQFAne95vs1kpcu16VMUOTsxu86G/MDdSYOzYdhdNCl4ks3lbpHF2Cdovnn99T4Kz7pKxo8XrP8FWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8115
Received-SPF: pass client-ip=216.71.142.165; envelope-from=bcain@quicinc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_SN6PR02MB42051534457B0D8568470B9EB83D9SN6PR02MB4205namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

/* moderators - this is a job ad, please discard if it's not permitted by t=
he community */

Qualcomm has openings for developers to help work on QEMU for the Hexagon D=
SP.  If you like QEMU and are interested in challenging work, please apply!

https://qualcomm.wd5.myworkdayjobs.com/External/job/Austin-USA/Senior-Engin=
eer--Software---QEMU-Development_3024633

--_000_SN6PR02MB42051534457B0D8568470B9EB83D9SN6PR02MB4205namp_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
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
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
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
<div class=3D"WordSection1">
<p class=3D"MsoNormal">/* moderators &#8211; this is a job ad, please disca=
rd if it&#8217;s not permitted by the community */<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Qualcomm has openings for developers to help work on=
 QEMU for the Hexagon DSP.&nbsp; If you like QEMU and are interested in cha=
llenging work, please apply!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://qualcomm.wd5.myworkdayjobs.com/Ex=
ternal/job/Austin-USA/Senior-Engineer--Software---QEMU-Development_3024633"=
>https://qualcomm.wd5.myworkdayjobs.com/External/job/Austin-USA/Senior-Engi=
neer--Software---QEMU-Development_3024633</a><o:p></o:p></p>
</div>
</body>
</html>

--_000_SN6PR02MB42051534457B0D8568470B9EB83D9SN6PR02MB4205namp_--

