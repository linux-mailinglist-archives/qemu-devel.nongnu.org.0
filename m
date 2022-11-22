Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475DB63346B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 05:29:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxKss-00037D-9F; Mon, 21 Nov 2022 23:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oxKsp-00036g-DA; Mon, 21 Nov 2022 23:27:43 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oxKsi-0000KZ-DD; Mon, 21 Nov 2022 23:27:43 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AM39bWJ020474; Mon, 21 Nov 2022 20:27:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=7BFK3S5sCKK6ERyllcHh76eGRzcvh5tyUrB8Ywwd0WQ=;
 b=TbMjkxrVrzaNGuTsDKY8f1MwH0bQKihyxPKpdrd2p3dv0QUp5zM/2sXUD1MG+d6PENjM
 sOrcEsZNFLXnfHff7Xmtb6YM8xis4S8pNFMHQEgOOGqMGeK3vsjKBH0t406f9rbOtvlk
 QZTQiusN4swZIA5+sJkGjYcaUGlIzONvx7OD51dweEGQDY2zpAWyGpfBsOr9jgiY6jO2
 JTdIKIGLEXNBDdTwFXMKbWTjeePyoXFYFwDjTv1t0xZzRdgRneq532vKIgWGYXQ3j3P/
 EgHftMrqms6ZSoHWoBREVwycqC362zHYyZW5Pi9tMNllwlb7OW6NuGT1xyy/AkUq0/QZ OA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxvbxpgyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 20:27:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKX2lS2g2nQZ0bObFxi7PxJe1yRevTlr0J8H4zcRCU7TcsffI0A6Vf55xhXCnm+Jo2Bw3luV3PGLiB6UpwIidcBODhAcQvo8xfkA7nPQhi/m4AEFwyhOz5w4yx+5KX5OZPlHlg4wk8l6EwRSk3UgG7w5YwcixS2mB3JBhgKef6QPGjnbiIpDe3egom8e2K58Hb+XhBKkPxm2OqqP7MQrdTDCSv6vuju/4LKRQKbUEhAsQbBQniiA1ZbcY56XvQpXQ2/wQvSO7HIYE9qiRDrCQ90RQO27psavGJ129CFvrWc+Y5xeuFJ/UAZgJAcCCn9YWgjO+p4uJ9Ot7mLDmFzRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BFK3S5sCKK6ERyllcHh76eGRzcvh5tyUrB8Ywwd0WQ=;
 b=fYybuQko/pNblS/nYpa93LNrhFxWjhWHqBAX8V8rYp65mq70IQw4Yqg3YGEIE1y/tBeNPhxL37h1X6NTN+Aj6CU7tuiWObh3QXIg4w/NIrapMUNQUQzgpPX+J91tuxRb5bEN0KAAuWtjQ+2g3d3Qy4vdEhnjgnyrvPjZnYiQYmwReAMMEoa03vmtQUSLhL1PXSYJGLhsn4OInaI8v4+dHmrErPkGUfPzBKu9V8Tgxd/u6uo+ws171d1YxBW7arqYwVk5j1dlVi9UrshQusOW4jwXv7VtUsqBJMGBv5Z0MKag4lwT1nl+q81G3rjX0HLze9VuIWtPq3jWIaSXXVCnOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BFK3S5sCKK6ERyllcHh76eGRzcvh5tyUrB8Ywwd0WQ=;
 b=a/HC7JQc24jZjvqaeoPGlrs+KpzES9ME1mL94NJ3GLU+CDvhTsSdDRcy6OR5lBEsv/x9hlbb8dTfExP2ntk2wa+T2dZJ46LTu5oVhffrnCoOGGW/s8bAaPh9FKaDsfPoU6NXK37ITjaCJZgAiC6TVBrN5zaY90xW2OIROLMGMRCqA7CHE8bYRmeqSBmnMeZ5w2Qek9fON62hAHpQOFQ9H+d108R4hpdBjwl1GUZkaYlqaaUzopNyWLJls6LjJ9ZMvM6SiQX2/4fzN+zLRP55P2CIX3LhMNJ+NBbhwv3VhgejtAPivTtZCVOCedt+DkXvDejhhBceDh3X7/WN0Wif6A==
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by SJ0PR02MB8628.namprd02.prod.outlook.com (2603:10b6:a03:3fd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 04:27:18 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::a01e:4b95:6c3:acf2]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::a01e:4b95:6c3:acf2%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 04:27:18 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng
 <fam@euphon.net>, Mathieu Poirier <mathieu.poirier@linaro.org>, Kevin Wolf
 <kwolf@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Hanna
 Reitz <hreitz@redhat.com>, "kangjie.xu@linux.alibaba.com"
 <kangjie.xu@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: mask VIRTIO_F_RING_RESET for vhost and vhost-user
 devices
Thread-Topic: [PATCH] vhost: mask VIRTIO_F_RING_RESET for vhost and vhost-user
 devices
Thread-Index: AQHY/ZGVlxxRXmCWL0u5AR18c0MRCq5KWkSA
Date: Tue, 22 Nov 2022 04:27:18 +0000
Message-ID: <287332EC-DDF6-4D2D-BFBC-34BE65C3AE8E@nutanix.com>
References: <20221121101101.29400-1-sgarzare@redhat.com>
In-Reply-To: <20221121101101.29400-1-sgarzare@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|SJ0PR02MB8628:EE_
x-ms-office365-filtering-correlation-id: 33cd125b-45d8-42c3-7dc6-08dacc41d788
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +61t6IFdcf/AO14exLXFocvaJoHgJ6yAT4JQhVJQWompVM1uDXvLv1hrWNrtAyufHUR40J+0EfjpblVnbfh1WVqa7pdY4H5+r1ZaIBQmN9aNUP25sA1p8t0tZkgurbwSpSVAAN+1MHe+MHYtiAvy61Q0J/mhmLRv/GPPzDj8RESS1bbum5hHmk/OBOz+o5CQaysCXbSoOsJ+nNcS9wuMeoBbOSr2Cp0lF50aOXGUHlcPmRKYKrHhG4N57CMd01sLHY7aSASvG1D56KZbK5Wuvlf6HFY9tjkmW7mr00Wb6heaf0Str/i/rm5dLtO6uTfcfORy9itRcVOCZLJ9Ys4OrORMMvBXFFgBozSEw0JWUuHvrxMiMA6l9NVsD3RxOduELGlsuxEkxUjeB9mROtb2kaBGc80hUNTW1cHFhegfZBBufeJxhJvQ+90IyOMf/IR4hpZNi7ROd3Msz2ewyltsf3CCZf5LRnB87sorvopswOZI5HY2y88EnouPLGGhUUFEuhH3p3TYi32re7UvvJeMcRY4n+L2OaBmMrV3gAZ2qUxsYAJ8qkTfipBdzu3+snoEerjJcSEnddddMXXzNZKw9eZALCpDkZgo4+cWXQjPGJBuEqUMJl7c4VB+Jcrty+eTYo+SUhXYRbquLqTXC8BwOfFtqzQ2nejw3OfQ8NGvO/qvuGwVeAgmVy0LJxu2j8iGqORCZ7dW0inDNQ0dfpoES8iFoYSAqoOtkcCPi1QucWojCc80ZuO93tO02ds3sq15iTmmxVZ3+lPmmEaN/E5nxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199015)(6506007)(38070700005)(26005)(71200400001)(2906002)(966005)(86362001)(83380400001)(36756003)(6486002)(478600001)(38100700002)(122000001)(53546011)(6512007)(33656002)(186003)(2616005)(44832011)(7416002)(8936002)(41300700001)(316002)(8676002)(4326008)(76116006)(5660300002)(66446008)(66946007)(66476007)(66556008)(54906003)(64756008)(6916009)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iUR44QMEz9gmug7aNOqU5UG7k36O9QkArMXvuptPy/t6T0I59+OKOBDCBi?=
 =?iso-8859-1?Q?CvO5WEnJiQdkkcX/Mg86fm7IhKq1eKUOGQHTMP00jaZI+K8D+GieomvCz6?=
 =?iso-8859-1?Q?jzywQCQ3j9PcspMxLRd40Obdud9d+5n6VojzcAr/E+yX/Pm6zr1/ZSTIp1?=
 =?iso-8859-1?Q?kI56ZKz+hBwMo3TMFO1NKoiidwXIG5anlePflJpht4hMLAhl4Ckzd5flV0?=
 =?iso-8859-1?Q?sH453S/Erk9syIQ+xDA2x87bpENn66FxzQePQvepd+IVgi6VHU+1ADwnvY?=
 =?iso-8859-1?Q?TaQ9w1mTqq8RdzA3G9gOGSfUH7HJ4GTW7RpY0Rurt2ctu99JA7RI8i2CIO?=
 =?iso-8859-1?Q?T0juOtTxzEFPp9fTw1KGal8QKH6ozjOK1OuLf9xsDgFsWkCNGyzLsKqx3S?=
 =?iso-8859-1?Q?ag0oXrLn9Ev57k+dAQLw8adYTJy8Igrvzj967eAKRFlX/brxX41HGtrwxz?=
 =?iso-8859-1?Q?rhW0uTrafVh1JRzelwu6Yfrdv+ItNLkiF2+8nHWuNtLn6YsSQPp8vjLpY7?=
 =?iso-8859-1?Q?3vJMid7eUJAJrQq+jLncePhCOxTSlHJHJfBiBqynErmhz5tlV5akJAvX1g?=
 =?iso-8859-1?Q?ntssW2ncvUT+2fJQG929UZu2sjG3PFl2a5dnv9O/tg+jRKCqcLKRR9gMjm?=
 =?iso-8859-1?Q?0bEh+mA4qd0krje0hzf6S2oGuAjX9JeagCUEGsvnc0JMS+ny/niRjyucvd?=
 =?iso-8859-1?Q?oom2Qkkxqr+2Fixw5pHTmKm8D8Xn/iF+hl0WsZiwzYJYoSuzdD/mytTqNx?=
 =?iso-8859-1?Q?nXajCF7dkKOYD8bTvgG+9nFjXb2MaNaWmvmNfbkXCeg/ztyKIJB6b3YRps?=
 =?iso-8859-1?Q?XJsnDMkaru3o/+uKaPmHSbQTAYDpd7/skYc8uZ1PJvx08bMuF4bhNtGBZX?=
 =?iso-8859-1?Q?v/P+JH3DFwv+zawaCiPntxMiUAObA10M2ynDuPZGKubXzl5DZYQfPQrjsg?=
 =?iso-8859-1?Q?UgzQoJuXEgv0fdkphyppdgsX+mryzXJuo6Vo/wTPLksW3U8I6G+5ma0iWp?=
 =?iso-8859-1?Q?GASWqyTArwPBdH4j8mpe/9ZkvImQEn8iMHxuJftGX1Wp5C8sqAHeOdZHIX?=
 =?iso-8859-1?Q?anxGehwoU3zIWct8+d0piW+OfhMxYl2GOIKJ1QzEyX1T8VANApkE65i9f5?=
 =?iso-8859-1?Q?a6UyHMQc3XSABh/exYYjhCbb97CwZonABkFx/7uPcRX3V7w5UM3O8k+kS1?=
 =?iso-8859-1?Q?jF2X/x4M+Hy3MzxFDLMYVqkJat3KtWLZo7/4aGWHtOEDPDxL7EQdK3mRqW?=
 =?iso-8859-1?Q?g6W9km3QJcdnwHKKXGKmvZDYhIPz8hkNnh0NQPoQ6jyTvlFNJw3GvlOnrp?=
 =?iso-8859-1?Q?ckEI1cIOM68P2gMJyt2IyI54xPwSEq+bXJhjFRabWtAvCJ330RBcOnjryM?=
 =?iso-8859-1?Q?rHy5RX7IMWPGV3AlIFcNY+e/wFcUufumV51ru3EAD6oHrhmauT+5jCvOc0?=
 =?iso-8859-1?Q?Xo7+XjsJXnWKqFP4/sU7B2HvzUAEJ/yFgmGaovZF1YIzk4P0d46aKuDQld?=
 =?iso-8859-1?Q?L5UkjaHYxfJaNm64rs2AKA+rC64+WhG5dB5MTsAgsIMzPcuQyh3zpNVTwp?=
 =?iso-8859-1?Q?6rZbipPkFTBKrgvfgWoJuVkJaSpo8KP1xTM97nm/7NRvzZ8MZoEk+aV8Or?=
 =?iso-8859-1?Q?40wTx5W/ZrQcTuD5Q2QafNouQrQiqEVdth0erdMwNoJdnpYIMK+iCvUw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C5DD2EA36525C34FB45249A8B6ADD50C@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cd125b-45d8-42c3-7dc6-08dacc41d788
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 04:27:18.6708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /bOyoIzQ7kYsbcMNA9OPxJOWNsTtHHIjp6noyKy3sB53//5dlF17oz7AzO3LSVpJ26qzI8r/AXbKbYr4j8WiZcYUL7kcVV5umevysk0tPQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8628
X-Proofpoint-GUID: 9aBDFSIQbw79tPD7_r_8skWJHGpppkxz
X-Proofpoint-ORIG-GUID: 9aBDFSIQbw79tPD7_r_8skWJHGpppkxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_02,2022-11-18_01,2022-06-22_01
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



> On Nov 21, 2022, at 5:11 AM, Stefano Garzarella <sgarzare@redhat.com> wro=
te:
>=20
> Commit 69e1c14aa2 ("virtio: core: vq reset feature negotation support")
> enabled VIRTIO_F_RING_RESET by default for all virtio devices.
>=20
> This feature is not currently emulated by QEMU, so for vhost and
> vhost-user devices we need to make sure it is supported by the offloaded
> device emulation (in-kernel or in another process).
> To do this we need to add VIRTIO_F_RING_RESET to the features bitmap
> passed to vhost_get_features(). This way it will be masked if the device
> does not support it.
>=20
> This issue was initially discovered with vhost-vsock and vhost-user-vsock=
,
> and then also tested with vhost-user-rng which confirmed the same issue.
> They fail when sending features through VHOST_SET_FEATURES ioctl or
> VHOST_USER_SET_FEATURES message, since VIRTIO_F_RING_RESET is negotiated
> by the guest (Linux >=3D v6.0), but not supported by the device.
>=20
> Fixes: 69e1c14aa2 ("virtio: core: vq reset feature negotation support")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1318
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Looks good. For vhost-user-blk and vhost-user-scsi:

Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>


