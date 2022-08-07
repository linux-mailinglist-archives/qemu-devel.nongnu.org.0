Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE658BCD7
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Aug 2022 22:15:04 +0200 (CEST)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKmfv-0007gc-IM
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 16:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oKmeS-0006DV-63; Sun, 07 Aug 2022 16:13:32 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:41714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oKmeO-0006Zt-RN; Sun, 07 Aug 2022 16:13:31 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2773GUmj019901;
 Sun, 7 Aug 2022 13:13:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=h1NJIbRguLdzUy9OLkiVyJFm0+t+aOHwiSjQ/nd21Nc=;
 b=hbTfhF9A3pay0flUAninKYUMV/0XdjMGk70famESK8tKjSXcwOXvg96UT5JIhnaejVA8
 IHEcvupaU7U1EMQLjKQNAHw8LjSqhDqERCpV2C0SRdrJrPEYuhIiPpgkUgd89n209ftk
 BLVHWTDjk0EpB8DjCHYGbygLBiJGXqSwBIT7T3zMwH76xE3y5Nt2UGvStfZCCEiLiseY
 7EIVVTCICbmmsmwOfbMILeLsWMkaAFbZWvRuXVPCQ+kEjSJWhGjItNnjapGu/KulfzSs
 PZ+X9Plf1x7/xeMPD6BrVUTz93KmSj9dnP4g7uFU3oSwJ92F50jzNgG1GYMhE6N4rboO mg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3hsm79anu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Aug 2022 13:13:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lj6edbb8LTKtmntsj2X4VuS2H8qofUF7IZFWTUJP2zVFf3XsmkzWZd1Mvu+QurY0ZwsyZBR8bO0NzsNv9NxI8+f+fkeiJ2SF11zDNCh7+S79KE7k+yqLUyMKwPlXw7yve8q9iMYVi5F69WYUxAGCcJMd7y3HtxLG/lvK7U+oicz1hn14xDWNecfYBa8XOLuLgd7DmQv7LVGaNwmy6Npz2yWwca0inCpBVuoJUUgCkdo3APGb3zcep/CVJjAoqdXdau0lEjKEAPAuHOT41RjzKBGfZX9KpN2wGutbmYJfB24/C1tqRgqnZO7PX4y+qRVDHdQf7X/p5Z2xoyXNOW/6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1NJIbRguLdzUy9OLkiVyJFm0+t+aOHwiSjQ/nd21Nc=;
 b=MBaqvt1k8PaE+nP2alyD9BS+hPJ9ugKGoELwiK+hMua4yd3qRrU0aYMq0xkl6zqQFJwO3QM4PHqelGkGtGCS6yP60FLr15BF4zYqqv5Jkb7LGGZ1FLnDTVTxS9ySDzyh6eyn5o9sOIz57fkZ9vpQODQj43MPllFQWypseQYRofM2xD+D5vNxHS1s6+Oc4mz6ptxV8wFmC+CufW4drO8GXfVvTFbHl/b7JXYAWKKxN9MRh+cUSq9kYt1lShey+VTQUiLumyUHEjqeLd7HP5YrEbUyfgbddWFKZEkH//tGagm/g2Fl+JAMwVZNWe4H5JbJDjPNDRluR4PWhVGllXYBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8940.namprd02.prod.outlook.com (2603:10b6:208:3b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Sun, 7 Aug
 2022 20:13:13 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::6c63:f572:60b4:ca7b]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::6c63:f572:60b4:ca7b%5]) with mapi id 15.20.5504.020; Sun, 7 Aug 2022
 20:13:13 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "slp@redhat.com"
 <slp@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "mathieu.poirier@linaro.org"
 <mathieu.poirier@linaro.org>, "viresh.kumar@linaro.org"
 <viresh.kumar@linaro.org>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH v4 11/22] hw/virtio: move vhd->started check into helper
 and add FIXME
Thread-Topic: [PATCH v4 11/22] hw/virtio: move vhd->started check into helper
 and add FIXME
Thread-Index: AQHYplawN3UdJYcMvkiiPtIiYJBts62j54mA
Date: Sun, 7 Aug 2022 20:13:13 +0000
Message-ID: <20220807201307.GA32495@raphael-debian-dev>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <20220802095010.3330793-12-alex.bennee@linaro.org>
In-Reply-To: <20220802095010.3330793-12-alex.bennee@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40e87be5-cee4-457a-50d3-08da78b141bf
x-ms-traffictypediagnostic: BL3PR02MB8940:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cHQ7rXZYcszXpit2EAiPbfgrfaoECwpBGSOIh4b9Q1tStnB21aTtSnwZ9VujSxpRjJvp5BiQQ9mr1UWmfTI/O3hsmNO7gm584mDV7piWAkUGatSb6d2cSkfKFAfIEXTJpzclvNg402MzaDHft2z6b5/xsjhen+HKw7gqnyYDTgpTJFWqhe7RZsQzLu7Y/NA1hpt6j0YmByMOPVIUc5TvqVzngeE9T/Dv+4bGxT1bkdO7ZzGdfTUeFx/16qxvCh+o4o6PswN9e33xp70MlkZv9/C8hCjQs/rSr54aogLbvFUW9voJXhrT1JQD1Ctt3pGajle2GMXSkOKpC5E7GGoC8To/jPEX/0g6986dn9b0nNLppkOPvhboh95FUX69vzi4pAXeHgliUprpIW8K2QmS+IrD1EWU/55nHnLzaAxWY2QpAm4wWLy4MzcT/Ef4tKThK454S9063wFuREvAJhWbV6Z8f8L86WzGOH3I2s2Es38/4nSgvh2bcfr1+9hLth4iE8dgkD+hGzzkLco0584lo43rF4P63mO/ZJuLojMiJ2fmpAx3zkxoAd1E/ZqWU4moGtXc98Z/JxsZVMAXgaPjFL2FfNVTPLKrmNTRnSWeufvYuuuxNJyiy/4z4IZglVGV/h2eVFFgVpr1qHw2gestmUmxYiwHbYDRsqjjgvmNIzqvXQrToJXmzZHdGdDs1ZzsCsPZE4/pUTZXSbPD684Lw1ERp2SlnxZcli+ez9Qbwi74muOBAPGkXriOzKSsCWG9swgO6990lQpdlbJgbqcfmQ5Mo5biPZDRiLF8w8LkC9iUNZBqBLgqg3HckSaGytYZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(39850400004)(396003)(136003)(366004)(346002)(66946007)(6512007)(26005)(9686003)(86362001)(122000001)(38100700002)(6506007)(38070700005)(1076003)(83380400001)(66574015)(4326008)(41300700001)(8676002)(186003)(64756008)(66446008)(7416002)(76116006)(66556008)(66476007)(33716001)(33656002)(44832011)(2906002)(5660300002)(8936002)(478600001)(316002)(54906003)(71200400001)(6486002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hLVC/AqssGPDW7tcO5IH2ckUa2FZwdP298f8mIbdoqd4lQw++zir+5v79E?=
 =?iso-8859-1?Q?Wdf+NNZBD4YjU9sITC7SOogJIe9IbOGXThE4+OqRTJRfz1QGXveB8Kgzr6?=
 =?iso-8859-1?Q?wauTXmg9h4k2qPx5eZolDadOqNN4eg331wsgXixxg6oSkeY2YEGB/MEWhc?=
 =?iso-8859-1?Q?uwCK8QnCeFoNGJ8FsnH78OhftdMVeXMSsyeqS1KjbGu3Y06IpXMG3gg2r3?=
 =?iso-8859-1?Q?w0c9/lgsa0K9l0QAh7D70lM+FOZodYb8+0V5MONVUcmVveENYf2U2XqZbt?=
 =?iso-8859-1?Q?GH95DVamh1NicMIim9Jwp9edTBSc2p9G5HRW0gDQG71OxePweIhxNuQu1r?=
 =?iso-8859-1?Q?IwEBisHAW2a3cP4qdncdfUiiOf5FkNUVoO1eRUjAd+yAnR85zUxRH7wt8H?=
 =?iso-8859-1?Q?sN2viXZ1L0wKculkZmrxXog0ZwF4U0QbG3jrQXbfDEYBPnfOSxGyy8iz+n?=
 =?iso-8859-1?Q?jmIpfGVpAVvqiqFhzYPdtcifC8eHkVt9Mx1wDwzAZ7IXWByziB74SVULH/?=
 =?iso-8859-1?Q?9MWmi9Q9BOp7bzXR2hgzYfVcwuE9TqPD3zTBK+MZ8P2F1dS3gPR2jDFv1a?=
 =?iso-8859-1?Q?Hd9xds6Ym6LNWl+BnYXNZDr6mocl+FILSs26HA/PZZ8qodhx+BJ4P1WB15?=
 =?iso-8859-1?Q?lTAzhILLGtHHB6Wt4hX1t8FzBtUuXfDZ62k26YqAEi7z5lmka5fmhfyP9l?=
 =?iso-8859-1?Q?qRo5XZ4zXpz3wznRPfzN+Sr+jSNgjlOnpfb6/N3YegSbFmhj2XmZVU6Hm6?=
 =?iso-8859-1?Q?7F5aTYcnVJetBS9nKa4kf4frIcgb5qqdee9NcOsNlhou2sBpoVCCDKryxG?=
 =?iso-8859-1?Q?HtMgZFSpsKiuR95vGUrY5GLEfTgHj5kFAOBsBRLH0erZ1jP1BiCeKNyUt1?=
 =?iso-8859-1?Q?RFPUcpLwjiw3XLE1URHqfP9Z0Gw6tSn9UoDcsLwH7C692ZJWPu+9omvSPQ?=
 =?iso-8859-1?Q?6KD/uTB1AQ7nn4DTc9zNETscOY0DYEOYP+zAQcXHTVhP7meaLS1PHYP2Ev?=
 =?iso-8859-1?Q?JAmbc6U3LddOCP0Pr0qy40OYm3X+gDIacgOB1cpBWLn1yFXb0CdXFqT6Md?=
 =?iso-8859-1?Q?BtQirfe70c7db42PyPirtTL/dAGGP9K96NoJrXiiJr0SpbWhGNYoK0pwRW?=
 =?iso-8859-1?Q?INMfy+9t0PEetXv2YWmzU5iomqB6Ras62nBvvHQ74CxkaPeDi4KcXcRQXc?=
 =?iso-8859-1?Q?4gH/Oav2R73ZL/Sq2JNqsWSWhRENYJtLpv66YlsQyGiW6St1jrvKDBcAiu?=
 =?iso-8859-1?Q?xtuZtADa4gq8YeVu0gQDA4m2O8Yma48UxwAE9BhCoj7EVxqGcZdfYbsO+t?=
 =?iso-8859-1?Q?5x4w7wUJv2nkoc/rF+8S2sCfQDiN+XMVrjgI9r2lH4YghBK6v22gfEG5PW?=
 =?iso-8859-1?Q?jkTz38bPLVIC/2HBHm3SI505IuWO0ZCR1emmWkUTVZ8+PjJC5WMIBRSSYR?=
 =?iso-8859-1?Q?FoWOZ32CeYhN7fBjJVWDL+5eenoRfW0i6x4Nhc287zxlM0qL6oAA+MhX3z?=
 =?iso-8859-1?Q?yqox60YYGXIWYnLN2COMi0QIU41WzzgfPMdIekWLI0gIYqFBiFMl84d+m0?=
 =?iso-8859-1?Q?M12ceqItGmFmDP6z3Ohm3Yjqj+oTYi37KylEYZ4esVfN5h8hLElrXDo+6A?=
 =?iso-8859-1?Q?QbuEraPOha8i1BIKdKl4RV0nJokSGZK6CpcucNi7ccBtx4M+Dul1kuC8/0?=
 =?iso-8859-1?Q?M13lw+8BrWNvfJ9xubE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A16D428FCBDC644CACAB231038A848F0@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e87be5-cee4-457a-50d3-08da78b141bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2022 20:13:13.3479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nyG+xOXN8ZeenVWlORTUwVky2NeZgEeVggZH81jwknK90kveuJHkrUEG9iXEGL7IHZwmA4GfrDPyt9FUEAeKQMGC0UKNZYJ7f6vcsLmDv00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8940
X-Proofpoint-ORIG-GUID: 0GmpVDf3IdRzO3KQVYtQGEjvrg9UW1PD
X-Proofpoint-GUID: 0GmpVDf3IdRzO3KQVYtQGEjvrg9UW1PD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-07_13,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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

On Tue, Aug 02, 2022 at 10:49:59AM +0100, Alex Benn=E9e wrote:
> The `started` field is manipulated internally within the vhost code
> except for one place, vhost-user-blk via f5b22d06fb (vhost: recheck
> dev state in the vhost_migration_log routine). Mark that as a FIXME
> because it introduces a potential race. I think the referenced fix
> should be tracking its state locally.

I don't think we can track the state locally. As described in the commit
message for f5b22d06fb, the state is used by vhost code in the
vhost_migration_log() function so we probably need something at the
vhost level. I do agree we shouldn't re-use vdev->started.

Maybe we should add another 'active' variable in vhost_dev? I'm happy
to send a patch for that.

Until we agree on a better solution I'm happy with the FIXME.

Reviewed-by: Raphael Norwitz <raphael.norwittz@nutanix.com>

>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  include/hw/virtio/vhost.h      | 12 ++++++++++++
>  hw/block/vhost-user-blk.c      | 10 ++++++++--
>  hw/scsi/vhost-scsi.c           |  4 ++--
>  hw/scsi/vhost-user-scsi.c      |  2 +-
>  hw/virtio/vhost-user-fs.c      |  3 ++-
>  hw/virtio/vhost-user-i2c.c     |  4 ++--
>  hw/virtio/vhost-user-rng.c     |  4 ++--
>  hw/virtio/vhost-user-vsock.c   |  2 +-
>  hw/virtio/vhost-vsock-common.c |  3 ++-
>  hw/virtio/vhost-vsock.c        |  2 +-
>  10 files changed, 33 insertions(+), 13 deletions(-)
>=20
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 586c5457e2..61b957e927 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -94,6 +94,7 @@ struct vhost_dev {
>      uint64_t protocol_features;
>      uint64_t max_queues;
>      uint64_t backend_cap;
> +    /* @started: is the vhost device started? */
>      bool started;
>      bool log_enabled;
>      uint64_t log_size;
> @@ -165,6 +166,17 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hde=
v, VirtIODevice *vdev);
>   */
>  void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *v=
dev);
> =20
> +/**
> + * vhost_dev_is_started() - report status of vhost device
> + * @hdev: common vhost_dev structure
> + *
> + * Return the started status of the vhost device
> + */
> +static inline bool vhost_dev_is_started(struct vhost_dev *hdev)
> +{
> +    return hdev->started;
> +}
> +
>  /**
>   * vhost_dev_start() - start the vhost device
>   * @hdev: common vhost_dev structure
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 9117222456..2bba42478d 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -229,7 +229,7 @@ static void vhost_user_blk_set_status(VirtIODevice *v=
dev, uint8_t status)
>          return;
>      }
> =20
> -    if (s->dev.started =3D=3D should_start) {
> +    if (vhost_dev_is_started(&s->dev) =3D=3D should_start) {
>          return;
>      }
> =20
> @@ -286,7 +286,7 @@ static void vhost_user_blk_handle_output(VirtIODevice=
 *vdev, VirtQueue *vq)
>          return;
>      }
> =20
> -    if (s->dev.started) {
> +    if (vhost_dev_is_started(&s->dev)) {
>          return;
>      }
> =20
> @@ -415,6 +415,12 @@ static void vhost_user_blk_event(void *opaque, QEMUC=
hrEvent event)
>               * the vhost migration code. If disconnect was caught there =
is an
>               * option for the general vhost code to get the dev state wi=
thout
>               * knowing its type (in this case vhost-user).
> +             *
> +             * FIXME: this is sketchy to be reaching into vhost_dev
> +             * now because we are forcing something that implies we
> +             * have executed vhost_dev_stop() but that won't happen
> +             * until vhost_user_blk_stop() gets called from the bh.
> +             * Really this state check should be tracked locally.
>               */
>              s->dev.started =3D false;
>          }
> diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
> index 3059068175..bdf337a7a2 100644
> --- a/hw/scsi/vhost-scsi.c
> +++ b/hw/scsi/vhost-scsi.c
> @@ -120,7 +120,7 @@ static void vhost_scsi_set_status(VirtIODevice *vdev,=
 uint8_t val)
>          start =3D false;
>      }
> =20
> -    if (vsc->dev.started =3D=3D start) {
> +    if (vhost_dev_is_started(&vsc->dev) =3D=3D start) {
>          return;
>      }
> =20
> @@ -147,7 +147,7 @@ static int vhost_scsi_pre_save(void *opaque)
> =20
>      /* At this point, backend must be stopped, otherwise
>       * it might keep writing to memory. */
> -    assert(!vsc->dev.started);
> +    assert(!vhost_dev_is_started(&vsc->dev));
> =20
>      return 0;
>  }
> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
> index 1b2f7eed98..bc37317d55 100644
> --- a/hw/scsi/vhost-user-scsi.c
> +++ b/hw/scsi/vhost-user-scsi.c
> @@ -49,7 +49,7 @@ static void vhost_user_scsi_set_status(VirtIODevice *vd=
ev, uint8_t status)
>      VHostSCSICommon *vsc =3D VHOST_SCSI_COMMON(s);
>      bool start =3D (status & VIRTIO_CONFIG_S_DRIVER_OK) && vdev->vm_runn=
ing;
> =20
> -    if (vsc->dev.started =3D=3D start) {
> +    if (vhost_dev_is_started(&vsc->dev) =3D=3D start) {
>          return;
>      }
> =20
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index d2bebba785..ad0f91c607 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -20,6 +20,7 @@
>  #include "hw/virtio/virtio-bus.h"
>  #include "hw/virtio/virtio-access.h"
>  #include "qemu/error-report.h"
> +#include "hw/virtio/vhost.h"
>  #include "hw/virtio/vhost-user-fs.h"
>  #include "monitor/monitor.h"
>  #include "sysemu/sysemu.h"
> @@ -124,7 +125,7 @@ static void vuf_set_status(VirtIODevice *vdev, uint8_=
t status)
>      VHostUserFS *fs =3D VHOST_USER_FS(vdev);
>      bool should_start =3D virtio_device_started(vdev, status);
> =20
> -    if (fs->vhost_dev.started =3D=3D should_start) {
> +    if (vhost_dev_is_started(&fs->vhost_dev) =3D=3D should_start) {
>          return;
>      }
> =20
> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> index b930cf6d5e..bc58b6c0d1 100644
> --- a/hw/virtio/vhost-user-i2c.c
> +++ b/hw/virtio/vhost-user-i2c.c
> @@ -95,7 +95,7 @@ static void vu_i2c_set_status(VirtIODevice *vdev, uint8=
_t status)
>      VHostUserI2C *i2c =3D VHOST_USER_I2C(vdev);
>      bool should_start =3D virtio_device_started(vdev, status);
> =20
> -    if (i2c->vhost_dev.started =3D=3D should_start) {
> +    if (vhost_dev_is_started(&i2c->vhost_dev) =3D=3D should_start) {
>          return;
>      }
> =20
> @@ -174,7 +174,7 @@ static void vu_i2c_disconnect(DeviceState *dev)
>      }
>      i2c->connected =3D false;
> =20
> -    if (i2c->vhost_dev.started) {
> +    if (vhost_dev_is_started(&i2c->vhost_dev)) {
>          vu_i2c_stop(vdev);
>      }
>  }
> diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
> index a9c1c4bc79..bc1f36c5ac 100644
> --- a/hw/virtio/vhost-user-rng.c
> +++ b/hw/virtio/vhost-user-rng.c
> @@ -92,7 +92,7 @@ static void vu_rng_set_status(VirtIODevice *vdev, uint8=
_t status)
>      VHostUserRNG *rng =3D VHOST_USER_RNG(vdev);
>      bool should_start =3D virtio_device_started(vdev, status);
> =20
> -    if (rng->vhost_dev.started =3D=3D should_start) {
> +    if (vhost_dev_is_started(&rng->vhost_dev) =3D=3D should_start) {
>          return;
>      }
> =20
> @@ -160,7 +160,7 @@ static void vu_rng_disconnect(DeviceState *dev)
> =20
>      rng->connected =3D false;
> =20
> -    if (rng->vhost_dev.started) {
> +    if (vhost_dev_is_started(&rng->vhost_dev)) {
>          vu_rng_stop(vdev);
>      }
>  }
> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> index 22c1616ebd..7b67e29d83 100644
> --- a/hw/virtio/vhost-user-vsock.c
> +++ b/hw/virtio/vhost-user-vsock.c
> @@ -57,7 +57,7 @@ static void vuv_set_status(VirtIODevice *vdev, uint8_t =
status)
>      VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
>      bool should_start =3D virtio_device_started(vdev, status);
> =20
> -    if (vvc->vhost_dev.started =3D=3D should_start) {
> +    if (vhost_dev_is_started(&vvc->vhost_dev) =3D=3D should_start) {
>          return;
>      }
> =20
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-commo=
n.c
> index 7394818e00..29b9ab4f72 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -14,6 +14,7 @@
>  #include "hw/virtio/virtio-access.h"
>  #include "qemu/error-report.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/virtio/vhost.h"
>  #include "hw/virtio/vhost-vsock.h"
>  #include "qemu/iov.h"
>  #include "monitor/monitor.h"
> @@ -199,7 +200,7 @@ int vhost_vsock_common_pre_save(void *opaque)
>       * At this point, backend must be stopped, otherwise
>       * it might keep writing to memory.
>       */
> -    assert(!vvc->vhost_dev.started);
> +    assert(!vhost_dev_is_started(&vvc->vhost_dev));
> =20
>      return 0;
>  }
> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> index 8031c164a5..7dc3c73931 100644
> --- a/hw/virtio/vhost-vsock.c
> +++ b/hw/virtio/vhost-vsock.c
> @@ -73,7 +73,7 @@ static void vhost_vsock_set_status(VirtIODevice *vdev, =
uint8_t status)
>      bool should_start =3D virtio_device_started(vdev, status);
>      int ret;
> =20
> -    if (vvc->vhost_dev.started =3D=3D should_start) {
> +    if (vhost_dev_is_started(&vvc->vhost_dev) =3D=3D should_start) {
>          return;
>      }
> =20
> --=20
> 2.30.2
> =

