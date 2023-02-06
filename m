Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7D768B53D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 06:39:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOuCJ-0007BH-Ep; Mon, 06 Feb 2023 00:37:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=140196ce1e=guohuai.shi@windriver.com>)
 id 1pOuCG-0007B8-TS
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 00:37:44 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=140196ce1e=guohuai.shi@windriver.com>)
 id 1pOuCC-00028b-PU
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 00:37:43 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3165ZWfi006134; Mon, 6 Feb 2023 05:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=PdhzbzHyjIT/bD2ks/M7dC8yg8kkyQ7BHAxTYbpIzeU=;
 b=Vuchdek/kL+GY5hcmh658yaVECqsbUZpxQlcPZPj5WhlZbIFn64HW6AGNtnPmxOGlxXt
 sJKkg13C8FSjebLb4+DYTKS9ygHzZiF8Cb9/vrWX9nv3vRIRvpvepp2hSfueP9Vndo0t
 0mi8LGMBLrpbegn5KfSpGnVA0hkQ3rrMhWrfpPPGgXh9uSpf9/O9/r0bQlJjf3j3CQmG
 f+LuxhGQOpne2HxUt9wjQ+IlHxVJzdICp5Yatc4ATDUZX30d7IYztTlziSkO9otes056
 u5n71yevCFp3ihdv0Bwucgy0EOLgThea3+WqiGrFDMQYnAZKrQSbCF0cUwOH23QEkcpv Gw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck31h04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 05:37:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHRRbdgEWyevjWr+mz4WY46/lfQt+cJ2zwl1KAnmhuuV7jNB+PxnAT7aF44UN9ttHfXIrWIkVo5FSKkmkS5EyqrJd87XTiSqRm3kga1jV3bWGQ7Uh/BSKp0EaSP7hOu081oM2xXoijr2i9dulP57Ev2B3YWfJttT+ToN+2Uq7ZgQsxZWQAZTzRHuZQpBfSJN9LYGbmcasMD26ztfVEQaEZjSlZYFxf85vaquNqlZLYeRTe4sdoN8PoHNaVthu3PYAJkiyj+pIBbYv09rAQMSda0euyhVQ+nahqCjSC6UqVs07T2cz3hQmngUn3kJ1KNUfVLjjTXPxjs/KqItp9Qc6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdhzbzHyjIT/bD2ks/M7dC8yg8kkyQ7BHAxTYbpIzeU=;
 b=XI0xxY5Qr7qCdO/Usw49jQ6l5fAUQS+5/Q509IfkSlCC3GZM1uoPVgET6M3lOW/+0eK2ea8+i9/sE8a8JOjGUbzFysULrXxpaDqitrH69pE0z/1NZUqREL24iu7YOuLzUPy0AMin1RtF+9IiXW6p1i9UxBe98yoB1NGkXP2RoTcY8Y21YJa+iVkACcwHPpwiaKp314MHUOEUVixLWTtFH6Y8cj/Mxv4KGMgwJp9tXskYOsQLmhVpBYpUBRskTkg6LK/emioPrrE7UgoBmPQn+jLRoyNacP8OoGYi+73skFAAVODB5wPm8CfuUgdQcCYOrH0A35RwIqYO67LFEeSyIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by DM6PR11MB4593.namprd11.prod.outlook.com (2603:10b6:5:2a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 05:37:16 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 05:37:16 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Meng, Bin" <Bin.Meng@windriver.com>, =?iso-8859-1?Q?Marc-Andr=E9_Lureau?=
 <marcandre.lureau@redhat.com>, =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?=
 <berrange@redhat.com>
Subject: RE: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Thread-Topic: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir()
 APIs
Thread-Index: AQHZNJCQ5QDQDl+c2UWDW8VIOF7gh669K9gAgAAOB2CAABf+gIAADomAgAAn3wCAA7nRcA==
Date: Mon, 6 Feb 2023 05:37:16 +0000
Message-ID: <MN2PR11MB4173960A520976B15946CCEBEFDA9@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
 <7414919.cCnjH5He9x@silver>
 <MN2PR11MB4173C6CF342F103D757F8A21EFD79@MN2PR11MB4173.namprd11.prod.outlook.com>
 <3667674.co3Lnhysxx@silver>
In-Reply-To: <3667674.co3Lnhysxx@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|DM6PR11MB4593:EE_
x-ms-office365-filtering-correlation-id: fd06fc53-1930-445d-b311-08db080434df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ormzPXZKemH0599BvXJ5vL6q03l6bFQc2KEX5CLDPlyjJxYft/NLPhPphgJr9oCG+Z8UXyn3RH+Q+F3ALVavYk0+sDbxzopB96eLjkw9EFMi0vnHyuZz1aqQ5Bx2maDYbFbJBQ9bAWk330oZkxOtM8FWJi8PwEgyu0ZIgaxpSHC4Pkt7g6mYjH9xH9cbj4BCBkg6jL9soNbOKed7WrdDMYLyBeOisn+oSwRc2IQgZDvkYiGdE6/TUyA0xMZcG0GUBrrQqclEVBeSlzyEb1AeRXPiAxwdDTNGMYMIg7uI/wuEHSawyhV5TiExFNWYM88nYQQ51w2ejsIAssGreQx2gqmS8BZmpTa/wumMkSiqmcMNvueUQLI5wM01YZQTWmgWUcZvAPCzRmadjoWS2rNBlWyXdX1ihPIbwCceOjG3hL2tZODHhvvPNPkxuHNUwkVnmsttLK4V6zO7YnX5S6EDUUG/RFEQVDNzGlYudPBBhHzQlmbOZObIla1cAibLqWQoEcGdWRpn00Nara4M5WCmyb1hwIZEGyEfFEOKurZ3M8Yf+EK23Jb+f/AFbbZK+Z1D8xKkCy9bB6YCOUaK5x1oPjeBc5wM1F8X7uvjbfwdJPdXXPEtToOQSW6j1cUl8+LnuBUYXSEIorwYF7+WngW04kZnYuiEjB8F2Gh20OndPX/6F3LhcYQ2b9frE/uEUtas1z5Ui2BjPs6qACjenWbaXEJf2jX7+/YGSsNr3oiluJsaxzAHdlN8roTZmxOwtde5ICbEVFHm3l3L79ybjWzP2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(39840400004)(396003)(366004)(451199018)(186003)(966005)(33656002)(6506007)(9686003)(26005)(53546011)(38100700002)(38070700005)(122000001)(110136005)(54906003)(316002)(52536014)(55016003)(8936002)(41300700001)(5660300002)(2906002)(71200400001)(66446008)(7696005)(30864003)(66476007)(8676002)(4326008)(66946007)(66556008)(64756008)(86362001)(83380400001)(478600001)(76116006)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?M4xUvKuZjiqN6EZjACRARRUPAs1srHITdCS4wStn65qdIy+mFchpebJOyJ?=
 =?iso-8859-1?Q?h8K/HgHe04qMUVkm5uPlctGIyjEC/hFKa9S1qFdgBIRshGiKdcyFS2BouC?=
 =?iso-8859-1?Q?QaD/4aCVAXRR8Cj4/NHK0X7L1ALhzPlZE8oyJnK+pJZFHRwTdtv0DHByQ6?=
 =?iso-8859-1?Q?45TrAkp/W17oHfg4G53MDOpQ/hZiGPFUzrJ/kSizH5amvx8+0i7AZKrLLR?=
 =?iso-8859-1?Q?qeuQCgNuNIE2fjXIffUY/Ef6/Zy144xuz5rQkzoT5VhI+OECWQnlqNRevi?=
 =?iso-8859-1?Q?/CXlhIiPX8ubhQ9oPw+tfUdPvoR6QP8SaoZTjAdd6p8WhgCwpNBHaNOe+e?=
 =?iso-8859-1?Q?R1+bku8apqkycqp8veRejzO7sFaDMACXM7jsWHwoXZQ5GnE+X3Uzvboacy?=
 =?iso-8859-1?Q?yFa5MdsyS76oq0KffPsmEhEVRmUkT58e9Vh7B/zxWqeykszJRq+5uaAHZi?=
 =?iso-8859-1?Q?2LzsMPuOL0xd1531v6Djm0vXNLIQfIm8KvTUD97DQR/fke2bMCTUTkDb6m?=
 =?iso-8859-1?Q?cIopZntH7mVY32v+TMu8ozaB3D+/IDRKTWEsd6iK5PWZGUkWlhzVBsMY+f?=
 =?iso-8859-1?Q?5oC1EJsAKdfIFKtihXKVEC+EVp4Nuj0vb7/MPGGw95M0yvW6hI19hiMEOT?=
 =?iso-8859-1?Q?wfcr+By1jy4jTwNIki6Y4cKNpF4EHNSpffY2YVQ0+z7vTduuMX8obEIkfe?=
 =?iso-8859-1?Q?qMHQBsV1TJJnuZyDyBdVesVrFMnnMpnCXypfUIQA2L3O0yzzSxzVaTwbrz?=
 =?iso-8859-1?Q?oSv5JHWexVh/HXYSKv8aTC/sgWglPakxFn+V7h+PkqdnXWj4NGfbOVHrhZ?=
 =?iso-8859-1?Q?wlAlEbhYAi6hw5UWSDzQohKJNvZq5Lnfqw0jFo3ZJXvASryAM24FI/1kJZ?=
 =?iso-8859-1?Q?kUE5X21udqkVc1TcmwcSBmbyAZIQy55ysJZ+6qIt3J+rWjoakleK2/8twg?=
 =?iso-8859-1?Q?gpyzaoOlndGMn5ZCXAbJZtmcVQNCgbdCnAECPqNO7TqUP3bJe8R9SK0c8r?=
 =?iso-8859-1?Q?THBCgdDVqk1UzHgW4Vxax4ljNaTcbdBPD+l2Wxq0JYJoD9rBgI69FrsSte?=
 =?iso-8859-1?Q?NQZZOTafpYH6qEpUKBt0UeV2/8ptJw3IUlyL4K+KvRmugBNxrYP2GGlXJ1?=
 =?iso-8859-1?Q?USOc5IvFqcCkDI5pfxS6MmQGjGaRkr46o+8avlHFjO/Zo4S5hulrlaJpB+?=
 =?iso-8859-1?Q?xr8D1qICt7I+vBEYZ1SRq1kBxt2syM2kA8au/+IaOHHrK26XD1orEWpOtW?=
 =?iso-8859-1?Q?cowFMC+UZKA2TejgfmtfJyyKxWdzJARfHIUlD4aetLtVprv5J5v47LribP?=
 =?iso-8859-1?Q?NoXukqO6n2y/fjJoI+BMafJT/uoW5PpkXcZ3xK0zS4oTcor9cwLTaGdomN?=
 =?iso-8859-1?Q?eReXmDUa56GczjyBawO8H18Ltk9VRXeS2+VaXMVJNo4RshD76lSzVBL6LM?=
 =?iso-8859-1?Q?JnNivTSe/gfho08kStSBbI3EhTCOjnxWMpjngaYuPLd1q9Ccu7gbSKlKNb?=
 =?iso-8859-1?Q?Rv9yv+4bPUrMJvQzVvIW+SGB9eb+LsE3tV4Btw76S/2X6ZUv5jnn4rPAnN?=
 =?iso-8859-1?Q?HNuhZFgkZQRXKjhaNeLAOJN19pF24YO8mHd+BQpBOrH6ASgcoY2avoWTBb?=
 =?iso-8859-1?Q?TR27Nqo3ZE9Ke36XT23Ukj5c24AI1YA8Op?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd06fc53-1930-445d-b311-08db080434df
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2023 05:37:16.2555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vzfVa+2KQZfplwwVQGxQzFqlqo3dqocHyZ3FjBizu04Eob9SJk85Kkh6dqeNMadGJm6tSAr6bPmmoM7wJuVz02XRO5VaB5PrGzWnnVoMvEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4593
X-Proofpoint-ORIG-GUID: YgOCM5MNXGd977Y3Ng9huCSelJKqKK4s
X-Proofpoint-GUID: YgOCM5MNXGd977Y3Ng9huCSelJKqKK4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_02,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060048
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=140196ce1e=guohuai.shi@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Sent: Saturday, February 4, 2023 01:55
> To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> Cc: Meng, Bin <Bin.Meng@windriver.com>; Marc-Andr=E9 Lureau
> <marcandre.lureau@redhat.com>; Daniel P. Berrang=E9
> <berrange@redhat.com>; Shi, Guohuai <Guohuai.Shi@windriver.com>
> Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir(=
)
> APIs
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Friday, February 3, 2023 5:30:35 PM CET Shi, Guohuai wrote:
> >
> > > -----Original Message-----
> > > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > Sent: Friday, February 3, 2023 22:41
> > > To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> > > Cc: Meng, Bin <Bin.Meng@windriver.com>; Marc-Andr=E9 Lureau
> > > <marcandre.lureau@redhat.com>; Daniel P. Berrang=E9
> > > <berrange@redhat.com>; Shi, Guohuai <Guohuai.Shi@windriver.com>
> > > Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific
> > > xxxdir() APIs
> > >
> > > CAUTION: This email comes from a non Wind River email account!
> > > Do not click links or open attachments unless you recognize the
> > > sender and know the content is safe.
> > >
> > > On Friday, February 3, 2023 2:34:13 PM CET Shi, Guohuai wrote:
> > > >
> > > > > -----Original Message-----
> > > > > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > > Sent: Friday, February 3, 2023 20:25
> > > > > To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> > > > > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin
> > > > > <Bin.Meng@windriver.com>; Marc-Andr=E9 Lureau
> > > > > <marcandre.lureau@redhat.com>; Daniel P. Berrang=E9
> > > > > <berrange@redhat.com>
> > > > > Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows
> > > > > specific
> > > > > xxxdir() APIs
> > > > >
> > > > > CAUTION: This email comes from a non Wind River email account!
> > > > > Do not click links or open attachments unless you recognize the
> > > > > sender and know the content is safe.
> > > > >
> > > > > On Monday, January 30, 2023 10:51:50 AM CET Bin Meng wrote:
> > > > > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > > > > >
> > > > > > This commit implements Windows specific xxxdir() APIs for
> > > > > > safety directory access.
> > > > > >
> > > > >
> > > > > This issue deserves a link to either the previous discussion
> > > > >
> > > > > Link:
> > > > > https://lore.kernel.org/qemu-devel/2830993.GtbaR8S6b6@silver/
> > > > >
> > > > > and/or a link to this continuation of the discussion here, as
> > > > > it's not a trivial issue, with pros and cons been discussed for
> > > > > the individual, possible solutions.
> > > > >
> > > > > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > > ---
> > > > > >
> > > > > >  hw/9pfs/9p-util.h       |   6 +
> > > > > >  hw/9pfs/9p-util-win32.c | 296
> > > > > > ++++++++++++++++++++++++++++++++++++++++
> > > > > >  2 files changed, 302 insertions(+)
> > > > > >
> > > > > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > > > > > 0f159fb4ce..c1c251fbd1 100644
> > > > > > --- a/hw/9pfs/9p-util.h
> > > > > > +++ b/hw/9pfs/9p-util.h
> > > > > > @@ -141,6 +141,12 @@ int unlinkat_win32(int dirfd, const char
> > > > > > *pathname, int flags);  int statfs_win32(const char
> > > > > > *root_path, struct statfs *stbuf);  int openat_dir(int dirfd,
> > > > > > const char *name);  int openat_file(int dirfd, const char
> > > > > > *name, int flags, mode_t mode);
> > > > > > +DIR *opendir_win32(const char *full_file_name); int
> > > > > > +closedir_win32(DIR *pDir); struct dirent *readdir_win32(DIR
> > > > > > +*pDir); void rewinddir_win32(DIR *pDir); void
> > > > > > +seekdir_win32(DIR *pDir, long pos); long telldir_win32(DIR
> > > > > > +*pDir);
> > > > > >  #endif
> > > > > >
> > > > > >  static inline void close_preserve_errno(int fd) diff --git
> > > > > > a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c index
> > > > > > a99d579a06..5503199300 100644
> > > > > > --- a/hw/9pfs/9p-util-win32.c
> > > > > > +++ b/hw/9pfs/9p-util-win32.c
> > > > > > @@ -37,6 +37,13 @@
> > > > > >   *    Windows does not support opendir, the directory fd is cr=
eated
> by
> > > > > >   *    CreateFile and convert to fd by _open_osfhandle(). Keep =
the fd
> > > open
> > > > > will
> > > > > >   *    lock and protect the directory (can not be modified or r=
eplaced)
> > > > > > + *
> > > > > > + * 5. Windows and MinGW does not provide safety directory
> > > > > > + accessing
> > > > > functions.
> > > > > > + *    readdir(), seekdir() and telldir() may get or set wrong =
value
> > > > > because
> > > > > > + *    directory entry data is not protected.
> > > > >
> > > > > I would rephrase that sentence, as it doesn't cover the root
> > > > > problem adequately. Maybe something like this:
> > > > >
> > > > > 5. Neither Windows native APIs, nor MinGW provide a POSIX
> > > > > compatible API for acquiring directory entries in a safe way.
> > > > > Calling those APIs (native
> > > > > _findfirst() and _findnext() or MinGW's readdir(), seekdir() and
> > > > > telldir()) directly can lead to an inconsistent state if
> > > > > directory is modified in between, e.g. the same directory
> > > > > appearing more than once in output, or directories not appearing
> > > > > at all in output even though they were neither newly created nor
> > > > > deleted. POSIX does not define what happens with deleted or
> > > > > newly created directories in between,
> > > but it guarantees a consistent state.
> > > > >
> > > > > > + *
> > > > > > + *    This file re-write POSIX directory accessing functions a=
nd cache
> > > all
> > > > > > + *    directory entries during opening.
> > > > > >   */
> > > > > >
> > > > > >  #include "qemu/osdep.h"
> > > > > > @@ -51,6 +58,27 @@
> > > > > >
> > > > > >  #define V9FS_MAGIC  0x53465039  /* string "9PFS" */
> > > > > >
> > > > > > +/*
> > > > > > + * MinGW and Windows does not provide safety way to seek
> > > > > > +directory while other
> > > > > > + * thread is modifying same directory.
> > > > > > + *
> > > > > > + * The two structures are used to cache all directory entries
> > > > > > +when opening
> > > > > it.
> > > > > > + * Cached entries are always returned for read or seek.
> > > > > > + */
> > > > > > +struct dir_win32_entry {
> > > > > > +    QSLIST_ENTRY(dir_win32_entry) node;
> > > > > > +    struct _finddata_t dd_data; };
> > > > > > +
> > > > > > +struct dir_win32 {
> > > > > > +    struct dirent dd_dir;
> > > > > > +    uint32_t offset;
> > > > > > +    uint32_t total_entries;
> > > > > > +    QSLIST_HEAD(, dir_win32_entry) head;
> > > > > > +    struct dir_win32_entry *current;
> > > > > > +    char dd_name[1];
> > > > > > +};
> > > > > > +
> > > > > >  /*
> > > > > >   * win32_error_to_posix - convert Win32 error to POSIX error
> number
> > > > > >   *
> > > > > > @@ -977,3 +1005,271 @@ int qemu_mknodat(int dirfd, const char
> > > > > > *filename,
> > > > > mode_t mode, dev_t dev)
> > > > > >      errno =3D ENOTSUP;
> > > > > >      return -1;
> > > > > >  }
> > > > > > +
> > > > > > +/*
> > > > > > + * opendir_win32 - open a directory
> > > > > > + *
> > > > > > + * This function opens a directory and caches all directory en=
tries.
> > > > > > + */
> > > > > > +DIR *opendir_win32(const char *full_file_name) {
> > > > > > +    HANDLE hDir =3D INVALID_HANDLE_VALUE;
> > > > > > +    DWORD attribute;
> > > > > > +    intptr_t dd_handle =3D -1;
> > > > > > +    struct _finddata_t dd_data;
> > > > > > +
> > > > > > +    struct dir_win32 *stream =3D NULL;
> > > > > > +    struct dir_win32_entry *dir_entry;
> > > > > > +    struct dir_win32_entry *prev;
> > > > > > +    struct dir_win32_entry *next;
> > > > > > +
> > > > > > +    int err =3D 0;
> > > > > > +    int find_status;
> > > > > > +    uint32_t index;
> > > > > > +
> > > > > > +    /* open directory to prevent it being removed */
> > > > > > +
> > > > > > +    hDir =3D CreateFile(full_file_name, GENERIC_READ,
> > > > > > +                      FILE_SHARE_READ | FILE_SHARE_WRITE |
> > > > > FILE_SHARE_DELETE,
> > > > > > +                      NULL,
> > > > > > +                      OPEN_EXISTING,
> > > > > > + FILE_FLAG_BACKUP_SEMANTICS, NULL);
> > > > > > +
> > > > > > +    if (hDir =3D=3D INVALID_HANDLE_VALUE) {
> > > > > > +        err =3D win32_error_to_posix(GetLastError());
> > > > > > +        goto out;
> > > > > > +    }
> > > > > > +
> > > > > > +    attribute =3D GetFileAttributes(full_file_name);
> > > > > > +
> > > > > > +    /* symlink is not allow */
> > > > > > +    if (attribute =3D=3D INVALID_FILE_ATTRIBUTES
> > > > > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) =
{
> > > > > > +        err =3D EACCES;
> > > > > > +        goto out;
> > > > > > +    }
> > > > > > +
> > > > > > +    /* check if it is a directory */
> > > > > > +    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) =3D=3D 0) {
> > > > > > +        err =3D ENOTDIR;
> > > > > > +        goto out;
> > > > > > +    }
> > > > > > +
> > > > > > +    /*
> > > > > > +     * findfirst() need suffix format name like
> > > > > > + "\dir1\dir2\*", allocate
> > > > > more
> > > > > > +     * buffer to store suffix.
> > > > > > +     */
> > > > > > +    stream =3D g_malloc0(sizeof(struct dir_win32) +
> > > > > > + strlen(full_file_name) +
> > > > > 3);
> > > > > > +    QSLIST_INIT(&stream->head);
> > > > > > +
> > > > > > +    strcpy(stream->dd_name, full_file_name);
> > > > > > +    strcat(stream->dd_name, "\\*");
> > > > > > +
> > > > > > +    dd_handle =3D _findfirst(stream->dd_name, &dd_data);
> > > > > > +
> > > > > > +    if (dd_handle =3D=3D -1) {
> > > > > > +        err =3D errno;
> > > > > > +        goto out;
> > > > > > +    }
> > > > > > +
> > > > > > +    index =3D 0;
> > > > > > +
> > > > > > +    /* read all entries to link list */
> > > > > > +    do {
> > > > > > +        dir_entry =3D g_malloc0(sizeof(struct dir_win32_entry)=
);
> > > > > > +        memcpy(&dir_entry->dd_data, &dd_data, sizeof(dd_data))=
;
> > > > > > +        if (index =3D=3D 0) {
> > > > > > +            QSLIST_INSERT_HEAD(&stream->head, dir_entry, node)=
;
> > > > > > +        } else {
> > > > > > +            QSLIST_INSERT_AFTER(prev, dir_entry, node);
> > > > > > +        }
> > > > > > +
> > > > > > +        prev =3D dir_entry;
> > > > > > +        find_status =3D _findnext(dd_handle, &dd_data);
> > > > > > +
> > > > > > +        index++;
> > > > > > +    } while (find_status =3D=3D 0);
> > > > >
> > > > > So you decided to go for the solution that caches all entries of
> > > > > a directory in RAM.
> > > > >
> > > > > So don't you think my last suggested solution that would call
> > > > > native
> > > > > _findfirst() and _findnext() directly, but without any chaching
> > > > > and instead picking the relevent entry simply by inode number,
> > > > > might be a better candidate as a starting point for landing Windo=
ws
> support?
> > > > > Link to that previous
> > > > > suggestion:
> > > > >
> > > > > https://lore.kernel.org/qemu-devel/2468168.SvRIHAoRfs@silver/
> > > > >
> > > >
> > > > I did a quick test for caching data without name entry, but it
> > > > failed for
> > > reading + deleting directory on Windows host (like "rm -rf" for a
> directory).
> > > > The root cause is: Windows's directory entry is not cached.
> > > > If there is 100 files in a directory:
> > > >
> > > > File1
> > > > File2
> > > > ...
> > > > File100
> > > >
> > > > When "rm -rf" is working:
> > > >
> > > > It read first 10 entries, and remove them. 9pfs may seek and
> > > > re-seek to
> > > offset 10 to read next 10 entries.
> > > > But Windows and MinGW does not provide rewinddir.
> > > > If we using findfirst() and findnext to seek to offset 10, then we
> > > > will not
> > > get File11 but get File 21 (because we skipped 10 entries by seekdir(=
)).
> > >
> > > I assume you are referring to a simple solution like MinGW does,
> > > i.e. a consecutive dense index (0,1,2,3,...n-1 where n is the
> > > current total amount of directory entries). That would not work,
> > > yes. But that's not what I suggested.
> > >
> > > With an inode number based lookup you would not seek to an incorrect
> > > entry ...
> > >
> > > > If we removed some entries in directory, inode number is useless
> > > > because we
> > > can not find it again.
> > >
> > > You *can* recover from the previous inode number, even if any
> > > directory entry has been deleted in the meantime: you would lookup
> > > the entry with the next higher inode number.
> > >
> > > Example, say initial directory state on host is:
> > >
> > > name   inode-nr
> > > aaa    8
> > > bbb    3
> > > ccc    4
> > > ddd    2
> > > eee    9
> > >
> > > Say client is looking up exactly 2 entries, you would return to
> > > client in this order (by inode-nr):
> > >
> > > 1. ddd
> > > 2. bbb
> > >
> > > Now say "bbb" (a.k.a. previous) and "ccc" (a.k.a next) are removed.
> > > Directory state on host is now:
> > >
> > > name   inode-nr
> > > aaa    8
> > > ddd    2
> > > eee    9
> > >
> > > Subsequently the last directory entries are requested by client.
> > > Previous inode number (stored in RAM) was 3, which no longer exists,
> > > so you lookup the entry with the next higher inode number than 3,
> > > which is now 8 in this example. Hence you would eventually return to
> client (in this order):
> > >
> > > 3. aaa
> > > 4. eee
> > >
> >
> > Yes, it can work by using inode number (called File ID on Windows host:
> https://learn.microsoft.com/en-us/windows/win32/api/winbase/ns-
> winbase-file_id_info).
> > However, Windows does not provide a function to get file information by
> file ID.
> > That means, for anytime of seeking directory, 9pfs need to do the follo=
wing
> sequence work to locate a name entry:
> >
> > 1. findfirst
> > 2. CreateFile to get file handle
> > 3. GetFileInformationByHandleEx to get file ID
> > (https://learn.microsoft.com/en-us/windows/win32/api/minwinbase/ne-
> min
> > winbase-file_info_by_handle_class)
> > 4. Close file handle and return if the file ID is match 5. findnext 6.
> > repeat to step #2
> >
> > Windows does not short file name entry by file ID and the file ID is 12=
8-bit
> integer.
> > When there are many entries in directory, seeking directory will cause =
a
> very bad performance.
>=20
> I know, it's an n-square performance issue and what I already wrote in th=
e
> summary of the linked original suggestion [1] in v3 before, quote:
>=20
>   + Relatively straight-forward to implement.
>=20
>   + No (major) changes in 9pfs code base required.
>=20
>   - Still n-square performance issue (neglectable to land Windows host
> support
>     IMO).
>=20
>   o Consistency assured for "most" cases, except one: if hardlinks are
>     inserted in between then it might fail

readdir() on Linux host may also return the deleted entries.
And POSIX specification does not mention about the consistency issue.

NTFS file id is the $MFT index id. It will keen unique until file is delete=
d.
But the index id may be reuse if delete and re-create many files.

Saving file id instead of name will make consistency better, but may not co=
ver all status.
Because read directory is not a "atomic" operation.
>=20
> [1] https://lore.kernel.org/qemu-devel/2468168.SvRIHAoRfs@silver/
>=20
> The idea was to use that just as a starting point to land Windows host su=
pport
> ASAP, slower on large dirs compared to other solutions, yes, but with
> guaranteed correct and deterministic behaviour. And then on the long run
> we would of course replace that with a more performant solution.
>=20
> I mean, this is really simple to implement, so I would at least test it. =
If it really
> runs horribly slow we could still discuss faster solutions, which are how=
ever
> all much more tricky.
>=20

I did a basic test on Windows host, here is the code:

    st =3D clock();
    pDir =3D opendir_win32(TEST_DIR);

    if (pDir =3D=3D NULL)
        return -1;
   =20
    while ((pEnt =3D readdir_win32(pDir)) !=3D NULL)
    {
        totals++;
    }
    closedir_win32(pDir);
    ed =3D clock();

    printf("total =3D %d clocks =3D %d %d\n", totals, ed - st, CLOCKS_PER_S=
EC);

My local storage is SSD disk.

Run this test for 100, 1000, 10000 entries.
For file name cache solution, the time cost is: 2, 9, 44 (in ms).
For file id cache solution, the time cost: 3, 438, 4338 (in ms).
I already used OpenFileById() to make it faster instead of CreateFile(). If=
 I use CreateFile, it need more than 80 seconds.

The performance looks like not good.=20
And actually, it would be worse in 9pfs.
Because in current design, 9pfs  may seek forward and seek back several tim=
es during reading directory, which may cause the performance worse.

> > So I think store all name entries would be better than store all file I=
D.
>=20
> As already discussed, NTFS allows up to (2^32 - 1) =3D 4,294,967,295 entr=
ies per
> directory. So caching only one directory (entirely) in RAM can already ex=
ceed
> the available RAM, which would crash QEMU. Multiplied by an expected
> amount of directory lookups by client and we even get into much higher
> categories, even with much smaller individual directory sizes.
>=20

Windows file id structure is 24 bytes, which is not a small structure.
If you think the performance is acceptable, I can rework this commit based =
on file id.

> >
> >
> > > >
> > > >
> > > > Thanks
> > > > Guohuai
> > > >
> > > >
> > > > > > +
> > > > > > +    if (errno =3D=3D ENOENT) {
> > > > > > +        /* No more matching files could be found, clean errno =
*/
> > > > > > +        errno =3D 0;
> > > > > > +    } else {
> > > > > > +        err =3D errno;
> > > > > > +        goto out;
> > > > > > +    }
> > > > > > +
> > > > > > +    stream->total_entries =3D index;
> > > > > > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > > > > > +
> > > > > > +out:
> > > > > > +    if (err !=3D 0) {
> > > > > > +        errno =3D err;
> > > > > > +        /* free whole list */
> > > > > > +        if (stream !=3D NULL) {
> > > > > > +            QSLIST_FOREACH_SAFE(dir_entry, &stream->head,
> > > > > > +node, next)
> > > {
> > > > > > +                QSLIST_REMOVE(&stream->head, dir_entry,
> > > > > > +dir_win32_entry,
> > > > > node);
> > > > > > +                g_free(dir_entry);
> > > > > > +            }
> > > > > > +            g_free(stream);
> > > > > > +            stream =3D NULL;
> > > > > > +        }
> > > > > > +    }
> > > > > > +
> > > > > > +    /* after cached all entries, this handle is useless */
> > > > > > +    if (dd_handle !=3D -1) {
> > > > > > +        _findclose(dd_handle);
> > > > > > +    }
> > > > > > +
> > > > > > +    if (hDir !=3D INVALID_HANDLE_VALUE) {
> > > > > > +        CloseHandle(hDir);
> > > > > > +    }
> > > > > > +
> > > > > > +    return (DIR *)stream;
> > > > > > +}
> > > > > > +
> > > > > > +/*
> > > > > > + * closedir_win32 - close a directory
> > > > > > + *
> > > > > > + * This function closes directory and free all cached resource=
s.
> > > > > > + */
> > > > > > +int closedir_win32(DIR *pDir) {
> > > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > > +    struct dir_win32_entry *dir_entry;
> > > > > > +    struct dir_win32_entry *next;
> > > > > > +
> > > > > > +    if (stream =3D=3D NULL) {
> > > > > > +        errno =3D EBADF;
> > > > > > +        return -1;
> > > > > > +    }
> > > > > > +
> > > > > > +    /* free all resources */
> > > > > > +
> > > > > > +    QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, next)
> {
> > > > > > +        QSLIST_REMOVE(&stream->head, dir_entry,
> > > > > > + dir_win32_entry,
> > > node);
> > > > > > +        g_free(dir_entry);
> > > > > > +    }
> > > > > > +
> > > > > > +    g_free(stream);
> > > > > > +
> > > > > > +    return 0;
> > > > > > +}
> > > > > > +
> > > > > > +/*
> > > > > > + * readdir_win32 - read a directory
> > > > > > + *
> > > > > > + * This function reads a directory entry from cached entry lis=
t.
> > > > > > + */
> > > > > > +struct dirent *readdir_win32(DIR *pDir) {
> > > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > > +
> > > > > > +    if (stream =3D=3D NULL) {
> > > > > > +        errno =3D EBADF;
> > > > > > +        return NULL;
> > > > > > +    }
> > > > > > +
> > > > > > +    if (stream->offset >=3D stream->total_entries) {
> > > > > > +        /* reach to the end, return NULL without set errno */
> > > > > > +        return NULL;
> > > > > > +    }
> > > > > > +
> > > > > > +    memcpy(stream->dd_dir.d_name,
> > > > > > +           stream->current->dd_data.name,
> > > > > > +           sizeof(stream->dd_dir.d_name));
> > > > > > +
> > > > > > +    /* Windows does not provide inode number */
> > > > > > +    stream->dd_dir.d_ino =3D 0;
> > > > > > +    stream->dd_dir.d_reclen =3D 0;
> > > > > > +    stream->dd_dir.d_namlen =3D strlen(stream->dd_dir.d_name);
> > > > > > +
> > > > > > +    stream->offset++;
> > > > > > +    stream->current =3D QSLIST_NEXT(stream->current, node);
> > > > > > +
> > > > > > +    return &stream->dd_dir;
> > > > > > +}
> > > > > > +
> > > > > > +/*
> > > > > > + * rewinddir_win32 - reset directory stream
> > > > > > + *
> > > > > > + * This function resets the position of the directory stream
> > > > > > +to the
> > > > > > + * beginning of the directory.
> > > > > > + */
> > > > > > +void rewinddir_win32(DIR *pDir) {
> > > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > > +
> > > > > > +    if (stream =3D=3D NULL) {
> > > > > > +        errno =3D EBADF;
> > > > > > +        return;
> > > > > > +    }
> > > > > > +
> > > > > > +    stream->offset =3D 0;
> > > > > > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > > > > > +
> > > > > > +    return;
> > > > > > +}
> > > > > > +
> > > > > > +/*
> > > > > > + * seekdir_win32 - set the position of the next readdir()
> > > > > > +call in the directory
> > > > > > + *
> > > > > > + * This function sets the position of the next readdir() call
> > > > > > +in the directory
> > > > > > + * from which the next readdir() call will start.
> > > > > > + */
> > > > > > +void seekdir_win32(DIR *pDir, long pos) {
> > > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > > +    uint32_t index;
> > > > > > +
> > > > > > +    if (stream =3D=3D NULL) {
> > > > > > +        errno =3D EBADF;
> > > > > > +        return;
> > > > > > +    }
> > > > > > +
> > > > > > +    if (pos < -1) {
> > > > > > +        errno =3D EINVAL;
> > > > > > +        return;
> > > > > > +    }
> > > > > > +
> > > > > > +    if (pos =3D=3D -1 || pos >=3D (long)stream->total_entries)=
 {
> > > > > > +        /* seek to the end */
> > > > > > +        stream->offset =3D stream->total_entries;
> > > > > > +        return;
> > > > > > +    }
> > > > > > +
> > > > > > +    if (pos - (long)stream->offset =3D=3D 0) {
> > > > > > +        /* no need to seek */
> > > > > > +        return;
> > > > > > +    }
> > > > > > +
> > > > > > +    /* seek position from list head */
> > > > > > +
> > > > > > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > > > > > +
> > > > > > +    for (index =3D 0; index < (uint32_t)pos; index++) {
> > > > > > +        stream->current =3D QSLIST_NEXT(stream->current, node)=
;
> > > > > > +    }
> > > > > > +    stream->offset =3D index;
> > > > > > +
> > > > > > +    return;
> > > > > > +}
> > > > > > +
> > > > > > +/*
> > > > > > + * telldir_win32 - return current location in directory
> > > > > > + *
> > > > > > + * This function returns current location in directory.
> > > > > > + */
> > > > > > +long telldir_win32(DIR *pDir) {
> > > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > > +
> > > > > > +    if (stream =3D=3D NULL) {
> > > > > > +        errno =3D EBADF;
> > > > > > +        return -1;
> > > > > > +    }
> > > > > > +
> > > > > > +    if (stream->offset > stream->total_entries) {
> > > > > > +        return -1;
> > > > > > +    }
> > > > > > +
> > > > > > +    return (long)stream->offset; }
> > > > > >
> > > > >
> > > >
> > > >
> > > >
> > >
> > >
> >
> >
> >
>=20
>=20


