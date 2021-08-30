Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09B83FB962
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 17:58:06 +0200 (CEST)
Received: from localhost ([::1]:41414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKjfX-00086K-S1
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 11:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mKje4-0006Sd-Q4
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:56:24 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:45416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mKje2-0006Uf-C7
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:56:24 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17UBWIQh013630;
 Mon, 30 Aug 2021 08:56:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=DSumLA2eECRVWmsZ3bWroH7AciZBuVjL+nnn9e1/kF0=;
 b=g/yj5YNYLgPgFh1GcVEXJ0OND6UwRyKmt1tflYZh5gDu8ntf2IaJ0yGlkk3eAoYSIZqZ
 T4fcaTz5gJCaedffaGuSBydRGVO0QOnhfJDb76r8CGK0idzMtQEHtBNNByGhqDSCkQx4
 qEbPHojSACPQNS33dxS1j6kk6mL32S1tc2w+CU1A0mEHav5bsvhBP4CvsoAdWC1ZGYLL
 SAolNMYLlH5xjS7lODQRMJ3axKcdgNQyNG3wJdJqdq+bwstYhBAUyF0quri4A266v0ml
 QBBVwmPYwQnp2ykOmz8Hq+jTrpxJHXWuhBQw5zmc9Z2WwT9eVEMI2SG8lOV3ZVGRYwLA KQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3arxhygf00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Aug 2021 08:56:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7e4i1NMdkVMoqrExSzgYE7zsSnZkwYLKkUr9xvIupQPkQNlTQSTkoqXA/IzllGGUw6zuKdZeanW6yvANICkuImayEm/X7c4GvksLrYxdrIZQilHQdr9tHhknvKDzUmQnAloH/QmuatJKcQgml6ODy0IGYgJL00Yl7QAj6RNP8YBzXeUTRsDzPsFr05CAdO9BjsHwPmQ91RMwZ8qePElZ5YKayVUb686SUUGKzezvg9rz/iNXOxKAggRtinUQcbTcpdj9EWW0OVulpq1dE1mMG100zVbl6umKezZovAzp+Ng5jjHfsE1Wz7lV1jR82uNA6vcqs39m8eJPjtAqRkfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSumLA2eECRVWmsZ3bWroH7AciZBuVjL+nnn9e1/kF0=;
 b=WckUzzjKHwrKj31anE+zF2WCY2ZGSrcAoXqCVCqTBYlVgp8GbBWwKKAC1xnmxdU9lbsFtPZaMqU1AP+xm5fNALBTEl8K9aKKzZHl26EBUavnqL7VCQkPZKeF7GON1C9N/cyWe8uGbSvO1JDeHpuvre+U1iOtfR46sRo/Z/huzqU12RDRldMw/RhRcHz2dbJ26EILMvklOsrpoHuQoNZyYhpVXhCZUB03k2s+mN5JtlXMGQQ9IFKxfvb3HGdSv/gsphRRuPDZG9wXaXcbjXXNek8B3X9bqjm+6pMSaQ9B8FAbrPRtp4LVMr5xrKP8yORK1/Mt/aCB1GISTGCgkAAjJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN4PR0201MB3581.namprd02.prod.outlook.com (2603:10b6:803:4b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 15:56:16 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::992f:b2c5:6a7c:3cfd]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::992f:b2c5:6a7c:3cfd%3]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 15:56:16 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "eblake@redhat.com" <eblake@redhat.com>
Subject: Re: [PATCH 1/2] storage-daemon: add opt to print when initialized
Thread-Topic: [PATCH 1/2] storage-daemon: add opt to print when initialized
Thread-Index: AQHXm2Oo61Tm7fDuAkWMts24tps1KquHsmYAgASF7YA=
Date: Mon, 30 Aug 2021 15:56:16 +0000
Message-ID: <20210830155611.GA23709@raphael-debian-dev>
References: <20210827164954.13951-1-raphael.norwitz@nutanix.com>
 <20210827185148.m6lvdrceygr6iz6y@redhat.com>
In-Reply-To: <20210827185148.m6lvdrceygr6iz6y@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ba258d4-143f-44dc-4a92-08d96bceb34f
x-ms-traffictypediagnostic: SN4PR0201MB3581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN4PR0201MB3581D90BC3EE79B37873DF62EACB9@SN4PR0201MB3581.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: owN3y8J5ijJODqIJNhJHfS9J7rF9BLPrHwtTf54zoHUQT84e8OVwucL5c2Ei+ILP/HCoE3IqKlvx0QK9q57cvdLVdSxujIXTjDo/X3tBvdQ7jwm4y8rebjM2F6g0XEnoIvlLjcX6Q9l4exK0KlVFN4g5qF1J7EP+aGkxYtdAkOwZ9hM7GI/Rcvw93PotBjR9/u+T6hCwE6L+m2qruwxfxLcYR4PYmu4StEp9SFFXSt+veHaEmq8iqittIysaTEVyEXBt/+FiaRyeiMNP9BVVGRaCZXkJISIMbaJs00+1qQhjLoqk6IXshGEkSahSODdQGRY3eM6xB+tp+YD+ByxAWrQzZ78R/HO02W64sD4Vx/AEAAm6z+hNIrPa5pU+d0eouUsnzM8ZTIYuKrrAr7i/ADjByc50SiZ9x3n04uFKPuTXOkwhivNISZLZ/KJdOJaDcQ5IoQoigNs+IWTH9Beq5NseG1NT5/w1qVOelc5XOA1j8NvaQYn2OvifAfilhitTAa3cnCtoa+v7Se0X7zQ8abdrmUL7Uq85jCCLIeFtSWNqvOnNie16EUEqZ2zxGGR/8xiMLVTZQoksvfdywbgT7RJHQPkMNi1KgUoIWzAl0N2UcIFETF3WyC51m5x//4GpTPnMwTg9V3hP4jaJUEyGPPoiT5T4l4j2MsxxNH+eLn6C9jJomDSfChZzHkNzakOJbI2DbHn/uQiScF49JmBChg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(346002)(366004)(396003)(39860400002)(136003)(376002)(2906002)(44832011)(33656002)(316002)(9686003)(6512007)(71200400001)(54906003)(76116006)(91956017)(66946007)(66446008)(64756008)(66556008)(66476007)(6506007)(6916009)(6486002)(8936002)(86362001)(4326008)(186003)(26005)(1076003)(5660300002)(478600001)(33716001)(38070700005)(38100700002)(122000001)(8676002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5fiUR8ENjjUTzjGFZJUDKndLeyFYedy5fonn8uSw384NIMLQJQ4RXnYTQLFD?=
 =?us-ascii?Q?GwtS3cMznt+VcAOjvhwfz8QM9InvAq08NZ5rFH0Stav8ilflMnkES42LCBlM?=
 =?us-ascii?Q?YgGsg3Nrgc/oJZTPq78iOpUVq3hqdSaKFTROyjb/Cz6GRT2cnXiZdIf1Hnel?=
 =?us-ascii?Q?S26rQHgG0InaB488EU6xVIe/SdRupsnvNAQ5ie6BOucAXYYecl0sAVRfC7Xj?=
 =?us-ascii?Q?j4GfOGnabkPK+QFZDD2ZJcObM90pq4Br4LlI9zVyNG3onfmI7bq6YlBy9gF9?=
 =?us-ascii?Q?Pa14uG+s4RIkA0YiGrU9HS9kaiOyvXtnVRR4HAJfjNdRMoX+IgwV+ZjbD/wJ?=
 =?us-ascii?Q?URSfv6licGsgFAmzxK9lrGCuFbhKTb4huk//npI9CFUkiRhBbszzqzYHs3dq?=
 =?us-ascii?Q?BIHdTBxZo3fcbIljAe1zkimsfmPXnZs+RQrwaivcb7Jgsic6MXS8kRf0ourx?=
 =?us-ascii?Q?/Ki6u9+pitrW27//9QmJM/5Au++NGVys9qXIYKPPwW13mnGkQ3yd9khBMrG5?=
 =?us-ascii?Q?NDId8Iuo+nG+h9BKaaOWHEIWxneFK8E5GzNDydJ0Ss+Pounzz0ngLlSqroGf?=
 =?us-ascii?Q?xN6hQQBqKS8ANoTL31XTGvPVR+UNGMo9LavRKmliopetq2GXqlDFeAEVIgna?=
 =?us-ascii?Q?2zzW85Djj/0j4tHNM9KDcIY4JeLq1qGXTcy1SLyTJXi5lF1SnGP5WFHg4InB?=
 =?us-ascii?Q?51y5YBupjdWO4sIh6o8sP1HYpaqSQIDkhog07wEA6ehz0rOIZCc63Rgi2dwq?=
 =?us-ascii?Q?fUcT1EsZURyjIVL/hkpX6muNot7kH4zf6V9dHWQJAX2eQ06Fn+6/vkUSd9Kl?=
 =?us-ascii?Q?bNFhW9t1dvBQbWTjeCbkBg1/oSbeMy0h54nHMGeCOdpd9wEPaFsY7TYov9Zl?=
 =?us-ascii?Q?odj99GuwC7jDjCS5AV29vk3MRPov9SffOar5oKdEIjUfto9Vdb2jE6nXbAC+?=
 =?us-ascii?Q?dTxFEtFCqZNP+yNlTe+vOcfW3KC4vGH9VAdx0msXE5yWXKaDDhnBIe+hqoFh?=
 =?us-ascii?Q?g1U9JNsVxKbBlzNXJmeImCQOrGZLYUzXNsX6h7npAJ11Ba5TyTYpWDMiRBkw?=
 =?us-ascii?Q?wonrm7pfY0UgXJJIk/3xtl/22Y+i/k3z5PFX0sx7OCEsp0UzdzVCb7Xq0Jd6?=
 =?us-ascii?Q?X5THohkXSPwoaxJtKD+9TR/rE3SWqACUWKifqZTmRnEG+BWJDBp6aW5s6GJf?=
 =?us-ascii?Q?TbRtXFcY+0/8hcGGcmTOFw3BCD3tWo6hW3tYk+h9ndaRGg9IihTU7wKhP/7/?=
 =?us-ascii?Q?1wZH7QaohXXFRw27jRP9i5OST8S9zdZP3Aw+kZqwwK2/6/zs/dEY+3JXymAu?=
 =?us-ascii?Q?hAcEHcXKVsp049cuxSqiHcwZEa0InZIrI6T3/sWZ0KblxQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B5E99F22C123D948A9791AB782A88E6C@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba258d4-143f-44dc-4a92-08d96bceb34f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 15:56:16.3300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rIL288503Ix4HeuyZrdMDS8pN/lbQx+I5p/qmegBK92g/ERF9rDCJhmI3LylsEqeqtVQ+SKbGPRZXLfNOQD2ueUGtKWHV6Hn66pq34qC4ZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3581
X-Proofpoint-ORIG-GUID: Z8CjXl41ysTvjgbBjZTegmynFEuy_Kr6
X-Proofpoint-GUID: Z8CjXl41ysTvjgbBjZTegmynFEuy_Kr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-30_05,2021-08-30_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 27, 2021 at 01:51:48PM -0500, eblake@redhat.com wrote:
> On Fri, Aug 27, 2021 at 04:50:35PM +0000, Raphael Norwitz wrote:
> > This change adds a command line option to print a line to standard out
> > when the storage daemon has completed initialization and is ready to
> > serve client connections.
> >=20
> > This option will be used to resolve a hang in the vhost-user-blk-test.
> =20
> Doesn't the existing --pidfile already serve the same job?  That is,
> why not fix vhost-user-blk-test to take advantage of the pid-file
> creation rather than output to stdout as evidence of when the storage
> daemon is up and running?
>=20
> Therefore, I don't think we need this patch.
>

Sure - that make sense. I didn't use the pid-file because I didn't want to
risk leaving junk on the filesystem if the storage-daemon crashed.

I'll send a V2 using pid-file without this change.

> >=20
> > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > ---
> >  storage-daemon/qemu-storage-daemon.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
>=20
> Missing a corresponding change to the man page
> (docs/tools/qemu-storage-daemon.rst), if we decide to go with this
> after all.
>=20

Ack

> --=20
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
> =

