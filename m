Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33D136EAF8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:57:28 +0200 (CEST)
Received: from localhost ([::1]:37800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc6ER-0004Wj-Ly
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lc6DY-0003yf-Ld; Thu, 29 Apr 2021 08:56:32 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:32880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lc6DW-00022O-Hd; Thu, 29 Apr 2021 08:56:32 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TCm64q007949; Thu, 29 Apr 2021 05:56:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=9AX5HaK30dLC5VyyJS14j/ezZLryiBpRvEkswZK6Y9k=;
 b=NFFukW6Mv6DFywNu+PNPFwFTIX7mlfTXK2l5JuJo5cu3eDhwSHldKBRN4Ln2rn3T0Y+G
 +jxQWpgW/fNjagR/uoqA1T7GbkEE9TLabGNT/Ub6Cbw/eiVpss9GRL0TJWj6dWyWT6+t
 7OzF1hePBr1k1/kLqIqz/BT3qcbXcwGJYDh3T+0R8ibB60vj4Wn/a9o4BGqxe/o3By1J
 YRWP5SbEvDgeKbFd1oAPuK1Qc3PMyCO5jzYKeuRVD8UB/joGVXhFJWqVsSC4ZELgHZY1
 MN6MAS+sczYSIoqgdzlCICxXUd0OipEmPys0xZp1tfQHpSZDKp8smbsl4F81UK8VPVEj dQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by mx0a-002c1b01.pphosted.com with ESMTP id 387f7t1guj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 05:56:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOFIWLi5hcbDk7wOXbLgzJW36wL4/ryxO3GUaBrnua9Q+9uAQ4qGs/XcTNhtD7d2k05rfu6eah7GBDXtsAAsMkUMzdluv8Rkbs4oV/dWgDSHddwco2u8/Y38q0i7lpO0W92dKjX3yNtsLrRx9daryDa7sItY7ZrQL5TeKM+JPWaR75uAuzmbBhEiq1Zx2rSNJ1DSh6CF/j0fdXJzek6UGyjkycsR4oQMAHd63+5X+0urYRT29Zrdg/kn+xMge17r4TY6G0FxxPVB0y9Cas3JLkF7jCwjXT+naTFOxMSAmXsqW8X4I33+Fh/JgXihdRYFo7tiyu/hdaVOwDc3QCSy7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AX5HaK30dLC5VyyJS14j/ezZLryiBpRvEkswZK6Y9k=;
 b=ANWFJeLLNqTpAE4qIbIqi4V6JjOm6pdLZGqSnCSuE2OQh1WuCMuxklmUJTvq118fSeU4ZRkGGpFjZRPk+P5p6xpgkhjaBioj2jyXT+ZNeVCaUIT2UWEdLiOjpVc8WKL5TKgUKsX3Uvt534oEvFeBl0N+AgfYoCpWno7sTYgmfm4HsN5lv7gXiAUSa1Y/8C1rSt91IHeBMECou/IcDny1sU1SnK2Y1ApnCBy6uyuUuUwHY9mqYL4Qb/Qs8l1lNyHLIXywHIp6JcpPIUiJFIUEPVxW32X6mygLa+Tf27egLVWolMqkDiXgZBcEb4bwXKtm3jL2n58vyVScjfM9y54kvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN6PR02MB5263.namprd02.prod.outlook.com (2603:10b6:805:70::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 12:56:25 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33%7]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 12:56:25 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/5] vhost-user-blk: Use Error more consistently
Thread-Topic: [PATCH 2/5] vhost-user-blk: Use Error more consistently
Thread-Index: AQHXN5lWjexo/QtqaEeqjWt7dSOnyKrKQ96AgAEAZ4CAADqmAA==
Date: Thu, 29 Apr 2021 12:56:25 +0000
Message-ID: <20210429125624.GB21125@raphael-debian-dev>
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-3-kwolf@redhat.com>
 <20210428180847.GB20148@raphael-debian-dev>
 <YIp7xcFS5eqq4XHE@merkur.fritz.box>
In-Reply-To: <YIp7xcFS5eqq4XHE@merkur.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [69.122.45.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 192380d2-1ab6-4c13-1674-08d90b0e32a3
x-ms-traffictypediagnostic: SN6PR02MB5263:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB5263629535E5DDF386C1925DEA5F9@SN6PR02MB5263.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: InEjsiZhZBzszqonmwS5xiUO7oxVl0X4z+7TseTysgft5mf2h991sPXMYIeiuayQV03Ly2uPcKUqIohPOBi7wSvrMpQgGLI3KCH5z5oSHVBvsrmpj6v9Kwnj5kBZl3HTNUZVdPYK30fzbPuTHAo4uzXFmI26Y8ZQ40K27QZRQCarFonmYOS19+q74xPfuGf1P4IgwZXHK/gLfKV0+WbCn0pZdm6JIW9EpXJWSPKi9FIyNYUvUzQvSwTb3/ZkLYqvBVpSSV5KHPQFNm1fPYKALWuDJQ+KN4NITyuBcTDqyTeMe0ZLxnIMtGX6vr3iaokXBXTjq9+9T7JgivUJBHUllzCJ40Uhewo/ak97MNMNG8ZK9Lz050R8SzWH8h8MV9+ywUJELHgXbNU7YkI9YBJILBrczcWRWqjnNTvDliBZY4qstNny6lNBEM7C/lr6iWu1lO9R/yKtD88RSiRYOg2hVfU+25srS7DV7vJpSAMQk0sB/ki65K7pUNoL3LysDd6J+Y3oa+ns7IfmSiNcEWsxgRBZHS3eHKfc3D4O69mfWPTPCpFO3P3e0pys3U1nfF0j3ID/q1JgSP4AQ4clWKfDqVey6tCx/beeOQ8N48Ryv6g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(346002)(376002)(396003)(39860400002)(366004)(136003)(86362001)(76116006)(54906003)(6916009)(71200400001)(26005)(33716001)(66556008)(8676002)(186003)(91956017)(44832011)(83380400001)(6486002)(122000001)(2906002)(66476007)(478600001)(5660300002)(8936002)(6506007)(6512007)(64756008)(33656002)(66446008)(1076003)(66946007)(9686003)(38100700002)(4326008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?CyMTsvV5aHKJHC7p2DyNDFY3h60LqCJpo7ufV4dVgb8kyuqpCSzDuYXXvi+G?=
 =?us-ascii?Q?Kf7VniYpYyK9I/z1tITifsbopGNEZAR5uJDTXs9KikWjTkR2yetPcyj8nj+q?=
 =?us-ascii?Q?TSF+jhPTR0mdV1a1/3/JzYKutbPwH4HNXeUJ/Ra8Ejabl9NILkFekkYROs+y?=
 =?us-ascii?Q?1ygZnfCkTQUdQHm1i0NxRcEWJOT5pWIjSX/mc/MJxIFAhW5qOB5Es/q0fzxi?=
 =?us-ascii?Q?8XmQnpek8A/puuRBrU+q/JNokcpV10TcJnXhUmmR95EiWzmkHeDrxQdQNqJk?=
 =?us-ascii?Q?4nQOshQEuFH5uCbZbHCnVQcdmDNy4TUtrU0lbtJpECQHLkRwoXUOvV9qOAOH?=
 =?us-ascii?Q?KcVsOLZJjeOru2rHAGSVyM6DnLEn/imhpF37SDFYqSHZcejHkM3ZZkJXBx48?=
 =?us-ascii?Q?xErSgVAmuBSKgGDWDZ1S7EADs/Lc60GFQf1aLFI8WiL/Wc/PsMZk8wPGn2N0?=
 =?us-ascii?Q?dX2cV1NWFK4iF9hg6Iux+GQg+L1yzXC1tPVdtCs7wCbd3Kp3+DvumClCru7h?=
 =?us-ascii?Q?0yqC5nkbifKDaKicEPSDF30Ebc7kXhi+gb/OJmzQpYDvjEsSpXHzA4MMopgP?=
 =?us-ascii?Q?+y4lAE/f870McV9b0oBG5gmSUP0pLKrUuameJpsmQ1X0M3JMpmfd/H3HLYKn?=
 =?us-ascii?Q?naCDY/h7KK90ZOZvfXkd73wnyzqdaETZx2YADaVbu5GbDCUZQrN2w2WhygA6?=
 =?us-ascii?Q?nNKNw+ZhumU3HzfaZ1pDGxsjRBEF5SeoOBsC4hmjgkrpVaKAaGJ8bOBqK3qR?=
 =?us-ascii?Q?nIFLpYmS9qs6Rj/n5VPq2oq9u0QbiT2aaEYMr33zfdWf6Du4bF3LXnKPpJn6?=
 =?us-ascii?Q?7or6GGzZoJf6c5ZXurn/vDsk3yuapHI6ngXxP3HAvCleMzWN2w4ihTwB3s/T?=
 =?us-ascii?Q?5IPGjka0TrvaDdkYubSAovEqhu6CsV8C05v1wMRYrp+wA9fUKRecQ149yI9V?=
 =?us-ascii?Q?4FAHO9HjZL4Mwe3tzCzAD9I2U6EM8J1c8mYsq/6Oz4EiOJvZj2xV/TKYF8mT?=
 =?us-ascii?Q?9bQQIsjXGo2uw/WG0MHfxTG3Sv0zmCrz58BDqOkGXF0VBPKADH/Zcx8m3dc7?=
 =?us-ascii?Q?Vjj5GqUtiqTVXEaNS46QkGp9deP1zbxrWKDMCvLz3+hLAlC/XOt0BzF9luuJ?=
 =?us-ascii?Q?/EY/Cr8QY43Dz7kbS1cjqzC0fcDHq8abD19oVc3QbGGNaNEU290IcOOsB7GA?=
 =?us-ascii?Q?zFufSKiZRoHZpUu//E67oxFUt9NL3wirt1xcD34QGxML+evbugIZTWQkWC+P?=
 =?us-ascii?Q?r0Dlfx+oN8qa3Vt+rGVzK3U4EM5VGTOZCx66QCLgPx7OQz+G576hr/uDQWzN?=
 =?us-ascii?Q?yw8xLf7AigdaTRHp3UwDUm23?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA199EFF157DB64EBDE3C4ECCA5A1977@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192380d2-1ab6-4c13-1674-08d90b0e32a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 12:56:25.5633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SF72SccT9kqQJJFxvvDHjkLfXGOxp8qmabxZoqoPabszodZlZ6GJNQdiupIAvSUZIFbdfbTKnYmbyO3hmOXfH5wUb3iE5gtnbK+CplLORS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5263
X-Proofpoint-GUID: OM-ZUG0A9pDVM2MreXreV_-mt2pFPVoW
X-Proofpoint-ORIG-GUID: OM-ZUG0A9pDVM2MreXreV_-mt2pFPVoW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_06:2021-04-28,
 2021-04-29 signatures=0
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

Makes sense - I see why it makes reporting better at realize time.

Thanks for the clarification.

On Thu, Apr 29, 2021 at 11:26:29AM +0200, Kevin Wolf wrote:
> Am 28.04.2021 um 20:08 hat Raphael Norwitz geschrieben:
> > Code looks ok - question about the commit message.
> >=20
> > Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> >=20
> > On Thu, Apr 22, 2021 at 07:02:18PM +0200, Kevin Wolf wrote:
> > > Now that vhost_user_blk_connect() is not called from an event handler
> > > any more, but directly from vhost_user_blk_device_realize(), we don't
> > > have to resort to error_report() any more, but can use Error again.
> >=20
> > vhost_user_blk_connect() is still called by vhost_user_blk_event() whic=
h
> > is registered as an event handler. I don't understand your point around
> > us having had to use error_report() before, but not anymore. Can you
> > clarify?
>=20
> What I meant is that vhost_user_blk_event() can't really make use of an
> Error object other than passing it to error_report_err(), which has the
> same result as directly using error_report().
>=20
> With the new code where vhost_user_blk_device_realize() calls the
> function directly, we can actually return the error to its caller so
> that it ends up in the QMP result or the command line error message.
>=20
> The result is still not great because vhost_user_blk_connect() doesn't
> know the original error message. We'd have to add Error to
> vhost_dev_init() and the functions that it calls to get the real error
> messages, but at least it's a first step in the right direction.
>=20
> We already figured that we need to change error reporting so we can know
> whether we should retry, so I guess this can be solved at the same time.
>=20
> Kevin
> =

