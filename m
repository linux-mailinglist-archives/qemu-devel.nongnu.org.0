Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EA35703D6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 15:07:32 +0200 (CEST)
Received: from localhost ([::1]:39388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAt8L-0006vl-1U
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 09:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <JL25131@jp.ibm.com>)
 id 1oAnbo-0004H6-Lm
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:13:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55172
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <JL25131@jp.ibm.com>)
 id 1oAnbm-0006j8-Hi
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:13:32 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26B3Tsvc009598
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=pp1;
 bh=7CD8cGWjo0r6fJODNYYAVisap51cC+VxYS0xNbgepeg=;
 b=UQbqookOKNUV4+IZX9nPmvjMOb2a5V4kZ4RbnHWh9KxD+F4avzu9tR0YNMtFD43AahKl
 oeOvPF5X1z+goLNq47xxHD0D9F0MoVSW5PcR35dXhZozjL9sWGGFfhstf21TFIwLHtSI
 HYDhEynSxlTU0JpdDrEhEXGNCULxyOBx1V1HK8kLOIlokrf8tccVQseXN3KSHmo4P+mu
 Ks7DC8JnY5KESST4A3BccjaCgfsLTSat1LcRaqXSYwbz2JFnGpcw17cIL+fmdFRG7Rfw
 fK9N3gzhheoJyym0KhjKeu3UfSnfT6bJNwyS1Wl14KzKUIL+etZEvDaqh5ErJ3tzgx68 tA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h81rj3tw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:38:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=en290iHE49Xc/AhLzDBURWEycEcVWQgauCeV2DG4x4uCLR0DnHTDu/UrMueytKQUt2ygUIB9RNh5bNuSJzQN41Gc345jYeVxC1dxYMS5uW7XqInD1IWY79nZQEA8MnmOpzcC91+T1AK3OlZs9dxDRiZUsf/FVTTfR01c3hGFRmWz8piKZ/xfF5PeGoldteovKyLt/UFSA5CtnPdGtQbB+1cm0kRMYfrUihA0Bz9unJtEARDokvJuGcB70xv4Go0Qr6lDUsgSPypkO1KzCr9l1YmphWc5lRJ6sPRVDZXdsyqoufjgGgUQy2yndL4PJalWJYkWFDs8ySlTZvrlilwNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CD8cGWjo0r6fJODNYYAVisap51cC+VxYS0xNbgepeg=;
 b=QlXW8Lu+67soLPVaiNJLz0QbFS2Rt1jAIpOd0pompa/dZjAfWc6/lNSuIbknr/Z3lj9Qz3SUjmhmgnaISLyYpIMkCSqNFu78HX1pNafoxa2k/Cq6GVh6wyFNmjAIvuQTbx/TkVRABNDh4a6afQUXq7jWKFEZHUH9+N5fjh0VOQMF79uInkDhFSYeQXcbQonmRayARoH2raTo6iX1i4q7znh2G6bHBr4dF4ykWvjKrgTvcyrMggdvrHbEtNVDsPmi0J4xeRHBUBZbRc8zN9Brvlz2Xw4fDr/3rZI2cAWC1HOxGNsfVT2XIS3tp6l8ei7vvBxdeAYagRDuKbi2r0EA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jp.ibm.com; dmarc=pass action=none header.from=jp.ibm.com;
 dkim=pass header.d=jp.ibm.com; arc=none
Received: from DM6PR15MB2635.namprd15.prod.outlook.com (2603:10b6:5:1a0::31)
 by SN6PR1501MB4127.namprd15.prod.outlook.com (2603:10b6:805:63::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 06:38:14 +0000
Received: from DM6PR15MB2635.namprd15.prod.outlook.com
 ([fe80::7c8a:6d30:d42b:cc30]) by DM6PR15MB2635.namprd15.prod.outlook.com
 ([fe80::7c8a:6d30:d42b:cc30%5]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 06:38:14 +0000
From: Motohiro Kawahito <JL25131@jp.ibm.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Error ret=-1 with EINTR in nbd_connect_systemd_socket_activation()
Thread-Topic: Error ret=-1 with EINTR in
 nbd_connect_systemd_socket_activation()
Thread-Index: AdiU7vCaQmj9UfkITyiCpUFXqQgnsg==
Date: Mon, 11 Jul 2022 06:38:14 +0000
Message-ID: <DM6PR15MB2635A63B1B5F9F204E08BBEED5879@DM6PR15MB2635.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad4314ea-0ea9-44bc-765e-08da6307eeb2
x-ms-traffictypediagnostic: SN6PR1501MB4127:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AUPU0RkVo3SqzOYNuei1Y0BowHwUi8WSQfwbM1azmX2ByfJlETPZbAnkrfdzeSGlo9jLcvQSVpK9fB+X4zLSwN2Kb7hwqBG0sQ75ZJq6qe7pEuNVBnCM1RkaUHlHhQYcin/iyeXkxOKQA374x2xZq/yTzK9QOVcr9m+gsqJBqJK13FQejjfidE6e0mExmeaPh86hmRd4mAs5wsPKlgr2vcPD1hKk8NIwTQtqoZ4A32w0tSTr/AyGZXPz3USoyvTOHjXI/lm2fZH+YC/RCU1PfWBb4mG8cyOfGKGdrdaW3VtE/Zkk4yQ1Ap4flE3AnkHgieCCR2wdhLZsQ/9socRzag13oLmjwS6wE3rivjYl0mUt4JKAAkPf5D9MaEqGbwePIq4QxAkF7IdRuIV/9MPwLAD0Bq+fqTI8hjt909O8csJp0abu3yyAP8vMdnFehVmPOo7n5uD6teQNJvG5q+1JNHMeReH9hcB/c+mldHkMirW3XUDvZVdyjpHUMCw87p0lIcrdbLNzCVWsZkPt9sD7fVXsSDvEE2/8KKmMepFKqnd/gRvnvND9P3hi8iYnc+NGHj2+4Nu9h2x5I5nabpNaePuiRIf7etqzZOgo7DsFlpJpB9umZF2ZfX/kakfDgxxvQBy5zqbaY3eZXIzyjMx6Qg/9MsUoo/ey6wttoStHteVYzCr3qt/WJFtMd1y0mxjfSjCCyNy57CDvW0urAKats8L5/KagWtzjAL0z4V+DqELagWImso67RrBQTgKMISToDU+IqoGNW/SS03COuvoAMoiaoWZjv5SjiQix6sO5F10zQk3/KnnLOQb7gfzgaSfZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR15MB2635.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(366004)(346002)(39860400002)(376002)(33656002)(186003)(76116006)(66556008)(66946007)(7696005)(66476007)(6506007)(9686003)(38100700002)(122000001)(38070700005)(86362001)(55016003)(83380400001)(478600001)(4744005)(52536014)(8936002)(316002)(5660300002)(6916009)(71200400001)(8676002)(64756008)(66446008)(2906002)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JRFgrq0C6KC8tPWPuc3YCWtmhlIuCkOvw9RUJEp1kUvf0C84ddkitIrfVGAn?=
 =?us-ascii?Q?tWrJfmqbi7vAxEmfeyHGTgh4LBcsEVT9tndEVDZAQCXKnaDmOnzevNMKmRiM?=
 =?us-ascii?Q?mZTDkd9yPEXOCFbsJRMsWVfm49JZoEyZmRTCUDX/PKAZDMrQvckyD3qnge50?=
 =?us-ascii?Q?gnQDIJBhlNhFhajwxKqpGEv/e/bl3nOO8TFkcyz5jjOZxDIdMo4bw3I8CnQI?=
 =?us-ascii?Q?OphKQ9yGBUHBKO5cGtgmwaBj3TvUSZ/K568cKHTxuC4hGiGmhsnRG3/G9Dgt?=
 =?us-ascii?Q?Y6zZExYTo/u66k6vh6K7+ugnelQw7iFL8G/PPi+/HHtokEMHKxeiEq2ypLbI?=
 =?us-ascii?Q?RC0WDwxDnjfNiPmLHigvtVa7tVUwBqUNLAyiupDXWDtDkRAj9HIyk2kKKjfQ?=
 =?us-ascii?Q?jz51WnU/AsMRpDSzc84AHsx5I2BaPiUvCtWdKvyJCKr7QO0p6CzLfbry6/Tz?=
 =?us-ascii?Q?38DEi8QXt7gorvkzt5eJD11JV2T8KZVbIQGrB6NnV8HYQ5j3t0iW0NrDcD6e?=
 =?us-ascii?Q?niZkMtM60T2TGOYta2DQnR+C5Q9e0ij9wkqUCBK0yfcBQ6yLVmR+8ODEpyaM?=
 =?us-ascii?Q?7/FI1LWljRCe8jHAdyN4UeUPo9/YC1YRGbQSR+tfvoWqu7etrD0glltrZanW?=
 =?us-ascii?Q?NcVy9MJOGHWWla+6KcjTfjEraOg1DBjBulJeYoXuiflsjPXw3ZJSBs+CKV+g?=
 =?us-ascii?Q?EGfESmZRQMnANpfosPciar9XU+c2bcOU9xv3vGybfWfT9CjL0xWnA77tz06Q?=
 =?us-ascii?Q?8byBtqCm4R/eM/oJS/gpTNlEUSavQlCQjhm89XjlsegOLn0GInhloc+xMysq?=
 =?us-ascii?Q?8wUh9yz9VgAh03vvCDMOxe1z5WggR8A7d+0B2JFLJMVruHuvCz1sXoJdJBRH?=
 =?us-ascii?Q?EVOan3WblXtRS+cTo2Bm3rE/cnVexcLwIOD518J93f21GGcM6Xjn+As79gWs?=
 =?us-ascii?Q?jGAOv9fMo1R89erv8qridxaPUcit8XOTOJ8iPHarAR42NJWh+ZmoP2LRXfej?=
 =?us-ascii?Q?Jj1bFUXhCa8hPEMmseExvNLk+Ti4pUnIjU2HPmWoS/bU0rdlfnbTE6yX6CKf?=
 =?us-ascii?Q?8Vs4hkpanN0WIv+VxpxTTTqQfWuC0UMeCearkKlX3SmSH3Y1WMjucrfKzeUX?=
 =?us-ascii?Q?AEk9CGAQdNcuUVrPLURBenT2x9N2Ob6/UJXRHlngvb2GMQJHQf+d2f2MqGc/?=
 =?us-ascii?Q?JMfP/5t+so+ioaP5fcfw06W/hrHlGGNeYVjQ117twb6xhX7yy/42OcKDMr0m?=
 =?us-ascii?Q?wiflD0QbT+C+grxhtUIms/fFaiADzD5sSCpBnCQ0LBQw/sjLRn/4qhioCerW?=
 =?us-ascii?Q?eK7FngOPUmatVz6FSrE3dQuFaXevgVGrnJ0y0kP4KJoXV/NXNN4k+xLjb0M0?=
 =?us-ascii?Q?ObBZ/W/5LfJB9LIsMeiwSGuQ0q1yRvItzmS1InuciwQ7eCXPb+6FsW6y7fib?=
 =?us-ascii?Q?A3QQj2TCEEnuVzdbe1R/94XVlitYYuaZ4IU4Rr0NzuqERxPLsQqLqrzqwf2q?=
 =?us-ascii?Q?r3cMD75/2vKNPRC0OvApFEP+PS24gVN07TqfkHkHRQzxKyexVNtaS4EYK52J?=
 =?us-ascii?Q?wktI82iOVnmMkUiiZrN3F1c/n/ffSvKi+QTBafNh4Iw8JSUW9+pOv53yZXU4?=
 =?us-ascii?Q?H2qq4s3r/w0cZQQ1EsAwe5Hb2JQupgljRYMMEdeKMrlB?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR15MB2635A63B1B5F9F204E08BBEED5879DM6PR15MB2635namp_"
MIME-Version: 1.0
X-OriginatorOrg: JP.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR15MB2635.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4314ea-0ea9-44bc-765e-08da6307eeb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 06:38:14.6315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TrsRWQaakIo/f5pr46UFuQ35v9ens0NO2U4iGZJkFlLWpNHYevHMRTsMhqCDUukJqX2TwRowWoHuibc56fgG3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR1501MB4127
X-Proofpoint-ORIG-GUID: AypY1zy3JbfGlqPGgHiPp8mJPr5OfDTG
X-Proofpoint-GUID: AypY1zy3JbfGlqPGgHiPp8mJPr5OfDTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-10_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 suspectscore=0 mlxlogscore=742 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1011 mlxscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110027
Received-SPF: pass client-ip=148.163.158.5; envelope-from=JL25131@jp.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--_000_DM6PR15MB2635A63B1B5F9F204E08BBEED5879DM6PR15MB2635namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, I'd like to connect to an encrypted QCOW2 file by nbd_connect_systemd_s=
ocket_activation(), but I got ret=3D-1 with EINTR.
The arg parameter I used is
qemu-nbd --object secret,id=3Dsec0,data=3Dabc123 --image-opts driver=3Dqcow=
2,encrypt.format=3Dluks,encrypt.key-secret=3Dsec0,file.filename=3D/tmp/empt=
y.qcow2

Can you find what a problem is? The version of qemu-nbd is
$ qemu-nbd -V
qemu-nbd 4.2.1 (Debian 1:4.2-3ubuntu6.23)

I created this encrypted QCOW2 image by the following command.
qemu-img create --object secret,id=3Dsec0,data=3Dabc123 -f qcow2 -o encrypt=
.format=3Dluks,encrypt.key-secret=3Dsec0 /tmp/empty.qcow2 8539292672

Note that I can connect to a normal QCOW2 file by this function without any=
 error. (arg: qemu-nbd -f qcow2 /tmp/normal.qcow2)

--_000_DM6PR15MB2635A63B1B5F9F204E08BBEED5879DM6PR15MB2635namp_
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
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0mm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Yu Gothic";}
span.17
	{mso-style-type:personal-compose;
	font-family:"Yu Gothic";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Yu Gothic";}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:99.25pt 30.0mm 30.0mm 30.0mm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026">
<v:textbox inset=3D"5.85pt,.7pt,5.85pt,.7pt" />
</o:shapedefaults></xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"JA" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Hi, =
I&#8217;d like to connect to an encrypted QCOW2 file by nbd_connect_systemd=
_socket_activation(), but I got ret=3D-1 with EINTR.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">The =
arg parameter I used is<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:5.5pt"><span lang=3D"EN-US" sty=
le=3D"font-size:11.0pt">qemu-nbd --object secret,id=3Dsec0,data=3Dabc123 --=
image-opts driver=3Dqcow2,encrypt.format=3Dluks,encrypt.key-secret=3Dsec0,f=
ile.filename=3D/tmp/empty.qcow2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Can =
you find what a problem is? The version of qemu-nbd is<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">$ qe=
mu-nbd -V<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">qemu=
-nbd 4.2.1 (Debian 1:4.2-3ubuntu6.23)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">I cr=
eated this encrypted QCOW2 image by the following command.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"text-indent:5.5pt"><span lang=3D"EN-US" sty=
le=3D"font-size:11.0pt">qemu-img create --object secret,id=3Dsec0,data=3Dab=
c123 -f qcow2 -o encrypt.format=3Dluks,encrypt.key-secret=3Dsec0 /tmp/empty=
.qcow2 8539292672<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Note=
 that I can connect to a normal QCOW2 file by this function without any err=
or. (arg: qemu-nbd -f qcow2 /tmp/normal.qcow2)<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_DM6PR15MB2635A63B1B5F9F204E08BBEED5879DM6PR15MB2635namp_--

