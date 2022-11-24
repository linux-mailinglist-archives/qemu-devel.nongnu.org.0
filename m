Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB3636EE5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 01:21:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxzyD-0006hb-Gd; Wed, 23 Nov 2022 19:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oxzy8-0006hN-Lr; Wed, 23 Nov 2022 19:19:57 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oxzy5-0000LC-A2; Wed, 23 Nov 2022 19:19:56 -0500
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANMPAuM015293; Wed, 23 Nov 2022 16:19:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=nwCpkkEh7EAxW1/3fDRpzfuXPKkB5rI+tWjEK9sPOC4=;
 b=sAzDUrxVDC+AF7yRANjOiDz0iqovAeNs2ZR77Ci5SI+fSoi+dVTTfgsn13ODgmqP+BRQ
 r53qDPatO7wRSJ0AapLgCpx/Js2EzXMNrlLB4Wn/h9SUsb6QNi/H+Q5bYtjWQKJd2r0i
 vi3nu/nNLtKY8Done08D+RNI5BzKU3aIGxyoB0br0VfU8yE/iK+SAL5A0s0YKA/Ema5n
 PjMTgySgoPHj1O9U4BXKv7js++ftcvTtGh0d63643q8mKXYKzgBFu+TC9AqQE16UWe9I
 GMpkdWYSW+L43RxbQd9TFKhPyYBj0/cfQl+EwKpDNfHm1siJqyHPeR4/zzXEH7E768Vs oQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxyj4uked-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 16:19:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8n09rwRBUxQSSFc1RXEpHsP6FlTH2gpjfevOSrV1gM2WAm+VH1Z7cVO7ZNkIDAMMxIkkJSRHNWvbhITUmxZXwe9/2Kq8cxEt0TyEj6b7pL7MbL5yr3El5XlHSk+QC+xzHulSFPWxrXXy8mlLP/mvM7O3BChqvcYZ9RmXy3CWjeING2ymcQk25QsR7y8ozjzP5amRXWDnnzGBvxt2iRHwVgTbP7Fun25Lch4sQupLAA/wc1SaGlP7LqiqdInimgcinkT0HiA1oACq/dMW2sq9AEXlhkIJx4ehrveYzWYeshWX8BmGnlUZgKrWvs7Txmu1RdSgF3jGBQCHhmXYNNB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwCpkkEh7EAxW1/3fDRpzfuXPKkB5rI+tWjEK9sPOC4=;
 b=a060ir1KptVwIrxMQ2jsprHpORgu/961qF3Li5KdMk0FFQCyfZxOVWkTZ4PBxLIkFWb2FQ23jyqrLPtxbp1HBtgw+XHROZ1lXMtoPe8L4IbKamxZB5GcsSXQfdtjcCC1xJwnim4NCwI26lPI6fsDuGlSz4AfAeXozAPJm4pngRs8mGYd70vhF4a7lAXaJ1FHOf3jg7gMJJTsIKPwv1vNLMKqfhZd39pbfiUFXuQUUAwk77HYPcMBpxwWCHlqj8BRpTik2LiZFlNC1plSIR+b3MCwluirGQVNlihXZ/pAEgSBzEPUxMDSiAANpA9d51aB3A+56rIwIurHURRCrVkBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwCpkkEh7EAxW1/3fDRpzfuXPKkB5rI+tWjEK9sPOC4=;
 b=Ocm6mBJr1Oaie4DTtn3nHumxqPXh7sl48bj7SNVcW7ewEMEWpeIqqXbXbzn/stg985/eo17SZ97Sc+9Z1E+uSpuC3l3RyWHc4p1Qjv7wZxTd+NolIbFaeWLDau4sUqohgK+0UksrjDwEdd4ocFoX+NLybGaH16E1nUybPwidJS65WwQfgnWwK4WRteGBQiNEf8iqjYfbgBGPKcEKOUKMd3X2j04g296Ctiz/3Jr6Ypw0ggSheBiZWkSugraYyHxo/iFK0nDLM/vySmQE6x5euFiaQy8ydLMfFVClifj78LL7CY3eVxlPJyMHy+YM4Rrs91ed5WwH/3Q+S030rwR6ag==
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by PH0PR02MB7525.namprd02.prod.outlook.com (2603:10b6:510:5c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Thu, 24 Nov
 2022 00:19:26 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::a01e:4b95:6c3:acf2]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::a01e:4b95:6c3:acf2%5]) with mapi id 15.20.5857.018; Thu, 24 Nov 2022
 00:19:26 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Fam
 Zheng <fam@euphon.net>, Viresh Kumar <viresh.kumar@linaro.org>, German
 Maglione <gmaglione@redhat.com>, =?iso-8859-1?Q?Alex_Benn=E9e?=
 <alex.bennee@linaro.org>, Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.2] vhost: enable vrings in vhost_dev_start() for
 vhost-user devices
Thread-Topic: [PATCH for-7.2] vhost: enable vrings in vhost_dev_start() for
 vhost-user devices
Thread-Index: AQHY/z3UUs9LyFKCW0uT000WPu60va5NNlQA
Date: Thu, 24 Nov 2022 00:19:25 +0000
Message-ID: <4A976F8D-AB6F-4BAD-AD5A-ABF69B8A040C@nutanix.com>
References: <20221123131630.52020-1-sgarzare@redhat.com>
In-Reply-To: <20221123131630.52020-1-sgarzare@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|PH0PR02MB7525:EE_
x-ms-office365-filtering-correlation-id: 91f11676-5464-4894-78f5-08dacdb18b89
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WBXfyiyQVzIHRRdFZR8xqja2PHttw0PPmginjpj58ISWNbmEN1YjY7Rucu0EYcdy8Gb801Xrn/h1fkuKx9iclG4IjIG5zs8L9rlnJ/bgikgaEPnOQQhIfuw5+pbTaSEO6der/7CiA5oksovoQjKs4RDOsGX/UhEZ2AFlD/5fO1pq8FxcPUgpp1LM2PryTNGDfhQPzssJGrI3y/uXTVbiSXW4wiworHmdSlkB68VOHrIinx4AD5h4jiN7MAW0Orl/e8aVyCdHUoRkl+NqruEk4EJ3uxFQP/LyQ3ox9WExPWW+dyHiyXTmz1WqENHQT1EDVJSw/UoB4+mbxQIBuYlFYi72iDur10M5SwmmThx1ozryii6IYj6FIDCTs+EIjH6aP0uUqwZpwyhhpsCatYw5mA6vQY3HK0W+NpjaUnIFwqBsmnI91rd49eMy4gPTJZPuVNoDxZsT10pp8MDx6qeMWiiO0/Aaxbjtx/ZgpWCwi65/7ohFImepwtPf44tOkT5MutbteZylB89BknuoKR4Ct/vt6naVfJBGpKEig6/CvWVMQJU+MJ+L8dpDhjlbXdgU9131DBmIM4+LwRswyMg24udWXIZYQWO4W+jKiZ180bi+4iGHfkDlmc3KEd1fy8TfVaSfKTU529abC2x+mA7lP/26gEmjfGHp6RV7METwTX25DxbQGnaaqsudwXj8IwVghmlZq297D6PGjYiD2uKMBHWC8vyi/vYuyX7ZJUzEmqZbs5r5voLzw4aidTdHj4J1sBTgUuPVHES/Q8COKdh35IoFyKaMkOe77CCrI7JcGPKC4Q+tmQmiC8tcfdWpwHjY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199015)(2616005)(186003)(6916009)(316002)(71200400001)(54906003)(6512007)(6506007)(53546011)(76116006)(66556008)(83380400001)(44832011)(5660300002)(66476007)(122000001)(4326008)(66446008)(64756008)(8676002)(66946007)(38100700002)(91956017)(7416002)(8936002)(86362001)(478600001)(966005)(2906002)(36756003)(6486002)(30864003)(33656002)(38070700005)(41300700001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZTtmOIUwG6dOHRPsd1S+Omb0BGNk/bnIgIXXgVdcZaVpZpvRQsHoY4ycEJ?=
 =?iso-8859-1?Q?xWY9dIXsiEj7h0oqdNMz4h0woo4sSzMw8loRP7ghCwuayBXs9zuc4cPLoG?=
 =?iso-8859-1?Q?0T606Wdi7GIEtPtYg7+wG8fogUl2Wo0QlsBc0F3XyYEk3fLiVZgxK90Dv/?=
 =?iso-8859-1?Q?PKbpzqzD1/mG0NTvNmWfTUvq8AsCazA+/OLGSglBd184tT0nFxcjzNHT/m?=
 =?iso-8859-1?Q?bHxfK5mVm8Tp+TAi9rCboQJItNWPEVG3IfuvRtyMDI7f4jdq353oF2g7Fz?=
 =?iso-8859-1?Q?jJNFoecPltKw278Q91/2828QmYttxXPD/9nAzJPD7tCa5y8cYsZeVvQd9w?=
 =?iso-8859-1?Q?BcNXC4ipaHrhqbY2Al+AkBPLzYK7tJjOd2YHUS8lG8Rqn0tHt1P/t0d8VS?=
 =?iso-8859-1?Q?t53dUr2MrzZGsP4l44zRGbFqfYUrrdrBLWxP4jKRjLBcHgvEr5GDaF3J2r?=
 =?iso-8859-1?Q?qfUUWKqAnoADV5iSddRIIhEqA24vtypBo/O8Db/OWzMgUp4xlLz7E7Y5yB?=
 =?iso-8859-1?Q?KVN/ErYpURbjpl3bRUcw8tZ09uEBUnguuKiOTTbPXGSG1rJl0zeTTt/JfD?=
 =?iso-8859-1?Q?ffzesfH7MqB21rpEwtZOOrhxDmbYfiSs/Z6l4D5v5cWEFgDdZciZRYRwQZ?=
 =?iso-8859-1?Q?yqXG/LYc43NF8g8bGAoFfqnfF9ptRlqb1BkKgef5MIaYBEP2BQf/yx/ijK?=
 =?iso-8859-1?Q?vlVuhaa2i8Zxm66K+Kbjhe4E/EFrlGbq0u1JHcwr3BYyRfA8h14sl3eB7a?=
 =?iso-8859-1?Q?ghf/58FyCAvTXXYzsKtSn4nsd4JkPRQH3vWhjWcK5KnVQadq386JAGLl6C?=
 =?iso-8859-1?Q?brwjFm4yGZMzxpwcaEMcG+XX8xeIQB2Fs2VPUDJxcn88dJecIfPOJdsvX5?=
 =?iso-8859-1?Q?dfbx29zncYQfx1yu5MhE9WFR2RwvMfuOGMfheFMu/oZc+v13YMMEhHbHSM?=
 =?iso-8859-1?Q?aYBNCPiQbk6vBi2FIJM44zO2wKNsjX819SsTVzx4N5SsOndpqHtVfcLW6D?=
 =?iso-8859-1?Q?CLI4Pgg3mZEs7YxsZxc608wvbIj0emdimbAR8DCKhqmwkMP+34/0JppLHw?=
 =?iso-8859-1?Q?9fIjUcifwS3HxRohRmx/BmjbwsjHfeCp+GboyZoL2pTCXGmtpi4bK7EhCs?=
 =?iso-8859-1?Q?c2elGvwmlWF5pPjvc+YvOAlQz0pIDQwzqxPJ5QhwJz7LKyRnzUAMjcSbYZ?=
 =?iso-8859-1?Q?eNe0i5D8aXICejyJ8Yf6QBbbmMXqZur/P72k5OSA9qvaPq8iP2ojRZxrc/?=
 =?iso-8859-1?Q?9jzy9f2gAtAD08mSHzT+yJpmaCJzK0YVfU3QBoafO5exNiUwW+PLJgpdjh?=
 =?iso-8859-1?Q?wkeW/j+kjPFbMplndfDnRDy8FCxFhXyKx99tSFOmZI5RoV7gKq3uIGSD2F?=
 =?iso-8859-1?Q?XIMqO7Q1xIjHeEwOrHtsl14oQ+qLJYKXK6NPK+0zzJYsl7lD7Ear3RH5YW?=
 =?iso-8859-1?Q?EqPjua0NvVqYH1xQDJtmMVLk7e+LXeE2sD4tvXcRblxWrVttnxhuPVS6dQ?=
 =?iso-8859-1?Q?NdZymU2HDRwhKDCQPJqYavXtLDufBq5rffxPUvlhe/PK7+Tc83Ynq9ygBv?=
 =?iso-8859-1?Q?Vs68fxxpNBNOpSverE4wfGU+kTV7CXEP77RPirC7h/mXcbkDrkCZFp1Lhn?=
 =?iso-8859-1?Q?3bmhV5J5k7GGXS0SOrDfJd9M+5scFDzFdvhKUZrMi/X6W4GALy0dqiQpm8?=
 =?iso-8859-1?Q?e+2dLk1X84K6lbmJQfY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B458ED54ED75C044ADB67562A69A7BB1@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f11676-5464-4894-78f5-08dacdb18b89
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 00:19:25.9981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /i3GNgRsyNhqIVGgPxeowEevwyXReHNLWKZe7pFtq1/ddh9eO2s/9ijibCZP0cQrYxfDe6eN7KTsyBcMT4yxLr1YNb9W1PXJHHJ+uxTF0+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7525
X-Proofpoint-ORIG-GUID: FcyUe9Fr6xxp0XLEkxYMPOvJhXMpXgBx
X-Proofpoint-GUID: FcyUe9Fr6xxp0XLEkxYMPOvJhXMpXgBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_13,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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


> On Nov 23, 2022, at 8:16 AM, Stefano Garzarella <sgarzare@redhat.com> wro=
te:
>=20
> Commit 02b61f38d3 ("hw/virtio: incorporate backend features in features")
> properly negotiates VHOST_USER_F_PROTOCOL_FEATURES with the vhost-user
> backend, but we forgot to enable vrings as specified in
> docs/interop/vhost-user.rst:
>=20
>    If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
>    ring starts directly in the enabled state.
>=20
>    If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
>    initialized in a disabled state and is enabled by
>    ``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.
>=20
> Some vhost-user front-ends already did this by calling
> vhost_ops.vhost_set_vring_enable() directly:
> - backends/cryptodev-vhost.c
> - hw/net/virtio-net.c
> - hw/virtio/vhost-user-gpio.c

To simplify why not rather change these devices to use the new semantics?

>=20
> But most didn't do that, so we would leave the vrings disabled and some
> backends would not work. We observed this issue with the rust version of
> virtiofsd [1], which uses the event loop [2] provided by the
> vhost-user-backend crate where requests are not processed if vring is
> not enabled.
>=20
> Let's fix this issue by enabling the vrings in vhost_dev_start() for
> vhost-user front-ends that don't already do this directly. Same thing
> also in vhost_dev_stop() where we disable vrings.
>=20
> [1] https://gitlab.com/virtio-fs/virtiofsd
> [2] https://github.com/rust-vmm/vhost/blob/240fc2966/crates/vhost-user-ba=
ckend/src/event_loop.rs#L217
> Fixes: 02b61f38d3 ("hw/virtio: incorporate backend features in features")
> Reported-by: German Maglione <gmaglione@redhat.com>
> Tested-by: German Maglione <gmaglione@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Looks good for vhost-user-blk/vhost-user-scsi.

Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
> include/hw/virtio/vhost.h      |  6 +++--
> backends/cryptodev-vhost.c     |  4 ++--
> backends/vhost-user.c          |  4 ++--
> hw/block/vhost-user-blk.c      |  4 ++--
> hw/net/vhost_net.c             |  8 +++----
> hw/scsi/vhost-scsi-common.c    |  4 ++--
> hw/virtio/vhost-user-fs.c      |  4 ++--
> hw/virtio/vhost-user-gpio.c    |  4 ++--
> hw/virtio/vhost-user-i2c.c     |  4 ++--
> hw/virtio/vhost-user-rng.c     |  4 ++--
> hw/virtio/vhost-vsock-common.c |  4 ++--
> hw/virtio/vhost.c              | 44 ++++++++++++++++++++++++++++++----
> hw/virtio/trace-events         |  4 ++--
> 13 files changed, 67 insertions(+), 31 deletions(-)
>=20
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 353252ac3e..67a6807fac 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -184,24 +184,26 @@ static inline bool vhost_dev_is_started(struct vhos=
t_dev *hdev)
>  * vhost_dev_start() - start the vhost device
>  * @hdev: common vhost_dev structure
>  * @vdev: the VirtIODevice structure
> + * @vrings: true to have vrings enabled in this call
>  *
>  * Starts the vhost device. From this point VirtIO feature negotiation
>  * can start and the device can start processing VirtIO transactions.
>  *
>  * Return: 0 on success, < 0 on error.
>  */
> -int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
> +int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev, bool vri=
ngs);
>=20
> /**
>  * vhost_dev_stop() - stop the vhost device
>  * @hdev: common vhost_dev structure
>  * @vdev: the VirtIODevice structure
> + * @vrings: true to have vrings disabled in this call
>  *
>  * Stop the vhost device. After the device is stopped the notifiers
>  * can be disabled (@vhost_dev_disable_notifiers) and the device can
>  * be torn down (@vhost_dev_cleanup).
>  */
> -void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
> +void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vri=
ngs);
>=20
> /**
>  * DOC: vhost device configuration handling
> diff --git a/backends/cryptodev-vhost.c b/backends/cryptodev-vhost.c
> index bc13e466b4..572f87b3be 100644
> --- a/backends/cryptodev-vhost.c
> +++ b/backends/cryptodev-vhost.c
> @@ -94,7 +94,7 @@ cryptodev_vhost_start_one(CryptoDevBackendVhost *crypto=
,
>         goto fail_notifiers;
>     }
>=20
> -    r =3D vhost_dev_start(&crypto->dev, dev);
> +    r =3D vhost_dev_start(&crypto->dev, dev, false);
>     if (r < 0) {
>         goto fail_start;
>     }
> @@ -111,7 +111,7 @@ static void
> cryptodev_vhost_stop_one(CryptoDevBackendVhost *crypto,
>                                  VirtIODevice *dev)
> {
> -    vhost_dev_stop(&crypto->dev, dev);
> +    vhost_dev_stop(&crypto->dev, dev, false);
>     vhost_dev_disable_notifiers(&crypto->dev, dev);
> }
>=20
> diff --git a/backends/vhost-user.c b/backends/vhost-user.c
> index 5dedb2d987..7bfcaef976 100644
> --- a/backends/vhost-user.c
> +++ b/backends/vhost-user.c
> @@ -85,7 +85,7 @@ vhost_user_backend_start(VhostUserBackend *b)
>     }
>=20
>     b->dev.acked_features =3D b->vdev->guest_features;
> -    ret =3D vhost_dev_start(&b->dev, b->vdev);
> +    ret =3D vhost_dev_start(&b->dev, b->vdev, true);
>     if (ret < 0) {
>         error_report("Error start vhost dev");
>         goto err_guest_notifiers;
> @@ -120,7 +120,7 @@ vhost_user_backend_stop(VhostUserBackend *b)
>         return;
>     }
>=20
> -    vhost_dev_stop(&b->dev, b->vdev);
> +    vhost_dev_stop(&b->dev, b->vdev, true);
>=20
>     if (k->set_guest_notifiers) {
>         ret =3D k->set_guest_notifiers(qbus->parent,
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 0d5190accf..1177064631 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -178,7 +178,7 @@ static int vhost_user_blk_start(VirtIODevice *vdev, E=
rror **errp)
>     }
>=20
>     s->dev.vq_index_end =3D s->dev.nvqs;
> -    ret =3D vhost_dev_start(&s->dev, vdev);
> +    ret =3D vhost_dev_start(&s->dev, vdev, true);
>     if (ret < 0) {
>         error_setg_errno(errp, -ret, "Error starting vhost");
>         goto err_guest_notifiers;
> @@ -213,7 +213,7 @@ static void vhost_user_blk_stop(VirtIODevice *vdev)
>         return;
>     }
>=20
> -    vhost_dev_stop(&s->dev, vdev);
> +    vhost_dev_stop(&s->dev, vdev, true);
>=20
>     ret =3D k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
>     if (ret < 0) {
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 26e4930676..043058ff43 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -259,7 +259,7 @@ static int vhost_net_start_one(struct vhost_net *net,
>         goto fail_notifiers;
>     }
>=20
> -    r =3D vhost_dev_start(&net->dev, dev);
> +    r =3D vhost_dev_start(&net->dev, dev, false);
>     if (r < 0) {
>         goto fail_start;
>     }
> @@ -308,7 +308,7 @@ fail:
>     if (net->nc->info->poll) {
>         net->nc->info->poll(net->nc, true);
>     }
> -    vhost_dev_stop(&net->dev, dev);
> +    vhost_dev_stop(&net->dev, dev, false);
> fail_start:
>     vhost_dev_disable_notifiers(&net->dev, dev);
> fail_notifiers:
> @@ -329,7 +329,7 @@ static void vhost_net_stop_one(struct vhost_net *net,
>     if (net->nc->info->poll) {
>         net->nc->info->poll(net->nc, true);
>     }
> -    vhost_dev_stop(&net->dev, dev);
> +    vhost_dev_stop(&net->dev, dev, false);
>     if (net->nc->info->stop) {
>         net->nc->info->stop(net->nc);
>     }
> @@ -606,7 +606,7 @@ err_start:
>         assert(r >=3D 0);
>     }
>=20
> -    vhost_dev_stop(&net->dev, vdev);
> +    vhost_dev_stop(&net->dev, vdev, false);
>=20
>     return r;
> }
> diff --git a/hw/scsi/vhost-scsi-common.c b/hw/scsi/vhost-scsi-common.c
> index 767f827e55..18ea5dcfa1 100644
> --- a/hw/scsi/vhost-scsi-common.c
> +++ b/hw/scsi/vhost-scsi-common.c
> @@ -68,7 +68,7 @@ int vhost_scsi_common_start(VHostSCSICommon *vsc)
>         goto err_guest_notifiers;
>     }
>=20
> -    ret =3D vhost_dev_start(&vsc->dev, vdev);
> +    ret =3D vhost_dev_start(&vsc->dev, vdev, true);
>     if (ret < 0) {
>         error_report("Error start vhost dev");
>         goto err_guest_notifiers;
> @@ -101,7 +101,7 @@ void vhost_scsi_common_stop(VHostSCSICommon *vsc)
>     VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
>     int ret =3D 0;
>=20
> -    vhost_dev_stop(&vsc->dev, vdev);
> +    vhost_dev_stop(&vsc->dev, vdev, true);
>=20
>     if (k->set_guest_notifiers) {
>         ret =3D k->set_guest_notifiers(qbus->parent, vsc->dev.nvqs, false=
);
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index dc4014cdef..d97b179e6f 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -76,7 +76,7 @@ static void vuf_start(VirtIODevice *vdev)
>     }
>=20
>     fs->vhost_dev.acked_features =3D vdev->guest_features;
> -    ret =3D vhost_dev_start(&fs->vhost_dev, vdev);
> +    ret =3D vhost_dev_start(&fs->vhost_dev, vdev, true);
>     if (ret < 0) {
>         error_report("Error starting vhost: %d", -ret);
>         goto err_guest_notifiers;
> @@ -110,7 +110,7 @@ static void vuf_stop(VirtIODevice *vdev)
>         return;
>     }
>=20
> -    vhost_dev_stop(&fs->vhost_dev, vdev);
> +    vhost_dev_stop(&fs->vhost_dev, vdev, true);
>=20
>     ret =3D k->set_guest_notifiers(qbus->parent, fs->vhost_dev.nvqs, fals=
e);
>     if (ret < 0) {
> diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
> index 5851cb3bc9..0b40ebd15a 100644
> --- a/hw/virtio/vhost-user-gpio.c
> +++ b/hw/virtio/vhost-user-gpio.c
> @@ -81,7 +81,7 @@ static int vu_gpio_start(VirtIODevice *vdev)
>      */
>     vhost_ack_features(&gpio->vhost_dev, feature_bits, vdev->guest_featur=
es);
>=20
> -    ret =3D vhost_dev_start(&gpio->vhost_dev, vdev);
> +    ret =3D vhost_dev_start(&gpio->vhost_dev, vdev, false);
>     if (ret < 0) {
>         error_report("Error starting vhost-user-gpio: %d", ret);
>         goto err_guest_notifiers;
> @@ -139,7 +139,7 @@ static void vu_gpio_stop(VirtIODevice *vdev)
>         return;
>     }
>=20
> -    vhost_dev_stop(vhost_dev, vdev);
> +    vhost_dev_stop(vhost_dev, vdev, false);
>=20
>     ret =3D k->set_guest_notifiers(qbus->parent, vhost_dev->nvqs, false);
>     if (ret < 0) {
> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> index 1c9f3d20dc..dc5c828ba6 100644
> --- a/hw/virtio/vhost-user-i2c.c
> +++ b/hw/virtio/vhost-user-i2c.c
> @@ -46,7 +46,7 @@ static void vu_i2c_start(VirtIODevice *vdev)
>=20
>     i2c->vhost_dev.acked_features =3D vdev->guest_features;
>=20
> -    ret =3D vhost_dev_start(&i2c->vhost_dev, vdev);
> +    ret =3D vhost_dev_start(&i2c->vhost_dev, vdev, true);
>     if (ret < 0) {
>         error_report("Error starting vhost-user-i2c: %d", -ret);
>         goto err_guest_notifiers;
> @@ -80,7 +80,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
>         return;
>     }
>=20
> -    vhost_dev_stop(&i2c->vhost_dev, vdev);
> +    vhost_dev_stop(&i2c->vhost_dev, vdev, true);
>=20
>     ret =3D k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, fal=
se);
>     if (ret < 0) {
> diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
> index f9084cde58..201a39e220 100644
> --- a/hw/virtio/vhost-user-rng.c
> +++ b/hw/virtio/vhost-user-rng.c
> @@ -47,7 +47,7 @@ static void vu_rng_start(VirtIODevice *vdev)
>     }
>=20
>     rng->vhost_dev.acked_features =3D vdev->guest_features;
> -    ret =3D vhost_dev_start(&rng->vhost_dev, vdev);
> +    ret =3D vhost_dev_start(&rng->vhost_dev, vdev, true);
>     if (ret < 0) {
>         error_report("Error starting vhost-user-rng: %d", -ret);
>         goto err_guest_notifiers;
> @@ -81,7 +81,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
>         return;
>     }
>=20
> -    vhost_dev_stop(&rng->vhost_dev, vdev);
> +    vhost_dev_stop(&rng->vhost_dev, vdev, true);
>=20
>     ret =3D k->set_guest_notifiers(qbus->parent, rng->vhost_dev.nvqs, fal=
se);
>     if (ret < 0) {
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-commo=
n.c
> index a67a275de2..d21c72b401 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -70,7 +70,7 @@ int vhost_vsock_common_start(VirtIODevice *vdev)
>     }
>=20
>     vvc->vhost_dev.acked_features =3D vdev->guest_features;
> -    ret =3D vhost_dev_start(&vvc->vhost_dev, vdev);
> +    ret =3D vhost_dev_start(&vvc->vhost_dev, vdev, true);
>     if (ret < 0) {
>         error_report("Error starting vhost: %d", -ret);
>         goto err_guest_notifiers;
> @@ -105,7 +105,7 @@ void vhost_vsock_common_stop(VirtIODevice *vdev)
>         return;
>     }
>=20
> -    vhost_dev_stop(&vvc->vhost_dev, vdev);
> +    vhost_dev_stop(&vvc->vhost_dev, vdev, true);
>=20
>     ret =3D k->set_guest_notifiers(qbus->parent, vvc->vhost_dev.nvqs, fal=
se);
>     if (ret < 0) {
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index d1c4c20b8c..7fb008bc9e 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1777,15 +1777,36 @@ int vhost_dev_get_inflight(struct vhost_dev *dev,=
 uint16_t queue_size,
>     return 0;
> }
>=20
> +static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable=
)
> +{
> +    if (!hdev->vhost_ops->vhost_set_vring_enable) {
> +        return 0;
> +    }
> +
> +    /*
> +     * For vhost-user devices, if VHOST_USER_F_PROTOCOL_FEATURES has not
> +     * been negotiated, the rings start directly in the enabled state, a=
nd
> +     * .vhost_set_vring_enable callback will fail since
> +     * VHOST_USER_SET_VRING_ENABLE is not supported.
> +     */
> +    if (hdev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_USER &&
> +        !virtio_has_feature(hdev->backend_features,
> +                            VHOST_USER_F_PROTOCOL_FEATURES)) {
> +        return 0;
> +    }
> +
> +    return hdev->vhost_ops->vhost_set_vring_enable(hdev, enable);
> +}
> +
> /* Host notifiers must be enabled at this point. */
> -int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
> +int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev, bool vri=
ngs)
> {
>     int i, r;
>=20
>     /* should only be called after backend is connected */
>     assert(hdev->vhost_ops);
>=20
> -    trace_vhost_dev_start(hdev, vdev->name);
> +    trace_vhost_dev_start(hdev, vdev->name, vrings);
>=20
>     vdev->vhost_started =3D true;
>     hdev->started =3D true;
> @@ -1830,10 +1851,16 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtI=
ODevice *vdev)
>             goto fail_log;
>         }
>     }
> +    if (vrings) {
> +        r =3D vhost_dev_set_vring_enable(hdev, true);
> +        if (r) {
> +            goto fail_log;
> +        }
> +    }
>     if (hdev->vhost_ops->vhost_dev_start) {
>         r =3D hdev->vhost_ops->vhost_dev_start(hdev, true);
>         if (r) {
> -            goto fail_log;
> +            goto fail_start;
>         }
>     }
>     if (vhost_dev_has_iommu(hdev) &&
> @@ -1848,6 +1875,10 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIO=
Device *vdev)
>         }
>     }
>     return 0;
> +fail_start:
> +    if (vrings) {
> +        vhost_dev_set_vring_enable(hdev, false);
> +    }
> fail_log:
>     vhost_log_put(hdev, false);
> fail_vq:
> @@ -1866,18 +1897,21 @@ fail_features:
> }
>=20
> /* Host notifiers must be enabled at this point. */
> -void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
> +void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vri=
ngs)
> {
>     int i;
>=20
>     /* should only be called after backend is connected */
>     assert(hdev->vhost_ops);
>=20
> -    trace_vhost_dev_stop(hdev, vdev->name);
> +    trace_vhost_dev_stop(hdev, vdev->name, vrings);
>=20
>     if (hdev->vhost_ops->vhost_dev_start) {
>         hdev->vhost_ops->vhost_dev_start(hdev, false);
>     }
> +    if (vrings) {
> +        vhost_dev_set_vring_enable(hdev, false);
> +    }
>     for (i =3D 0; i < hdev->nvqs; ++i) {
>         vhost_virtqueue_stop(hdev,
>                              vdev,
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 820dadc26c..14fc5b9bb2 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -9,8 +9,8 @@ vhost_section(const char *name) "%s"
> vhost_reject_section(const char *name, int d) "%s:%d"
> vhost_iotlb_miss(void *dev, int step) "%p step %d"
> vhost_dev_cleanup(void *dev) "%p"
> -vhost_dev_start(void *dev, const char *name) "%p:%s"
> -vhost_dev_stop(void *dev, const char *name) "%p:%s"
> +vhost_dev_start(void *dev, const char *name, bool vrings) "%p:%s vrings:=
%d"
> +vhost_dev_stop(void *dev, const char *name, bool vrings) "%p:%s vrings:%=
d"
>=20
>=20
> # vhost-user.c
> --=20
> 2.38.1
>=20


