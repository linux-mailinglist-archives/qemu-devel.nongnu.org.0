Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41BF637A85
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 14:51:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyCcc-0000Se-LX; Thu, 24 Nov 2022 08:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oyCcZ-0000Ri-TC; Thu, 24 Nov 2022 08:50:31 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oyCcX-00017e-6o; Thu, 24 Nov 2022 08:50:31 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AOBB2EB020474; Thu, 24 Nov 2022 05:50:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=guvbPAYZCs61kZX2vxLUlVRex5pKBf0j+O8qSGKXQh8=;
 b=x7veiidBrwZBiA+ddFgismY44RAKrnSLumzfNW3hn7MFFtfrKKa441zoy3MZ3B1Ine+0
 opWeQqsE9HvZGlPUVI4g2QNjZA9bmsVG0okeJy78yzY8Sd/Ra+jqbVYlKGEPB+MJnC/0
 L74D+kD91v64RhpWENjZGQEbOj6RkdrcNCY1bFr7vdSxxBO6d15MDgKcwM63ciS48gJY
 dTAI41dgY4TKWl5Z5FJqd0NSJ3X4s28m26t59xI0yv/Y8+Q7E/1o0xhixAttRCkC3CJa
 lK1h63vTMlA/5SgHICmBp4sHtXkgHht4SJeG8lYW4X6PbgS7V8Fd8rac5IPpnqWkxIpO kw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxvbxvpn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 05:50:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwKmF0VXWS9Ub0kQ3yyduHkzUyGcgpDwDgNQTp4yIUOAbumlCswgKEJEK/e0yz8/7LLRW5U/CG87zWEfcmsqAHTb/CcqBWmYeDehNA5F1K0whlxLTSAYDgzKmIyE8bCBRhWE1kXDMglGd1v9hnPc9GAofCq+pAh3wtScTHWWCO8sBNGnk5Ql+2y5mIdXhSP9l+QZtcVgyoboekRJWOOq8Y1Ksve00a0AEUF+PoOLK0oFWDlGC1PvR1Th6fsX+0ZUlkt31cfjISk60XRBXjtBCqSlZukUDV4FHH1GBu2HBxCzXbgXLjzhbOBD2l1SEySPT+DXP6fnwsk21L7cSUJ2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guvbPAYZCs61kZX2vxLUlVRex5pKBf0j+O8qSGKXQh8=;
 b=Zr4aNn7aqUkVb0aYn9CAh5B7+nzAtf4BSdWypDY2rr5tCefdFrcflKZkU+S+hoN5/F2L5Wwl6NtlUTJqS6e8MTzUPyoA/a9qjd7oLnFVg1DWq5wA8PcriDI5OlPEHrTTRXvHlEZJT1QLmGQIQ1fqVKWKL08V6vcZbFfAF5B6mamfoNj+GReey9iQK7bfvhwZ7ih1iBlawknNMXWWa0S2s4Ph6mVgKazaZlJuigrznuos8JfBDxoB7ogPhoHk5tQYa1CAiQvcxQS7mHg/EX3uN3QIMjARwBd3XkRoIVq+XYiHGqPRI5McGYO+kZZEpDxO9xcMhAzaX74j6M+OjQKT8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guvbPAYZCs61kZX2vxLUlVRex5pKBf0j+O8qSGKXQh8=;
 b=D5y4bCz+ejODC6yk0VCGsJp9/WCNRu5DiJCi64CDBv6LiVFkaIVipceLKBNWXS8qnxoDiGCgw3AJ3CY4/uIbFbBIaHf6PPgOtI7D3BycPqSTVICXpQlpDVKGLWAZB3hjjIB3ng5tPDXQfybwWpPUVgD6mDsvHwaHJFPmtvETLBigp0clyo4V4iwzDlld4wpskBK/8FF6/oN7wI5FxAQhYLZ0CV1Tc4FzLIVRxMD3FukGSiuUlwVkptvwLCoz/bN7NHkyuTGNjkEbixD01IaiX+0dt8cVew4yT3uaTBZ3ChOCaoL0lY8gSfTcRd4WNxIsfd9SRxAd5dOmWGaHhsptJg==
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by CH0PR02MB8058.namprd02.prod.outlook.com (2603:10b6:610:107::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 13:50:04 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::a01e:4b95:6c3:acf2]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::a01e:4b95:6c3:acf2%4]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 13:50:04 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Fam Zheng <fam@euphon.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 German Maglione <gmaglione@redhat.com>, =?iso-8859-1?Q?Alex_Benn=E9e?=
 <alex.bennee@linaro.org>, Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.2] vhost: enable vrings in vhost_dev_start() for
 vhost-user devices
Thread-Topic: [PATCH for-7.2] vhost: enable vrings in vhost_dev_start() for
 vhost-user devices
Thread-Index: AQHY/z3UUs9LyFKCW0uT000WPu60va5NNlQAgABtOICAABIJAIAAYz2A
Date: Thu, 24 Nov 2022 13:50:04 +0000
Message-ID: <2254ACCA-BD15-4091-B5A9-226D55E6A93D@nutanix.com>
References: <20221123131630.52020-1-sgarzare@redhat.com>
 <4A976F8D-AB6F-4BAD-AD5A-ABF69B8A040C@nutanix.com>
 <20221124014951-mutt-send-email-mst@kernel.org>
 <20221124075452.y2slphvuwbjsst36@sgarzare-redhat>
In-Reply-To: <20221124075452.y2slphvuwbjsst36@sgarzare-redhat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|CH0PR02MB8058:EE_
x-ms-office365-filtering-correlation-id: 457ffa1d-12ef-4b39-0287-08dace22ca74
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a53L0EwClHBBYDsmF/vbnX6GU8Cx3ieicfRF1k97OUCuUIlkxWWLWVP6NgPNFPF54rbimpgXDvVVIa8iJRspzouYdYuDLTP5NxXeXVj3i45L3glyhDSblLu0MS/1OqvEra/0Kg4GnVHz0XsYWdOOytadBA8nj8t65r+Yk8foJ1+etctcCd0YZbph4JdO3RNyIdG85KoD0aB5jsed++xDSgVhrgzScA9QGGUUgPWLDQxIcFbPQc9N+URBSFcxhirYGRUCs9CAgHu2U/3u8XrIQobGN5nsQU7nqbZt0jP7ridKF7y3d++YjqFYB+NHmO4Mep0nkbtv7oNCutDAoz1axjK/oGNbydXyfvCKC4IzICDRIfobevgIQYTxvNFrp/ITM63c+M+UKsbX2SY7zqD7l611R5JiWGHl0iAiFnI3PKKwn+CpkweKnBosrHoYjfr0o/QY0czjkYOUU6bo351K32WGEPWcfCBSwOQJ0gVHIliNVxXDO56KPjd8vJhD1VCh9xi4O/4AHUsJgDYS9r0z4ZidwlR9TGj/skOF5ud4AU8jyP0LxmE4GD0EE7JV7FlsjiB9Gq2fB3Wu4necRwaVnV6XLFfnqUlHrzluX1jptA1SX6gorKL7Ot1GXw71NK7hi1OR1dbwbhYyoPsL4plbQlaoI3i3HNIHmYGlA9e6aZBQ9vTY6CCrAjyY9tMzRb/T2L4GKM3EVMnLdiGZ1QK3nNHrF5YOCX0t4Sf40febv3+gV9dmuip4eUKxtxqM7jYqttxBQFOrDV77ZoBlwb1a6jkl9e+/NA+PC7nRgmRlxwo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199015)(91956017)(38070700005)(38100700002)(4326008)(478600001)(71200400001)(6506007)(33656002)(6486002)(36756003)(966005)(6916009)(316002)(6512007)(86362001)(76116006)(66946007)(66556008)(8676002)(66476007)(64756008)(66446008)(54906003)(53546011)(41300700001)(122000001)(5660300002)(2906002)(83380400001)(186003)(44832011)(7416002)(8936002)(2616005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5BQoV52FSzPc3BqRBXM9CXmP/vAJaQCLPiNPsScCwAnOcGQLS9sF3GZhQC?=
 =?iso-8859-1?Q?En9fpkaSCddR7QhZ44Rgy4klJkFnPQa2Fmgz7U26GZ7ThubO9Z/fa/YZFp?=
 =?iso-8859-1?Q?ElyyRA/Ag8mhjV8jMhuppbGWScRx0TfDF26vXOE90g6K4TjgM94txg/ERH?=
 =?iso-8859-1?Q?6QqXb+5Kut3oDTxj3v/a40SAwByHiHBFhJGuDDQCpOmx2dN+Jd0oYvS/Lq?=
 =?iso-8859-1?Q?QWEpEGIzihL7kdC3/LCVmu8Bastz15f9WS86HxduYR2WONCR1IQr6BoOrT?=
 =?iso-8859-1?Q?1RTa/FGQgZhfU3yanpNr4p7qkMX9zOJLS0sUe79LBo2LXp5XGXPkhVhgDF?=
 =?iso-8859-1?Q?dp+uj5hS5KTNstmvI/lIhE97FqecyMXCroCGcqdbdI163N4dx9Bvu7Izcj?=
 =?iso-8859-1?Q?JxC3vmK42iGpVoDZ+25S5c5AemVByUb+EBhuOIndwnH9kR7HpYqsQq1JXV?=
 =?iso-8859-1?Q?THsy39sPHGidaN7zcfY5AgsxzcJ3oM2aaQv1QY/OqUq7SqcsV/ASj1AFPk?=
 =?iso-8859-1?Q?UVjX3HPtZaVsyHOzepcTSTUASuPJlAklW/6PhHMvrG5I5/ZfGGr7hdr3EP?=
 =?iso-8859-1?Q?xL05XcbX/ONQjs4A0Lsi8pb5XQuJxr8b2Bjgue/YlaohXSYGmJrPRAxtti?=
 =?iso-8859-1?Q?q+Gl6g9XyHr95VjIeq9plgeeFcG6BVj0k/JwQc+zvzDTN4uy9ZsteE30zj?=
 =?iso-8859-1?Q?TGllMYgiK7sSoCntCkfBlLDgM8vbatyaoENyuuWHm5cIryvOyBgZ2x30pe?=
 =?iso-8859-1?Q?jj5skBnlAc8L0wHOB2wNd3GbMOuNj9uRwV1J4pJbMEnPhRZaGqXSLYQHZ+?=
 =?iso-8859-1?Q?iF070+VtGdJ/jv+upGEkQEMUw6ppGdjgVzkos9eNYfe7KTAkqS7krOCxST?=
 =?iso-8859-1?Q?Ch0/t4h/KJIRY1neHkc1P3KuQWKInDPQPSlJPpGzKSkRIQI1jDBSt+cziL?=
 =?iso-8859-1?Q?3Pc2p6cUnPQT8pGCHCc6ykxmTj8izxw9i/n4nTijJWWlVM1dwJwOWjo613?=
 =?iso-8859-1?Q?etY4OTUGDSsCe0XwRnOpj3AtiiARkZ8XiRVhEJ4+p4QDHscgZEU6adPsbd?=
 =?iso-8859-1?Q?BZsDlOw0+MiMWYG60H+rADOJwJPz7ezUlceUulA6/umdFzVySUjHnyiAuF?=
 =?iso-8859-1?Q?vT8oyKvjRJ5Yk3SL0HurQ7OXwkzISMOUbPJVg509QmXjKebKY5oY+Ii+oE?=
 =?iso-8859-1?Q?xjxQ012OpZDiaAxIFtoPTYyQIkqcos0tcVH+ZUojOYJkdEWEMs2ujSdOyI?=
 =?iso-8859-1?Q?aa1CVtUMSyLeFFqXmzslzEnL1Ws2gTPz4HpMsvCK1wXkR2MNTyJuqpQDQS?=
 =?iso-8859-1?Q?lLnDHO5PQLb/genO5CCnmnbWyGWO0VxUNVz+D6SkpiLzcWNzF7YnnFx2LP?=
 =?iso-8859-1?Q?UXnk+118o1ZWpgskLC/HtpVAbcdbMdBJaM8LhaUpszAoHEBhAghDN7lMnE?=
 =?iso-8859-1?Q?x8ZXs8F0jiMzYSGNEzRR752D9DoLhPtuiJdldkA2TGAWtshZIU3xs0Rf10?=
 =?iso-8859-1?Q?bq3Rm6IIO4CE/sNcQbNBf2k35RgRfW1RP5epNNYRtBRs4MpIxJElUYXFum?=
 =?iso-8859-1?Q?kNpvgORvdkKdScWZga/ZvykGQagxs43QiXPsD3b0UW86j3nEcNFvV5U/9V?=
 =?iso-8859-1?Q?gruDqWqRo87j9dYI3tJwg2WfRaPmI2iGDZulVOf/jqgs9YROxEj7s778X3?=
 =?iso-8859-1?Q?xtSJIO3GznGaJtQyPoM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F2BDD7832E58CC4AB88FD2E058D9AF76@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457ffa1d-12ef-4b39-0287-08dace22ca74
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 13:50:04.7000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9DpR4AivcbQcfDY28TshecLjeNTbEPxBaVGQ2WWY0qtCi6r7/B38cqwwihkUPMsQoGHBnincmizUwKE2aV9MZPqc8+feyE1FGMGUZxRjvYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8058
X-Proofpoint-GUID: aRpvUB7FmiL1RUyoB9JKFNuhzzuojHjC
X-Proofpoint-ORIG-GUID: aRpvUB7FmiL1RUyoB9JKFNuhzzuojHjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_11,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



> On Nov 24, 2022, at 2:54 AM, Stefano Garzarella <sgarzare@redhat.com> wro=
te:
>=20
> On Thu, Nov 24, 2022 at 01:50:19AM -0500, Michael S. Tsirkin wrote:
>> On Thu, Nov 24, 2022 at 12:19:25AM +0000, Raphael Norwitz wrote:
>>>=20
>>> > On Nov 23, 2022, at 8:16 AM, Stefano Garzarella <sgarzare@redhat.com>=
 wrote:
>>> >
>>> > Commit 02b61f38d3 ("hw/virtio: incorporate backend features in featur=
es")
>>> > properly negotiates VHOST_USER_F_PROTOCOL_FEATURES with the vhost-use=
r
>>> > backend, but we forgot to enable vrings as specified in
>>> > docs/interop/vhost-user.rst:
>>> >
>>> >    If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
>>> >    ring starts directly in the enabled state.
>>> >
>>> >    If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the rin=
g is
>>> >    initialized in a disabled state and is enabled by
>>> >    ``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.
>>> >
>>> > Some vhost-user front-ends already did this by calling
>>> > vhost_ops.vhost_set_vring_enable() directly:
>>> > - backends/cryptodev-vhost.c
>>> > - hw/net/virtio-net.c
>>> > - hw/virtio/vhost-user-gpio.c
>>>=20
>>> To simplify why not rather change these devices to use the new semantic=
s?
>=20
> Maybe the only one I wouldn't be scared of is vhost-user-gpio, but for ex=
ample vhost-net would require a lot of changes, maybe better after the rele=
ase.
>=20
> For example, we could do like vhost-vdpa and call SET_VRING_ENABLE in the=
 VhostOps.vhost_dev_start callback of vhost-user.c, but I think it's too ri=
sky to do that now.
>=20
>>=20
>> Granted this is already scary enough for this release.
>=20
> Yeah, I tried to touch as little as possible but I'm scared too, I just h=
aven't found a better solution for now :-(
>=20

Sure - no need to force a more disruptive change in right before the releas=
e. If anything can be simplified later.

>>=20
>>> >
>>> > But most didn't do that, so we would leave the vrings disabled and so=
me
>>> > backends would not work. We observed this issue with the rust version=
 of
>>> > virtiofsd [1], which uses the event loop [2] provided by the
>>> > vhost-user-backend crate where requests are not processed if vring is
>>> > not enabled.
>>> >
>>> > Let's fix this issue by enabling the vrings in vhost_dev_start() for
>>> > vhost-user front-ends that don't already do this directly. Same thing
>>> > also in vhost_dev_stop() where we disable vrings.
>>> >
>>> > [1] https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gitlab.com=
_virtio-2Dfs_virtiofsd&d=3DDwIBAg&c=3Ds883GpUCOChKOHiocYtGcg&r=3DIn4gmR1pGz=
KB8G5p6LUrWqkSMec2L5EtXZow_FZNJZk&m=3DPcC4TEq5C80Knek-ScCNI26rQ13h0n3QEMNNh=
c-ENd7Txd8wHYqwC1TYfXW_hYor&s=3D5pdxt8m4-ks8VB2tRSXQV05kdfdP50iy-aAxuGe-Ffc=
&e=3D > [2] https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.c=
om_rust-2Dvmm_vhost_blob_240fc2966_crates_vhost-2Duser-2Dbackend_src_event-=
5Floop.rs-23L217&d=3DDwIBAg&c=3Ds883GpUCOChKOHiocYtGcg&r=3DIn4gmR1pGzKB8G5p=
6LUrWqkSMec2L5EtXZow_FZNJZk&m=3DPcC4TEq5C80Knek-ScCNI26rQ13h0n3QEMNNhc-ENd7=
Txd8wHYqwC1TYfXW_hYor&s=3D-3NUG1pPKN-FwUeDkuu52roXoPoeLR1y4gjrddHUz2U&e=3D =
> Fixes: 02b61f38d3 ("hw/virtio: incorporate backend features in features")
>>> > Reported-by: German Maglione <gmaglione@redhat.com>
>>> > Tested-by: German Maglione <gmaglione@redhat.com>
>>> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>>=20
>>> Looks good for vhost-user-blk/vhost-user-scsi.
>>>=20
>>> Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
>=20
> Thanks for the review!
> Stefano


