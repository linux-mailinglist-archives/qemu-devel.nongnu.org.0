Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B683D3FA23B
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 02:32:40 +0200 (CEST)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJmH0-0001Lt-Qv
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 20:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=787444d0a8=pdel@fb.com>)
 id 1mJmEu-0000F6-EW; Fri, 27 Aug 2021 20:30:28 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:7838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=787444d0a8=pdel@fb.com>)
 id 1mJmEs-000260-1u; Fri, 27 Aug 2021 20:30:28 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17S0SseJ007305; Fri, 27 Aug 2021 17:30:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=ieG55pWFf4tcTYam7swJYGr2/HeHm7CPrcfUebIBiNA=;
 b=Xi8lptKRj/ECIa/LOyNWL7GP8/kH0MafaXv6SD4gHTO85ExOwbbZMwgDoFxGR1fiEhJN
 TMW+AOXsyWf/jeKMMd3evDo/o5W2cqIounluqowkVI9VXtC9e7b9vvNn4bf5SsMJDs6K
 w+7V2Nu6Frgyta6rKufNsrQvMPRg0iMUatk= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3aq6pgh9sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 27 Aug 2021 17:30:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 17:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTpOIt0jtFviN/GfEEdJMEXwWASuqdYtrze+rZuHATs/eoHQnOebl4l4ySf4PZTUHSPP/0fIdNf4Y8EbGkOwVXqAwbyXirBuKQsqMzpPKhPi8xMQVRnGISfafufswGYCOBQZTEPRsMnD/Ug31ll9tq1J+4Kvrw5DO8uFeOe8ZmnTmaiSt/dVzZHhrzIUzPJmbT/nx9fhe6acKz8tgcSIM/dZp8h0Gl6lNoy2NFTOxJxWowTp+exfIIHy1tNEL3/mi338ON7Yu9cMAM40EPBuxczZoPeBOSR2wImb7SNsM929/WE1iXjEPWSXwIZr2bmPD9Pj2CtAER1zaykHXSi5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieG55pWFf4tcTYam7swJYGr2/HeHm7CPrcfUebIBiNA=;
 b=SFAV0tJEoK+jQyXudFD3UHBCBf/L1gAstjPEWgQSmmly3EcJ8ncjTIh/GZMtgw6j3nXalLyKaLzeQgst2avp7W1gYgP3tFdaX1DWW6GH70FMTYa2WrejaT0agmgCFtqlEkuEt6SjtzpbCgUbD19qhJAC2vu7yfYr2Bvr/C1VjSnWPikt6sCPJFgyWFc4ysKO8xpE23J8vMkwiKGeU3SRaV3PxggUBPUdmgvyEH4DYCDNcJIQQkiiEkKcr0b57bwd5P5PtAGT4RAUYznZjyfzeFct2kdEI8brpRq4LzX3GCOzdFqd40Xmwnjx5uSJtGd4OthaTaohBPpdAvp5CsCZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB2709.namprd15.prod.outlook.com (2603:10b6:a03:156::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 00:30:12 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 00:30:12 +0000
From: Peter Delevoryas <pdel@fb.com>
To: Peter Delevoryas <pdel@fb.com>
CC: "clg@kaod.org" <clg@kaod.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH 1/5] hw/arm/aspeed: Add get_irq to AspeedSoCClass
Thread-Topic: [PATCH 1/5] hw/arm/aspeed: Add get_irq to AspeedSoCClass
Thread-Index: AQHXm4de1xoTxdKOMk6HjcOySq6aZ6uIDpVb
Date: Sat, 28 Aug 2021 00:30:12 +0000
Message-ID: <BYAPR15MB3032B3C41D133A7196774A6AACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-2-pdel@fb.com>
In-Reply-To: <20210827210417.4022054-2-pdel@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca2019cf-d14d-44dd-09f0-08d969baffd9
x-ms-traffictypediagnostic: BYAPR15MB2709:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2709CCF94E21280E2BF6F0B7ACC99@BYAPR15MB2709.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3GWKWQx3Nic7kRbRJLp4PeSo0YD9JqSd7KukOK5i+qAJmC9EmeKgcrQCQGTKekrwz8xPSh7A38IMPcbMm25qxJUvCJCi6kANV87+VcmmQ1/GS0dobQvYBSLpNGeXcKeE0TRJLfzGJ/dlQFYv0vY/XsgeTURCiaHomtZMP4K8xtFtJ/XHcqVP5j0ol2l7REjJmOOwaUeboy7XhNQJ766UOm2ZdYAV8p5FKh6lMS0Rheo+yI9OWHWLjeV9anZyQsaE+qqoOAFpicR+CDlGSyKuLHOxYId/JXfhWZLEJAnpupw0mnE/1vZOmXSptO02qi/pjU2uHA111sOSPwZI+mhdAS24R5L98YWsD1CiVW9UovUjEq7DctTPMiDXb2Hm79Ea+s9W3z1aOAr9nVXN0yoPRYVLg7KHcl17jb+LIS7ZsEUlm5jQsIzMFKI7WRLqRGwQWrs07QjrOA90ESVqNYZCSoJJu0quDBOGpNcl8vw47OnslBA8ud4X4SIYmcgolIQ6g9ygnROvbxC/6S8w5AnqdytRzMbopjUSo227HGZ2Z79PurYXObnLHD1eujwdbC+qXYPx4MDwuC1ylXiYwuGOrgZzbvKNqbuubuMLI0YOKobY/X8jAoq2txingQ1SrRTMdcv9JVnj8CiMD2BXkyQHiiMvPvv/knYSyfnaGW8s+/g4YlWvg08M5hkLylpY4FoZC89tvSCkUhaZ+o4Rp3BYvz4KVKFJiBr4l/54bU9TH2E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(7696005)(186003)(71200400001)(53546011)(6506007)(6200100001)(5660300002)(38070700005)(8936002)(38100700002)(2906002)(122000001)(33656002)(4326008)(316002)(54906003)(55016002)(508600001)(9686003)(64756008)(83380400001)(86362001)(76116006)(66946007)(66446008)(66556008)(66476007)(52536014)(6862004)(8676002)(145603002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?YVT25+XhwH8gbk3KOvDKNTsHvXRY0CNa3gGp0cwXEgu+pBmEd5qR5fuZ?=
 =?Windows-1252?Q?2uSpmMGsvo69LYIczWCeIj+kiKCK+PI6IlTlbql3mAtv4bvJQjAwlc+I?=
 =?Windows-1252?Q?ONRf90lWbhanpc9/MoNv3uq+pGZcYpK91tlCRTI6ti/IiQxIjO1GE4V0?=
 =?Windows-1252?Q?pMG54jmYZrora1It2Bgbfa/Vpcz5EeNnknRBl5amcAixYJ+9Pf1HgVN9?=
 =?Windows-1252?Q?/K/ZieNEZx3Bgn+lFybGCd0PKYbOIsbgMqazkSzyiC017qilcogmoHrL?=
 =?Windows-1252?Q?4toeTQjU92zsDe6F2a9e8ZU/Yf+iKrv0SMfffZCtCsGlkdimR2ap1ssj?=
 =?Windows-1252?Q?1AvvX1CP7LOHwCWMDiexNS3/oNV+xo18Y9piwFrF/5kQ+W9IRunCLA3C?=
 =?Windows-1252?Q?z4mhuaCiC07e17SM0aVOce7EmappRNd6plBVYPPb9rjG/PgDPDkQWAri?=
 =?Windows-1252?Q?BbUkQrTmV/ORxxZqFe7c4enUzK2xlFz2ezt5HXGc848GWxUUS/MURpLh?=
 =?Windows-1252?Q?GIKpRBUIEpPrfJChOXXh+I21AOYxy8TmL0mpk7SBnRwhMoPKG7IXxQIP?=
 =?Windows-1252?Q?MBo5Y6CwUUZDNsVhu3KnzeLM7oXRNamYfiorQFN20GxZ719Msns9GZE7?=
 =?Windows-1252?Q?4P+q86GGSWRaHWlYcM97PNk8Jkt7LS1Zwx3NL0OT29S7EJO6aXxUHMnO?=
 =?Windows-1252?Q?MaIyFVORsDvaitX4GuEluN3fYdfTgyxxgFE4Y0f2WzHG7VAHxe82qRTB?=
 =?Windows-1252?Q?3XMt+XC3/oQKaqC3vI6TtDqrSU/aZ6rG2vSO1l9EoDRgPTFqLVRW9Kcw?=
 =?Windows-1252?Q?A562I/+atMu/JPli353dqkC+PwrzRypgLTcfsfkNfMochgAE21K1VCsS?=
 =?Windows-1252?Q?3FzBdvM+wbacAmbgWB2d144geC2v8dMKT1omBd3tAODeU+1wuZeXh4xM?=
 =?Windows-1252?Q?aoXfNOuM5FhrENNhqj2meo+bO7i/PCZ5Ab3JOhi4H7WvIu3MOtyehaO7?=
 =?Windows-1252?Q?iZUAYaxgESd5BQnUuPdyqy9wB4HZOYP5kLxu746O6lGEljw+Qm72cvB1?=
 =?Windows-1252?Q?NVmwSqpihrpaR1csuS272PtTeW7Gc3BLkSz7hpXnSX+UFybO5TSWZJsw?=
 =?Windows-1252?Q?nlmoVT7VLP9eDGcRFik0/QiqVNgihDLLXsW83P3S2Q0070Vaw8DKFAhg?=
 =?Windows-1252?Q?vyzBJVxdhcsbNS/Fe/hTaa6KLflRdTWLCWMArK/OnSYYFToXnDj/uF3I?=
 =?Windows-1252?Q?Ruj5GmRqZqpyGeVfAPBo3tuKg4V5lEvnU9ekZSZNFVZrSLgt8xa7D0YZ?=
 =?Windows-1252?Q?c87LqfF3Y9JYusDUMQo4YGwaFtq8sb9jlqiMyVsB7KIQf3uRPpr3YHlQ?=
 =?Windows-1252?Q?VHKfANsUZFzy+slG00Y8emjPty6UF02eRaBzeHKJy6VsEWRsdF52mJsl?=
 =?Windows-1252?Q?5hlUaxKpPNOjjNYqbHLyAZaJQwWMJJP1uSpmBdcJptc=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR15MB3032B3C41D133A7196774A6AACC99BYAPR15MB3032namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2019cf-d14d-44dd-09f0-08d969baffd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2021 00:30:12.4464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3CXDzgxI+dIrHV5sCIWgSg0S0Lj9g0k/ygH+ckzBuugpN2kdaN8e4biEx7wBTjr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2709
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: tLjoTFf-KjXeByXlPDgNEGtm260Ue4lP
X-Proofpoint-ORIG-GUID: tLjoTFf-KjXeByXlPDgNEGtm260Ue4lP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_07:2021-08-27,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108280000
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=787444d0a8=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BYAPR15MB3032B3C41D133A7196774A6AACC99BYAPR15MB3032namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Just noticed, I forgot to initialize get_irq for the AST2500. I didn=92t no=
tice it because I hadn=92t tested booting an image for -machine ast2500-evb=
. I=92ll make sure to test with images for all 3 chip revisions, then I=92l=
l resubmit with PATCH v2. I=92ll wait a little while though, for comments o=
n the rest of the series.

From: pdel@fb.com <pdel@fb.com>
Date: Friday, August 27, 2021 at 2:06 PM
To:
Cc: clg@kaod.org <clg@kaod.org>, joel@jms.id.au <joel@jms.id.au>, qemu-deve=
l@nongnu.org <qemu-devel@nongnu.org>, qemu-arm@nongnu.org <qemu-arm@nongnu.=
org>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH 1/5] hw/arm/aspeed: Add get_irq to AspeedSoCClass
From: Peter Delevoryas <pdel@fb.com>

The AST2500 uses different logic than the AST2600 for getting IRQ's.
This adds a virtual `get_irq` function to the Aspeed SOC class, so that
the shared initialization code in `hw/arm/aspeed.c` can retrieve IRQ's.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast2600.c     | 1 +
 hw/arm/aspeed_soc.c         | 1 +
 include/hw/arm/aspeed_soc.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e3013128c6..56e1adb343 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -527,6 +527,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *=
oc, void *data)
     sc->irqmap       =3D aspeed_soc_ast2600_irqmap;
     sc->memmap       =3D aspeed_soc_ast2600_memmap;
     sc->num_cpus     =3D 2;
+    sc->get_irq      =3D aspeed_soc_get_irq;
 }

 static const TypeInfo aspeed_soc_ast2600_type_info =3D {
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 3ad6c56fa9..c373182299 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -476,6 +476,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *=
oc, void *data)
     sc->irqmap       =3D aspeed_soc_ast2400_irqmap;
     sc->memmap       =3D aspeed_soc_ast2400_memmap;
     sc->num_cpus     =3D 1;
+    sc->get_irq      =3D aspeed_soc_get_irq;
 }

 static const TypeInfo aspeed_soc_ast2400_type_info =3D {
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index d9161d26d6..ca16e1e383 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -84,6 +84,7 @@ struct AspeedSoCClass {
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
+    qemu_irq (*get_irq)(AspeedSoCState *s, int ctrl);
 };


--
2.30.2

--_000_BYAPR15MB3032B3C41D133A7196774A6AACC99BYAPR15MB3032namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Just noticed, I forgot to initialize get_irq for the=
 AST2500. I didn=92t notice it because I hadn=92t tested booting an image f=
or -machine ast2500-evb. I=92ll make sure to test with images for all 3 chi=
p revisions, then I=92ll resubmit with PATCH
 v2. I=92ll wait a little while though, for comments on the rest of the ser=
ies.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">pdel@fb.com &lt;pde=
l@fb.com&gt;<br>
<b>Date: </b>Friday, August 27, 2021 at 2:06 PM<br>
<b>To: </b><br>
<b>Cc: </b>clg@kaod.org &lt;clg@kaod.org&gt;, joel@jms.id.au &lt;joel@jms.i=
d.au&gt;, qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;, qemu-arm@non=
gnu.org &lt;qemu-arm@nongnu.org&gt;, Peter Delevoryas &lt;pdel@fb.com&gt;<b=
r>
<b>Subject: </b>[PATCH 1/5] hw/arm/aspeed: Add get_irq to AspeedSoCClass<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">From: Peter Delevorya=
s &lt;pdel@fb.com&gt;<br>
<br>
The AST2500 uses different logic than the AST2600 for getting IRQ's.<br>
This adds a virtual `get_irq` function to the Aspeed SOC class, so that<br>
the shared initialization code in `hw/arm/aspeed.c` can retrieve IRQ's.<br>
<br>
Signed-off-by: Peter Delevoryas &lt;pdel@fb.com&gt;<br>
---<br>
&nbsp;hw/arm/aspeed_ast2600.c&nbsp;&nbsp;&nbsp;&nbsp; | 1 +<br>
&nbsp;hw/arm/aspeed_soc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 1 +<br>
&nbsp;include/hw/arm/aspeed_soc.h | 1 +<br>
&nbsp;3 files changed, 3 insertions(+)<br>
<br>
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c<br>
index e3013128c6..56e1adb343 100644<br>
--- a/hw/arm/aspeed_ast2600.c<br>
+++ b/hw/arm/aspeed_ast2600.c<br>
@@ -527,6 +527,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *=
oc, void *data)<br>
&nbsp;&nbsp;&nbsp;&nbsp; sc-&gt;irqmap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D aspeed_soc_ast2600_irqmap;<br>
&nbsp;&nbsp;&nbsp;&nbsp; sc-&gt;memmap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D aspeed_soc_ast2600_memmap;<br>
&nbsp;&nbsp;&nbsp;&nbsp; sc-&gt;num_cpus&nbsp;&nbsp;&nbsp;&nbsp; =3D 2;<br>
+&nbsp;&nbsp;&nbsp; sc-&gt;get_irq&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D aspeed=
_soc_get_irq;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static const TypeInfo aspeed_soc_ast2600_type_info =3D {<br>
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c<br>
index 3ad6c56fa9..c373182299 100644<br>
--- a/hw/arm/aspeed_soc.c<br>
+++ b/hw/arm/aspeed_soc.c<br>
@@ -476,6 +476,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *=
oc, void *data)<br>
&nbsp;&nbsp;&nbsp;&nbsp; sc-&gt;irqmap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D aspeed_soc_ast2400_irqmap;<br>
&nbsp;&nbsp;&nbsp;&nbsp; sc-&gt;memmap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D aspeed_soc_ast2400_memmap;<br>
&nbsp;&nbsp;&nbsp;&nbsp; sc-&gt;num_cpus&nbsp;&nbsp;&nbsp;&nbsp; =3D 1;<br>
+&nbsp;&nbsp;&nbsp; sc-&gt;get_irq&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D aspeed=
_soc_get_irq;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static const TypeInfo aspeed_soc_ast2400_type_info =3D {<br>
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h<br>
index d9161d26d6..ca16e1e383 100644<br>
--- a/include/hw/arm/aspeed_soc.h<br>
+++ b/include/hw/arm/aspeed_soc.h<br>
@@ -84,6 +84,7 @@ struct AspeedSoCClass {<br>
&nbsp;&nbsp;&nbsp;&nbsp; const int *irqmap;<br>
&nbsp;&nbsp;&nbsp;&nbsp; const hwaddr *memmap;<br>
&nbsp;&nbsp;&nbsp;&nbsp; uint32_t num_cpus;<br>
+&nbsp;&nbsp;&nbsp; qemu_irq (*get_irq)(AspeedSoCState *s, int ctrl);<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;<br>
-- <br>
2.30.2<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_BYAPR15MB3032B3C41D133A7196774A6AACC99BYAPR15MB3032namp_--

