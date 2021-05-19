Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA394389967
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 00:41:08 +0200 (CEST)
Received: from localhost ([::1]:33818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljUsF-0000dR-Fe
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 18:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1ljUqG-0007Gg-Up
 for qemu-devel@nongnu.org; Wed, 19 May 2021 18:39:04 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:8058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1ljUqD-00051D-Pp
 for qemu-devel@nongnu.org; Wed, 19 May 2021 18:39:04 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14JMWMck002691; Wed, 19 May 2021 15:38:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=qjAI38BNLPJj+fo5lcC42FNtuAc2f16q1/SS4pVx1Qo=;
 b=is9IvGtH3mSdohQd0ua1CsWAC2rd5bA8VwUiZQsdeF20x3LZdu6RIhtlirTSNFSh6/Bz
 xb9DO1+jnFw5H4PyVTQc8k7vVVdGywCj8i1Ziu14EGAYsJFyo9ur12r2ug9tr4AxnxPu
 QXJTs2TGjU6fuZe/JBnGE561pKcN3/sp5m6hvntbtGz91gp12tJhaJ/IRww2UHmH6pjr
 b47+1zB0K2RylT/9guS0/RDOXPv/Pbez08OYlNJVSWA11q6SM3IJZ7URmd7qYAKkTex1
 SfriY2OqVoRUFD9T3VJhOk0iI7wYXNbjotfEJPNMzA9LDWQ5kaaLswdr7Qc1XvXSMvG3 jw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0b-002c1b01.pphosted.com with ESMTP id 38mhx0b4tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 15:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+1He8lLQEqpbW86ljfvcyLWr0Hmzo77Zi9xL3fJ/mVVzDrYOealDekpbXoCERxleX0ZCJAeaHyKbUiMaBPmrZBwlUNwONSCZV41nFqyVFqHWEdbA8e7cPUPGvZJcc8GD479dmeGEYho1fQoXEYk2fF2oAKaR8yylBcpj13hPr6VtxJ3ib1rbUkPzssTxlS0HHM29s2Sr2ybq5Qx29qT83/QaV6llg+Z2mQm3XLbqWw4ThGedBUMl0HGZeS7j/GkuS4IMIz4ftwJCchHyewneN/gefeHHBJmJMhExvX2qD12qHwXVdk9e/C+eYUMclV5pSPQDj/JlM4RIqI5hFVqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjAI38BNLPJj+fo5lcC42FNtuAc2f16q1/SS4pVx1Qo=;
 b=ng9tTEZ/kTS9Rz5RyyFk1qu/JoIUER7YcMxI9QWQ5GFcq3DHBmWav49mKSMt4cbVQorQIxGiuYz6gMHthRIUCdQvUWUtkSLutt8eiOtme3r6gASucDTkRBTfbGpQhIMkr6Fpogm3jjO/rnYgS7q4Z5+Ig1uR3CWWR8ERHrUFPJzd1mGp4853WGAP8fnepO2wneO0cOPnx+zaQ/1Y1tkQdBIUMESc02u6e9qlRaMzyh8n30MIK97VLX2I5hwotuulBUUbiyUxgUqVZ1IUUEtYMozgnYOtigbzEVDGX/TUQxoRYqChfilLy3Qt2ocWYP5OYnXzRLTP5ezhVLlILBjfKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by BL3PR02MB8204.namprd02.prod.outlook.com (2603:10b6:208:33b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 22:38:49 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::c97f:ebc7:b7e8:29ad]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::c97f:ebc7:b7e8:29ad%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 22:38:49 +0000
From: John Levon <john.levon@nutanix.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Thread-Topic: [PATCH v8] introduce vfio-user protocol specification
Thread-Index: AQHXMSMgb7SIFmt51kWnbVuTmfaYAKrrg+aAgAAZRgA=
Date: Wed, 19 May 2021 22:38:48 +0000
Message-ID: <20210519223844.GA1036405@sent>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <20210519150817.6a90985b.alex.williamson@redhat.com>
In-Reply-To: <20210519150817.6a90985b.alex.williamson@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [88.98.93.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06c7fd5c-419a-439f-2673-08d91b16ded0
x-ms-traffictypediagnostic: BL3PR02MB8204:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL3PR02MB8204C6B3F22CC899CC4059E9972B9@BL3PR02MB8204.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yxk+NiiLooxXMkK0KPvddLX3tMV7JQ7/HKhzMHQtKEdF+jFPJ67SHJw2oOW3iO8MCYPY1qn+hrSDIvaZqwoXLuof+wDu5Kz4AzzcPbejkoHKjgtW+v20N37BQTLf+JO2OK41xbrgzMNCk68ONka8Tft7hAnnx17iEyaIWfGH6HPCmInE8l+vR037hyr7lnd7zrX3YckfqIiDbHfqu+oIm4wDUyXinRAt3rUBVSHgEr0tn+wp29O9mtyRFh+jqnqbQopeFMIknjB5mO5eB56ijvoZCX19zCDk1rkCVbHe/Da3lLAbpG9g8SnRiH860F/603csLRkZ36jwOMuRgaAaRQ9Uy4WiBgwZEvVROpFmnI3CyqY23/yhuIlAEyn1nsRSr5eJMZI1qwlPGs+LCbuswIUytopwzWJfcSvfNUJFLd8cV3zzTW7MMx2oHoFob5oGyAvEv+MpCY1Nx7LK1VnI/QpCS9EDI4081ENYDcUcQhRnxm7jeRL9ZGKWlITHjh3iVa4Ah/NFhrvf161gDKHM/uFIrdoy+d5n5xM79CJX23enbwLmNtiBykpt6AnFi/Itwlg063YHDcl+Nn5lzFFU0jCfo2B4pY6L/8bgvy16Tx0QcTA1QjsFbFlM0afYgZXSkUU5WRBlnoIrRte5J0woQZrGNSyBtGXj5PHm9ahuDkNcRtkUZDYnkBsorDqs6u1fWJERcWSPII916KmS5fLvtL3L/FF//qp2RvpX8IuCLvo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(39860400002)(136003)(396003)(376002)(346002)(366004)(44832011)(8936002)(86362001)(26005)(1076003)(6506007)(7416002)(6486002)(54906003)(71200400001)(33656002)(83380400001)(2906002)(8676002)(9686003)(6512007)(122000001)(91956017)(316002)(38100700002)(478600001)(66946007)(76116006)(4326008)(5660300002)(33716001)(66476007)(66446008)(64756008)(6916009)(186003)(66556008)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tyR5spwK7zXrEEMxC3nvjfkRtddKkKh/bsZpqqhG6NC3IoFjVsb7eJefCC6i?=
 =?us-ascii?Q?X+tyaBF5zu9obwXGu3TRATOvGRZY57TfdWGvneVfRjZxdrIMk4+uGP/Pz98t?=
 =?us-ascii?Q?wr1mCMUftUUeKF7PEUmWPIV+I+T0ArVe/UbY+uqKITfdHCnxcjkzV4KGg2y1?=
 =?us-ascii?Q?Ucl+j3n+JgQ7yW66MwbCjOcEBJPHCj89fMEpdQuN2U8ZFBnjW/bMWUTnsfkV?=
 =?us-ascii?Q?WwIjkgfd2Z0PMh9YMjlK4IJbPuybq+Sh60iHDTS+rIzRJJlGt8gWNRiyRazP?=
 =?us-ascii?Q?sWLCXdGtlGE9PcgIv0NEBqVKkv1a556jtELtDECLnk6zdrmLkDFJ17sspBSo?=
 =?us-ascii?Q?KyegGx6buif0fJ11Bch7+H89p3KVdiMtnsT9VwEuOJryavFT1JqkXhqlRj5c?=
 =?us-ascii?Q?iJnktYPxDMK/5FLcKwbPwgCijkrtfoirR82KH2wFaSTIVSHex0HhU26jvFDI?=
 =?us-ascii?Q?9jTm1jynV8hnCzAHBEKkyqf1WLwjIfjKqtMYxKL8LnO61uDOkf2AL4JCKnHB?=
 =?us-ascii?Q?IxMA5V822Bp/9D+Fuoi/R/LjL2qRMfcSqqt5ItI+GjvESXlEO1c6k30aKxbC?=
 =?us-ascii?Q?0iPDdNpVL7REicprW/PaF3L3NgLrXiFtMXs5WNXNX60B1QZK/T56jP1tmKDs?=
 =?us-ascii?Q?aPrLqg9YnhHsIt07ThrTFMlFlcNJpHT6934hVpILAw9KNzDzgvVoTLio1qhc?=
 =?us-ascii?Q?aPOX8bl3TR+ZFxfvx0otU8tZCtPByOPEsqpc25UfEgsO8FlqaY3gpmX3Fy1v?=
 =?us-ascii?Q?WarZCKLBeJ8zM7QVUguOMn0UODdx/y38lCb3/aafWBIHneS4f1QrbYKhAhFH?=
 =?us-ascii?Q?BJDmIAiYHrBnBEA+9fkeDJEckJJgvlhdzNEezMWQ27J7snBQZI/5TzwIze1v?=
 =?us-ascii?Q?bm1fGZZZYmBEzePnuLTpblFcmQquQyiPo2L3ooWi0aBkYHhNojaFxK0udAfq?=
 =?us-ascii?Q?E2Crs4Itx2VTMMATDVvZ/lnWdSmXGZoufBGWuQh0mhPFLPVJXaDyIZWhKDWe?=
 =?us-ascii?Q?zSEEzn93wjw5lthhi2eJDXYckkQzD+3qpe7D1WBBRowMdaBWAI92RIHEWYSy?=
 =?us-ascii?Q?AtjWZBSkY7RIK19IJTUzOLupMQzMi+AQcFkk8wuy8BnTDaL85XOS1uOJHRl7?=
 =?us-ascii?Q?L+xcXUDyFzYnFfGeeFSzw9eHU/ELOWPQvcHgPHnCe/4oiLaBI8P7BMftRX8e?=
 =?us-ascii?Q?Tb3mewFkGDafWFWqk8SwGmjwCy7eAWO1aZjBcOeS/rJkXsbD48+UYmt5idec?=
 =?us-ascii?Q?C/2kibzj3cYm4PAdekuQvPv1Zsvp1fpFxGxypFEI131p5vskGhdeGrXVWdjY?=
 =?us-ascii?Q?WFs+MU4tdIM0vtRXIgwuEcQK?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <991B1D72D9D2514380D404D4A208875D@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c7fd5c-419a-439f-2673-08d91b16ded0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 22:38:48.7721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7cJjg2tZCGEIrUqIBNE6kq7AV94S10ckTFRv65wS7MX4USxSQJqEWGifl2OZJ8F4zb2xC98v6MV27gxS3LNreA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8204
X-Proofpoint-GUID: Bp6sqvqLSrosi1idAHGl212xCPIq1W2C
X-Proofpoint-ORIG-GUID: Bp6sqvqLSrosi1idAHGl212xCPIq1W2C
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_10:2021-05-19,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=john.levon@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "benjamin.walker@intel.com" <benjamin.walker@intel.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <levon@movementarian.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "tina.zhang@intel.com" <tina.zhang@intel.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 "james.r.harris@intel.com" <james.r.harris@intel.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Kanth.Ghatraju@oracle.com" <Kanth.Ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuvalkashtan@gmail.com" <yuvalkashtan@gmail.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ismael@linux.com" <ismael@linux.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "tomassetti.andrea@gmail.com" <tomassetti.andrea@gmail.com>,
 "mpiszczek@ddn.com" <mpiszczek@ddn.com>, Cornelia Huck <cohuck@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "xiuchun.lu@intel.com" <xiuchun.lu@intel.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 03:08:17PM -0600, Alex Williamson wrote:

> > +VFIO_USER_DMA_MAP
> > +-----------------
> > +
> > +Message Format
> > +^^^^^^^^^^^^^^
> > +
> > ++--------------+------------------------+
> > +| Name         | Value                  |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +| Message ID   | <ID>                   |
> > ++--------------+------------------------+
> > +| Command      | 2                      |
> > ++--------------+------------------------+
> > +| Message size | 16 + table size        |
> > ++--------------+------------------------+
> > +| Flags        | Reply bit set in reply |
> > ++--------------+------------------------+
> > +| Error        | 0/errno                |
> > ++--------------+------------------------+
> > +| Table        | array of table entries |
> > ++--------------+------------------------+
> > +
> > +This command message is sent by the client to the server to inform it =
of the
> > +memory regions the server can access. It must be sent before the serve=
r can
> > +perform any DMA to the client. It is normally sent directly after the =
version
> > +handshake is completed, but may also occur when memory is added to the=
 client,
> > +or if the client uses a vIOMMU. If the client does not expect the serv=
er to
> > +perform DMA then it does not need to send to the server VFIO_USER_DMA_=
MAP
> > +commands. If the server does not need to perform DMA then it can ignor=
e such
> > +commands but it must still reply to them. The table is an array of the
> > +following structure:
> > +
> > +Table entry format
> > +^^^^^^^^^^^^^^^^^^
> > +
> > ++-------------+--------+-------------+
> > +| Name        | Offset | Size        |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +| Address     | 0      | 8           |
> > ++-------------+--------+-------------+
> > +| Size        | 8      | 8           |
> > ++-------------+--------+-------------+
> > +| Offset      | 16     | 8           |
> > ++-------------+--------+-------------+
> > +| Protections | 24     | 4           |
> > ++-------------+--------+-------------+
> > +| Flags       | 28     | 4           |
> > ++-------------+--------+-------------+
> > +|             | +-----+------------+ |
> > +|             | | Bit | Definition | |
> > +|             | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=
 |
> > +|             | | 0   | Mappable   | |
> > +|             | +-----+------------+ |
> > ++-------------+--------+-------------+
> > +
> > +* *Address* is the base DMA address of the region.
> > +* *Size* is the size of the region.
> > +* *Offset* is the file offset of the region with respect to the associ=
ated file
> > +  descriptor.
>=20
> It might help to explicitly state this value is ignored by the server
> for non-mappable DMA, otherwise a server might assume a specific value
> is required (ex. zero) for such cases.

Generally we say that unused inputs must be zero, but yes, this should be
clarified, thanks.

> > +* *Protections* are the region's protection attributes as encoded in
> > +  ``<sys/mman.h>``.
> > +* *Flags* contains the following region attributes:
> > +
> > +  * *Mappable* indicates that the region can be mapped via the mmap() =
system
> > +    call using the file descriptor provided in the message meta-data.
> > +
> > +This structure is 32 bytes in size, so the message size is:
> > +16 + (# of table entries * 32).
> > +
> > +If a DMA region being added can be directly mapped by the server, an a=
rray of
> > +file descriptors must be sent as part of the message meta-data. Each m=
appable
> > +region entry must have a corresponding file descriptor. On AF_UNIX soc=
kets, the
>=20
> Is this saying that if the client provides table entries where indexes
> 1, 3, and 5 are indicated as mappable, then there must be an ancillary
> file descriptor array with 3 entries, where fd[0] maps to entry[1],
> fd[1]:entry[3], and fd[2]:entry[5], even if fd[0-2] are all the
> same file descriptor?

Yes. Though we are planning to change these calls to only support single re=
gions
which would make this moot.

> > +file descriptors must be passed as SCM_RIGHTS type ancillary data. Oth=
erwise,
> > +if a DMA region cannot be directly mapped by the server, it can be acc=
essed by
> > +the server using VFIO_USER_DMA_READ and VFIO_USER_DMA_WRITE messages, =
explained
> > +in `Read and Write Operations`_. A command to map over an existing reg=
ion must
> > +be failed by the server with ``EEXIST`` set in error field in the repl=
y.
> > +
> > +Adding multiple DMA regions can partially fail. The response does not =
indicate
> > +which regions were added and which were not, therefore it is a client
> > +implementation detail how to recover from the failure.
> > +
> > +.. Note::
> > +   The server can optionally remove succesfully added DMA regions maki=
ng this
> > +   operation atomic.
> > +   The client can recover by attempting to unmap one by one all the DM=
A regions
> > +   in the VFIO_USER_DMA_MAP command, ignoring failures for regions tha=
t do not
> > +   exist.
>=20
> What's the benefit of specifying this server behavior as optional?  I'm
> afraid this unspecified error recovery behavior might actually deter
> clients from performing batch mappings.  Servers also have little
> incentive to do their own cleanup if the client has no way to detect
> that behavior.

This may well be moot too.

> > +VFIO_USER_DMA_UNMAP
> > +-------------------
> > +
> > +This command message is sent by the client to the server to inform it =
that a
> > +DMA region, previously made available via a VFIO_USER_DMA_MAP command =
message,
> > +is no longer available for DMA. It typically occurs when memory is sub=
tracted
> > +from the client or if the client uses a vIOMMU. If the client does not=
 expect
> > +the server to perform DMA then it does not need to send to the server
> > +VFIO_USER_DMA_UNMAP commands. If the server does not need to perform D=
MA then
> > +it can ignore such commands but it must still reply to them. The table=
 is an
>=20
> I'm confused why expectation of DMA plays a factor here.  For example,
> if QEMU unplugs a DIMM and the server has an mmap of the file descriptor
> related to that DIMM, does it get to retain the mmap if it doesn't
> currently have any DMA queued targeting that address range?  Can QEMU
> skip sending an unmap if the PCI bus master bit is disabled on the
> device preventing further DMA?  How can the associated file descriptor
> get released?  This doesn't feel strongly specified.

I thought we'd removed those sentences actually, as they're just confusing.=
 In
reality, everything is going to both send and handle map/unmap messages.

> Are there any assumptions about address and size of the unmap command
> relative to the original map command or is the client freely allowed to
> bisect, overlap, or overextend previous mappings?

Good question. Filed https://github.com/nutanix/libvfio-user/issues/504 to
track this.

I actually don't know what clients would like to be able to do in this resp=
ect.

> > +* *Offset* is the file offset of the region with respect to the associ=
ated file
> > +  descriptor.
> > +* *Protections* are the region's protection attributes as encoded in
> > +  ``<sys/mman.h>``.
> > +* *Flags* contains the following region attributes:
> > +
> > +  * *VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP* indicates that a dirty page=
 bitmap
> > +    must be populated before unmapping the DMA region. The client must=
 provide
> > +    a ``struct vfio_bitmap`` in the VFIO bitmaps field for each region=
, with
> > +    the ``vfio_bitmap.pgsize`` and ``vfio_bitmap.size`` fields initial=
ized.
> > +
> > +* *VFIO Bitmaps* contains one ``struct vfio_bitmap`` per region (expla=
ined
> > +  below) if ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in Flags.
>=20
> How will this be extended when new flags are added to get new data or
> new data formats?  Note for instance that the kernel struct
> vfio_iommu_type1_dma_unmap specifies the data[] as opaque in general and
> only specifies it as struct vfio_bitmap for the case where
> GET_DIRTY_BITMAP is specified.

We're planning to do something like that for the new (actually more like vf=
io
again) map/unmap format.

> > +Upon receiving a VFIO_USER_DMA_UNMAP command, if the file descriptor i=
s mapped
> > +then the server must release all references to that DMA region before =
replying,
> > +which includes potentially in flight DMA transactions. Removing a port=
ion of a
> > +DMA region is possible.
>=20
> Ah, maybe this answers my question about unmap vs map, but it also seems
> to contradict the description allowing the server to ignore unmap
> requests if no DMA is expected when we state here that the server MUST
> release references.

The text is confusing (which is why I've removed it again). What it's reall=
y
trying to say is:

If there is a server implementation (such as the gpio-pci-idio-16 sample) t=
hat
never needs to access guest memory at all, then the server can choose to ig=
nore
DMA_MAP/UNMAP - so it would never keep any references around in the first p=
lace.

It's not a useful thing to mention in the spec IMHO.

> Is this also a good place to point out that the max messages size of
> 4096 is extremely limiting for returning a dirty bitmap for most use
> cases?  Some discussion of the error codes for such a case might be
> relevant here too.

It's a silly low default. The only implementation so far reports 65536 for =
what
it's worth.

We are also prototyping implementation changes such that this limit can be
removed altogether; hopefully that will come in a future spec update.

> > +VFIO_USER_VM_INTERRUPT
> > +
> > +Interrupt info format
> > +^^^^^^^^^^^^^^^^^^^^^
> > +
> > ++-----------+--------+------+
> > +| Name      | Offset | Size |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D+
> > +| Sub-index | 16     | 4    |
> > ++-----------+--------+------+
> > +
> > +* *Sub-index* is relative to the IRQ index, e.g., the vector number us=
ed in PCI
> > +  MSI/X type interrupts.
>=20
> Sorry if I'm blind, but where is the index itself provided?

You were confused because the message makes no sense as it's defined. It's =
been
removed.

Thanks for taking a look, much appreciated!

regards
john=

