Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667934DA4BF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 22:44:54 +0100 (CET)
Received: from localhost ([::1]:36602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUEyL-0001Xd-8K
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 17:44:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1nUEwx-0008Mu-IK
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 17:43:28 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:64892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1nUEwt-00010y-CU
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 17:43:26 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22FEwcwl020665;
 Tue, 15 Mar 2022 14:43:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=YNSuNICNRTJCfZIaAlcTSeolNyvPM9Tw/o9h2I8p+1I=;
 b=hA6dRr7RWThX9iB+QjGC4bDFU4GYkKV1gAeZ62d9x3LUJlxrG/oYl2OG2N+f2DYPfxcA
 tZxe4iqVKMp+Fop+Vnoz20dEj008v1DzlSfN0mDWdlRmFmBGPOvmnlYaR7W/RDdrM/Bq
 JnWrvYU3Du8nwGE1tv7WTQNsgNWfbO4Z4OLwo3bTrd6AQJl9Fxw8JUmEq65GW+ZvrN9+
 bT5mz9vEXmuY4FsIm+lO677YNs2Htj0756W/54xIJqKOnGFkuX3qWV3ZLCk/34wAiFu8
 Idcbig5X+w7gMW3Hx4QnHUJoOICpVDvguwOaoVE23MzhJoKz+2j0PpidDOidJwp7/fqx Pw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3et64m3jk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 14:43:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apHSOx5HGpfMsBgWcL6dMaJEYtRCkljKgL2vrkaoP+KMPqHnFYT0Zqov8w0gYk5ZQSA2dl+dAE5lEfiXlO1VqPyOB2jzWelAzlnQHXZuCldhxSWrGz90fLZuTIPf/LEdsMyPgrBra8oLinpDcpIqP0YLtR1jO7A3kXlAmo0ROGYc3c5ewMQiq3H2YyoPKw7N+95WrnFlf3LaMdqDy8qhHFeAtfIzGGlCQRZScVPhN09gXl1Bid7/V2zGvvrgLiSKSiKi0xUiGsNSUKLxJbdXDp7E8k0s8Z0G8L6zHXeKje5uHjZEqAyvHeHXreOweWdJAcDheZw9zjKD/tK/TtNcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNSuNICNRTJCfZIaAlcTSeolNyvPM9Tw/o9h2I8p+1I=;
 b=S1mWK4nkQ7N1Ft9AmFUGFJ762LsaJ7IBDE5kxKx9zOoRATjcrOP8Ww7KzV3JjN07h3RZymdXVTNNTEsAiws1tAhNrDHpBEizyp15yS6ruOgqC52Mn8uc9H2NlM0BacX06wYhC/RN6CpAsmtN3Wn+oYzsRwyjozyIq5C9LEPtJbHItmHNt8qUap/o8igxT54GZwpFqyOo++pHy7rBpITv0qg4JEuwqV3XRtPCRCNxum/uun5F6Lw0TOr+oDl40EcrnP+lRiQ6wuwDASFpm9CtX4H0P7PWbRSaijX1RtjfqzRzwo1Ge90UfcEHV7cl7LIrsBe7FN/5Yz1/bh1PC/SLKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM8PR02MB8005.namprd02.prod.outlook.com (2603:10b6:8:16::16) by
 BY5PR02MB6611.namprd02.prod.outlook.com (2603:10b6:a03:205::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 15 Mar
 2022 21:43:15 +0000
Received: from DM8PR02MB8005.namprd02.prod.outlook.com
 ([fe80::51bf:8780:a83b:85df]) by DM8PR02MB8005.namprd02.prod.outlook.com
 ([fe80::51bf:8780:a83b:85df%6]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 21:43:15 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Alex Williamson <alex.williamson@redhat.com>, John Johnson
 <john.g.johnson@oracle.com>
Subject: RE: [RFC v4 01/21] vfio-user: introduce vfio-user protocol
 specification
Thread-Topic: [RFC v4 01/21] vfio-user: introduce vfio-user protocol
 specification
Thread-Index: AQHYB090hYIo4176z0qmMW2Si3Qb0Ky3/SuAgAlfRRA=
Date: Tue, 15 Mar 2022 21:43:15 +0000
Message-ID: <DM8PR02MB8005ACC7B26833CC47F9101B8B109@DM8PR02MB8005.namprd02.prod.outlook.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <a9b696ca38ee2329e371c28bcaa2921cac2a48a2.1641584316.git.john.g.johnson@oracle.com>
 <20220309153453.25eee9dd.alex.williamson@redhat.com>
In-Reply-To: <20220309153453.25eee9dd.alex.williamson@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26af9ba3-9eac-4f14-6941-08da06cccfa4
x-ms-traffictypediagnostic: BY5PR02MB6611:EE_
x-microsoft-antispam-prvs: <BY5PR02MB66111A5D47D8658304BFE3718B109@BY5PR02MB6611.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: amyBI6O1P2eEofWcuMB7lkD+1Am3GZAIq82woQ3v6H6/51SQyT1p+cSiGWgPsIy92bgonSToRy3CTLvhvmz8i003gT1X4ewC2PHnUlWkLwK0qDschyFew7i8dvc7W1O1jTWoGk3drpBOZhKhao6VDTa50hbQqhtgEFEMCbKjffvwXIgIfyOUpFXE+ylOg4afyx0AyHCFlGGb7Toc2tCGpnk/9f/XSG84P4Q0m2arCoYqSBqZQFvQXJm3itCzprcqHsF46nqe7ZWbTQJUIDzseOilLS6Fg/6QY3QYaRS0ipjuRpBsEcxHCipZHvo28SrLmkTpWHJARW0UqYgONyxQ2FCZjPOkY2H9/w32wMJkBUvh3yoKWPS3PcpNrMYw/7/FXEwxo9W/9R83z71vDVMMcwOErZaiMdMQ5pQepT3pkDEMxw0MsrnJTJhXfjtyN+jRextWau1uwd4IQVEzEIFjcHPlH4XOuyDB/Eyjfz8L8GpXhHcdj7jlnn8au3JuE4W4v1/PDI2BipsbTsWGYVRkGPRq1sXvHfw6ZsV26JjGPpOvL7Q0H70A6yFHJ4MY7Ha6WZzPOCpHn1kN8TLapCKwI4tzYtu717ArvZ9XSDtf6R9SYy0ZUuYTS/vuDkNsH1nOU48ajOXHqyY2qChCF5rcbY4oHSkBvwAE5mxx/+YE2a0cEgiX5tlB9DbalozF/gfdu7kSF4aJrqHd8rQPeeU5Jl1oIYZUCZYR9fXms85u57Oupbq8UI6oeQpVIzLgXA9lN8qsqkH/shedZOjeBEq8VvHpa9Fx10n3xn3sKPpBPQw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8005.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(76116006)(8676002)(4326008)(66946007)(66446008)(66476007)(66556008)(508600001)(71200400001)(2906002)(33656002)(54906003)(316002)(38070700005)(122000001)(86362001)(52536014)(8936002)(44832011)(83380400001)(110136005)(55236004)(53546011)(9686003)(6506007)(7696005)(38100700002)(107886003)(5660300002)(55016003)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o3xQz9lIho6NVw+ZH/Bwo5Qy4+au1ZIVyuVGm2IuKvLnU6ck+2upDylWpHA4?=
 =?us-ascii?Q?6kJEGdsW//20hYs+1kiLoHaIkiC0Emc4eVOrO3ymYl4H5osajW7G2s04QCUr?=
 =?us-ascii?Q?MexTunO75cSg+AIBTIkMjtTNBgn0lXFYHvZTZ+LoNRcVSCKwN4l9mKLVLVPw?=
 =?us-ascii?Q?k852xwuuxtzdZeDKlCymRqXQZyn+elA7cSzNpANIzLoMtZ+ltXq94ACw0Edc?=
 =?us-ascii?Q?EfJwRne6q/TxJwUcgKDRZf26fBEqage1FJxSRplbicLJkx5ayVbEbLeLv2L8?=
 =?us-ascii?Q?d0S/hw0MIyJyN+s39m7siTSH+V5ZksuypCNGDJOiV/4xtZZWJLqyaH9dAQlL?=
 =?us-ascii?Q?iCQlJzR43/5MOnwjJIErjm+nYQT4nt+ASFYuAeOnDokuY0GspqOHuU1+54S0?=
 =?us-ascii?Q?3PsO0nUrXhCWVMpiafqQrfswv2749NcUrPaVSMr48IXnvah3ddwQlkKMpTyx?=
 =?us-ascii?Q?GfErh31rM76/Q46u2p70ptJOJpOqTeZPNTISxNVd53t16ZO3RZYAFqlyCDUA?=
 =?us-ascii?Q?2GAv5En78nmwH699u4WuwXCi2KiGMkNcCCKbG7cgMJBwtmUqtbQvABLtbv0+?=
 =?us-ascii?Q?BaNi4kNNfvIAbBBuXYSIX2oGP/UVR4uMvCYdAqypjsCxiNWRYFblAFt08B6v?=
 =?us-ascii?Q?bb+iQnPmMhLgEr9fM/7XF5jpZc2g4J/JlAjwknoAHpHVCAUh2kSIHk9x5A0P?=
 =?us-ascii?Q?Z74FXfyYtsfMMlsqzpnrv7O9IS9mnlJohlExQ/s4sSVcfSAwD86bFAlN+NEd?=
 =?us-ascii?Q?HoEYeuzh83Gd7CB88LpJZFTOUT/ncilu5pxsFHUaMoDoOWnHRy9jkD/Fh32i?=
 =?us-ascii?Q?FPXjIY/Q9MLeMaU7FZbWaNLY04luyffHoKcmJmDlR89L1UqH6nrnhTd5wn/m?=
 =?us-ascii?Q?Uk28RJ+QAKKSnJLlK7E9f5Uc99LGcpMzdJ3QNJjLXdAbhANw7RiQQekTJwIx?=
 =?us-ascii?Q?UNbKEfyAHdXBy0vbtgFb//RvFqqRafn465knaIv7m5Nr5I5/X9Ck1w1uC+p1?=
 =?us-ascii?Q?r7r3oR5loTua8ck0Za6dNZDJHvdvoWeVO/XEEjfo25T/XDk1bxk2Q8fhsj4s?=
 =?us-ascii?Q?+EPDW7rKOPPPY6UTblpO42mC8AI9U0URpAZU7V4NiPXWqFEY1qFk7LAEflRD?=
 =?us-ascii?Q?ROn45rRbKLIksgbLrDTRQaNj3sCRDXLmuV1jqpQcxNQKgsyTQeLGV3gAx5ox?=
 =?us-ascii?Q?yaOhyaAg4P+5caDTg9/jUus5wNWNi+9LgX5JS3jge0pLM2VwUKmLh5+drQr/?=
 =?us-ascii?Q?QtHc5YZ/8EsZe2JfektE0+EdyeZMH72T+oQsiimIrVn0SQCem/5D/eZztHPN?=
 =?us-ascii?Q?ZMz76gZc71dHPONI7jhewGFBc0HApLwpSH5kvTfohrtAp42YZp+A41iX2oBT?=
 =?us-ascii?Q?8qvH1toJ+ZZwaLUC7+LCq4i4/SRy6ASCfmu3UEjadhkbPeomvqSQKfGbxed4?=
 =?us-ascii?Q?9mFIuHk5P8p+fNmlk5nMmcThBJBIjD4O?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8005.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26af9ba3-9eac-4f14-6941-08da06cccfa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2022 21:43:15.2162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sWnMaKzFdZHWsQqd5ZToaGRx4CocXYSL1WTYhvr8FHaOtZXO61jXcF0mQKvWuxEaCNvycNAbyace0c8OXnyDmr6/HQ/t9urcgbE6lfgAGbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6611
X-Proofpoint-ORIG-GUID: qk7XCXH666a6ZXgNbKajBdupsZeryNlC
X-Proofpoint-GUID: qk7XCXH666a6ZXgNbKajBdupsZeryNlC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-15_11,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <john.levon@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+thanos.makatos=3Dnutanix.com@nongnu.org> On Behalf Of Alex
> Williamson
> Sent: 09 March 2022 22:35
> To: John Johnson <john.g.johnson@oracle.com>
> Cc: qemu-devel@nongnu.org
> Subject: Re: [RFC v4 01/21] vfio-user: introduce vfio-user protocol speci=
fication
>=20
> On Tue, 11 Jan 2022 16:43:37 -0800
> John Johnson <john.g.johnson@oracle.com> wrote:
> > +VFIO region info cap sparse mmap
> > +""""""""""""""""""""""""""""""""
> > +
> > ++----------+--------+------+
> > +| Name     | Offset | Size |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D+
> > +| nr_areas | 0      | 4    |
> > ++----------+--------+------+
> > +| reserved | 4      | 4    |
> > ++----------+--------+------+
> > +| offset   | 8      | 8    |
> > ++----------+--------+------+
> > +| size     | 16     | 9    |
> > ++----------+--------+------+
>=20
> Typo, I'm pretty sure size isn't 9 bytes.
>=20
> > +| ...      |        |      |
> > ++----------+--------+------+
> > +
> > +* *nr_areas* is the number of sparse mmap areas in the region.
> > +* *offset* and size describe a single area that can be mapped by the c=
lient.
> > +  There will be *nr_areas* pairs of offset and size. The offset will b=
e added to
> > +  the base offset given in the ``VFIO_USER_DEVICE_GET_REGION_INFO`` to
> form the
> > +  offset argument of the subsequent mmap() call.
> > +
> > +The VFIO sparse mmap area is defined in ``<linux/vfio.h>`` (``struct
> > +vfio_region_info_cap_sparse_mmap``).
> > +
> > +VFIO region type cap header
> > +"""""""""""""""""""""""""""
> > +
> > ++------------------+---------------------------+
> > +| Name             | Value                     |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +| id               | VFIO_REGION_INFO_CAP_TYPE |
> > ++------------------+---------------------------+
> > +| version          | 0x1                       |
> > ++------------------+---------------------------+
> > +| next             | <next>                    |
> > ++------------------+---------------------------+
> > +| region info type | VFIO region info type     |
> > ++------------------+---------------------------+
> > +
> > +This capability is defined when a region is specific to the device.
> > +
> > +VFIO region info type cap
> > +"""""""""""""""""""""""""
> > +
> > +The VFIO region info type is defined in ``<linux/vfio.h>``
> > +(``struct vfio_region_info_cap_type``).
> > +
> > ++---------+--------+------+
> > +| Name    | Offset | Size |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D+
> > +| type    | 0      | 4    |
> > ++---------+--------+------+
> > +| subtype | 4      | 4    |
> > ++---------+--------+------+
> > +
> > +The only device-specific region type and subtype supported by vfio-use=
r is
> > +``VFIO_REGION_TYPE_MIGRATION`` (3) and
> ``VFIO_REGION_SUBTYPE_MIGRATION`` (1).
>=20
> These should be considered deprecated from the kernel interface.  I
> hope there are plans for vfio-user to adopt the new interface that's
> currently available in linux-next and intended for v5.18.
>=20
> ...
> > +Unused VFIO ``ioctl()`` commands
> > +--------------------------------
> > +
> > +The following VFIO commands do not have an equivalent vfio-user
> command:
> > +
> > +* ``VFIO_GET_API_VERSION``
> > +* ``VFIO_CHECK_EXTENSION``
> > +* ``VFIO_SET_IOMMU``
> > +* ``VFIO_GROUP_GET_STATUS``
> > +* ``VFIO_GROUP_SET_CONTAINER``
> > +* ``VFIO_GROUP_UNSET_CONTAINER``
> > +* ``VFIO_GROUP_GET_DEVICE_FD``
> > +* ``VFIO_IOMMU_GET_INFO``
> > +
> > +However, once support for live migration for VFIO devices is finalized=
 some
> > +of the above commands may have to be handled by the client in their
> > +corresponding vfio-user form. This will be addressed in a future proto=
col
> > +version.
>=20
> As above, I'd go ahead and drop the migration region interface support,
> it's being removed from the kernel.  Dirty page handling might also be
> something you want to pull back on as we're expecting in-kernel vfio to
> essentially deprecate its iommu backends in favor of a new shared
> userspace iommufd interface.  We expect to have backwards compatibility
> via that interface, but as QEMU migration support for vfio-pci devices
> is experimental and there are desires not to consolidate dirty page
> tracking behind the iommu interface in the new model, it's not clear if
> the kernel will continue to expose the current dirty page tracking.
>=20
> AIUI, we're expecting to see patches officially proposing the iommufd
> interface in the kernel "soon".  Thanks,

Are you referring to the "[RFC v2] /dev/iommu uAPI proposal" work (https://=
lkml.org/lkml/2021/7/9/89)?

>=20
> Alex
>=20


