Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF18136DDAF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:57:21 +0200 (CEST)
Received: from localhost ([::1]:52030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnV3-0003A7-26
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lbnQ9-0008Aw-Sw; Wed, 28 Apr 2021 12:52:17 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:12508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lbnQ7-0000PX-6r; Wed, 28 Apr 2021 12:52:17 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SGqBEJ026779; Wed, 28 Apr 2021 09:52:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=gLgXwWw53ZDZm4gNWlMMmNCc8dD2981PWgWDSwY9ZpY=;
 b=Ri35Q7+dDPpDWWTEAy9Ywg5siUvE7VlgR39W5dlMASQ4Qkf0NcOolN1SsAjyS4Uspv2k
 VR+GLZwSKgR98Bw2UhjmQz6s8pBW9aHoKQ1ryDO00Zd5zed4ImMeJSKRv7GZ1bjwlaUg
 3Ge27Ln+kWiRYzLW8WmtauMxM9nahpqjrmn0Aak2UUNGdvsOHjBni9cL2L0JQTVN9O5C
 jr8YleZu/IALUTFyW0etbUvS5P7tTpIDbF7Q+jy/fdWW6qjkuYhAp+NSuRvgVswymItG
 Pr7hoW98WCCnm1HSVES+C3O2C2pFBuI1AYhBC/O9p3wrtIT05kijtuhWrQ8NSLyHZC3Z aw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0b-002c1b01.pphosted.com with ESMTP id 386fc3bkhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 09:52:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIU4uibnL/SNRDj8NqXIFtVCU6JSXSPQxJ8SI0LXAjG1NgwH+5LoDzSYiIEnohoVAapNGnC9JPzi5gS5DwWI8Otr4SrhkpE3PO8MajKq4FF4mBzgdvgf9h6NgjoOBGsFB4LBAQHuS8umKjJYAnx+27NPmIc4j0KagIBoV3KGUJoTCrh8nP1q8+e7kejiaeJgVO2s//lm6qWC7hZtAeI0Y+OzeO8SUtuvGqgugk3CjKxcrh/6zx7e1J95cgNvrF04blUBqEb9pDe4XLGmBuPHHxdqYOOeo41Mh+KJgQvG577ETkwDjnNNmOJRNmfCkr1hBjF+ndpkGuAGD5HZz16+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLgXwWw53ZDZm4gNWlMMmNCc8dD2981PWgWDSwY9ZpY=;
 b=DQ5rsU+lqdPBCDmljaj8wQ9UawJZksqJul61Uo9SHzFA8UCPQs89fJMK0wieS54RAUlm2BDPq47N+aII5yPWAGVGpEl+i1fg4DppC8medJ7qjV/HHqhscbdB0OAzm2BWT+b+dbOsvGc2/BRY86KxIiPULuEDaboSDmAHIlCLhFblwsSdPB4AHRiTK8xEKCr7AlQfU2d6guVGn/rCAJAul/+a4Em2r+1QPkXEcek8c/slkoeBtU6nk95Ng1owiX3dGEhiA7JaKzBzJIqyDgNluOWIQE3cv04ZLKkQpIyYDoxqUWqUJAEX2vScBm+EjI/qAN+rvqcliZ+Zy7FXIOom+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN6PR02MB4032.namprd02.prod.outlook.com (2603:10b6:805:2b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 16:52:08 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 16:52:08 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/5] vhost-user-blk: Don't reconnect during initialisation
Thread-Topic: [PATCH 1/5] vhost-user-blk: Don't reconnect during initialisation
Thread-Index: AQHXN5luvZM5Xi2MZEaKiL49u8fLParKJwGA
Date: Wed, 28 Apr 2021 16:52:08 +0000
Message-ID: <20210428162529.GA20148@raphael-debian-dev>
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-2-kwolf@redhat.com>
In-Reply-To: <20210422170221.285006-2-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [69.122.45.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b61069e-ff14-42df-39fd-08d90a65f62e
x-ms-traffictypediagnostic: SN6PR02MB4032:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB40320914777C26715D1F2923EA409@SN6PR02MB4032.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CE11yqZBP92KRbjS/wuK4eUQlf3a7tPrJO0UMs4LtCJvuuFAtpkpqGXQZBbLxbOFqMeY4XAsPmG3B4ryCj+lbIOXDCn2LgiJMHefchSgUFNO/odAI4mEfxnl4RvZ10Rm4U8jGI+bmyVc8Sl0mENAisVcMtEAfWv3f95uDQfdK6hhdQWG02ljZTO0nVH7w3girnv2h22AKFIHqYaG0ttMDOR0xToM2tqilmNumgbMNCTbHW2FQjvYieaE2NFvglIDmCf6VF35mVPG/fcmpGlf4VBqIMghawagWU9gKDjMrCULAy/wwanq+QkIlS8RECOf0d1+tU7SlH975xzrkn7UZLghNxo1SjQ6jhFmBjyPane1x41yntXKGBzuSpxXkNEztcB+eedRuBkYEaOZMLVn1zIVg5XsNrO/VQ44ZWU0XE9e+ZAaUjAh3FP6imrZ7YNPOPDEyBZcbs/YlF2y1CyLG5Cr8LJk8SCTqN/9M9NmjS1XsyRIvwJs7EargxRPUfOU7gnczcJ/5/KsXdJfIC2AG4lAdMvOST9yF34MmpeArnuzvK+ds4NWkO4BmQd4UmpF32B0HmL46Siphv9T2DH2Q9xJ1HoQ2QFwFZ0b8pHMehs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(39860400002)(346002)(376002)(136003)(396003)(366004)(64756008)(8936002)(6916009)(6506007)(71200400001)(33656002)(76116006)(122000001)(91956017)(66946007)(4326008)(186003)(66556008)(66446008)(44832011)(66476007)(8676002)(5660300002)(9686003)(38100700002)(54906003)(1076003)(2906002)(33716001)(6486002)(6512007)(86362001)(26005)(83380400001)(478600001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?NCwNq0202Q3/2s84IFfX7QRDAQEYEH+Oc3iVVoEmjtM8EDupxhomJDcJRlMM?=
 =?us-ascii?Q?wZKGaCKdJnmkGtjqSRSoN7ltXDC3qEwqcce73tjaVMRWs8H5uHgXiSgoyPcx?=
 =?us-ascii?Q?i4abclyEqCIi2rqMoRJ9MmrFeXg8e93pYGI1ntOjEDMc32FTloNW9Ww0KWuu?=
 =?us-ascii?Q?dN8P0pkIsDaLrhujGVf9IseZFKlGAKtiMf3R43WK3vdffvZpX3yHCiUf7/+r?=
 =?us-ascii?Q?SGRSQDUOINgoULVRm96i5c6K2ChQ5qKk85EAMXHZNq8KXpp1wcuOCwVYWBE9?=
 =?us-ascii?Q?Mb5wfxdGsoyoTg2QSeOHOqRMsAyxV3kaXGUmcq5jhsdDwKrce7dXtk1X12y+?=
 =?us-ascii?Q?Xb4/lDVbKhhdSSQORRPMgpIp5vDE2cc9FkV60SPDZ1OFq/jbyVwfXg0T9EnR?=
 =?us-ascii?Q?MR5A4b3xe48ncvUc4c46BJSd3xe4oWQGh/Bq1u5JC8QdKiykyWAckipg2XFI?=
 =?us-ascii?Q?TdX9yD1f2I1xTEbhZiPxOqLzqyx6UNrrMgZCM1agejiJVKrN8NQNaffeQQNb?=
 =?us-ascii?Q?TfSulaRyJlHrbehBsTJChcQT33icGiWnLDVbJegu4gWF/yCAu0gT95vmzuLP?=
 =?us-ascii?Q?FJqy4oeSWvflutrKWx8VEkUjD1i5U7oIxQ027/ksLGZW23zNozeX24DRJIhI?=
 =?us-ascii?Q?cU6mmGrLvYnPkNmiYqW7oYjUHr7YlEOrYHFa1sUTXNHyshhGLr0AnxL45OSS?=
 =?us-ascii?Q?jeEOs/9iwfE7uADX+UR+LyOPgSq1gpBYASWrzbo7/FyE4uVSYz/U41NYeNZ5?=
 =?us-ascii?Q?gGqgXzNbV7nRKWUYSqmLop+gaJtFitXHSSQhpJRHJ2M5KyxavMbWo/5dMY1T?=
 =?us-ascii?Q?6Ck+l28QZfWh+YoR2YGAkxyyHaN+kaKIdUZIAmY7vcxNwYxF8lrkvXB3y1A8?=
 =?us-ascii?Q?AdtlnvgBs+9RXaRD6YaZBVTNLghTyTdiEGEFMuJbOM1Y8+rJ8Kt/0nkUtveX?=
 =?us-ascii?Q?IrGBRzwWXAcs7WyGTZVVjlpo54ZoQ4ouDQLwAQ2XAmX5B5zdw8qOYR4yaGDY?=
 =?us-ascii?Q?mzFekZu1jKLn97HiXVnFM3mN9TMbSD/CgmDMqafjsu5DKeZG8b1qwSU6ecun?=
 =?us-ascii?Q?qpUffyh8g4d+Vflx3/O5wUnJV+SGVN9/F9LnhlER7+KS2ELXPtrQuuey8AXw?=
 =?us-ascii?Q?ecSV0nO2RzGRDVKGAkgP5PIeZPoEl+j0kxqB5IXlCdc9i215gajYYM3wrYdQ?=
 =?us-ascii?Q?nYxxYhBZjZFtPQxidAytrM4daLVDGh30BjIIF8rCx0m3gSkkj0fHkotjcmQr?=
 =?us-ascii?Q?8JpW3BSws2zG8CRh0paOQnzEbCIjTbuhgyMf9xGUcmatmubMybWjAEJqO9Mw?=
 =?us-ascii?Q?Pd7gSDW3cRvzOxB5T9x4IWOF?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <205A0CF6E789BE4980D53CCE31806BE5@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b61069e-ff14-42df-39fd-08d90a65f62e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 16:52:08.6345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aI7XTkPKSK2Vwsto2fdYzKKdFJTj2xQVB18aYIGqv9i1XCu94xkVWYsvccb6k1ueJq6RWEdlYzkcoiVOY9EknJIcRjcO/XKD0dLEWGY2wiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4032
X-Proofpoint-GUID: v_vCzIjamY91kmajuG2HLDILWbiwKkip
X-Proofpoint-ORIG-GUID: v_vCzIjamY91kmajuG2HLDILWbiwKkip
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_10:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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

Given what you've shown with the use-after-free, I agree the changes
need to be reverted. I'm a little uneasy about removing the reconnect
logic from the device realization completely though.

On Thu, Apr 22, 2021 at 07:02:17PM +0200, Kevin Wolf wrote:
> This is a partial revert of commits 77542d43149 and bc79c87bcde.
>=20
> Usually, an error during initialisation means that the configuration was
> wrong. Reconnecting won't make the error go away, but just turn the
> error condition into an endless loop. Avoid this and return errors
> again.
>=20

Is that nessesarily true? As I understand it the main usecases for
device reconnect are to allow a device backend to be restarted after a
failure or to allow the backend to be upgraded without restarting the
guest. I agree - misconfiguration could be a common cause of a device
backend crashing at realize time, but couldn't there be others? Maybe
transient memory pressure?

Especially in the case where one process is connecting to many different
vhost-user-blk instances, I could imagine power-ons and incoming
migrations racing with backend restarts quite frequently. Should
these cases cause failures?

We can still hit the infinite looping case you describe post-realize.
Why should we treat pre-realize differently?

> Additionally, calling vhost_user_blk_disconnect() from the chardev event
> handler could result in use-after-free because none of the
> initialisation code expects that the device could just go away in the
> middle. So removing the call fixes crashes in several places.
>=20
> For example, using a num-queues setting that is incompatible with the
> backend would result in a crash like this (dereferencing dev->opaque,
> which is already NULL):
>=20
>  #0  0x0000555555d0a4bd in vhost_user_read_cb (source=3D0x5555568f4690, c=
ondition=3D(G_IO_IN | G_IO_HUP), opaque=3D0x7fffffffcbf0) at ../hw/virtio/v=
host-user.c:313
>  #1  0x0000555555d950d3 in qio_channel_fd_source_dispatch (source=3D0x555=
557c3f750, callback=3D0x555555d0a478 <vhost_user_read_cb>, user_data=3D0x7f=
ffffffcbf0) at ../io/channel-watch.c:84
>  #2  0x00007ffff7b32a9f in g_main_context_dispatch () at /lib64/libglib-2=
.0.so.0
>  #3  0x00007ffff7b84a98 in g_main_context_iterate.constprop () at /lib64/=
libglib-2.0.so.0
>  #4  0x00007ffff7b32163 in g_main_loop_run () at /lib64/libglib-2.0.so.0
>  #5  0x0000555555d0a724 in vhost_user_read (dev=3D0x555557bc62f8, msg=3D0=
x7fffffffcc50) at ../hw/virtio/vhost-user.c:402
>  #6  0x0000555555d0ee6b in vhost_user_get_config (dev=3D0x555557bc62f8, c=
onfig=3D0x555557bc62ac "", config_len=3D60) at ../hw/virtio/vhost-user.c:21=
33
>  #7  0x0000555555d56d46 in vhost_dev_get_config (hdev=3D0x555557bc62f8, c=
onfig=3D0x555557bc62ac "", config_len=3D60) at ../hw/virtio/vhost.c:1566
>  #8  0x0000555555cdd150 in vhost_user_blk_device_realize (dev=3D0x555557b=
c60b0, errp=3D0x7fffffffcf90) at ../hw/block/vhost-user-blk.c:510
>  #9  0x0000555555d08f6d in virtio_device_realize (dev=3D0x555557bc60b0, e=
rrp=3D0x7fffffffcff0) at ../hw/virtio/virtio.c:3660
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/block/vhost-user-blk.c | 54 ++++++++++-----------------------------
>  1 file changed, 13 insertions(+), 41 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index f5e9682703..e824b0a759 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -50,6 +50,8 @@ static const int user_feature_bits[] =3D {
>      VHOST_INVALID_FEATURE_BIT
>  };
> =20
> +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event);
> +
>  static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *co=
nfig)
>  {
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> @@ -362,19 +364,6 @@ static void vhost_user_blk_disconnect(DeviceState *d=
ev)
>      vhost_dev_cleanup(&s->dev);
>  }
> =20
> -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> -                                 bool realized);
> -
> -static void vhost_user_blk_event_realize(void *opaque, QEMUChrEvent even=
t)
> -{
> -    vhost_user_blk_event(opaque, event, false);
> -}
> -
> -static void vhost_user_blk_event_oper(void *opaque, QEMUChrEvent event)
> -{
> -    vhost_user_blk_event(opaque, event, true);
> -}
> -
>  static void vhost_user_blk_chr_closed_bh(void *opaque)
>  {
>      DeviceState *dev =3D opaque;
> @@ -382,12 +371,11 @@ static void vhost_user_blk_chr_closed_bh(void *opaq=
ue)
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> =20
>      vhost_user_blk_disconnect(dev);
> -    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL,
> -            vhost_user_blk_event_oper, NULL, opaque, NULL, true);
> +    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_eve=
nt,
> +                             NULL, opaque, NULL, true);
>  }
> =20
> -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> -                                 bool realized)
> +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
>  {
>      DeviceState *dev =3D opaque;
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> @@ -401,17 +389,7 @@ static void vhost_user_blk_event(void *opaque, QEMUC=
hrEvent event,
>          }
>          break;
>      case CHR_EVENT_CLOSED:
> -        /*
> -         * Closing the connection should happen differently on device
> -         * initialization and operation stages.
> -         * On initalization, we want to re-start vhost_dev initializatio=
n
> -         * from the very beginning right away when the connection is clo=
sed,
> -         * so we clean up vhost_dev on each connection closing.
> -         * On operation, we want to postpone vhost_dev cleanup to let th=
e
> -         * other code perform its own cleanup sequence using vhost_dev d=
ata
> -         * (e.g. vhost_dev_set_log).
> -         */
> -        if (realized && !runstate_check(RUN_STATE_SHUTDOWN)) {
> +        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
>              /*
>               * A close event may happen during a read/write, but vhost
>               * code assumes the vhost_dev remains setup, so delay the
> @@ -431,8 +409,6 @@ static void vhost_user_blk_event(void *opaque, QEMUCh=
rEvent event,
>               * knowing its type (in this case vhost-user).
>               */
>              s->dev.started =3D false;
> -        } else {
> -            vhost_user_blk_disconnect(dev);
>          }
>          break;
>      case CHR_EVENT_BREAK:
> @@ -490,31 +466,27 @@ static void vhost_user_blk_device_realize(DeviceSta=
te *dev, Error **errp)
>      s->vhost_vqs =3D g_new0(struct vhost_virtqueue, s->num_queues);
>      s->connected =3D false;
> =20
> -    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> -                             vhost_user_blk_event_realize, NULL, (void *=
)dev,
> -                             NULL, true);
> -
> -reconnect:
>      if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
>          error_report_err(err);
>          goto virtio_err;
>      }
> =20
> -    /* check whether vhost_user_blk_connect() failed or not */
> -    if (!s->connected) {
> -        goto reconnect;
> +    if (vhost_user_blk_connect(dev) < 0) {
> +        qemu_chr_fe_disconnect(&s->chardev);
> +        goto virtio_err;
>      }
> +    assert(s->connected);

Maybe a good compromise here would be to retry some small number of
times (or even just once) so that cases like daemon upgrades and
recoverable crashes racing with power-ons and incoming migrations
don't result in failures?=20

As a more general solution, we could have a user defined parameter to
specify a number of repeated connection failures to allow both pre and
post realize before bringing QEMU down. Thoughts?

> =20
>      ret =3D vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
>                                 sizeof(struct virtio_blk_config));
>      if (ret < 0) {
>          error_report("vhost-user-blk: get block config failed");
> -        goto reconnect;
> +        goto virtio_err;
>      }
> =20
> -    /* we're fully initialized, now we can operate, so change the handle=
r */
> +    /* we're fully initialized, now we can operate, so add the handler *=
/
>      qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> -                             vhost_user_blk_event_oper, NULL, (void *)de=
v,
> +                             vhost_user_blk_event, NULL, (void *)dev,
>                               NULL, true);
>      return;
> =20
> --=20
> 2.30.2
> =

