Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B15336ED0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:27:12 +0100 (CET)
Received: from localhost ([::1]:33192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHb5-000853-Gb
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=0703e03c9e=adam.olek@aptiv.com>)
 id 1lJvbe-0001Ka-La
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:58:19 -0500
Received: from mx0a-00275a01.pphosted.com ([148.163.157.133]:53842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=0703e03c9e=adam.olek@aptiv.com>)
 id 1lJvba-0007gz-B0
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:58:17 -0500
Received: from pps.filterd (m0109021.ppops.net [127.0.0.1])
 by mx0a-00275a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A9veVa021072
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 04:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aptiv.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=POD21Dec2019-1-Aptiv;
 bh=nxgOBMNeyzE+i3kWY+8/51MuAz1TnoEuTPZL3G6zI6o=;
 b=phWVORfAbkXU4Gi+ps5PO27uaPgZoPiNIDXfBmHskhcLUPbu7khxpgdFndYQH+N1K57U
 q4iIDld0Hp5UWcMrIoFcZeV0+ce+NsYh8GODtw/QqsF6EuWxXs2UN6BjKBokakkdMeVB
 OnGhRbKZvM4OuaY3/TFOen4iI0IZJYGJC4LLbadnUhAhhH9hQQ1yp+lD/AeX+LXotM1A
 9qvIPOJP7yKMDNG8kDbhUIvMxZ8vZGsKlYmpdmToBuwKTSsHQlcYoSVV1YJhCjPLohUW
 qiu8DhubVPkMssimxA2X4JxRq3TDTWsEBmh4NEVa4oVdsNotvc6SaEOZq7KUhyHMVEHu eg== 
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2054.outbound.protection.outlook.com [104.47.46.54])
 by mx0a-00275a01.pphosted.com with ESMTP id 37479h8tnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 04:58:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrgZCobufOZOq7hmzY4u+K7kDsxaj8RDJ6lDcCTfJGPiRbfL8ZZ0tyf924xRpgN77G38lYVulQlRL3bGwXTwVJyVrgRN4F0mlAM7X9sUufTu2TPEUn7qePSlaJ2gP+udZKxXSpLYCVwerYIlJ0bo8gL4uFtPC6kDE8gfzBz7BW5jZDOs7gJZEtezzYdm2Wkom2S7jH/a+9epbFbBavicqAQhKPMhff1+q1h3Ohbs+ih6sebQm8eVAiZc3cXgeYv95jMGpkSS7tS8ahVOjDyXQPOF2A4btV+PSreflVTMJMq7viSKzhWresLlKNIsI6QxZ6ywHqJlTERjjrKJDOGc4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxgOBMNeyzE+i3kWY+8/51MuAz1TnoEuTPZL3G6zI6o=;
 b=bYTqWrbSyar12DwW8iYP8BSLbk1ml2KYQprd3/rmz/zLougQ62LT2guf2kPWaNT8oU9ZC06pYoWmxlqCfGlGYxuPksSHv9TTaxrfw0m60yPNx7A5r/c9YXPi236QnCUNrBKaQtzq8dCApbixvk1jeRRHHJ+D/EKnQyukEA7nyoKF1E5c5X26rh3WRJqkrxjdRt/diDR2RW1d3i/zdh4rzbe/KjID7grfuubw4EqMXNXLImbe7jLzIEKeb35EMRYtkcs3RORM0LFoxUmIljFuKLJIy/DBs4lZEz7fn5GuiU/Vq8JO9S4qqHfMZ2VK6LYcxQrtDzKtLxeT/Ph23ffTBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aptiv.com; dmarc=pass action=none header.from=aptiv.com;
 dkim=pass header.d=aptiv.com; arc=none
Received: from MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM (2603:10b6:320:4::26) by
 CO1P197MB0005.NAMP197.PROD.OUTLOOK.COM (2603:10b6:110:74::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.27; Wed, 10 Mar 2021 09:58:08 +0000
Received: from MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM
 ([fe80::d8e9:18d6:c62b:1bc6]) by MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM
 ([fe80::d8e9:18d6:c62b:1bc6%12]) with mapi id 15.20.3890.041; Wed, 10 Mar
 2021 09:58:08 +0000
From: "Olek, Adam" <adam.olek@aptiv.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: IMX FEC model- modification in interrupts
Thread-Topic: IMX FEC model- modification in interrupts
Thread-Index: AdcVk33C80J3r2WzTL+ixnVTm1sPZg==
Date: Wed, 10 Mar 2021 09:58:08 +0000
Message-ID: <MWHP197MB00634EEBA13CDF0F980576C5E5919@MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=aptiv.com;
x-originating-ip: [34.103.240.103]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b10b9af-dcf9-401f-c5f5-08d8e3ab01d8
x-ms-traffictypediagnostic: CO1P197MB0005:
x-microsoft-antispam-prvs: <CO1P197MB0005831E7BC6C5FC96F71C71E5919@CO1P197MB0005.NAMP197.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dwdWBQ5k3wYczmI4fFTluXaN1R2GLSOv3EOO/FcVnZML1q0tZKIzA7sCOnVw233BedezxGgpeyT6nWF2XAxIgMtP1DTqdVJmhW7KuPIA0wsQG3FO/x3yTNpiSV8x0kGdjnT4tFcNculOdggWXOSnteEDDK0fT3BPE99P1NmmGPJ4Fwm7xqOvb0ijBFgc53qttjp7eU3PrIcE8OxDW6tVbxR7Vi83P/DF8AWQS7lHqg9z8pCMmoCC98o9264AbOdtnMnsfcMxLYxMwdTvBA09s46LyMGLQWJDGVTbD/qb3yIDw65rniWxiD2dsX63W4X+l4yGbvVs6XnizZm1dO5SecT2rzpZpniHLGV4wQXsbDvZMtRAMI7HQyrxrYzmXOoA132FkIuEQFf05mrsBkB25j0pVaUlj2FjJozlM51drJGQ1CyN9UkSGxBiibnyFreKdC82Sjf9+WirR4urIHih3U099sKQz4pWeSnrHa9R75+SHddh1vgFoUTdDpksXNgX8O1n4uLU+qxJusKPjM103A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(396003)(376002)(346002)(6506007)(71200400001)(7696005)(86362001)(8936002)(26005)(8676002)(66556008)(66476007)(66446008)(66946007)(5660300002)(64756008)(76116006)(2906002)(316002)(186003)(52536014)(33656002)(9686003)(55016002)(478600001)(6916009)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?7VOegHy40DqP1/koIajJ0oNz5X8UlELb+KCvsYb0hLLdAxpD2GfmebF1RMRx?=
 =?us-ascii?Q?CUfKGpgLN9D7aqFKdwbB3ZoSE0c4LvWDn80zBqRIOVpS5C7Qk6ypV2CBjBFs?=
 =?us-ascii?Q?xPdtTJxv6Js26lrXtTj48vNfalajWzylOP6g+DLACuba5Ge65BbQrIfFHbiB?=
 =?us-ascii?Q?hPkf+4/8xtu95Tn25ySQBcMqaxCS1SmOUs5Kozm5h3PNM4xDtCE7IUlJPHbp?=
 =?us-ascii?Q?G82RvKk4NzfIgGtatqSO05F4p3X6oEHWob2OXWGKowr1StpSgrR+gSSswsxT?=
 =?us-ascii?Q?uI4WFMSxppNOZVv2ZzeULQ5GhgrrPKWM2QipPRdkLZBcjC7n1TPJzEtx6ztm?=
 =?us-ascii?Q?CV15PSu8czi7M19nmf722RL6erhRDlAil/mPgstTDyPAIkUeuOPJhvDavQy1?=
 =?us-ascii?Q?eC128M/RtV9/Nv490NIEZk4mIVWFHVnp9+wNDqdaBhlCU0wvtsntqqvb/pNa?=
 =?us-ascii?Q?yHbd9JVDiG/uNc30fnQw9oqlKNas3OjfA2naKvC3awaxdj2qfwvK8z4X+lLA?=
 =?us-ascii?Q?Yl53aul4OhWDdFE4MfqRpJLpxiGOdPyw1U0ZBZacE3CT3Kp7lCCS5bxcl0n5?=
 =?us-ascii?Q?MzgYrF87MxNZIKIHt1KQOdXL7kwzUCUTcy7WhdVkvtbpVNsHIvSg2IqVV9Zf?=
 =?us-ascii?Q?WqUSHl3pezco3lw/N0cMI4aet2WD3k34Y/yr4lIS5RNbT9yH6IzY1IM5avjI?=
 =?us-ascii?Q?JgLz13W3J8AkwvMY5cIV5SxOWGICAVPNo/zFLvPuUH/QEIyjFcOSJPK/tFpZ?=
 =?us-ascii?Q?9OU0euEh9PGL/R9pUic08q9zeVziCVyiP0BW7e/ZNlJq6GW2Waus3TnRq/au?=
 =?us-ascii?Q?qyXJaIP/8Tyf7jAQwvxTZiarGjzhMA0uZ8Jjp1dmfXr+1MVw6QcJYWkgBMYU?=
 =?us-ascii?Q?PbTFACgHpa91gDqz72Yb8njNi4RhuBgF3odxCuG327+DflfflA4H4biQYsAN?=
 =?us-ascii?Q?6XPX5cADeKRyARxXsNHUw+XcM+0YA4JWm7YXTob2Sn0t8JT3AbfTLLaGMhxa?=
 =?us-ascii?Q?XFj1+5InRJPjJp7K/OvdyJhCLOSAdf0KR0Bnwxi3qAQD8vAuFpmm9F06lF7h?=
 =?us-ascii?Q?A4d8vOdyItVmyfOFUOkgpF1zj5r08x04s8dAXTbe/UIWk+rCZv/1akUWg2h0?=
 =?us-ascii?Q?czzOe01u92etNmzr+PPPcbRMGNDu1bcYLR0lKMVIZwTDxT2LZiDtLsio4Vcx?=
 =?us-ascii?Q?iGs8fxdNU7ekaqB3yf3voQnsYMVB1NNq9Wmugi1gnP1IY+k2HcoPbUdePWnT?=
 =?us-ascii?Q?LirOCz088WJZ4wy6GC8DcWgqmqnRFPZSCrxWapGJ3L8VkR+3+8xDWT3TwPDj?=
 =?us-ascii?Q?Ggo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MWHP197MB00634EEBA13CDF0F980576C5E5919MWHP197MB0063NAMP_"
MIME-Version: 1.0
X-OriginatorOrg: aptiv.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHP197MB0063.NAMP197.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b10b9af-dcf9-401f-c5f5-08d8e3ab01d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 09:58:08.1982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6b1311e5-123f-49db-acdf-8847c2d00bed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /dupWzLXJ4HYufaBlI6bC3W8KDwLznUASszy7BPyAzBtTfuu0mC5RAhhaULgLo0HYMEtmaxF9YsAf+RjvVACqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1P197MB0005
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_07:2021-03-10,
 2021-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=431 clxscore=1011
 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103100046
Received-SPF: pass client-ip=148.163.157.133;
 envelope-from=prvs=0703e03c9e=adam.olek@aptiv.com;
 helo=mx0a-00275a01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 04:24:41 -0500
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

--_000_MWHP197MB00634EEBA13CDF0F980576C5E5919MWHP197MB0063NAMP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear QEMU Team,
We have tried to up and running QNX 7.0 on QEMU 5.2.0 Sabrelite model. The =
QNX reach the prompt and was responsive to user command.
However, starting the network caused a QNX freeze. After debugging the prob=
lem at QNX and QEMU sites we end up with a solution which requires a slight=
 QEMU source code modification.
It seem that the hw/net/imx_fec.c is source of the problem. To fix the issu=
e we changed the condition in line 442 from:
if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] &
     (ENET_INT_MAC | ENET_INT_TS_TIMER)) {
to:
if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] & ENET_INT_TS_TIMER) {
Without this modification the PTP (Precise Time Protocol, 1588 IRQ) interru=
pt was generated each time any of the network interrupts occurred.
This was making QNX freeze when ifconfig has been called, because QNX was f=
looded by PTP interrupts that haven't occurred.
With this modification QEMU will generate PTP interrupt when it actually oc=
curs. Just to cross check, this modification does not impact the Linux perf=
ormance in any way.
Can anyone take a closer look at this condition and confirm that this modif=
ication make sense and it hasn't negative impact on anything else?
Regards,
Adam Olek
Senior Software Engineer
APTIV

--_000_MWHP197MB00634EEBA13CDF0F980576C5E5919MWHP197MB0063NAMP_
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
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML - wst\0119pnie sformatowany Znak";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.Stylwiadomocie-mail17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTML-wstpniesformatowanyZnak
	{mso-style-name:"HTML - wst\0119pnie sformatowany Znak";
	mso-style-priority:99;
	mso-style-link:"HTML - wst\0119pnie sformatowany";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"PL" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"background:white"><span lang=3D"EN-US" styl=
e=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#17=
2B4D">Dear QEMU Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt;background:white"><span la=
ng=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#172B4D">We have tried to up and running QNX 7.0 on QEMU 5.2.=
0 Sabrelite model.&nbsp;The QNX reach the prompt and was
 responsive to user command.<br>
However, starting the network caused a QNX freeze.&nbsp;After debugging the=
 problem at QNX and QEMU sites we end up with a solution which requires a s=
light QEMU source code modification.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt;background:white"><span la=
ng=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#172B4D">It seem that the&nbsp;<b>hw/net/imx_fec.c</b>&nbsp;i=
s source of the problem. To fix the issue we changed the condition
 in line&nbsp;<b>442</b>&nbsp;from:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt;background:white"><span la=
ng=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Courier New&quot;;=
color:#172B4D">if (s-&gt;regs[ENET_EIR] &amp; s-&gt;regs[ENET_EIMR] &amp;
<br>
&nbsp; &nbsp; &nbsp;(ENET_INT_MAC | ENET_INT_TS_TIMER))&nbsp;{<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt;background:white"><span la=
ng=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#172B4D">to:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt;background:white"><span la=
ng=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Courier New&quot;;=
color:#172B4D">if (s-&gt;regs[ENET_EIR] &amp; s-&gt;regs[ENET_EIMR] &amp; E=
NET_INT_TS_TIMER)&nbsp;{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt;background:white"><span la=
ng=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#172B4D">Without this modification the PTP (Precise Time Prot=
ocol, 1588 IRQ) interrupt was generated each time
 any of the network interrupts occurred.<br>
This was making QNX freeze when ifconfig has been called, because QNX was f=
looded by PTP interrupts that haven't occurred.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt;background:white"><span la=
ng=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#172B4D">With this modification QEMU will generate PTP interr=
upt when it actually occurs.&nbsp;Just to cross check,
 this modification does not impact the Linux performance in any way.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt;background:white"><span la=
ng=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#172B4D">Can anyone take a closer look at this condition and =
confirm that this modification make sense and it hasn&#8217;t
 negative impact on anything else?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-top:7.5pt;background:white"><span la=
ng=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#172B4D">Regards,<br>
Adam Olek<br>
Senior Software Engineer<br>
APTIV<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_MWHP197MB00634EEBA13CDF0F980576C5E5919MWHP197MB0063NAMP_--

