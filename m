Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788B636DF87
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:26:53 +0200 (CEST)
Received: from localhost ([::1]:39744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbppk-00029r-IN
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lbpnj-0000wZ-N9; Wed, 28 Apr 2021 15:24:47 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:40276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lbpne-0007jQ-Fr; Wed, 28 Apr 2021 15:24:47 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SJN2Qa013554; Wed, 28 Apr 2021 12:24:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=Ll3+tvAPsAzXbFYbW9hHosUWI1fSKs70EcnmyYHUbno=;
 b=wlplS5CmsulnQubyZFajZLpKlgZ+WcZGPbQOuW0GU5F7Mgjd4nNxG3VzYCnQf2iKbWeY
 X9ThmfCP1ko2Q222uXQ/zCErOio8B42WEC4RQML/8qkaIS63dI6TircpLdQbzdU6f9oq
 cFPVWlqP/gwapzJ75nzNroghakFv+A6BcYzsAQXvOUZk7zqq01laV80Zyr2/7RA4gYue
 UTsPf2qK5j5/yCvC9J0ui+F7xqr44xDct/IZuGq7bKHtudJGXwITvge5n7jbbB5Lcie/
 4JnIFhpB6DMwJ2KtOYH45BvEmrAQDcaCoQINwk31/GXFRSikhhji9Wzl107J+J3fQhOk Cw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0a-002c1b01.pphosted.com with ESMTP id 386t3htbe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 12:24:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFAICy1Rwj2De00dKPsJasqZi2LxjLCk2UShD4HHimuLkZq1yhb70/cmOZe3MaZMN2Iv5FK3IZJ1531q/nPl9B5+JJMpoEdqYq70RmW5924j1Jt2R6R1xEsN6VTXEWoQs5Kh9XaZJPKh8Qqn+P9mZCQgXtiyOZTTXp3NkdLdYvQfpaGH45So6MmEcMnIAF5guqjN+HnU6AANHacm1G1lns+M9Cf6yP8EPsa/+rAcIqemyffuyp6m4wJPBIOqYy6ziuaO8Ku4wHxg7btjKK9e6UdCaC3LVTaW6pwZTA1NwPu8HgMZFllyG+RcbqZ4n6RUo/Qx4Z/Ic+Ntdkbso9EDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ll3+tvAPsAzXbFYbW9hHosUWI1fSKs70EcnmyYHUbno=;
 b=FIf5YKhwMDk+bi/CvCbq230MlfY5+ukXQRPwXe0aOFYJv9LID+6X6lH3gDYJgUxjyR0QkU9LeSxa93t6zXZOOB5yEcnsJg6TShoimbbCfyqBCs4LQmCPHCSmusVMI0+pIbKUE63+L9OXo2DSZDIqgCeFDOfh8GyeW453kQ+dnDDKdUFIdo/6uSr5fMs+hmiXRn95i4gLC91At6R/9qmS6H5f5OLNihmUjTnnC/R+0NOOLAn6WjfGJKvAkls2jKWDhkES/ncARL430vTPQDrjn84ynUofB7D+5Ii3pp9pM1Qz38jmFb5zcOZ2zHqoMe6v8zuvt7xgDvLgafnP9v4QmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN1PR02MB3821.namprd02.prod.outlook.com (2603:10b6:802:2d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Wed, 28 Apr
 2021 19:24:35 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 19:24:35 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 4/5] virtio: Fail if iommu_platform is requested, but
 unsupported
Thread-Topic: [PATCH 4/5] virtio: Fail if iommu_platform is requested, but
 unsupported
Thread-Index: AQHXN5lWW/llp3lkL06gnwadtyn+KqrKWQeA
Date: Wed, 28 Apr 2021 19:24:32 +0000
Message-ID: <20210428192431.GC20605@raphael-debian-dev>
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-5-kwolf@redhat.com>
In-Reply-To: <20210422170221.285006-5-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [69.122.45.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 547014a8-4ca4-4eea-6f05-08d90a7b420e
x-ms-traffictypediagnostic: SN1PR02MB3821:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR02MB3821A0D1934BE96B7860D7ECEA409@SN1PR02MB3821.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /jLnyHtjgM1tEMuD5TYNtUy4GoAQEdHfUF/vzQeAoDgRGRGRfzP0NoQwoRyvAbCOVOnyx6SIRqzb/uRBPROSADBLKLiF/C+EU3qXpu+/NDuxVnsH5mLydrTb7Fyz+oD2itm4OCz9xODiWAb5FTs+6z/68a30sHi5LGMRcweJTROSRL/4+IAZnxmpre7rE65F37f4yftOq6IiYOU/8fL2ZmJR0JVamHxVwFR12P6sdyp1AR7pCEcPvCKhoe8Q2CzqqgYLS1l/WGsnDK8uSmDIlso602xDmcAD5uN8e+P6jGZFkYBHN0UgOgXuTlFke0K1eNCIJfxhHNhpmjOGlTd5OuXXA1cuCCNW2awjdYhvOpTnYy+m/82C+R3pzEgPVXDa2Z/UTC5LeRi7noqpziNn4Fr3YWPVrTW5a+Y1aGDkcDTg6UaxUXSXcmytL3NpIU6ixbhZeSy6DOR5vb3qDzl25sLIKE51zi+UIoSuck/GTri8iH7d+W/0oij2/VdcDpauU22hpPLf7NndgX4HTrZuYfgGxFO9pQap7rkCc73EhegfroUgSQ8t6S11LYsMjLbku40N6oR8bKnScHdFln9TEvya+HNTlCDCaysVb+G9nEnM7kFFE8bJpMWzQ3Vc7XorOiIJNHwcnTMCvqGeA6omebLzmEkS4A85xYFiAfXWl3ENF2HHq2d4oF59WKLpnVwW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(346002)(136003)(396003)(376002)(39860400002)(366004)(76116006)(966005)(6506007)(33656002)(83380400001)(478600001)(54906003)(122000001)(71200400001)(6486002)(38100700002)(8676002)(44832011)(316002)(9686003)(91956017)(5660300002)(6512007)(8936002)(66946007)(66446008)(2906002)(26005)(6916009)(64756008)(86362001)(66556008)(66476007)(6666004)(33716001)(186003)(1076003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?R7mp4CmeiS1JMoO7/SYVHJkkPfDYHdndiShcLr8Z2Eb8wkG3G9fsPL2bePdo?=
 =?us-ascii?Q?K7GzUj6lhLED0ci1Szprw6k687Rb7NVqJCqQEuxZwb++nq/DSSlu3PGQPRlg?=
 =?us-ascii?Q?RKa7qknvnbPPuFluOHLfaubjYhhqD5Ey/hy+SM3gLmcyG2JLX6LMwaGw6fK8?=
 =?us-ascii?Q?QGMi0E3VhobiWoLlH1o/jo+xdEsNpDMRsB6MFzchZa64vWBih+0S1Y32icyh?=
 =?us-ascii?Q?jAVp1qKqgtkOGYiPbrxBld8RWkocRpbot31YvCK9f0rR6RiFmG7J9vUcxbjl?=
 =?us-ascii?Q?b/TObnifIbKYms5nCdWkDdaaZp5fc9nFS16CvCQ2wBj6K2C1n44NQhma1LiU?=
 =?us-ascii?Q?H+UU/IapzuX6ywesOP8KkZBFxdJFZZQpmN5USxVi5rBtK0F2AbfOXRIX0QFg?=
 =?us-ascii?Q?1lgri7XXf0lNXiMsbe1mz8t4yGFqhuEsX28krQ4sE6sQlEdk3LNj8UP3Bmye?=
 =?us-ascii?Q?/27wlFj25AdmnrG0kJqq7SslKySGxGTqX/y9Y3GOyx92oF3pfu7Wqvu7o5Hx?=
 =?us-ascii?Q?jvnXm5qAQLqGIJOBQ0y+eScNNTjg5t8L72vY1u1svTYT5iVfPDoCU5PUL1n0?=
 =?us-ascii?Q?0RjirnEJnoozrsKG2vt2vzckEJa8agDak0PZu9EMudv2icVH2k8tOMBg88N7?=
 =?us-ascii?Q?ngU3pmuvWoqnOgSgxRqcEJsRIwh2vEkhwjoTQiqSXnFnUPrg4B2Js0qEDT49?=
 =?us-ascii?Q?EzgHR+dmT6i/LsIo9d2lOVHnsKaLQWK2pb3MqTVIEA6sQYuaM8lVaZnRKm2K?=
 =?us-ascii?Q?KP4PAnUUA/SJ0p0TovhdeUIG3IMG+63NJpByK46ntUKZP4qq5sItO5BVxA2N?=
 =?us-ascii?Q?jeFXrth1NRNpfZQY4cn2SMZo05tSmGTKtlUvMcTrKAhvsLQQFq9MjiMYecqa?=
 =?us-ascii?Q?QUU/hnlmt7yqfkeiJs85kWhKguvkGg9az9L20wCGYrhM2FjOPQByADRMZqfi?=
 =?us-ascii?Q?us6oCJss3OGK73zazQW25+uzKv1PN80YIcPi1tltmBtC7H1suOGiEWxEveGE?=
 =?us-ascii?Q?e1LkmSP/0nR6tHJE99e8AqovpZKHfjQfqlRszqAzlcxDRVQewaGvbj5GOkef?=
 =?us-ascii?Q?zt5qVpyHOYAxQa8hEIExyxld3HyiY4GWXGRZqALrSb1KPbpVDjGY7kaN9ROp?=
 =?us-ascii?Q?554zQyuwXIUOiCIkfGFhRUGRrSW8Zc5BR6HpSJu1AAe+Cruoy7WK3n2axFqS?=
 =?us-ascii?Q?GHQorYhz0Q1eTmRTzO+ucKeSDir2mDeSHm1rvBWsXQGl9rs/sBRfSJLt6z+H?=
 =?us-ascii?Q?06U579TzjOZSLpOF1joWGnJ+3FcAhMRGIzmsQ3W2ioe99wvtFEaAGV0+McrS?=
 =?us-ascii?Q?yANwRRD/CrHZQYRLT61Tjo1O?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4F1139B4DA6E434FA8273B872ED37414@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547014a8-4ca4-4eea-6f05-08d90a7b420e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 19:24:35.4133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q3Fl06mz/+NnTj0FTRJB0BR/ghSAYq/eCIMPI58UOz+9Mi3LuKQ+o0D1nC8m5IdfrXKdyymuEismb4CdqFZR485/4O2vdYERoE/78ANpdJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3821
X-Proofpoint-ORIG-GUID: w3aGjNCKXfTVuaE58UusNM9d8NCEuKa2
X-Proofpoint-GUID: w3aGjNCKXfTVuaE58UusNM9d8NCEuKa2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_13:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "den-plotnikov@yandex-team.ru" <den-plotnikov@yandex-team.ru>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 07:02:20PM +0200, Kevin Wolf wrote:
> Commit 2943b53f6 (' virtio: force VIRTIO_F_IOMMU_PLATFORM') made sure
> that vhost can't just reject VIRTIO_F_IOMMU_PLATFORM when it was
> requested. However, just adding it back to the negotiated flags isn't
> right either because it promises support to the guest that the device
> actually doesn't support. One example of a vhost-user device that
> doesn't have support for the flag is the vhost-user-blk export of QEMU.
>=20
> Instead of successfully creating a device that doesn't work, just fail
> to plug the device when it doesn't support the feature, but it was
> requested. This results in much clearer error messages.
>=20
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1935031
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/virtio/virtio-bus.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index d6332d45c3..859978d248 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -69,6 +69,11 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Err=
or **errp)
>          return;
>      }
>

Can you explain this check a little more?

Above we have:
bool has_iommu =3D virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);

and then we get the host features from the bckend:
vdev->host_features =3D vdc->get_features(vdev, vdev->host_features

So as is this is catching the case where vdev->host_features had
VIRTIO_F_IOMMU_PLATFORM set before (by default?), but doesn't now that
the features have been retrieved?=20

Why not just:
    if (!virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {

> +    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATF=
ORM)) {
> +        error_setg(errp, "iommu_platform=3Dtrue is not supported by the =
device");
> +        return;
> +    }
> +
>      if (klass->device_plugged !=3D NULL) {
>          klass->device_plugged(qbus->parent, &local_err);
>      }
> --=20
> 2.30.2
> =

