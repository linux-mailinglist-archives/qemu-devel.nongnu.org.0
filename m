Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D4951ADE7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 21:37:32 +0200 (CEST)
Received: from localhost ([::1]:37272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmKoV-0000XI-7C
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 15:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2123ef2400=guohuai.shi@windriver.com>)
 id 1nmKlx-0006xt-B0
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:34:54 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238]:43906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2123ef2400=guohuai.shi@windriver.com>)
 id 1nmKlr-0007c0-V7
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:34:52 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244BnBRH011935;
 Wed, 4 May 2022 19:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=PbqAdXBALizaMGT7g41FC2eS31P1NLRzmmg3M7PYzSc=;
 b=X867AJE7flA0NSg1lasICBw32++XE1u81bNnn1fboEXyAElFbu9FDzgBOmly8gtvxpZk
 r8mED2YYdkKujcFEIIaGqg4fpSbRLe7Q/m+WjOTBXGuwFsD7v5Rc3XMMst4adhG8UC4G
 dUURKp/9TrQB2+BbmQHG1T82rc2yO6G3gyc9AYnD5sssLLYiajg07V8cLg4CHb+W610n
 ReUKHIi3hL5L2C91X83aY37VKoaSrf3LxaKRW4G+UWAv3pIaANv69ULSZrdMXKJw7MOa
 llSqu96lFqOL+p7b8U98HyxE5/3RY4WhddX5uaoFiSCjZEhxUjDsWy5HMQzmCQi7JueC dw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3frv38uap2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 19:34:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrgL/SzuX4juQmMlimL4II941inG2qc0n7os4mKKYx00DPk+GnLS/66CqUhgad2Hnsi+XrYlxgy1EWwr5+w3dveu/Q5HtgINVNZ/Y7GhI2fB27ikYxDSD76OTxQS8ShFpiaWx95yHqYutcR9T6Q5FsHbwnUv/gl7iBQaiLSNfPFD98ZFA3Wmn45+AVI6SpOM5dGUwX3KaXVpevmNl/G51Um9bvyzYiCyYfoMj6cTrUfLggD5CpVvmYIVgnBBsD4J3QX6PJyCSNSiJT/kpTReG5eXQWBmHhxNH7OksKta4bvoiK4k68B8NvPISrR6FAsL6JoJ59Ruy8etJzSp0dBClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbqAdXBALizaMGT7g41FC2eS31P1NLRzmmg3M7PYzSc=;
 b=OZ23lg/H3bRMK/ziF5GSWFEdx9bg7Hap4/A22hlvqdcVAgGI6qB9mUn1+4DPXxoVdh0mzNrsQ3gf15THTLS5U0yS6owUub++TReJyd3luv3ExZlxOOdVlWGZOcPdIGnSS/Q2P88jiem3vCQxY3NoJzyStzUfIK0eQI2b6EBTIBLwerC+zXBp136lC9Qls2pDgIsTdsAoopI4N+4cUaRvMjiGIt/BOQvU3WGi45RBUMe82vG9Zrz3U2iuM1KMBbbwuYQy5nsBHCT1xUl3NqP6MnaPHf33QpU9Usxd/sdO9hbhswf+/mcoWHp9P7EWlo1ql4/EBaimSIxYwk0R+tX85Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4454.namprd11.prod.outlook.com (2603:10b6:610:45::22)
 by BN6PR11MB1507.namprd11.prod.outlook.com (2603:10b6:405:9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 19:34:22 +0000
Received: from CH2PR11MB4454.namprd11.prod.outlook.com
 ([fe80::fcc2:6d62:6e1e:d1f0]) by CH2PR11MB4454.namprd11.prod.outlook.com
 ([fe80::fcc2:6d62:6e1e:d1f0%6]) with mapi id 15.20.5186.028; Wed, 4 May 2022
 19:34:22 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>, Bin Meng
 <bmeng.cn@gmail.com>
Subject: RE: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend driver for
 Windows
Thread-Topic: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend driver
 for Windows
Thread-Index: AQHYWLCcWsfI4/Y1i0icMWaeEyy3Ca0PEJuAgAAZrtA=
Date: Wed, 4 May 2022 19:34:22 +0000
Message-ID: <CH2PR11MB445462A54AC1006BD093737BEFC39@CH2PR11MB4454.namprd11.prod.outlook.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
 <20220425142705.2099270-6-bmeng.cn@gmail.com> <2749735.hgEqPgphOh@silver>
In-Reply-To: <2749735.hgEqPgphOh@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fe46795-a765-468d-3b3c-08da2e051706
x-ms-traffictypediagnostic: BN6PR11MB1507:EE_
x-microsoft-antispam-prvs: <BN6PR11MB15079F2076335DB39A76E97AEFC39@BN6PR11MB1507.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R17xouTLMQuNG2kFYxT6cwiJmNRiOJyPPG+GSSB1GMzduTdcKbYeM7LsljkWWlTfgJOY16kjvIK9ItY4C++8tuH/+J+cHER7zwNQcd6aKmuH7/kLVxy4J6tAwq3pIR7djl1Tdzh07+9pKvdGO05YwxlYyf794EG4SoKEXkFTgd7eothrZ+XMAF8WZ5Pv9ZUpxUaHmyKHu3B8r3syuo8UWKoHsMUTJ6xNrwPbc0NbIkIYuo1iLZDLVmFF21m/u5CN1j8CiqmuNXL9QUs8SMmDkImCPqqCzaWHlkoGfthUdx0aVRA/5WNotChUj+a317ZvSKTwisWDyDh3vnt0kjj2NMMjorY7hkzcp495vYj9ASk4yFriv1CN064PdQXH5wZ09zSsLKQAA9L8ReIv6TGJlbqf6ss5Ek07pH/j7DZiFKpK+yTE6RhCV4fWx4QvCeF9lIoYPCcMG9x8eFrDqHMBV4tA1QAoO2RuW/DPJKL4wXVo6O6+Cq0NlKPjksXXUxoMx98we/jyvLeh8/kO1mXA9fJryqmWyt2vrPX1tqM1xmF+hRNYXeBDkm/n1iTwlvtpYxX5b0ezkXe/wrui3c+qm8muZ84PiQ/Sl5wRB8akvG6sTv6LXiwvuFBePX0eJgs/IVo9bu+nj7ub5WFd3IzQkamNfH+PoV1ZnMR05aTA+nalABQ89kYty2dQ5+jfzqrEBN17pCztuk5xFLz59TP7vahvgRRgLE2EsghUD2XloqAmqlAmyDQz4Nw9T/MTB3UGpuX8ATGIpWV8lIoKh1CsDTREehGOGAss1tse11TW2TU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR11MB4454.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66446008)(64756008)(66946007)(66556008)(66476007)(33656002)(966005)(83380400001)(8676002)(76116006)(54906003)(110136005)(186003)(316002)(55016003)(86362001)(9686003)(2906002)(26005)(53546011)(6506007)(30864003)(71200400001)(7696005)(5660300002)(122000001)(38100700002)(38070700005)(508600001)(8936002)(52536014)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QiES3FKt+JvMzFIQpCA9APj9GvihEwah+U9HLjB8I58k8pdlK7lJ4miKJtpn?=
 =?us-ascii?Q?ZXQufE1LiYou32D0ekYXF54Jnv3tel939k3JHeLaVMvNwM17Fz4AtSVB0iOK?=
 =?us-ascii?Q?zcUtjjVgVpJAkRkziClkb8sBMBiP5Zkc/zXhaEtlAuZgNJpBbk2j78FY25W/?=
 =?us-ascii?Q?Q9uA7I03nAVi3aO6yYzaqlEtnTqYo5kvs6Wore6Cz4EB8TpNDEym9TrTaA61?=
 =?us-ascii?Q?WWb5munEeKLK11TJWzvtoY2ti+BfMigh9DJlYGeJOzG4zh8rYg1rgV0XAyvR?=
 =?us-ascii?Q?9MpCLzne6wJWExOFP0tbJMdEBgSAxPOsP6x9ClN9z37Ewe75lw7fdhbJtbFQ?=
 =?us-ascii?Q?9EzUPR9ERN1r7oOyxt+qe0MzCKJkoHVX/QQCgi3wv5jTnv3inSab9H+Gbsc0?=
 =?us-ascii?Q?FCNQdgpUJIM8aWZZI3+hkh44otvBYCt79xPGy2zzIggQ6CCB7GBSuI4hKowq?=
 =?us-ascii?Q?062WElidwvdel+N2qPl1AbaEp3NiwhMwdOsar0MpNUCZT7OZR2N+oXGCAnw6?=
 =?us-ascii?Q?xvecd0g4vppp54J6obMLkBEKNpwF8Y9JN4TT9phewBY4RXlsMFkHLY8WFCpq?=
 =?us-ascii?Q?l+jVjMPMeCyADbhehBysu9/g0PW55k623Ql/SXbz7zr700fnwp6KF8YAgtxw?=
 =?us-ascii?Q?4gKYh7m5G45peUZdmpcMTYcErN1K70bgev4HK2eg5dGWaxruntqkzdvQxRVL?=
 =?us-ascii?Q?lKWQ/kL+J1+AqobIOAaMJVvG0weUuze/M6KIkaFsPpaQl5wmJf5j82IAKwX1?=
 =?us-ascii?Q?cI+uEsFIn8in7O2doIYJiyZ9y67AXwUjFHRHR15X71yXunR3gRGQnntTN+8a?=
 =?us-ascii?Q?oi7+H2jmC9fxasbA6znQM6+J8y4mM2YLUhVFiNCKV4aSil1nPOj9q9wRDr7k?=
 =?us-ascii?Q?TRFg/IE2dlIuJiBCE57J3uJ9IYFAf6NOr+l+3Q/gt5i5c/runfy1m4jov/qu?=
 =?us-ascii?Q?PV9pqI0Y315ywuctmiJzFOfdsyOsuaLgiH0XHT6TwFN/MlpQ11aK5TzKNPYX?=
 =?us-ascii?Q?3+sOf6S2Ss4Qz7zRzHSKx2uYaIIP2mj3knYyp0hRkDL6qftR+ImmWlxwkdYt?=
 =?us-ascii?Q?xR2Q+1WusCBcwn0A4QWgvzAQ9TnMT1KEgjnFcmg1fr6K+xaUUKaiLIC34B7+?=
 =?us-ascii?Q?1cKvSSw4rSrfZutZZHTStaFHlhrRuX9brJm+G4qg0t2vjQPvHvi2Fcema7IK?=
 =?us-ascii?Q?kYsQbXnZnFJF+iePf+JjvdZYDiZLCeRVtVClLDdjTSNofzLZ98ucE6KFqDLf?=
 =?us-ascii?Q?PXfY8tD23KvviM6E+IewdQKd+Pj3w2CEqNW79lYud+8MWduC7YfJV04iOrOA?=
 =?us-ascii?Q?E3/yqSRyrDW7yntaEqLc8L1tnt/DI+PEYmuqdJtdK6qC4diZcZPww1B63XrR?=
 =?us-ascii?Q?s4qdiOnjJa16Q+ZCC0TZS1x17Iandof4pmTJpgwRH5NJnrnozjDAKVNB3oUt?=
 =?us-ascii?Q?wNEWo+TKNoc987+qf4Wi0opEO9L6gjXOYfB0ebgLAhhvnp12jV/aQOkH4Riu?=
 =?us-ascii?Q?An/YBAEu9juvFv2W1oVZYgmVSVJ2Oj+GpE4R27Pfr456VRk7BAeXt77WrrVs?=
 =?us-ascii?Q?+8KoUhe2P037ZYRZJWtR3SDVCaKnUFolmKi70Zfx3TNhRPrm4ULjVde8qvqP?=
 =?us-ascii?Q?+4aXIUF4v6HbAPK5Xz86OXQrzxfUb0EApx4C+y2uj50yzVgNLtwCJ3qStxWX?=
 =?us-ascii?Q?5d9XNgv1mEl/NaYpzAy0ZVybVHoWSZpsVyZKisZT+TLYNENo/CKCcg5Kdi7v?=
 =?us-ascii?Q?txB3DwsKH+Q1g4f2H255g/NuHbjeeKo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4454.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe46795-a765-468d-3b3c-08da2e051706
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 19:34:22.2188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZlSjW0EhQeEhojWYaOmoifbZX3y6EDfBED76j+rU4hfPTBEwZfv+zGeg03WfTGsHsWFMGlQBrCUiFcj6DDxhGndG2wdYTierLfMP19cApUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1507
X-Proofpoint-ORIG-GUID: b4yt-15KvmFySuw0jilPeFCl6JPCEapc
X-Proofpoint-GUID: b4yt-15KvmFySuw0jilPeFCl6JPCEapc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_05,2022-05-04_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 clxscore=1011 phishscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205040114
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=2123ef2400=guohuai.shi@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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



> -----Original Message-----
> From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Sent: Thursday, May 5, 2022 02:02
> To: qemu-devel@nongnu.org
> Cc: Greg Kurz <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>; Shi,
> Guohuai <Guohuai.Shi@windriver.com>; Bin Meng <bmeng.cn@gmail.com>
> Subject: Re: [PATCH 5/9] hw/9pfs: Add a 'local' file system backend drive=
r
> for Windows
>=20
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On Montag, 25. April 2022 16:27:01 CEST Bin Meng wrote:
> > From: Guohuai Shi <guohuai.shi@windriver.com>
> >
> > Add a 9p local file system backend driver to support Windows,
> > including open, read, write, close, rename, remove, etc.
> >
> > All security models are supported. The mapped (mapped-xattr)
> > security model is implemented using NTFS Alternate Data Stream
> > (ADS) so the 9p export path shall be on an NTFS partition.
> >
> > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/9pfs/9p-linux-errno.h |  151 +++++
> >  hw/9pfs/9p-local.h       |    4 +
> >  hw/9pfs/9p-util.h        |   41 ++
> >  hw/9pfs/9p.h             |   23 +
> >  hw/9pfs/9p-local-win32.c | 1242 ++++++++++++++++++++++++++++++++++++++
> >  hw/9pfs/9p-util-win32.c  |  303 ++++++++++
> >  hw/9pfs/9p-xattr.c       |  113 ++++
> >  hw/9pfs/9p.c             |   91 ++-
> >  hw/9pfs/codir.c          |   15 +
> >  9 files changed, 1982 insertions(+), 1 deletion(-)
> >  create mode 100644 hw/9pfs/9p-linux-errno.h
> >  create mode 100644 hw/9pfs/9p-local-win32.c
> >  create mode 100644 hw/9pfs/9p-util-win32.c
>=20
> This patch is definitely too huge and should be split up into a huge bunc=
h of
> separate patches!
>=20
> > diff --git a/hw/9pfs/9p-linux-errno.h b/hw/9pfs/9p-linux-errno.h
> > new file mode 100644
> > index 0000000000..b0d6ac45ac
> > --- /dev/null
> > +++ b/hw/9pfs/9p-linux-errno.h
>=20
> This file definitely deserves a patch on its own.
>=20
> As for its filename: Following our current filename scheme, it would prob=
ably
> be better be named 9p-errno-linux.h or 9p-errno-dotl.h as this is probabl=
y a
> 9p protocol version thing.
>=20
> > @@ -0,0 +1,151 @@
> > +/*
> > + * 9p Linux errno translation definition
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > later. + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <errno.h>
> > +
> > +#ifndef QEMU_9P_LINUX_ERRNO_H
> > +#define QEMU_9P_LINUX_ERRNO_H
> > +
> > +/*
> > + * This file contains the Linux errno definitions to translate errnos =
set
> > by + * the 9P server (running on Windows) to a corresponding errno valu=
e. +
> > *
> > + * This list should be periodically reviewed and updated; particularly=
 for
> > + * errnos that might be set as a result of a file system operation.
> > + */
> > +
>=20
> I would just import the already existing sys/errno.h from the Linux kerne=
l,
> with all its copyright header etc. and then with a 2nd patch just prefix =
the
> individual macros with DOTL_*
>=20
> > +#define L_EPERM             1   /* Operation not permitted */
> > +#define L_ENOENT            2   /* No such file or directory */
> > +#define L_ESRCH             3   /* No such process */
> > +#define L_EINTR             4   /* Interrupted system call */
> > +#define L_EIO               5   /* I/O error */
> > +#define L_ENXIO             6   /* No such device or address */
> > +#define L_E2BIG             7   /* Argument list too long */
> > +#define L_ENOEXEC           8   /* Exec format error */
> > +#define L_EBADF             9   /* Bad file number */
> > +#define L_ECHILD            10  /* No child processes */
> > +#define L_EAGAIN            11  /* Try again */
> > +#define L_ENOMEM            12  /* Out of memory */
> > +#define L_EACCES            13  /* Permission denied */
> > +#define L_EFAULT            14  /* Bad address */
> > +#define L_ENOTBLK           15  /* Block device required */
> > +#define L_EBUSY             16  /* Device or resource busy */
> > +#define L_EEXIST            17  /* File exists */
> > +#define L_EXDEV             18  /* Cross-device link */
> > +#define L_ENODEV            19  /* No such device */
> > +#define L_ENOTDIR           20  /* Not a directory */
> > +#define L_EISDIR            21  /* Is a directory */
> > +#define L_EINVAL            22  /* Invalid argument */
> > +#define L_ENFILE            23  /* File table overflow */
> > +#define L_EMFILE            24  /* Too many open files */
> > +#define L_ENOTTY            25  /* Not a typewriter */
> > +#define L_ETXTBSY           26  /* Text file busy */
> > +#define L_EFBIG             27  /* File too large */
> > +#define L_ENOSPC            28  /* No space left on device */
> > +#define L_ESPIPE            29  /* Illegal seek */
> > +#define L_EROFS             30  /* Read-only file system */
> > +#define L_EMLINK            31  /* Too many links */
> > +#define L_EPIPE             32  /* Broken pipe */
> > +#define L_EDOM              33  /* Math argument out of domain of func=
 */
> > +#define L_ERANGE            34  /* Math result not representable */
> > +#define L_EDEADLK           35  /* Resource deadlock would occur */
> > +#define L_ENAMETOOLONG      36  /* File name too long */
> > +#define L_ENOLCK            37  /* No record locks available */
> > +#define L_ENOSYS            38  /* Function not implemented */
> > +#define L_ENOTEMPTY         39  /* Directory not empty */
> > +#define L_ELOOP             40  /* Too many symbolic links encountered=
 */
> > +#define L_ENOMSG            42  /* No message of desired type */
> > +#define L_EIDRM             43  /* Identifier removed */
> > +#define L_ECHRNG            44  /* Channel number out of range */
> > +#define L_EL2NSYNC          45  /* Level 2 not synchronized */
> > +#define L_EL3HLT            46  /* Level 3 halted */
> > +#define L_EL3RST            47  /* Level 3 reset */
> > +#define L_ELNRNG            48  /* Link number out of range */
> > +#define L_EUNATCH           49  /* Protocol driver not attached */
> > +#define L_ENOCSI            50  /* No CSI structure available */
> > +#define L_EL2HLT            51  /* Level 2 halted */
> > +#define L_EBADE             52  /* Invalid exchange */
> > +#define L_EBADR             53  /* Invalid request descriptor */
> > +#define L_EXFULL            54  /* Exchange full */
> > +#define L_ENOANO            55  /* No anode */
> > +#define L_EBADRQC           56  /* Invalid request code */
> > +#define L_EBADSLT           57  /* Invalid slot */
> > +#define L_EBFONT            58  /* Bad font file format */
> > +#define L_ENOSTR            59  /* Device not a stream */
> > +#define L_ENODATA           61  /* No data available */
> > +#define L_ETIME             62  /* Timer expired */
> > +#define L_ENOSR             63  /* Out of streams resources */
> > +#define L_ENONET            64  /* Machine is not on the network */
> > +#define L_ENOPKG            65  /* Package not installed */
> > +#define L_EREMOTE           66  /* Object is remote */
> > +#define L_ENOLINK           67  /* Link has been severed */
> > +#define L_EADV              68  /* Advertise error */
> > +#define L_ESRMNT            69  /* Srmount error */
> > +#define L_ECOMM             70  /* Communication error on send */
> > +#define L_EPROTO            71  /* Protocol error */
> > +#define L_EMULTIHOP         72  /* Multihop attempted */
> > +#define L_EDOTDOT           73  /* RFS specific error */
> > +#define L_EBADMSG           74  /* Not a data message */
> > +#define L_EOVERFLOW         75  /* Value too large for defined data ty=
pe
> */
> > +#define L_ENOTUNIQ          76  /* Name not unique on network */
> > +#define L_EBADFD            77  /* File descriptor in bad state */
> > +#define L_EREMCHG           78  /* Remote address changed */
> > +#define L_ELIBACC           79  /* Can not access a needed shared libr=
ary
> > */ +#define L_ELIBBAD           80  /* Accessing a corrupted shared lib=
rary
> > */ +#define L_ELIBSCN           81  /* .lib section in a.out corrupted =
*/
> > +#define L_ELIBMAX           82  /* Attempting to link in too many shar=
ed
> > libs */ +#define L_ELIBEXEC          83  /* Cannot exec a shared librar=
y
> > directly */ +#define L_EILSEQ            84  /* Illegal byte sequence *=
/
> > +#define L_ERESTART          85  /* Interrupted system call should be
> > restarted */ +#define L_ESTRPIPE          86  /* Streams pipe error */
> > +#define L_EUSERS            87  /* Too many users */
> > +#define L_ENOTSOCK          88  /* Socket operation on non-socket */
> > +#define L_EDESTADDRREQ      89  /* Destination address required */
> > +#define L_EMSGSIZE          90  /* Message too long */
> > +#define L_EPROTOTYPE        91  /* Protocol wrong type for socket */
> > +#define L_ENOPROTOOPT       92  /* Protocol not available */
> > +#define L_EPROTONOSUPPORT   93  /* Protocol not supported */
> > +#define L_ESOCKTNOSUPPORT   94  /* Socket type not supported */
> > +#define L_EOPNOTSUPP        95  /* Operation not supported on transpor=
t
> > endpoint */ +#define L_EPFNOSUPPORT      96  /* Protocol family not
> > supported */ +#define L_EAFNOSUPPORT      97  /* Address family not
> > supported by protocol */ +#define L_EADDRINUSE        98  /* Address
> > already in use */
> > +#define L_EADDRNOTAVAIL     99  /* Cannot assign requested address */
> > +#define L_ENETDOWN          100 /* Network is down */
> > +#define L_ENETUNREACH       101 /* Network is unreachable */
> > +#define L_ENETRESET         102 /* Network dropped connection because =
of
> > reset */ +#define L_ECONNABORTED      103 /* Software caused connection
> > abort */ +#define L_ECONNRESET        104 /* Connection reset by peer *=
/
> > +#define L_ENOBUFS           105 /* No buffer space available */
> > +#define L_EISCONN           106 /* Transport endpoint is already conne=
cted
> > */ +#define L_ENOTCONN          107 /* Transport endpoint is not connec=
ted
> > */ +#define L_ESHUTDOWN         108 /* Cannot send after transport endp=
oint
> > shutdown */ +#define L_ETOOMANYREFS      109 /* Too many references: ca=
nnot
> > splice */ +#define L_ETIMEDOUT         110 /* Connection timed out */
> > +#define L_ECONNREFUSED      111 /* Connection refused */
> > +#define L_EHOSTDOWN         112 /* Host is down */
> > +#define L_EHOSTUNREACH      113 /* No route to host */
> > +#define L_EALREADY          114 /* Operation already in progress */
> > +#define L_EINPROGRESS       115 /* Operation now in progress */
> > +#define L_ESTALE            116 /* Stale NFS file handle */
> > +#define L_EUCLEAN           117 /* Structure needs cleaning */
> > +#define L_ENOTNAM           118 /* Not a XENIX named type file */
> > +#define L_ENAVAIL           119 /* No XENIX semaphores available */
> > +#define L_EISNAM            120 /* Is a named type file */
> > +#define L_EREMOTEIO         121 /* Remote I/O error */
> > +#define L_EDQUOT            122 /* Quota exceeded */
> > +#define L_ENOMEDIUM         123 /* No medium found */
> > +#define L_EMEDIUMTYPE       124 /* Wrong medium type */
> > +#define L_ECANCELED         125 /* Operation Canceled */
> > +#define L_ENOKEY            126 /* Required key not available */
> > +#define L_EKEYEXPIRED       127 /* Key has expired */
> > +#define L_EKEYREVOKED       128 /* Key has been revoked */
> > +#define L_EKEYREJECTED      129 /* Key was rejected by service */
> > +#define L_EOWNERDEAD        130 /* Owner died */
> > +#define L_ENOTRECOVERABLE   131 /* State not recoverable */
> > +
> > +#endif /* QEMU_9P_LINUX_ERRNO_H */
> > diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
> > index 55ea4b7883..4c75876e19 100644
> > --- a/hw/9pfs/9p-local.h
> > +++ b/hw/9pfs/9p-local.h
> > @@ -31,6 +31,10 @@ static inline bool
> > local_is_mapped_file_metadata(FsContext *fs_ctx,
> >
> >  int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags=
,
> >                          mode_t mode);
> > +#ifndef CONFIG_WIN32
> >  int local_opendir_nofollow(FsContext *fs_ctx, const char *path);
> > +#else
> > +DIR *local_opendir_nofollow(FsContext *fs_ctx, const char *path);
> > +#endif
> >
> >  #endif
>=20
> Same goes for all the rest ... this should all be split up into individua=
l
> patches, some of the changes of a file probably with separate patches as =
well.
> As this looks now, it's simply not clear what all these hunks of this hug=
e
> patch are needed for.
>=20
> Stopping here for now.
>=20
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > index 97e681e167..6eadb38e1d 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -43,6 +43,7 @@ static inline void close_preserve_errno(int fd)
> >      errno =3D serrno;
> >  }
> >
> > +#ifndef CONFIG_WIN32
> >  static inline int openat_dir(int dirfd, const char *name)
> >  {
> >      return openat(dirfd, name,
> > @@ -89,7 +90,9 @@ again:
> >      errno =3D serrno;
> >      return fd;
> >  }
> > +#endif /* !CONFIG_WIN32 */
> >
> > +#ifndef CONFIG_WIN32
> >  ssize_t fgetxattrat_nofollow(int dirfd, const char *path, const char *=
name,
> > void *value, size_t size);
> >  int fsetxattrat_nofollow(int dirfd, const char *path, const char *name=
,
> > @@ -98,7 +101,38 @@ ssize_t flistxattrat_nofollow(int dirfd, const char
> > *filename, char *list, size_t size);
> >  ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> >                                  const char *name);
> > +#else
> > +
> > +ssize_t fgetxattrat_nofollow(const char *dirname, const char *filename=
,
> > +                             const char *name, void *value, size_t siz=
e);
> > +int fsetxattrat_nofollow(const char *dirname, const char *filename,
> > +                         const char *name, void *value, size_t size,
> > +                         int flags);
> > +ssize_t flistxattrat_nofollow(const char *dirname, const char *filenam=
e,
> > +                              char *list, size_t size);
> > +ssize_t fremovexattrat_nofollow(const char *dirname, const char *filen=
ame,
> > +                                const char *name);
> > +
> > +int qemu_statfs(const char *fs_root, struct statfs *stbuf);
> > +
> > +static inline char *merge_fs_path(const char *path1, const char *path2=
)
> > +{
> > +    char *full_fs_path;
> > +    size_t full_fs_path_len;
> > +
> > +    full_fs_path_len =3D strlen(path1) + strlen(path2) + 2;
> > +    full_fs_path =3D g_malloc(full_fs_path_len);
> >
> > +    strcpy(full_fs_path, path1);
> > +    strcat(full_fs_path, "\\");
> > +    strcat(full_fs_path, path2);
> > +
> > +    return full_fs_path;
> > +}
> > +
> > +#endif /* !CONFIG_WIN32 */
> > +
> > +#ifndef CONFIG_WIN32
> >  /*
> >   * Darwin has d_seekoff, which appears to function similarly to d_off.
> >   * However, it does not appear to be supported on all file systems,
> > @@ -113,6 +147,7 @@ static inline off_t qemu_dirent_off(struct dirent *=
dent)
> > return dent->d_off;
> >  #endif
> >  }
> > +#endif /* !CONFIG_WIN32 */
> >
> >  /**
> >   * qemu_dirent_dup() - Duplicate directory entry @dent.
> > @@ -154,6 +189,12 @@ static inline struct dirent *qemu_dirent_dup(struc=
t
> > dirent *dent) #if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDI=
R_NP
> >  int pthread_fchdir_np(int fd) __attribute__((weak_import));
> >  #endif
> > +
> > +#ifndef CONFIG_WIN32
> >  int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t d=
ev);
> > +#else
> > +int qemu_mknodat(const char *dirname, const char *filename,
> > +                 mode_t mode, dev_t dev);
> > +#endif
> >
> >  #endif
> > diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> > index 994f952600..87e8eac840 100644
> > --- a/hw/9pfs/9p.h
> > +++ b/hw/9pfs/9p.h
> > @@ -3,13 +3,36 @@
> >
> >  #include <dirent.h>
> >  #include <utime.h>
> > +#ifndef CONFIG_WIN32
> >  #include <sys/resource.h>
> > +#endif
> >  #include "fsdev/file-op-9p.h"
> >  #include "fsdev/9p-iov-marshal.h"
> >  #include "qemu/thread.h"
> >  #include "qemu/coroutine.h"
> >  #include "qemu/qht.h"
> >
> > +#ifdef CONFIG_WIN32
> > +
> > +#define O_NOCTTY            0
> > +#define O_NDELAY            0
> > +#define O_NONBLOCK          0
> > +#define O_DSYNC             0
> > +#define O_DIRECT            0
> > +#define O_NOFOLLOW          0
> > +#define O_NOATIME           0
> > +#define O_SYNC              0
> > +#define O_ASYNC             0
> > +#define O_DIRECTORY         02000000
>=20
> Again, these are POSIX types. I don't think declaring them belongs into t=
his
> header file.
>=20
> > +
> > +#define FASYNC              0
> > +
> > +#define AT_REMOVEDIR        1
> > +
> > +#define NAME_MAX            260
> > +
> > +#endif
> > +
> >  enum {
> >      P9_TLERROR =3D 6,
> >      P9_RLERROR,
> > diff --git a/hw/9pfs/9p-local-win32.c b/hw/9pfs/9p-local-win32.c
> > new file mode 100644
> > index 0000000000..aab7c9f7b5
> > --- /dev/null
> > +++ b/hw/9pfs/9p-local-win32.c
> > @@ -0,0 +1,1242 @@
> > +/*
> > + * 9p Windows callback
> > + *
> > + * Copyright (c) 2022 Wind River Systems, Inc.
> > + *
> > + * Based on hw/9pfs/9p-local.c
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.  S=
ee
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +/*
> > + * Not so fast! You might want to read the 9p developer docs first:
> > + * https://wiki.qemu.org/Documentation/9p
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include <windows.h>
> > +#include <dirent.h>
> > +#include "9p.h"
> > +#include "9p-local.h"
> > +#include "9p-xattr.h"
> > +#include "9p-util.h"
> > +#include "fsdev/qemu-fsdev.h"   /* local_ops */
> > +#include "qapi/error.h"
> > +#include "qemu/cutils.h"
> > +#include "qemu/error-report.h"
> > +#include "qemu/option.h"
> > +#include <libgen.h>
>=20
> I'm not sure whether all of this (i.e. 9p-local-win32.c in general) is re=
ally
> needed. I mean yes, it probably does the job, but you basically add a
> complete
> separate 'local' backend implementation just for the Windows host platfor=
m.
>=20
> My expectation would be to stick to 9p-local.c being OS-agnostic, and onl=
y
> define OS-specific functionality in 9p-util-windows.c if needed.
>=20
> And most importantly: don't duplicate code as far as possible! I mean
> somebody
> would need to also review and maintain all of this.

Actually, almost all FileOperations functions are re-written for Windows ho=
st.

Here is the comparison statistics for 9p-local.c and 9p-local-win32.c:
Total lines : 1611
Changed lines: 590
Inserted lines: 138
Removed lines: 414

For function level difference count:

Changed function: 39
Unchanged function: 13

If use "#ifdef _WIN32" to sperate Windows host code, it may need to be inse=
rted about 150 code blocks (or 39 code blocks for all changed functions).

I am not sure if it is a good idea to insert so many "#ifdef _WIN32", it ma=
y cause this file not readable.

If stick to 9p-local.c being OS-agnostic, I think it is better to create tw=
o new files: 9p-local-linux.c and 9p-local-win32.c


>=20
> > +
> > +static inline int openfile_with_ctx(FsContext *fs_ctx, const char *nam=
e,
> > +                                    int flags, mode_t mode)
> > +{
> > +    char *full_file_name;
> > +    int fd;
> > +
> > +    full_file_name =3D merge_fs_path(fs_ctx->fs_root, name);
> > +    fd =3D open(full_file_name, flags | _O_BINARY, mode);
> > +    g_free(full_file_name);
> > +
> > +    return fd;
> > +}
> > +
> > +static inline DIR *opendir_with_ctx(FsContext *fs_ctx, const char *nam=
e)
> > +{
> > +    char *full_file_name;
> > +    DIR *dir;
> > +
> > +    full_file_name =3D merge_fs_path(fs_ctx->fs_root, name);
> > +    dir =3D opendir(full_file_name);
> > +    g_free(full_file_name);
> > +    return dir;
> > +}
> > +
> > +int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags=
,
> > +                        mode_t mode)
> > +{
> > +    int fd;
> > +
> > +    if (path[strlen(path) - 1] =3D=3D '/' || (flags & O_DIRECTORY) !=
=3D 0) {
> > +        /* Windows does not allow call open() for a directory */
> > +        fd =3D -1;
> > +    } else {
> > +        fd =3D openfile_with_ctx(fs_ctx, path, flags, mode);
> > +    }
> > +
> > +    return fd;
> > +}
> > +
> > +DIR *local_opendir_nofollow(FsContext *fs_ctx, const char *path)
> > +{
> > +    return opendir_with_ctx(fs_ctx, path);
> > +}
> > +
> > +static FILE *local_fopenat(const char *dirname, const char *name,
> > +                           const char *mode)
> > +{
> > +    char *full_file_name;
> > +    char modestr[3] =3D {0};
> > +    FILE *fp;
> > +
> > +    /*
> > +     * only supports two modes
> > +     */
> > +    if (mode[0] =3D=3D 'r') {
> > +        modestr[0] =3D 'r';
> > +    } else if (mode[0] =3D=3D 'w') {
> > +        modestr[0] =3D 'w';
> > +    } else {
> > +        return NULL;
> > +    }
> > +    /* Windows host needs 'b' flag */
> > +    modestr[1] =3D 'b';
> > +
> > +    full_file_name =3D merge_fs_path(dirname, name);
> > +    fp =3D fopen(full_file_name, modestr);
> > +    g_free(full_file_name);
> > +
> > +    return fp;
> > +}
> > +
> > +static void local_mapped_file_attr(const char *dirpath, const char *na=
me,
> > +                                   struct stat *stbuf)
> > +{
> > +    FILE *fp;
> > +    char buf[ATTR_MAX];
> > +    char *full_file_name;
> > +
> > +    if (strcmp(name, ".") !=3D 0) {
> > +        full_file_name =3D merge_fs_path(dirpath, VIRTFS_META_DIR);
> > +        fp =3D local_fopenat(full_file_name, name, "r");
> > +        g_free(full_file_name);
> > +    } else {
> > +        fp =3D local_fopenat(dirpath, VIRTFS_META_ROOT_FILE, "r");
> > +    }
> > +    if (!fp) {
> > +        return;
> > +    }
> > +
> > +    memset(buf, 0, ATTR_MAX);
> > +    while (fgets(buf, ATTR_MAX, fp)) {
> > +        if (!strncmp(buf, "virtfs.uid", 10)) {
> > +            stbuf->st_uid =3D atoi(buf + 11);
> > +        } else if (!strncmp(buf, "virtfs.gid", 10)) {
> > +            stbuf->st_gid =3D atoi(buf + 11);
> > +        } else if (!strncmp(buf, "virtfs.mode", 11)) {
> > +            stbuf->st_mode =3D (stbuf->st_mode & ~0777);
> > +            stbuf->st_mode |=3D (atoi(buf + 12) & 0777);
> > +        } else if (!strncmp(buf, "virtfs.rdev", 11)) {
> > +            stbuf->st_rdev =3D atoi(buf + 12);
> > +        }
> > +        memset(buf, 0, ATTR_MAX);
> > +    }
> > +    fclose(fp);
> > +}
> > +
> > +static int local_lstat(FsContext *fs_ctx, V9fsPath *fs_path, struct st=
at
> > *stbuf) +{
> > +    int err =3D -1;
> > +    char *full_dir_name, *full_file_name;
> > +    char *dirpath =3D g_path_get_dirname(fs_path->data);
> > +    char *name =3D g_path_get_basename(fs_path->data);
> > +
> > +    full_dir_name =3D merge_fs_path(fs_ctx->fs_root, dirpath);
> > +    full_file_name =3D merge_fs_path(full_dir_name, name);
> > +    err =3D stat(full_file_name, stbuf);
> > +
> > +    if (err =3D=3D 0 && strcmp(fs_path->data, ".") =3D=3D 0) {
> > +        /*
> > +         * Hard code for root directory on Windows host.
> > +         * This will root directory have a special inode number,
> > +         * then guest OS can detect it is a special directory.
> > +         */
> > +        stbuf->st_ino =3D 2;
> > +    }
> > +
> > +    if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
> > +        /* Actual credentials are part of extended attrs */
> > +        uid_t tmp_uid;
> > +        gid_t tmp_gid;
> > +        mode_t tmp_mode;
> > +        dev_t tmp_dev;
> > +
> > +        if (fgetxattrat_nofollow(full_dir_name, name, "user.virtfs.uid=
",
> > +                                 &tmp_uid, sizeof(uid_t)) > 0) {
> > +            stbuf->st_uid =3D le32_to_cpu(tmp_uid);
> > +        }
> > +        if (fgetxattrat_nofollow(full_dir_name, name, "user.virtfs.gid=
",
> > +                                 &tmp_gid, sizeof(gid_t)) > 0) {
> > +            stbuf->st_gid =3D le32_to_cpu(tmp_gid);
> > +        }
> > +        if (fgetxattrat_nofollow(full_dir_name, name, "user.virtfs.mod=
e",
> > +                                 &tmp_mode, sizeof(mode_t)) > 0) {
> > +            stbuf->st_mode =3D (stbuf->st_mode & ~0777);
> > +            stbuf->st_mode |=3D le32_to_cpu(tmp_mode);
> > +        }
> > +        if (fgetxattrat_nofollow(full_dir_name, name, "user.virtfs.rde=
v",
> > +                                 &tmp_dev, sizeof(dev_t)) > 0) {
> > +            stbuf->st_rdev =3D le64_to_cpu(tmp_dev);
> > +        }
> > +    } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > +        local_mapped_file_attr(full_dir_name, name, stbuf);
> > +    }
> > +
> > +    g_free(full_file_name);
> > +    g_free(full_dir_name);
> > +
> > +    if (err) {
> > +        goto err_out;
> > +    }
> > +
> > +err_out:
> > +    g_free(name);
> > +    g_free(dirpath);
> > +    return err;
> > +}
> > +
> > +static int local_set_mapped_file_attrat(const char *dirname, const cha=
r
> > *name, +                                        FsCred *credp)
> > +{
> > +    FILE *fp;
> > +    int ret;
> > +    char buf[ATTR_MAX];
> > +    int uid =3D -1, gid =3D -1, mode =3D -1, rdev =3D -1;
> > +    bool is_root =3D !strcmp(name, ".");
> > +    char *full_dir_name;
> > +
> > +    if (is_root) {
> > +        fp =3D local_fopenat(dirname, VIRTFS_META_ROOT_FILE, "r");
> > +        if (!fp) {
> > +            if (errno =3D=3D ENOENT) {
> > +                goto update_map_file;
> > +            } else {
> > +                return -1;
> > +            }
> > +        }
> > +    } else {
> > +        /*
> > +         * mapped-file:
> > +         *   <sub_file> attribute stored to:
> > +         *   <directory> + VIRTFS_META_DIR + <sub_file_name>
> > +         */
> > +        full_dir_name =3D merge_fs_path(dirname, VIRTFS_META_DIR);
> > +        ret =3D mkdir(full_dir_name);
> > +
> > +        if (ret < 0 && errno !=3D EEXIST) {
> > +            g_free(full_dir_name);
> > +            return -1;
> > +        }
> > +
> > +        fp =3D local_fopenat(full_dir_name, name, "r");
> > +        if (!fp) {
> > +            if (errno =3D=3D ENOENT) {
> > +                goto update_map_file;
> > +            } else {
> > +                g_free(full_dir_name);
> > +                return -1;
> > +            }
> > +        }
> > +    }
> > +
> > +    memset(buf, 0, ATTR_MAX);
> > +    while (fgets(buf, ATTR_MAX, fp)) {
> > +        if (!strncmp(buf, "virtfs.uid", 10)) {
> > +            uid =3D atoi(buf + 11);
> > +        } else if (!strncmp(buf, "virtfs.gid", 10)) {
> > +            gid =3D atoi(buf + 11);
> > +        } else if (!strncmp(buf, "virtfs.mode", 11)) {
> > +            mode =3D atoi(buf + 12);
> > +        } else if (!strncmp(buf, "virtfs.rdev", 11)) {
> > +            rdev =3D atoi(buf + 12);
> > +        }
> > +        memset(buf, 0, ATTR_MAX);
> > +    }
> > +    fclose(fp);
> > +
> > +update_map_file:
> > +    if (is_root) {
> > +        fp =3D local_fopenat(dirname, VIRTFS_META_ROOT_FILE, "w");
> > +    } else {
> > +        fp =3D local_fopenat(full_dir_name, name, "w");
> > +        g_free(full_dir_name);
> > +    }
> > +    if (!fp) {
> > +        return -1;
> > +    }
> > +
> > +    if (credp->fc_uid !=3D -1) {
> > +        uid =3D credp->fc_uid;
> > +    }
> > +    if (credp->fc_gid !=3D -1) {
> > +        gid =3D credp->fc_gid;
> > +    }
> > +    if (credp->fc_mode !=3D (mode_t)-1) {
> > +        mode =3D credp->fc_mode;
> > +    }
> > +    if (credp->fc_rdev !=3D -1) {
> > +        rdev =3D credp->fc_rdev;
> > +    }
> > +
> > +    if (uid !=3D -1) {
> > +        fprintf(fp, "virtfs.uid=3D%d\n", uid);
> > +    }
> > +    if (gid !=3D -1) {
> > +        fprintf(fp, "virtfs.gid=3D%d\n", gid);
> > +    }
> > +    if (mode !=3D -1) {
> > +        fprintf(fp, "virtfs.mode=3D%d\n", mode);
> > +    }
> > +    if (rdev !=3D -1) {
> > +        fprintf(fp, "virtfs.rdev=3D%d\n", rdev);
> > +    }
> > +    fclose(fp);
> > +
> > +    return 0;
> > +}
> > +
> > +static int local_set_xattrat(const char *dirname, const char *path,
> > +                             FsCred *credp)
> > +{
> > +    int err;
> > +
> > +    if (credp->fc_uid !=3D -1) {
> > +        uint32_t tmp_uid =3D cpu_to_le32(credp->fc_uid);
> > +        err =3D fsetxattrat_nofollow(dirname, path, "user.virtfs.uid",
> > +                                   &tmp_uid, sizeof(uid_t), 0);
> > +        if (err) {
> > +            return err;
> > +        }
> > +    }
> > +    if (credp->fc_gid !=3D -1) {
> > +        uint32_t tmp_gid =3D cpu_to_le32(credp->fc_gid);
> > +        err =3D fsetxattrat_nofollow(dirname, path, "user.virtfs.gid",
> > +                                   &tmp_gid, sizeof(gid_t), 0);
> > +        if (err) {
> > +            return err;
> > +        }
> > +    }
> > +    if (credp->fc_mode !=3D (mode_t)-1) {
> > +        uint32_t tmp_mode =3D cpu_to_le32(credp->fc_mode);
> > +        err =3D fsetxattrat_nofollow(dirname, path, "user.virtfs.mode"=
,
> > +                                   &tmp_mode, sizeof(mode_t), 0);
> > +        if (err) {
> > +            return err;
> > +        }
> > +    }
> > +    if (credp->fc_rdev !=3D -1) {
> > +        uint64_t tmp_rdev =3D cpu_to_le64(credp->fc_rdev);
> > +        err =3D fsetxattrat_nofollow(dirname, path, "user.virtfs.rdev"=
,
> > +                                   &tmp_rdev, sizeof(dev_t), 0);
> > +        if (err) {
> > +            return err;
> > +        }
> > +    }
> > +    return 0;
> > +}
> > +
> > +static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
> > +                              char *buf, size_t bufsz)
> > +{
> > +    return -1;
> > +}
> > +
> > +static int local_close(FsContext *ctx, V9fsFidOpenState *fs)
> > +{
> > +    return close(fs->fd);
> > +}
> > +
> > +static int local_closedir(FsContext *ctx, V9fsFidOpenState *fs)
> > +{
> > +    return closedir(fs->dir.stream);
> > +}
> > +
> > +static int local_open(FsContext *ctx, V9fsPath *fs_path,
> > +                      int flags, V9fsFidOpenState *fs)
> > +{
> > +    int fd;
> > +
> > +    fd =3D local_open_nofollow(ctx, fs_path->data, flags, 0);
> > +    if (fd =3D=3D -1) {
> > +        return -1;
> > +    }
> > +    fs->fd =3D fd;
> > +    return fs->fd;
> > +}
> > +
> > +static int local_opendir(FsContext *ctx,
> > +                         V9fsPath *fs_path, V9fsFidOpenState *fs)
> > +{
> > +    DIR *stream;
> > +    char *full_file_name;
> > +
> > +    full_file_name =3D merge_fs_path(ctx->fs_root, fs_path->data);
> > +    stream =3D opendir(full_file_name);
> > +    g_free(full_file_name);
> > +
> > +    if (!stream) {
> > +        return -1;
> > +    }
> > +
> > +    fs->dir.stream =3D stream;
> > +    return 0;
> > +}
> > +
> > +static void local_rewinddir(FsContext *ctx, V9fsFidOpenState *fs)
> > +{
> > +    rewinddir(fs->dir.stream);
> > +}
> > +
> > +static off_t local_telldir(FsContext *ctx, V9fsFidOpenState *fs)
> > +{
> > +    return telldir(fs->dir.stream);
> > +}
> > +
> > +static struct dirent *local_readdir(FsContext *ctx, V9fsFidOpenState *=
fs)
> > +{
> > +    struct dirent *entry;
> > +
> > +again:
> > +    entry =3D readdir(fs->dir.stream);
> > +    if (!entry) {
> > +        return NULL;
> > +    }
> > +
> > +    if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > +        if (local_is_mapped_file_metadata(ctx, entry->d_name)) {
> > +            /* skip the meta data */
> > +            goto again;
> > +        }
> > +    }
> > +
> > +    return entry;
> > +}
> > +
> > +static void local_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t =
off)
> > +{
> > +    off_t count;
> > +    struct dirent *findentry;
> > +    struct dirent *entry;
> > +    size_t namelen[3] =3D {0};
> > +    off_t direntoff[3] =3D {-1, -1, -1};
> > +    char *d_name[3];
> > +    int i;
> > +
> > +    /*
> > +     * MinGW's seekdir() requires directory is not modified. If guest =
OS
> is
> > +     * modifying the directory when calling seekdir(), e.g.: "rm -rf *=
", +
> >     * then MinGW's seekdir() will seek to a wrong offset.
> > +     *
> > +     * This function saves some old offset directory entry name,
> > +     * and lookup current entry again, and compare the offset.
> > +     *
> > +     * If new offset is less than old offset, that means someone is
> > deleting +     * files in the directory, thus we need to seek offset
> > backward. +     *
> > +     * If new offset is larger than old offset, that means someone is
> > creating +     * files in the directory, thus we need to seek offset
> > forward. +     */
> > +
> > +    direntoff[0] =3D telldir(fs->dir.stream);
> > +
> > +    /* do nothing if current offset is 0 or EOF */
> > +    if (direntoff[0] =3D=3D 0 || direntoff[0] < 0) {
> > +        seekdir(fs->dir.stream, off);
> > +        return ;
> > +    }
> > +
> > +    d_name[0] =3D g_malloc0(sizeof(entry->d_name) * 3);
> > +    d_name[1] =3D d_name[0] + sizeof(entry->d_name);
> > +    d_name[2] =3D d_name[1] + sizeof(entry->d_name);
> > +
> > +    /* save 3 nearest entries and offsets */
> > +    for (i =3D 0; i < 3; i++) {
> > +        entry =3D &fs->dir.stream->dd_dir;
> > +
> > +        memcpy(d_name[i], entry->d_name, entry->d_namlen);
> > +        namelen[i] =3D strlen(d_name[i]) + 1;
> > +
> > +        direntoff[i] =3D telldir(fs->dir.stream);
> > +
> > +        entry =3D readdir(fs->dir.stream);
> > +        if (entry =3D=3D NULL) {
> > +            break;
> > +        }
> > +    }
> > +
> > +    /* lookup saved entries again */
> > +    for (i =3D 0; i < 3 && direntoff[i] !=3D -1; i++) {
> > +        rewinddir(fs->dir.stream);
> > +        count =3D 0;
> > +        while ((findentry =3D readdir(fs->dir.stream)) !=3D NULL) {
> > +            count++;
> > +
> > +            if (memcmp(findentry->d_name, d_name[i], namelen[i]) =3D=
=3D 0) {
> > +                if (count + i =3D=3D direntoff[i]) {
> > +                    seekdir(fs->dir.stream, off);
> > +                    goto out;
> > +                } else if (count + i < direntoff[i]) {
> > +                    off =3D off - (direntoff[i] - count) - i;
> > +                    if (off <=3D 0) {
> > +                        off =3D 0;
> > +                    }
> > +                    seekdir(fs->dir.stream, off);
> > +                    goto out;
> > +                } else {
> > +                    off =3D off + (count - direntoff[i]) - i;
> > +                    seekdir(fs->dir.stream, off);
> > +                    goto out;
> > +                }
> > +            }
> > +        }
> > +    }
> > +    /* can not get anything, seek backward */
> > +    off =3D off - 1;
> > +
> > +    seekdir(fs->dir.stream, off);
> > +out:
> > +    g_free(d_name[0]);
> > +    return ;
> > +}
> > +
> > +static ssize_t local_preadv(FsContext *ctx, V9fsFidOpenState *fs,
> > +                            const struct iovec *iov,
> > +                            int iovcnt, off_t offset)
> > +{
> > +#ifdef CONFIG_PREADV
> > +    return preadv(fs->fd, iov, iovcnt, offset);
> > +#else
> > +    int err =3D lseek(fs->fd, offset, SEEK_SET);
> > +    if (err =3D=3D -1) {
> > +        return err;
> > +    } else {
> > +        return readv(fs->fd, iov, iovcnt);
> > +    }
> > +#endif
> > +}
> > +
> > +static ssize_t local_pwritev(FsContext *ctx, V9fsFidOpenState *fs,
> > +                             const struct iovec *iov,
> > +                             int iovcnt, off_t offset)
> > +{
> > +    ssize_t ret;
> > +#ifdef CONFIG_PREADV
> > +    ret =3D pwritev(fs->fd, iov, iovcnt, offset);
> > +#else
> > +    int err =3D lseek(fs->fd, offset, SEEK_SET);
> > +    if (err =3D=3D -1) {
> > +        return err;
> > +    } else {
> > +        ret =3D writev(fs->fd, iov, iovcnt);
> > +    }
> > +#endif
> > +#ifdef CONFIG_SYNC_FILE_RANGE
> > +    if (ret > 0 && ctx->export_flags & V9FS_IMMEDIATE_WRITEOUT) {
> > +        /*
> > +         * Initiate a writeback. This is not a data integrity sync.
> > +         * We want to ensure that we don't leave dirty pages in the ca=
che
> > +         * after write when writeout=3Dimmediate is sepcified.
> > +         */
> > +        sync_file_range(fs->fd, offset, ret,
> > +                        SYNC_FILE_RANGE_WAIT_BEFORE |
> > SYNC_FILE_RANGE_WRITE); +    }
> > +#endif
> > +    return ret;
> > +}
> > +
> > +static int local_chmod(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *c=
redp)
> > +{
> > +    char *dirpath =3D g_path_get_dirname(fs_path->data);
> > +    char *name =3D g_path_get_basename(fs_path->data);
> > +    int ret =3D -1;
> > +    char *full_file_name =3D NULL;
> > +    DIR *dir;
> > +    dir =3D local_opendir_nofollow(fs_ctx, dirpath);
> > +    if (dir =3D=3D NULL) {
> > +        goto out;
> > +    }
> > +    full_file_name =3D merge_fs_path(fs_ctx->fs_root, dirpath);
> > +
> > +    if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
> > +        ret =3D local_set_xattrat(full_file_name, name, credp);
> > +    } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > +        ret =3D local_set_mapped_file_attrat(full_file_name, name, cre=
dp);
> > +    } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> > +               fs_ctx->export_flags & V9FS_SM_NONE) {
> > +        ret =3D -1;
> > +        errno =3D ENOTSUP;
> > +    }
> > +    closedir(dir);
> > +
> > +out:
> > +    if (full_file_name !=3D NULL) {
> > +        g_free(full_file_name);
> > +    }
> > +
> > +    g_free(dirpath);
> > +    g_free(name);
> > +    return ret;
> > +}
> > +
> > +static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
> > +                       const char *name, FsCred *credp)
> > +{
> > +    return -1;
> > +}
> > +
> > +static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
> > +                       const char *name, FsCred *credp)
> > +{
> > +    int err =3D -1;
> > +    char *full_file_name;
> > +    char *full_dir_name;
> > +    DIR *dir;
> > +
> > +    if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > +        local_is_mapped_file_metadata(fs_ctx, name)) {
> > +        errno =3D EINVAL;
> > +        return -1;
> > +    }
> > +
> > +    dir =3D local_opendir_nofollow(fs_ctx, dir_path->data);
> > +    if (dir =3D=3D NULL) {
> > +        return -1;
> > +    }
> > +    closedir(dir);
> > +
> > +    full_dir_name =3D merge_fs_path(fs_ctx->fs_root, dir_path->data);
> > +    full_file_name =3D merge_fs_path(full_dir_name, name);
> > +
> > +    if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
> > +        fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > +        err =3D mkdir(full_file_name);
> > +        if (err =3D=3D -1) {
> > +            goto out;
> > +        }
> > +        credp->fc_mode =3D credp->fc_mode;
> > +
> > +        if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
> > +            err =3D local_set_xattrat(full_dir_name, name, credp);
> > +        } else {
> > +            err =3D local_set_mapped_file_attrat(full_dir_name, name, =
credp);
> > +        }
> > +        if (err =3D=3D -1) {
> > +            rmdir(full_file_name);
> > +        }
> > +    } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
> > +               fs_ctx->export_flags & V9FS_SM_NONE) {
> > +        err =3D mkdir(full_file_name);
> > +        if (err =3D=3D -1) {
> > +            goto out;
> > +        }
> > +        /* Windows does not support chmod, do nothing here */
> > +    }
> > +
> > +    goto out;
> > +
> > +out:
> > +    g_free(full_dir_name);
> > +    g_free(full_file_name);
> > +    return err;
> > +}
> > +
> > +static int local_fstat(FsContext *fs_ctx, int fid_type,
> > +                       V9fsFidOpenState *fs, struct stat *stbuf)
> > +{
> > +
> > +    int err, fd;
> > +    char filename[NAME_MAX];
> > +    char *dirpath;
> > +    char *name;
> > +    HANDLE hFile;
> > +    DWORD dwRet;
> > +
> > +    if (fid_type =3D=3D P9_FID_DIR) {
> > +        /* Windows does not support open directory */
> > +        return -1;
> > +    } else {
> > +        fd =3D fs->fd;
> > +    }
> > +
> > +    err =3D fstat(fd, stbuf);
> > +    if (err) {
> > +        return err;
> > +    }
> > +
> > +    /* get real file name by fd */
> > +    hFile =3D (HANDLE)_get_osfhandle(fd);
> > +    dwRet =3D GetFinalPathNameByHandle(hFile, filename, sizeof(filenam=
e), 0);
> > +
> > +    if (dwRet >=3D NAME_MAX) {
> > +        return -1;
> > +    }
> > +    /* skip string "\\\\?\\" return from GetFinalPathNameByHandle() */
> > +    memmove(filename, filename + 4, NAME_MAX - 4);
> > +
> > +    dirpath =3D g_path_get_dirname(filename);
> > +    name =3D g_path_get_basename(filename);
> > +
> > +    if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
> > +        /* Actual credentials are part of extended attrs */
> > +        uid_t tmp_uid;
> > +        gid_t tmp_gid;
> > +        mode_t tmp_mode;
> > +        dev_t tmp_dev;
> > +
> > +        if (fgetxattrat_nofollow(dirpath, name, "user.virtfs.uid",
> > +                                 &tmp_uid, sizeof(uid_t)) > 0) {
> > +            stbuf->st_uid =3D le32_to_cpu(tmp_uid);
> > +        }
> > +        if (fgetxattrat_nofollow(dirpath, name, "user.virtfs.gid",
> > +                                 &tmp_gid, sizeof(gid_t)) > 0) {
> > +            stbuf->st_gid =3D le32_to_cpu(tmp_gid);
> > +        }
> > +        if (fgetxattrat_nofollow(dirpath, name, "user.virtfs.mode",
> > +                                 &tmp_mode, sizeof(mode_t)) > 0) {
> > +            stbuf->st_mode =3D (stbuf->st_mode & ~0777);
> > +            stbuf->st_mode |=3D le32_to_cpu(tmp_mode);
> > +        }
> > +        if (fgetxattrat_nofollow(dirpath, name, "user.virtfs.rdev",
> > +                                 &tmp_dev, sizeof(dev_t)) > 0) {
> > +            stbuf->st_rdev =3D le64_to_cpu(tmp_dev);
> > +        }
> > +    } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > +        errno =3D EOPNOTSUPP;
> > +        g_free(dirpath);
> > +        g_free(name);
> > +        return -1;
> > +    }
> > +
> > +    g_free(dirpath);
> > +    g_free(name);
> > +
> > +    return err;
> > +}
> > +
> > +static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const ch=
ar
> > *name, +                       int flags, FsCred *credp, V9fsFidOpenSta=
te
> > *fs) +{
> > +    int fd =3D -1;
> > +    int err =3D -1;
> > +    char *full_file_name;
> > +
> > +    if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > +        local_is_mapped_file_metadata(fs_ctx, name)) {
> > +        errno =3D EINVAL;
> > +        return -1;
> > +    }
> > +
> > +    full_file_name =3D merge_fs_path(dir_path->data, name);
> > +    fd =3D openfile_with_ctx(fs_ctx, full_file_name, flags, credp->fc_=
mode);
> > +    g_free(full_file_name);
> > +
> > +    err =3D fd;
> > +    fs->fd =3D fd;
> > +    goto out;
> > +
> > +    close_preserve_errno(fd);
> > +out:
> > +    return err;
> > +}
> > +
> > +
> > +static int local_symlink(FsContext *fs_ctx, const char *oldpath,
> > +                         V9fsPath *dir_path, const char *name, FsCred
> > *credp) +{
> > +    return -1;
> > +}
> > +
> > +static int local_link(FsContext *ctx, V9fsPath *oldpath,
> > +                      V9fsPath *dirpath, const char *name)
> > +{
> > +    return -1;
> > +}
> > +
> > +static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t siz=
e)
> > +{
> > +    int fd, ret;
> > +
> > +    fd =3D local_open_nofollow(ctx, fs_path->data, O_WRONLY, 0);
> > +    if (fd =3D=3D -1) {
> > +        return -1;
> > +    }
> > +    ret =3D ftruncate(fd, size);
> > +    close_preserve_errno(fd);
> > +    return ret;
> > +}
> > +
> > +static int local_chown(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *c=
redp)
> > +{
> > +    char *full_file_name;
> > +    char *dirpath =3D g_path_get_dirname(fs_path->data);
> > +    char *name =3D g_path_get_basename(fs_path->data);
> > +    int ret =3D -1;
> > +    DIR *dir;
> > +
> > +    dir =3D local_opendir_nofollow(fs_ctx, dirpath);
> > +    if (dir =3D=3D NULL) {
> > +        goto out;
> > +    }
> > +    full_file_name =3D merge_fs_path(fs_ctx->fs_root, dirpath);
> > +
> > +    if ((credp->fc_uid =3D=3D -1 && credp->fc_gid =3D=3D -1) ||
> > +        (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
> > +        (fs_ctx->export_flags & V9FS_SM_NONE)) {
> > +        /* Windows does not support chown() */
> > +        ret =3D -1;
> > +        errno =3D ENOTSUP;
> > +    } else if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
> > +        ret =3D local_set_xattrat(full_file_name, name, credp);
> > +    } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > +        ret =3D local_set_mapped_file_attrat(full_file_name, name, cre=
dp);
> > +    }
> > +    g_free(full_file_name);
> > +    closedir(dir);
> > +out:
> > +    g_free(name);
> > +    g_free(dirpath);
> > +    return ret;
> > +}
> > +
> > +static int local_utimensat(FsContext *s, V9fsPath *fs_path,
> > +                           const struct timespec *buf)
> > +{
> > +    struct utimbuf tm;
> > +    char *full_file_name;
> > +    int err;
> > +
> > +    tm.actime =3D buf[0].tv_sec;
> > +    tm.modtime =3D buf[1].tv_sec;
> > +
> > +    full_file_name =3D merge_fs_path(s->fs_root, fs_path->data);
> > +    err =3D utime(full_file_name, &tm);
> > +    g_free(full_file_name);
> > +
> > +    return err;
> > +}
> > +
> > +static int local_unlinkat_common(FsContext *ctx, const char *dirname,
> > +                                 const char *name, int flags)
> > +{
> > +    int ret;
> > +    char *full_file_name;
> > +    char *full_dir_name;
> > +
> > +    full_dir_name =3D merge_fs_path(ctx->fs_root, dirname);
> > +    full_file_name =3D merge_fs_path(full_dir_name, name);
> > +
> > +    if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > +        char *full_meta_dir_name;
> > +        char *full_meta_file_name;
> > +
> > +        /*
> > +         * We need to remove the metadata as well:
> > +         * - the metadata directory if we're removing a directory
> > +         * - the metadata file in the parent's metadata directory
> > +         *
> > +         * If any of these are missing (ie, ENOENT) then we're probabl=
y
> > +         * trying to remove something that wasn't created in mapped-fi=
le
> > +         * mode. We just ignore the error.
> > +         */
> > +
> > +        if ((flags & AT_REMOVEDIR) !=3D 0) {
> > +            full_meta_dir_name =3D merge_fs_path(full_file_name,
> > VIRTFS_META_DIR); +            ret =3D rmdir(full_meta_dir_name);
> > +            g_free(full_meta_dir_name);
> > +
> > +            if (ret < 0 && errno !=3D ENOENT) {
> > +                g_free(full_file_name);
> > +                g_free(full_dir_name);
> > +                return -1;
> > +            }
> > +        }
> > +
> > +        full_meta_dir_name =3D merge_fs_path(full_dir_name, VIRTFS_MET=
A_DIR);
> > +        full_meta_file_name =3D merge_fs_path(full_meta_dir_name, name=
); +
> >      ret =3D remove(full_meta_file_name);
> > +        g_free(full_meta_dir_name);
> > +        g_free(full_meta_file_name);
> > +
> > +        if (ret < 0 && errno !=3D ENOENT) {
> > +            g_free(full_dir_name);
> > +            g_free(full_file_name);
> > +
> > +            return -1;
> > +        }
> > +    }
> > +
> > +    if ((flags & AT_REMOVEDIR) !=3D 0) {
> > +        ret =3D rmdir(full_file_name);
> > +    } else {
> > +        ret =3D remove(full_file_name);
> > +    }
> > +
> > +    g_free(full_dir_name);
> > +    g_free(full_file_name);
> > +
> > +    return ret;
> > +}
> > +
> > +static int local_remove(FsContext *ctx, const char *path)
> > +{
> > +    int err;
> > +    DIR *stream;
> > +    char *full_file_name;
> > +    char *dirpath =3D g_path_get_dirname(path);
> > +    char *name =3D g_path_get_basename(path);
> > +    int flags =3D 0;
> > +
> > +    full_file_name =3D merge_fs_path(ctx->fs_root, path);
> > +    stream =3D opendir(full_file_name);
> > +    if (stream !=3D NULL) {
> > +        closedir(stream);
> > +        flags |=3D AT_REMOVEDIR;
> > +    }
> > +    err =3D local_unlinkat_common(ctx, dirpath, name, flags);
> > +
> > +    g_free(name);
> > +    g_free(dirpath);
> > +    g_free(full_file_name);
> > +    return err;
> > +}
> > +
> > +static int local_fsync(FsContext *ctx, int fid_type,
> > +                       V9fsFidOpenState *fs, int datasync)
> > +{
> > +    if (fid_type !=3D P9_FID_DIR) {
> > +        return _commit(fs->fd);
> > +    }
> > +    return 0;
> > +}
> > +
> > +static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs
> > *stbuf) +{
> > +    int ret;
> > +    ret =3D qemu_statfs(s->fs_root, stbuf);
> > +    if (ret =3D=3D 0) {
> > +        /* use context address as fsid */
> > +        memcpy(&stbuf->f_fsid, s, sizeof(long));
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static ssize_t local_lgetxattr(FsContext *ctx, V9fsPath *fs_path,
> > +                               const char *name, void *value, size_t s=
ize)
> > +{
> > +    return -1;
> > +}
> > +
> > +static ssize_t local_llistxattr(FsContext *ctx, V9fsPath *fs_path,
> > +                                void *value, size_t size)
> > +{
> > +    return -1;
> > +}
> > +
> > +static int local_lsetxattr(FsContext *ctx, V9fsPath *fs_path, const ch=
ar
> > *name, +                           void *value, size_t size, int flags)
> > +{
> > +    return -1;
> > +}
> > +
> > +static int local_lremovexattr(FsContext *ctx, V9fsPath *fs_path,
> > +                              const char *name)
> > +{
> > +    return -1;
> > +}
> > +
> > +static int local_name_to_path(FsContext *ctx, V9fsPath *dir_path,
> > +                              const char *name, V9fsPath *target)
> > +{
> > +    if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > +        local_is_mapped_file_metadata(ctx, name)) {
> > +        errno =3D EINVAL;
> > +        return -1;
> > +    }
> > +
> > +    if (dir_path) {
> > +        if (!strcmp(name, ".")) {
> > +            /* "." relative to "foo/bar" is "foo/bar" */
> > +            v9fs_path_copy(target, dir_path);
> > +        } else if (!strcmp(name, "..")) {
> > +            if (!strcmp(dir_path->data, ".")) {
> > +                /* ".." relative to the root is "." */
> > +                v9fs_path_sprintf(target, ".");
> > +            } else {
> > +                char *tmp =3D g_path_get_dirname(dir_path->data);
> > +                /*
> > +                 * Symbolic links are resolved by the client. We can
> assume
> > +                 * that ".." relative to "foo/bar" is equivalent to "f=
oo"
> > +                 */
> > +                v9fs_path_sprintf(target, "%s", tmp);
> > +                g_free(tmp);
> > +            }
> > +        } else {
> > +            assert(!strchr(name, '/'));
> > +            v9fs_path_sprintf(target, "%s/%s", dir_path->data, name);
> > +        }
> > +    } else if (!strcmp(name, "/") || !strcmp(name, ".") ||
> > +               !strcmp(name, "..")) {
> > +            /* This is the root fid */
> > +        v9fs_path_sprintf(target, ".");
> > +    } else {
> > +        assert(!strchr(name, '/'));
> > +        v9fs_path_sprintf(target, "./%s", name);
> > +    }
> > +    return 0;
> > +}
> > +
> > +static int local_renameat(FsContext *ctx, V9fsPath *olddir,
> > +                          const char *old_name, V9fsPath *newdir,
> > +                          const char *new_name)
> > +{
> > +    return -1;
> > +}
> > +
> > +static int local_rename(FsContext *ctx, const char *oldpath,
> > +                        const char *newpath)
> > +{
> > +    int err;
> > +
> > +    char *full_old_name;
> > +    char *full_new_name;
> > +
> > +    full_old_name =3D merge_fs_path(ctx->fs_root, oldpath);
> > +    full_new_name =3D merge_fs_path(ctx->fs_root, newpath);
> > +
> > +    err =3D rename(full_old_name, full_new_name);
> > +
> > +    g_free(full_old_name);
> > +    g_free(full_new_name);
> > +
> > +    return err;
> > +}
> > +
> > +static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
> > +                          const char *name, int flags)
> > +{
> > +    int ret;
> > +
> > +    if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
> > +        local_is_mapped_file_metadata(ctx, name)) {
> > +        errno =3D EINVAL;
> > +        return -1;
> > +    }
> > +
> > +    ret =3D local_unlinkat_common(ctx, dir->data, name, flags);
> > +
> > +    return ret;
> > +}
> > +
> > +static int check_filesystem_type(char *fs_root, int export_flags)
> > +{
> > +    HANDLE hFile;
> > +    wchar_t FsName[MAX_PATH + 1] =3D {0};
> > +    wchar_t NtfsName[5] =3D {'N', 'T', 'F', 'S'};
> > +
> > +    if ((export_flags & V9FS_SM_MAPPED) =3D=3D 0) {
> > +        return 0;
> > +    }
> > +
> > +    hFile =3D CreateFile(fs_root, GENERIC_READ, FILE_SHARE_READ, NULL,
> > +                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL=
);
> > +    if (hFile =3D=3D INVALID_HANDLE_VALUE) {
> > +        return -1;
> > +    }
> > +
> > +    /* Get file system type name */
> > +    if (GetVolumeInformationByHandleW(hFile, NULL, 0, NULL, NULL, NULL=
,
> > +                                      FsName, MAX_PATH + 1) =3D=3D 0) =
{
> > +        CloseHandle(hFile);
> > +        return -1;
> > +    }
> > +    CloseHandle(hFile);
> > +
> > +    if (wcscmp(FsName, NtfsName) !=3D 0) {
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int local_init(FsContext *ctx, Error **errp)
> > +{
> > +    LocalData *data =3D g_malloc(sizeof(*data));
> > +
> > +    struct stat StatBuf;
> > +
> > +    if (stat(ctx->fs_root, &StatBuf) !=3D 0) {
> > +        error_setg_errno(errp, errno, "failed to open '%s'", ctx->fs_r=
oot);
> > +        goto err;
> > +    }
> > +
> > +    /*
> > +     * security_model=3Dmapped(-xattr) requires a fileystem on Windows=
 that
> > +     * supports Alternate Data Stream (ADS). NTFS is one of them, and =
is
> > +     * probably most popular on Windows. It is fair enough to assume
> > +     * Windows users to use NTFS for the mapped security model.
> > +     */
> > +    if (check_filesystem_type(ctx->fs_root, ctx->export_flags) !=3D 0)=
 {
> > +        error_setg_errno(errp, EINVAL, "require NTFS file system when =
"
> > +                         "security_model is mapped or mapped-xattr");
> > +        goto err;
> > +    }
> > +
> > +    if (ctx->export_flags & V9FS_SM_PASSTHROUGH) {
> > +        ctx->xops =3D passthrough_xattr_ops;
> > +    } else if (ctx->export_flags & V9FS_SM_MAPPED) {
> > +        ctx->xops =3D mapped_xattr_ops;
> > +    } else if (ctx->export_flags & V9FS_SM_NONE) {
> > +        ctx->xops =3D none_xattr_ops;
> > +    } else if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > +        /*
> > +         * xattr operation for mapped-file and passthrough
> > +         * remain same.
> > +         */
> > +        ctx->xops =3D passthrough_xattr_ops;
> > +    }
> > +    ctx->export_flags |=3D V9FS_PATHNAME_FSCONTEXT;
> > +
> > +    ctx->private =3D data;
> > +    return 0;
> > +
> > +err:
> > +    g_free(data);
> > +    return -1;
> > +}
> > +
> > +static void local_cleanup(FsContext *ctx)
> > +{
> > +    LocalData *data =3D ctx->private;
> > +
> > +    if (!data) {
> > +        return;
> > +    }
> > +
> > +    close(data->mountfd);
> > +    g_free(data);
> > +}
> > +
> > +static void error_append_security_model_hint(Error *const *errp)
> > +{
> > +    error_append_hint(errp, "Valid options are: security_model=3D"
> > +                      "[passthrough|mapped-xattr|mapped-file|none]\n")=
;
> > +}
> > +
> > +static int local_parse_opts(QemuOpts *opts, FsDriverEntry *fse, Error
> > **errp) +{
> > +    ERRP_GUARD();
> > +    const char *sec_model =3D qemu_opt_get(opts, "security_model");
> > +    const char *path =3D qemu_opt_get(opts, "path");
> > +    const char *multidevs =3D qemu_opt_get(opts, "multidevs");
> > +
> > +    if (!sec_model) {
> > +        error_setg(errp, "security_model property not set");
> > +        error_append_security_model_hint(errp);
> > +        return -1;
> > +    }
> > +
> > +    if (!strcmp(sec_model, "passthrough")) {
> > +        fse->export_flags |=3D V9FS_SM_PASSTHROUGH;
> > +    } else if (!strcmp(sec_model, "mapped") ||
> > +               !strcmp(sec_model, "mapped-xattr")) {
> > +        fse->export_flags |=3D V9FS_SM_MAPPED;
> > +    } else if (!strcmp(sec_model, "none")) {
> > +        fse->export_flags |=3D V9FS_SM_NONE;
> > +    } else if (!strcmp(sec_model, "mapped-file")) {
> > +        fse->export_flags |=3D V9FS_SM_MAPPED_FILE;
> > +    } else {
> > +        error_setg(errp, "invalid security_model property '%s'",
> > sec_model); +        error_append_security_model_hint(errp);
> > +        return -1;
> > +    }
> > +
> > +    if (multidevs) {
> > +        if (!strcmp(multidevs, "remap")) {
> > +            fse->export_flags &=3D ~V9FS_FORBID_MULTIDEVS;
> > +            fse->export_flags |=3D V9FS_REMAP_INODES;
> > +        } else if (!strcmp(multidevs, "forbid")) {
> > +            fse->export_flags &=3D ~V9FS_REMAP_INODES;
> > +            fse->export_flags |=3D V9FS_FORBID_MULTIDEVS;
> > +        } else if (!strcmp(multidevs, "warn")) {
> > +            fse->export_flags &=3D ~V9FS_FORBID_MULTIDEVS;
> > +            fse->export_flags &=3D ~V9FS_REMAP_INODES;
> > +        } else {
> > +            error_setg(errp, "invalid multidevs property '%s'",
> > +                       multidevs);
> > +            error_append_hint(errp, "Valid options are: multidevs=3D"
> > +                              "[remap|forbid|warn]\n");
> > +            return -1;
> > +        }
> > +    }
> > +
> > +    if (!path) {
> > +        error_setg(errp, "path property not set");
> > +        return -1;
> > +    }
> > +
> > +    if (fsdev_throttle_parse_opts(opts, &fse->fst, errp)) {
> > +        error_prepend(errp, "invalid throttle configuration: ");
> > +        return -1;
> > +    }
> > +
> > +    if (fse->export_flags & V9FS_SM_MAPPED ||
> > +        fse->export_flags & V9FS_SM_MAPPED_FILE) {
> > +        fse->fmode =3D
> > +            qemu_opt_get_number(opts, "fmode", SM_LOCAL_MODE_BITS) & 0=
777;
> > +        fse->dmode =3D
> > +            qemu_opt_get_number(opts, "dmode", SM_LOCAL_DIR_MODE_BITS)=
 &
> > 0777; +    } else {
> > +        if (qemu_opt_find(opts, "fmode")) {
> > +            error_setg(errp, "fmode is only valid for mapped security
> > modes"); +            return -1;
> > +        }
> > +        if (qemu_opt_find(opts, "dmode")) {
> > +            error_setg(errp, "dmode is only valid for mapped security
> > modes"); +            return -1;
> > +        }
> > +    }
> > +
> > +    fse->path =3D g_strdup(path);
> > +
> > +    return 0;
> > +}
> > +
> > +FileOperations local_ops =3D {
> > +    .parse_opts =3D local_parse_opts,
> > +    .init  =3D local_init,
> > +    .cleanup =3D local_cleanup,
> > +    .lstat =3D local_lstat,
> > +    .readlink =3D local_readlink,
> > +    .close =3D local_close,
> > +    .closedir =3D local_closedir,
> > +    .open =3D local_open,
> > +    .opendir =3D local_opendir,
> > +    .rewinddir =3D local_rewinddir,
> > +    .telldir =3D local_telldir,
> > +    .readdir =3D local_readdir,
> > +    .seekdir =3D local_seekdir,
> > +    .preadv =3D local_preadv,
> > +    .pwritev =3D local_pwritev,
> > +    .chmod =3D local_chmod,
> > +    .mknod =3D local_mknod,
> > +    .mkdir =3D local_mkdir,
> > +    .fstat =3D local_fstat,
> > +    .open2 =3D local_open2,
> > +    .symlink =3D local_symlink,
> > +    .link =3D local_link,
> > +    .truncate =3D local_truncate,
> > +    .rename =3D local_rename,
> > +    .chown =3D local_chown,
> > +    .utimensat =3D local_utimensat,
> > +    .remove =3D local_remove,
> > +    .fsync =3D local_fsync,
> > +    .statfs =3D local_statfs,
> > +    .lgetxattr =3D local_lgetxattr,
> > +    .llistxattr =3D local_llistxattr,
> > +    .lsetxattr =3D local_lsetxattr,
> > +    .lremovexattr =3D local_lremovexattr,
> > +    .name_to_path =3D local_name_to_path,
> > +    .renameat  =3D local_renameat,
> > +    .unlinkat =3D local_unlinkat,
> > +};
> > diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
> > new file mode 100644
> > index 0000000000..d9b35e7425
> > --- /dev/null
> > +++ b/hw/9pfs/9p-util-win32.c
> > @@ -0,0 +1,303 @@
> > +/*
> > + * 9p utilities (Windows Implementation)
> > + *
> > + * Copyright (c) 2022 Wind River Systems, Inc.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > later. + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "qemu/error-report.h"
> > +#include "9p.h"
> > +#include "9p-util.h"
> > +#include "9p-linux-errno.h"
> > +#include <windows.h>
> > +#include <dirent.h>
> > +
> > +#ifndef V9FS_MAGIC
> > +#define V9FS_MAGIC 0x53465039 /* string "9PFS" */
> > +#endif
> > +
> > +static int build_ads_name(char *namebuf, size_t namebuflen,
> > +                          const char *dirname, const char *filename,
> > +                          const char *ads_name)
> > +{
> > +    size_t totalsize;
> > +
> > +    totalsize =3D strlen(dirname) + strlen(filename) + strlen(ads_name=
) + 3;
> > +    if (totalsize  > namebuflen) {
> > +        return -1;
> > +    }
> > +
> > +    /*
> > +     * NTFS ADS (Alternate Data Streams) name format:
> > +     *  filename:ads_name
> > +     * e.g.
> > +     *  d:\1.txt:my_ads_name
> > +     */
> > +    strcpy(namebuf, dirname);
> > +    strcat(namebuf, "\\");
> > +    strcat(namebuf, filename);
> > +    strcat(namebuf, ":");
> > +    strcat(namebuf, ads_name);
> > +
> > +    return 0;
> > +}
> > +
> > +static ssize_t copy_ads_name(char *namebuf, size_t namebuflen,
> > +                             char *fulladsname)
> > +{
> > +    char *p1, *p2;
> > +
> > +    /*
> > +     * NTFS ADS (Alternate Data Streams) name from emurate data format=
:
> > +     *  :ads_name:$DATA
> > +     * e.g.
> > +     *  :my_ads_name:$DATA
> > +     *
> > +     * ADS name from FindNextStreamW() always have ":$DATA" string at =
the
> > end +     *
> > +     * This function copy ADS name to namebuf.
> > +     */
> > +
> > +    p1 =3D strchr(fulladsname, ':');
> > +    if (p1 =3D=3D NULL) {
> > +        return -1;
> > +    }
> > +
> > +    p2 =3D strchr(p1 + 1, ':');
> > +    if (p2 =3D=3D NULL) {
> > +        return -1;
> > +    }
> > +
> > +    /* skip empty ads name */
> > +    if (p2 - p1 =3D=3D 1) {
> > +        return 0;
> > +    }
> > +
> > +    if (p2 - p1 + 1 > namebuflen) {
> > +        return -1;
> > +    }
> > +
> > +    memcpy(namebuf, p1 + 1, p2 - p1 - 1);
> > +    namebuf[p2 - p1 - 1] =3D '\0';
> > +
> > +    return p2 - p1;
> > +}
> > +
> > +ssize_t fgetxattrat_nofollow(const char *dirname, const char *filename=
,
> > +                             const char *name, void *value, size_t siz=
e)
> > +{
> > +    HANDLE hStream;
> > +    char ADSFileName[NAME_MAX + 1] =3D {0};
> > +    DWORD dwBytesRead;
> > +
> > +    if (build_ads_name(ADSFileName, NAME_MAX, dirname, filename, name)=
 < 0)
> > { +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    hStream =3D CreateFile(ADSFileName, GENERIC_READ, FILE_SHARE_READ,=
 NULL,
> > +                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
> > +    if (hStream =3D=3D INVALID_HANDLE_VALUE &&
> > +        GetLastError() =3D=3D ERROR_FILE_NOT_FOUND) {
> > +        errno =3D ENODATA;
> > +        return -1;
> > +    }
> > +
> > +    if (ReadFile(hStream, value, size, &dwBytesRead, NULL) =3D=3D FALS=
E) {
> > +        errno =3D EIO;
> > +        CloseHandle(hStream);
> > +        return -1;
> > +    }
> > +
> > +    CloseHandle(hStream);
> > +
> > +    return dwBytesRead;
> > +}
> > +
> > +ssize_t flistxattrat_nofollow(const char *dirname, const char *filenam=
e,
> > +                              char *list, size_t size)
> > +{
> > +    WCHAR WideCharStr[NAME_MAX + 1] =3D { 0 };
> > +    char fulladsname[NAME_MAX + 1];
> > +    char *full_fs_name =3D merge_fs_path(dirname, filename);
> > +    int ret;
> > +    HANDLE hFind;
> > +    WIN32_FIND_STREAM_DATA fsd;
> > +    BOOL bFindNext;
> > +    char *listptr =3D list;
> > +    size_t listleftsize =3D size;
> > +
> > +    /*
> > +     * ADS emurate function only have WCHAR version, need to  covert
> > filename +     * to WCHAR string.
> > +     */
> > +
> > +    ret =3D MultiByteToWideChar(CP_UTF8, 0, full_fs_name,
> > +                              strlen(full_fs_name), WideCharStr, NAME_=
MAX);
> > +    g_free(full_fs_name);
> > +    if (ret =3D=3D 0) {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    hFind =3D FindFirstStreamW(WideCharStr, FindStreamInfoStandard, &f=
sd, 0);
> > +    if (hFind =3D=3D INVALID_HANDLE_VALUE) {
> > +        errno =3D ENODATA;
> > +        return -1;
> > +    }
> > +
> > +    do {
> > +        memset(fulladsname, 0, sizeof(fulladsname));
> > +
> > +        /*
> > +         * ADS emurate function only have WCHAR version, need to cover=
t
> > +         * cStreamName to utf-8 string.
> > +         */
> > +
> > +        ret =3D WideCharToMultiByte(CP_UTF8, 0,
> > +                                  fsd.cStreamName, wcslen(fsd.cStreamN=
ame)
> > + 1, +                                  fulladsname, sizeof(fulladsname=
) -
> > 1, +                                  NULL, NULL);
> > +
> > +        if (ret =3D=3D 0) {
> > +            if (GetLastError() =3D=3D ERROR_INSUFFICIENT_BUFFER) {
> > +                errno =3D ERANGE;
> > +            }
> > +            CloseHandle(hFind);
> > +            return -1;
> > +        }
> > +
> > +        ret =3D copy_ads_name(listptr, listleftsize, fulladsname);
> > +        if (ret < 0) {
> > +            errno =3D ERANGE;
> > +            CloseHandle(hFind);
> > +            return -1;
> > +        }
> > +
> > +        listptr =3D listptr + ret;
> > +        listleftsize =3D listleftsize - ret;
> > +
> > +        bFindNext =3D FindNextStreamW(hFind, &fsd);
> > +    } while (bFindNext);
> > +
> > +    CloseHandle(hFind);
> > +
> > +    return size - listleftsize;
> > +}
> > +
> > +ssize_t fremovexattrat_nofollow(const char *dirname, const char *filen=
ame,
> > +                                const char *name)
> > +{
> > +    char ADSFileName[NAME_MAX + 1] =3D {0};
> > +
> > +    if (build_ads_name(ADSFileName, NAME_MAX, dirname, filename, name)=
 < 0)
> > { +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    if (DeleteFile(ADSFileName) !=3D 0) {
> > +        if (GetLastError() =3D=3D ERROR_FILE_NOT_FOUND) {
> > +            errno =3D ENODATA;
> > +            return -1;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +int fsetxattrat_nofollow(const char *dirname, const char *filename,
> > +                         const char *name, void *value, size_t size, i=
nt
> > flags) +{
> > +    HANDLE hStream;
> > +    char ADSFileName[NAME_MAX + 1] =3D {0};
> > +    DWORD dwBytesWrite;
> > +
> > +    if (build_ads_name(ADSFileName, NAME_MAX, dirname, filename, name)=
 < 0)
> > { +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    hStream =3D CreateFile(ADSFileName, GENERIC_WRITE, FILE_SHARE_READ=
, NULL,
> > +                         CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL); =
+
> > if (hStream =3D=3D INVALID_HANDLE_VALUE) {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    if (WriteFile(hStream, value, size, &dwBytesWrite, NULL) =3D=3D FA=
LSE) {
> > +        errno =3D EIO;
> > +        CloseHandle(hStream);
> > +        return -1;
> > +    }
> > +
> > +    CloseHandle(hStream);
> > +
> > +    return 0;
> > +}
> > +
> > +int qemu_mknodat(const char *dirname, const char *filename,
> > +                 mode_t mode, dev_t dev)
> > +{
> > +    errno =3D ENOTSUP;
> > +    return -1;
> > +}
> > +
> > +int qemu_statfs(const char *fs_root, struct statfs *stbuf)
> > +{
> > +    HANDLE hFile;
> > +    char RealPath[NAME_MAX + 1];
> > +    unsigned long SectorsPerCluster;
> > +    unsigned long BytesPerSector;
> > +    unsigned long NumberOfFreeClusters;
> > +    unsigned long TotalNumberOfClusters;
> > +
> > +    hFile =3D CreateFile(fs_root, GENERIC_READ, FILE_SHARE_READ, NULL,
> > +                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL=
);
> > +    if (hFile =3D=3D INVALID_HANDLE_VALUE) {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    /* get real path of root */
> > +    if (GetFinalPathNameByHandle(hFile, RealPath, sizeof(RealPath),
> > +                                 FILE_NAME_NORMALIZED) =3D=3D 0) {
> > +        errno =3D EIO;
> > +        CloseHandle(hFile);
> > +        return -1;
> > +    }
> > +
> > +    CloseHandle(hFile);
> > +
> > +    /*
> > +     * GetFinalPathNameByHandle will return real path start with "\\\\=
?\\".
> > +     * "C:\\123" will be "\\\\?\\C:\\123"
> > +     * Skip first 4 bytes and truncate the string at offset 7, it will=
 get
> > +     * the real root directory like "C:\\", this is parameter
> > GetDiskFreeSpace +     * needed.
> > +     */
> > +
> > +    RealPath[7] =3D '\0';
> > +
> > +    if (GetDiskFreeSpace(RealPath + 4, &SectorsPerCluster, &BytesPerSe=
ctor,
> > +                         &NumberOfFreeClusters, &TotalNumberOfClusters=
) =3D=3D
> > 0) { +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    stbuf->f_type =3D V9FS_MAGIC;
> > +    stbuf->f_bsize =3D (__fsword_t)(SectorsPerCluster * BytesPerSector=
);
> > +    stbuf->f_blocks =3D (fsblkcnt_t)TotalNumberOfClusters;
> > +    stbuf->f_bfree =3D (fsblkcnt_t)NumberOfFreeClusters;
> > +    stbuf->f_bavail =3D (fsblkcnt_t)NumberOfFreeClusters;
> > +    stbuf->f_files =3D -1;
> > +    stbuf->f_ffree =3D -1;
> > +    stbuf->f_namelen =3D NAME_MAX;
> > +    stbuf->f_frsize =3D 0;
> > +    stbuf->f_flags =3D 0;
> > +
> > +    return 0;
> > +}
> > diff --git a/hw/9pfs/9p-xattr.c b/hw/9pfs/9p-xattr.c
> > index 9ae69dd8db..5623f0e2ef 100644
> > --- a/hw/9pfs/9p-xattr.c
> > +++ b/hw/9pfs/9p-xattr.c
> > @@ -78,10 +78,45 @@ ssize_t v9fs_list_xattr(FsContext *ctx, const char
> > *path, char *orig_value, *orig_value_start;
> >      ssize_t xattr_len, parsed_len =3D 0, attr_len;
> >      char *dirpath, *name;
> > +#ifdef CONFIG_WIN32
> > +    char *full_dir_path;
> > +    DIR *dir;
> > +#else
> >      int dirfd;
> > +#endif
> >
> >      /* Get the actual len */
> >      dirpath =3D g_path_get_dirname(path);
> > +
> > +#ifdef CONFIG_WIN32
> > +    dir =3D local_opendir_nofollow(ctx, dirpath);
> > +    if (dir =3D=3D NULL) {
> > +        return -1;
> > +    }
> > +    closedir(dir);
> > +
> > +    full_dir_path =3D merge_fs_path(ctx->fs_root, dirpath);
> > +    g_free(dirpath);
> > +
> > +    name =3D g_path_get_basename(path);
> > +    xattr_len =3D flistxattrat_nofollow(full_dir_path, name, value, 0)=
;
> > +    if (xattr_len <=3D 0) {
> > +        g_free(name);
> > +        g_free(full_dir_path);
> > +        return xattr_len;
> > +    }
> > +
> > +    /* Now fetch the xattr and find the actual size */
> > +    orig_value =3D g_malloc(xattr_len);
> > +    xattr_len =3D flistxattrat_nofollow(full_dir_path, name, orig_valu=
e,
> > +                                      xattr_len);
> > +    g_free(name);
> > +    g_free(full_dir_path);
> > +    if (xattr_len < 0) {
> > +        g_free(orig_value);
> > +        return -1;
> > +    }
> > +#else
> >      dirfd =3D local_opendir_nofollow(ctx, dirpath);
> >      g_free(dirpath);
> >      if (dirfd =3D=3D -1) {
> > @@ -105,6 +140,7 @@ ssize_t v9fs_list_xattr(FsContext *ctx, const char
> > *path, g_free(orig_value);
> >          return -1;
> >      }
> > +#endif
> >
> >      /* store the orig pointer */
> >      orig_value_start =3D orig_value;
> > @@ -166,6 +202,31 @@ int v9fs_remove_xattr(FsContext *ctx,
> >  ssize_t local_getxattr_nofollow(FsContext *ctx, const char *path,
> >                                  const char *name, void *value, size_t =
size)
> > {
> > +#ifdef CONFIG_WIN32
> > +    char *dirpath =3D g_path_get_dirname(path);
> > +    char *filename =3D g_path_get_basename(path);
> > +    char *full_dir_path;
> > +    DIR *dir;
> > +    ssize_t ret =3D -1;
> > +
> > +    full_dir_path =3D merge_fs_path(ctx->fs_root, dirpath);
> > +
> > +    dir =3D local_opendir_nofollow(ctx, dirpath);
> > +    if (dir =3D=3D NULL) {
> > +        goto out;
> > +    }
> > +    closedir(dir);
> > +
> > +    ret =3D fgetxattrat_nofollow(full_dir_path, filename,
> > +                               name, value, size);
> > +
> > +out:
> > +    g_free(full_dir_path);
> > +    g_free(dirpath);
> > +    g_free(filename);
> > +
> > +    return ret;
> > +#else
> >      char *dirpath =3D g_path_get_dirname(path);
> >      char *filename =3D g_path_get_basename(path);
> >      int dirfd;
> > @@ -177,11 +238,13 @@ ssize_t local_getxattr_nofollow(FsContext *ctx, c=
onst
> > char *path, }
> >
> >      ret =3D fgetxattrat_nofollow(dirfd, filename, name, value, size);
> > +
> >      close_preserve_errno(dirfd);
> >  out:
> >      g_free(dirpath);
> >      g_free(filename);
> >      return ret;
> > +#endif
> >  }
> >
> >  ssize_t pt_getxattr(FsContext *ctx, const char *path, const char *name=
,
> > @@ -194,6 +257,30 @@ ssize_t local_setxattr_nofollow(FsContext *ctx, co=
nst
> > char *path, const char *name, void *value, size_t size, int flags)
> >  {
> > +#ifdef CONFIG_WIN32
> > +    char *dirpath =3D g_path_get_dirname(path);
> > +    char *filename =3D g_path_get_basename(path);
> > +    char *full_dir_path;
> > +    DIR *dir;
> > +    ssize_t ret =3D -1;
> > +
> > +    full_dir_path =3D merge_fs_path(ctx->fs_root, dirpath);
> > +
> > +    dir =3D local_opendir_nofollow(ctx, dirpath);
> > +    if (dir =3D=3D NULL) {
> > +        goto out;
> > +    }
> > +    closedir(dir);
> > +
> > +    ret =3D fsetxattrat_nofollow(full_dir_path, filename, name,
> > +                               value, size, flags);
> > +out:
> > +    g_free(full_dir_path);
> > +    g_free(dirpath);
> > +    g_free(filename);
> > +    return ret;
> > +
> > +#else
> >      char *dirpath =3D g_path_get_dirname(path);
> >      char *filename =3D g_path_get_basename(path);
> >      int dirfd;
> > @@ -210,6 +297,7 @@ out:
> >      g_free(dirpath);
> >      g_free(filename);
> >      return ret;
> > +#endif
> >  }
> >
> >  int pt_setxattr(FsContext *ctx, const char *path, const char *name, vo=
id
> > *value, @@ -221,6 +309,30 @@ int pt_setxattr(FsContext *ctx, const char
> > *path, const char *name, void *value, ssize_t
> > local_removexattr_nofollow(FsContext *ctx, const char *path, const char
> > *name)
> >  {
> > +#ifdef CONFIG_WIN32
> > +    char *dirpath =3D g_path_get_dirname(path);
> > +    char *filename =3D g_path_get_basename(path);
> > +    char *full_dir_path;
> > +    DIR *dir;
> > +    ssize_t ret =3D -1;
> > +
> > +    full_dir_path =3D merge_fs_path(ctx->fs_root, dirpath);
> > +
> > +    dir =3D local_opendir_nofollow(ctx, dirpath);
> > +    if (dir =3D=3D NULL) {
> > +        goto out;
> > +    }
> > +    closedir(dir);
> > +
> > +    ret =3D fremovexattrat_nofollow(full_dir_path, filename, name);
> > +
> > +out:
> > +    g_free(full_dir_path);
> > +    g_free(dirpath);
> > +    g_free(filename);
> > +    return ret;
> > +
> > +#else
> >      char *dirpath =3D g_path_get_dirname(path);
> >      char *filename =3D g_path_get_basename(path);
> >      int dirfd;
> > @@ -237,6 +349,7 @@ out:
> >      g_free(dirpath);
> >      g_free(filename);
> >      return ret;
> > +#endif
> >  }
> >
> >  int pt_removexattr(FsContext *ctx, const char *path, const char *name)
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 225f31fc31..a04889c1d6 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -38,6 +38,10 @@
> >  #include "migration/blocker.h"
> >  #include "qemu/xxhash.h"
> >  #include <math.h>
> > +#ifdef CONFIG_WIN32
> > +#define UTIME_NOW   ((1l << 30) - 1l)
> > +#define UTIME_OMIT  ((1l << 30) - 2l)
> > +#endif
> >
> >  int open_fd_hw;
> >  int total_open_fd;
> > @@ -986,9 +990,11 @@ static int stat_to_qid(V9fsPDU *pdu, const struct =
stat
> > *stbuf, V9fsQID *qidp) if (S_ISDIR(stbuf->st_mode)) {
> >          qidp->type |=3D P9_QID_TYPE_DIR;
> >      }
> > +#ifndef CONFIG_WIN32
> >      if (S_ISLNK(stbuf->st_mode)) {
> >          qidp->type |=3D P9_QID_TYPE_SYMLINK;
> >      }
> > +#endif
> >
> >      return 0;
> >  }
> > @@ -1095,6 +1101,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> V9fsString
> > *extension) ret |=3D S_IFDIR;
> >      }
> >
> > +#ifndef CONFIG_WIN32
> >      if (mode & P9_STAT_MODE_SYMLINK) {
> >          ret |=3D S_IFLNK;
> >      }
> > @@ -1104,6 +1111,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> V9fsString
> > *extension) if (mode & P9_STAT_MODE_NAMED_PIPE) {
> >          ret |=3D S_IFIFO;
> >      }
> > +#endif
> >      if (mode & P9_STAT_MODE_DEVICE) {
> >          if (extension->size && extension->data[0] =3D=3D 'c') {
> >              ret |=3D S_IFCHR;
> > @@ -1116,6 +1124,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> V9fsString
> > *extension) ret |=3D S_IFREG;
> >      }
> >
> > +#ifndef CONFIG_WIN32
> >      if (mode & P9_STAT_MODE_SETUID) {
> >          ret |=3D S_ISUID;
> >      }
> > @@ -1125,6 +1134,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> V9fsString
> > *extension) if (mode & P9_STAT_MODE_SETVTX) {
> >          ret |=3D S_ISVTX;
> >      }
> > +#endif
> >
> >      return ret;
> >  }
> > @@ -1180,6 +1190,7 @@ static uint32_t stat_to_v9mode(const struct stat
> > *stbuf) mode |=3D P9_STAT_MODE_DIR;
> >      }
> >
> > +#ifndef CONFIG_WIN32
> >      if (S_ISLNK(stbuf->st_mode)) {
> >          mode |=3D P9_STAT_MODE_SYMLINK;
> >      }
> > @@ -1191,11 +1202,13 @@ static uint32_t stat_to_v9mode(const struct sta=
t
> > *stbuf) if (S_ISFIFO(stbuf->st_mode)) {
> >          mode |=3D P9_STAT_MODE_NAMED_PIPE;
> >      }
> > +#endif
> >
> >      if (S_ISBLK(stbuf->st_mode) || S_ISCHR(stbuf->st_mode)) {
> >          mode |=3D P9_STAT_MODE_DEVICE;
> >      }
> >
> > +#ifndef CONFIG_WIN32
> >      if (stbuf->st_mode & S_ISUID) {
> >          mode |=3D P9_STAT_MODE_SETUID;
> >      }
> > @@ -1207,6 +1220,7 @@ static uint32_t stat_to_v9mode(const struct stat
> > *stbuf) if (stbuf->st_mode & S_ISVTX) {
> >          mode |=3D P9_STAT_MODE_SETVTX;
> >      }
> > +#endif
> >
> >      return mode;
> >  }
> > @@ -1245,9 +1259,16 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *=
pdu,
> > V9fsPath *path, return err;
> >          }
> >      } else if (v9stat->mode & P9_STAT_MODE_DEVICE) {
> > +#ifndef CONFIG_WIN32
> >          v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
> >                  S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
> >                  major(stbuf->st_rdev), minor(stbuf->st_rdev));
> > +#else
> > +        v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
> > +                S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
> > +                0, 0);
> > +#endif
> > +
> >      } else if (S_ISDIR(stbuf->st_mode) || S_ISREG(stbuf->st_mode)) {
> >          v9fs_string_sprintf(&v9stat->extension, "%s %lu",
> >                  "HARDLINKCOUNT", (unsigned long)stbuf->st_nlink);
> > @@ -1315,7 +1336,11 @@ static int32_t blksize_to_iounit(const V9fsPDU *=
pdu,
> > int32_t blksize)
> >
> >  static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *s=
tbuf)
> > {
> > +#ifndef CONFIG_WIN32
> >      return blksize_to_iounit(pdu, stbuf->st_blksize);
> > +#else
> > +    return blksize_to_iounit(pdu, 0);
> > +#endif
> >  }
> >
> >  static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
> > @@ -1329,6 +1354,14 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, con=
st
> > struct stat *stbuf, v9lstat->st_gid =3D stbuf->st_gid;
> >      v9lstat->st_rdev =3D stbuf->st_rdev;
> >      v9lstat->st_size =3D stbuf->st_size;
> > +
> > +#ifdef CONFIG_WIN32
> > +    v9lstat->st_blksize =3D stat_to_iounit(pdu, stbuf);
> > +    v9lstat->st_blocks =3D 0;
> > +    v9lstat->st_atime_sec =3D stbuf->st_atime;
> > +    v9lstat->st_mtime_sec =3D stbuf->st_mtime;
> > +    v9lstat->st_ctime_sec =3D stbuf->st_ctime;
> > +#else /* !CONFIG_WIN32 */
> >      v9lstat->st_blksize =3D stat_to_iounit(pdu, stbuf);
> >      v9lstat->st_blocks =3D stbuf->st_blocks;
> >      v9lstat->st_atime_sec =3D stbuf->st_atime;
> > @@ -1343,6 +1376,8 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, cons=
t
> > struct stat *stbuf, v9lstat->st_mtime_nsec =3D stbuf->st_mtim.tv_nsec;
> >      v9lstat->st_ctime_nsec =3D stbuf->st_ctim.tv_nsec;
> >  #endif
> > +#endif /* CONFIG_WIN32 */
> > +
> >      /* Currently we only support BASIC fields in stat */
> >      v9lstat->st_result_mask =3D P9_STATS_BASIC;
> >
> > @@ -1759,7 +1794,11 @@ static bool name_is_illegal(const char *name)
> >
> >  static bool same_stat_id(const struct stat *a, const struct stat *b)
> >  {
> > +#ifdef CONFIG_WIN32
> > +    return 0;
> > +#else
> >      return a->st_dev =3D=3D b->st_dev && a->st_ino =3D=3D b->st_ino;
> > +#endif  /* CONFIG_WIN32 */
> >  }
> >
> >  static void coroutine_fn v9fs_walk(void *opaque)
> > @@ -2300,7 +2339,11 @@ static int coroutine_fn
> > v9fs_do_readdir_with_stat(V9fsPDU *pdu, count +=3D len;
> >          v9fs_stat_free(&v9stat);
> >          v9fs_path_free(&path);
> > +#ifndef CONFIG_WIN32
> >          saved_dir_pos =3D qemu_dirent_off(dent);
> > +#else
> > +        saved_dir_pos =3D v9fs_co_telldir(pdu, fidp);
> > +#endif
> >      }
> >
> >      v9fs_readdir_unlock(&fidp->fs.dir);
> > @@ -2501,14 +2544,32 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> > *pdu, V9fsFidState *fidp, qid.version =3D 0;
> >          }
> >
> > +#ifdef CONFIG_WIN32
> > +        /*
> > +         * Windows does not have dent->d_off, get offset by calling
> > telldir() +         * manually.
> > +         */
> > +        off =3D v9fs_co_telldir(pdu, fidp);
> > +#else
> >          off =3D qemu_dirent_off(dent);
> > +#endif
> >          v9fs_string_init(&name);
> >          v9fs_string_sprintf(&name, "%s", dent->d_name);
> >
> > +#ifdef CONFIG_WIN32
> > +        /*
> > +         * Windows does not have dent->d_type
> > +         */
> > +
> > +        len =3D pdu_marshal(pdu, 11 + count, "Qqbs",
> > +                          &qid, off,
> > +                          0, &name);
> > +#else
> >          /* 11 =3D 7 + 4 (7 =3D start offset, 4 =3D space for storing c=
ount) */
> >          len =3D pdu_marshal(pdu, 11 + count, "Qqbs",
> >                            &qid, off,
> >                            dent->d_type, &name);
> > +#endif
> >
> >          v9fs_string_free(&name);
> >
> > @@ -2838,8 +2899,14 @@ static void coroutine_fn v9fs_create(void *opaqu=
e)
> >          }
> >
> >          nmode |=3D perm & 0777;
> > +
> > +#ifndef CONFIG_WIN32
> >          err =3D v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
> >                              makedev(major, minor), nmode, &stbuf);
> > +#else
> > +        err =3D -ENOTSUP;
> > +#endif
> > +
> >          if (err < 0) {
> >              goto out;
> >          }
> > @@ -2864,8 +2931,12 @@ static void coroutine_fn v9fs_create(void *opaqu=
e)
> >          v9fs_path_copy(&fidp->path, &path);
> >          v9fs_path_unlock(s);
> >      } else if (perm & P9_STAT_MODE_SOCKET) {
> > +#ifndef CONFIG_WIN32
> >          err =3D v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
> >                              0, S_IFSOCK | (perm & 0777), &stbuf);
> > +#else
> > +        err =3D -ENOTSUP;
> > +#endif
> >          if (err < 0) {
> >              goto out;
> >          }
> > @@ -3600,6 +3671,7 @@ out_nofid:
> >  static void coroutine_fn v9fs_mknod(void *opaque)
> >  {
> >
> > +#ifndef CONFIG_WIN32
> >      int mode;
> >      gid_t gid;
> >      int32_t fid;
> > @@ -3656,6 +3728,11 @@ out:
> >  out_nofid:
> >      pdu_complete(pdu, err);
> >      v9fs_string_free(&name);
> > +#else
> > +    V9fsPDU *pdu =3D opaque;
> > +
> > +    pdu_complete(pdu, -1);
> > +#endif
> >  }
> >
> >  /*
> > @@ -3928,7 +4005,7 @@ out_nofid:
> >  #if defined(CONFIG_LINUX)
> >  /* Currently, only Linux has XATTR_SIZE_MAX */
> >  #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
> > -#elif defined(CONFIG_DARWIN)
> > +#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
> >  /*
> >   * Darwin doesn't seem to define a maximum xattr size in its user
> >   * space header, so manually configure it across platforms as 64k.
> > @@ -3945,6 +4022,7 @@ out_nofid:
> >
> >  static void coroutine_fn v9fs_xattrcreate(void *opaque)
> >  {
> > +#ifndef CONFIG_WIN32
> >      int flags, rflags =3D 0;
> >      int32_t fid;
> >      uint64_t size;
> > @@ -4006,10 +4084,15 @@ out_put_fid:
> >  out_nofid:
> >      pdu_complete(pdu, err);
> >      v9fs_string_free(&name);
> > +#else
> > +    V9fsPDU *pdu =3D opaque;
> > +    pdu_complete(pdu, -1);
> > +#endif
> >  }
> >
> >  static void coroutine_fn v9fs_readlink(void *opaque)
> >  {
> > +#ifndef CONFIG_WIN32
> >      V9fsPDU *pdu =3D opaque;
> >      size_t offset =3D 7;
> >      V9fsString target;
> > @@ -4045,6 +4128,10 @@ out:
> >      put_fid(pdu, fidp);
> >  out_nofid:
> >      pdu_complete(pdu, err);
> > +#else
> > +    V9fsPDU *pdu =3D opaque;
> > +    pdu_complete(pdu, -1);
> > +#endif
> >  }
> >
> >  static CoroutineEntry *pdu_co_handlers[] =3D {
> > @@ -4306,6 +4393,7 @@ void v9fs_reset(V9fsState *s)
> >
> >  static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
> >  {
> > +#ifndef CONFIG_WIN32
> >      struct rlimit rlim;
> >      if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
> >          error_report("Failed to get the resource limit");
> > @@ -4313,4 +4401,5 @@ static void __attribute__((__constructor__))
> > v9fs_set_fd_limit(void) }
> >      open_fd_hw =3D rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
> >      open_fd_rc =3D rlim.rlim_cur / 2;
> > +#endif
> >  }
> > diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> > index 93ba44fb75..2fbe7b831b 100644
> > --- a/hw/9pfs/codir.c
> > +++ b/hw/9pfs/codir.c
> > @@ -78,6 +78,9 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
> > *fidp, int len, err =3D 0;
> >      int32_t size =3D 0;
> >      off_t saved_dir_pos;
> > +#ifdef CONFIG_WIN32
> > +    off_t next_dir_pos;
> > +#endif
> >      struct dirent *dent;
> >      struct V9fsDirEnt *e =3D NULL;
> >      V9fsPath path;
> > @@ -124,6 +127,14 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidSt=
ate
> > *fidp, break;
> >          }
> >
> > +#ifdef CONFIG_WIN32
> > +        next_dir_pos =3D s->ops->telldir(&s->ctx, &fidp->fs);
> > +        if (next_dir_pos < 0) {
> > +            err =3D next_dir_pos;
> > +            goto out;
> > +        }
> > +#endif
> > +
> >          /*
> >           * stop this loop as soon as it would exceed the allowed maxim=
um
> >           * response message size for the directory entries collected s=
o
> > far, @@ -168,7 +179,11 @@ static int do_readdir_many(V9fsPDU *pdu,
> > V9fsFidState *fidp, }
> >
> >          size +=3D len;
> > +#ifndef CONFIG_WIN32
> >          saved_dir_pos =3D qemu_dirent_off(dent);
> > +#else
> > +        saved_dir_pos =3D next_dir_pos;
> > +#endif
> >      }
> >
> >      /* restore (last) saved position */
>=20




