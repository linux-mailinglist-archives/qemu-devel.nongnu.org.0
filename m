Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7E4528C58
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:51:20 +0200 (CEST)
Received: from localhost ([::1]:47706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqesJ-0003Zs-FG
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nqeZG-0001tR-7Y
 for qemu-devel@nongnu.org; Mon, 16 May 2022 13:31:38 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nqeZD-0003mc-Nw
 for qemu-devel@nongnu.org; Mon, 16 May 2022 13:31:37 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24GGIXXI031694;
 Mon, 16 May 2022 10:31:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=VkPGx70+oDghhhSjR5YCiEezwPfzhoLIjD9T94b889I=;
 b=eW77fIuiXrmNOUvnoDWHsZD+/s1Kl/HjgBoP0siO5gGA/1SjLAZoy1YUGspdWJzF9GId
 QQ1T9iLyqOo1Xn8NKT2t5QP0Dm9PQmUJJ8tyGySsBHZOpDP9q+1uufPzLRZMaCSmjZ7V
 Yf4ylYgUNK163LdREe/iP89viVgZIQzALKq6KDv3oYnC/BLbUqrmx+4w8EO4ohlvsvBp
 tLSEOVTrNg1CFLD7WhBrWTz8H8Q0BHm8XpR8bN8n/xBadyJ9JPC57+m7cWDoUSkLon3M
 dE9lllvYXSIH7I5fa7PssUB8GRNgsIT+yD7TNE4EFlnlx0bJIB9IweipBYGSkn+U/gFY iA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3g2brhkuae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 10:31:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHKSsZN5lA2UdbyTA817WH7JE2QAGOq7WIhY6L/Mky7ry4QW9fkNqfWef+nvDT3cFmgChA2QX13CeWjwqKyWwa408KVviN/ZqqcDJRuJRKRAzcTpLZBXHaPOBO6uX5nOB/4AHbUH7xHYCHSUmL4Xg8nL/hKxDlN6ENJkHX3jkNOOmnZqpitNDzq8nnZqnsqYeO82t/eVWo8+SpKObybWcIsgBxdbjTkRDE6JCZk4zKD+c8/EOxU4B3fHKQNX7PnLMlr+VV+0ZRPsU4Cw0vlyhDIkb4C1ZHxX2A6Ho3NmTuT/iQHJ3myy+gafflM/EANNMEiom+uNI3UYdZykXopY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkPGx70+oDghhhSjR5YCiEezwPfzhoLIjD9T94b889I=;
 b=mOulHhKFXCv0uFXavTl+kWNw5xqW+q84rB6J3x5+/iI6F68OMIIkB0L/Hrh2qKFq+nZ1Ff766x5rr6x18W2KIS5g+NZ3Uuv37gcWADzTzhGAERu8Y1eB2BQ7luQ6B58PXTaR5byo3ykwSWso2DsQFOIesfoudP+I9dN5G7YEKzmDwUcE20LtHFN6TMKc9UpEy5llJmP4Nncnt8oFODKQQaD7AG+HbJiwX9phlQQ0IVr0dWKNoaKWVTAfwhH6bBfeJaHzr2fM3yLsgFvgDJpbFTVH5VzqbWNAUtCXGsV/j7fObWGk5DWXK18Jn/9/zx63/0+jbJhtbbToytU5SydPGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by MN2PR02MB6399.namprd02.prod.outlook.com (2603:10b6:208:1bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 17:31:29 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e%8]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 17:31:29 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2] vhost-user-scsi: avoid unlink(NULL) with fd passing
Thread-Topic: [PATCH v2] vhost-user-scsi: avoid unlink(NULL) with fd passing
Thread-Index: AQHYaT2efoRpLeFJR0WWTrrOv1YcYa0hwwwA
Date: Mon, 16 May 2022 17:31:29 +0000
Message-ID: <20220516173124.GA13284@raphael-debian-dev>
References: <20220516155701.1789638-1-stefanha@redhat.com>
In-Reply-To: <20220516155701.1789638-1-stefanha@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec0ef9ca-454e-4b8f-1a30-08da3761e9a7
x-ms-traffictypediagnostic: MN2PR02MB6399:EE_
x-microsoft-antispam-prvs: <MN2PR02MB63996FB39C2E852CDBB09164EACF9@MN2PR02MB6399.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KPZIEFzgIrC833pESKr1N2atkm0amFksNnoochALsCfdwvMyn+NTV4YYGqx02/k3ccQqU0LE6OAk/mLz9gLCS3SLmzhhPIHIJpGr+n6pSn4Rkb/3oTOhEPdF7lLIVXdxZmzgdrzNSi7c9UnPUsEnwA6tctH4WNzIJOlZqs+7oJPypRlqcfKPV97aLvt8f1GGhLD+CUTrHbaGyPNR76L6VjX/M4QglR46+EuRrb2ZxftUeGLeA6XIbfjGFhz8x85ouEsE6/D7WTLMkhOf3Zgiz6oBqDJ5Gmv9SJSEkhvqT66lUguPkgkSHebA2JLmNFKm5sklxrqgJFptmVeOs6EgKfnPdI+6J4DLTNNNiztYwoD/tWtZQ5wEeZmXiq0/5GSCvGAwlBkw+gnBodF57DgJvX5kEsO1A7c61TPkkSme+RQ+ayaYWbXyn29bomFd2+gXPCgfAi2X0h3kDOPTjgFGiKpS8ljBuREbzwZHLbqZfNVWrOneF59bBcEUTebo6DhS7BhGrm2Bu34YUOKn/U0jDMUPYkBsZkOp592/MlMV4bB/0q6vOpvXDvFjiebY9tMexSpBSLd4qavluEs8ptlZ7HJaC4/wX/KdOLMumh2FP6HJk4x8u9Ecf2TiguKbKoGNndarmaX68FB1AizcSUhZP4J9eo1AmbTfTquU7NVPZsD/Fz6DXhHlUrSeqp44KFkSeyWEMxDiAlHqRVbEjFXi0w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(8936002)(54906003)(1076003)(8676002)(6506007)(5660300002)(6486002)(122000001)(26005)(6512007)(6916009)(186003)(9686003)(316002)(2906002)(33656002)(38100700002)(4326008)(91956017)(76116006)(86362001)(33716001)(44832011)(83380400001)(38070700005)(64756008)(71200400001)(66946007)(66476007)(508600001)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Gfch2yzkOVAWfXg1vbGHxxXz2fi+HQnBmgClDvd5J7U0yZpRJuHQHWzLpO8h?=
 =?us-ascii?Q?Ri+TuHA20SuCzZZx9+rXK5MmEYFysorpL0NI+CyPxpNpjqHwwW/weVDkuRwP?=
 =?us-ascii?Q?kwAV+ypq4Rd4+Gije0kE/5lUi25bTa8YYu//OeS4s43bqfzyhJeZU4xBEVjN?=
 =?us-ascii?Q?opssrX03MXXQBi5PQswF1z1na2JM7sZjmCxmrVXWaNLmqr0PdSebdUp75T0D?=
 =?us-ascii?Q?SPtItBvYn7plw4hdbWimT5gAQ2fse8c7+GDS68Lrgbua4TQ8cf0wEnsVbc8i?=
 =?us-ascii?Q?buY2ifNtUFqdoMOVholJB51YE6q7ETRc49tgOF3WOFvZBwrcor75+UiV2JuT?=
 =?us-ascii?Q?rGTI9ef2q+lf2fmeugzTgriciVv4MFsS4wegCYV8t+IfidDYOFBKfcvD/h7L?=
 =?us-ascii?Q?ynWqwcMAzIefLe5UljMVQCuM2Nd5zphYOpinvS4ubhwx43J6agyGOqeTpLlq?=
 =?us-ascii?Q?X0XnHAgx92SAqANKY9q4QcfiBXqMeKXBPV4jzs+T3FdWFiPe/WqzEjhKRdsy?=
 =?us-ascii?Q?YQHGj4OkRGPFx6B4TtZkt/IzLCqCFJl1ypk9zlj2mxqOlBJpKtw2kf5vdB5k?=
 =?us-ascii?Q?ZJJJBvgzUZsWIPYwpPAiCwNbTksnTr/qPu7UaajXJXuGfHQfsQzkziu7LE7n?=
 =?us-ascii?Q?i6a65NohH/b64jkAeA9x4o1RnUBBhiy4KixaoYxm37tLczjUMlM8cbDYEY2d?=
 =?us-ascii?Q?60NEOmn/DjV1nzvg4LhbcWA508GT12An7bFADtGyfhbVFptH95UhDzUjCa4o?=
 =?us-ascii?Q?aUzy6lF62iFJuXo4upv6XQFTiSyZK0DIc9j3ID6ibkFdde7ItMx8HT9B8L4Q?=
 =?us-ascii?Q?bYPpVwqdwjr/yOAMKRZL8olKPCBX3F67QCiU4X5S065PFfkKKMtkvugPonUs?=
 =?us-ascii?Q?nEzSFGOZZD7BbBqv1V80N850uD4VWdXl+F/rx7M+egFQ3Phn2/cW/7JJ4Bn5?=
 =?us-ascii?Q?Y6vEqo4+YcH7VekSk3sga2pYC7WPSh1YC+WPeXbv23npwurXXBjcB8YP/diM?=
 =?us-ascii?Q?k5o5m9GMgeARp3Pd3dlK6IxHvV2Ncpb92V2N85+rvMikTmVV2rqvoermEX3x?=
 =?us-ascii?Q?quKl5Ias9OpeHbb/+aWDBkH2aY6OEfiXb0OyzYLbP2mA44RdweQeeLkREkYZ?=
 =?us-ascii?Q?D/vde1qGjHlBUPjJFy9plLOff68wJCIniUt07nlximWSawPptjMCsVAgcB0A?=
 =?us-ascii?Q?Oa6y0j4EWQagxpVzgu18fgXy9m4TKbPU6OyjjsIo9vVu01pOJk7v62TRuZQ0?=
 =?us-ascii?Q?ioQE6j2tT77rGzhHOF41FlZHV1U3tvDwJ4+T3H3MgdeOdaejMDcs1jx1aAeH?=
 =?us-ascii?Q?ZeVs4UQXrNH3GD0HNVphelkAzIjoe57gcMl5EMZ2vcAeV2OmiQXJgQYpnVay?=
 =?us-ascii?Q?Oy/yxzX67WMhdKsotZXzaV+MonyehpmFf0pE0qPkW34XVqoaryrgLY/GYvvh?=
 =?us-ascii?Q?Qx75ST642oqe+vZe46Hy7e2X2mqTmE/QPq099gz7UKT8++O2HNQ2Kqq53A35?=
 =?us-ascii?Q?PIXpA3MX8OW4cAs1pJdMyRc61m1JKPkIzZVkgShg3WHYJVrru2q0y37qi8PR?=
 =?us-ascii?Q?EeNPjvzdzDJpNbxURAIx7lKhcukxK8A2Sh0XSR4X8MFA3XHTYwn/u2c6FCRW?=
 =?us-ascii?Q?4CwABrTf59Y0IIqGJ9CDQ6D8EtdKkSzaZ9a7kh27pgruT8Ex4T0iOkGhkFce?=
 =?us-ascii?Q?RJkmAnxV1T/AfdIAXHORdbMiJubcNO+DAP6+ebqB5W1XKzK0WXQUzDbmY9ES?=
 =?us-ascii?Q?aW9mEdWXPyqh1L8F58jLAsLpMyH/oV3Q1lsIiZOG/NRU69hGruqS?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4F41FD40D43CB140BF1FA67F22C8E3D2@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0ef9ca-454e-4b8f-1a30-08da3761e9a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 17:31:29.7119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n7d3+0Dr26AJdFkqygT+181GJhdE6broEoFY8Ggb194IgA/g6lYiQfKNa+nKie4ZhpJs4uKB7CwAG6mQLL2o+FeMknmt1s3Y7abVWBUNm9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6399
X-Proofpoint-ORIG-GUID: Pj0FJzLji3C6uBSP0chy4NkodpQQPnnw
X-Proofpoint-GUID: Pj0FJzLji3C6uBSP0chy4NkodpQQPnnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_15,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, May 16, 2022 at 04:57:01PM +0100, Stefan Hajnoczi wrote:
> Commit 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend
> Program conventions for vhost-user-scsi") introduced fd-passing support
> as part of implementing the vhost-user backend program conventions.
>=20
> When fd passing is used the UNIX domain socket path is NULL and we must
> not call unlink(2).
>=20
> The unlink(2) call is necessary when the listen socket, lsock, was
> created successfully since that means the UNIX domain socket is visible
> in the file system.
>=20
> Fixes: Coverity CID 1488353
> Fixes: 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend Prog=
ram conventions for vhost-user-scsi")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

>  contrib/vhost-user-scsi/vhost-user-scsi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-us=
er-scsi/vhost-user-scsi.c
> index b2c0f98253..9ef61cf5a7 100644
> --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> @@ -433,13 +433,16 @@ out:
>      if (vdev_scsi) {
>          g_main_loop_unref(vdev_scsi->loop);
>          g_free(vdev_scsi);
> -        unlink(opt_socket_path);
>      }
>      if (csock >=3D 0) {
>          close(csock);
>      }
>      if (lsock >=3D 0) {
>          close(lsock);
> +
> +        if (opt_socket_path) {
> +            unlink(opt_socket_path);
> +        }
>      }
>      g_free(opt_socket_path);
>      g_free(iscsi_uri);
> --=20
> 2.36.1
> =

