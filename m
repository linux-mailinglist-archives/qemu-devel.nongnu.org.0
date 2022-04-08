Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F064C4FA04F
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 01:57:16 +0200 (CEST)
Received: from localhost ([::1]:50442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyTc-0002v6-1e
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 19:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1ncyS9-0001cO-56; Fri, 08 Apr 2022 19:55:45 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:15498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1ncyS6-0001lr-AI; Fri, 08 Apr 2022 19:55:43 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 238ElNtu017901;
 Fri, 8 Apr 2022 16:55:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=fpLih3y0PwIg8znho61JDkXWI/gKLeMc8KeE3FykAw8=;
 b=tYeQiLK/Y25Ib+6KiE7TT2Ha3cSTFV/3pOvzl5qncjJgKRR7tA86P3Za8cVKRXF3NI3t
 ontKpeamaX89bFj6tBPhoRG7gwV25go/5DmHtj8XtehGMW3cK0QKz8xobqjXJfhWT1w2
 HO+olm/Ni1Sv+SgP0FJFv5MTg/TIotBP4sEOKRkYw0rBuu4keDCrq76fg/28bKwUTsYz
 zo3V0QkKTqIQojex8ekJMuc+NYUI5au2rXCundkbpQq+/ZWs0KbId6/QThGNbZFsoq3s
 yF3VpKGeWANfsjr+UBCj1uW0pzrKBOCFh2sp7cdVGDTul4J29iNjsct7W9RteMyZLHMD yw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f6jttxq64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 16:55:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evm+v2AmFU+3dwmob1CJxMatAI/59wEJbjRFRe+0NHpnHGaPIDciyjFkP3S4eZwRINTSsL/bzMU1MsbI0jvF4o2f+c0Wb0/0fTBOH7FEpViv2HUeDOUjI2c7XeF7MKd8kuulnG0DYJ99Mv30Uf5PKU8/fbVU2TRxwbeICPHGtT5amT7a/UWSvdhCMfup/BQ4p3sKUK17iEuPnXmrKEbiPkyoSowAQnp8V1m83Yk86NUmWef/RZOGGu+4AJeieijZKzKzL0dRnMmXO2pt1pchAL5KUe+Zxc/FY8VipfeOnn+p8WhxOMZ5hW2vQLmrCepjDVFKoMuKqI1uyVgKGspg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpLih3y0PwIg8znho61JDkXWI/gKLeMc8KeE3FykAw8=;
 b=j1xk5x98Usx+1eoAALKEf3yj2XaAUEknCWCtZXdymr3ncNIJKpl/Di+V07wweKTwFEtN+QzC7N3732gYtiHi++c/n1rpJ12P5YkGBN8Tn4bmM1Hvb1gzhmecif7zg6TBaDfj7nDvlg7KJhH7CvX5tb7dxG1ZLCW2MAeRvnrB28DlpX3ZwVRNXdBEYkTS89jUu32ujVANbTe7flhJhQD7Dp3yC9320YV1CVl8x9pr1s8tH3cnNmnAPi4GcciplyYaa5BebodvVV4zD7F2A3tapIQgDj6Tmm2jmiKcPn6f53ZK3fhJ9IzckUG43eILMqYPi/jp0Bf8mRxZ7o2jGPF78Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by SA0PR02MB7145.namprd02.prod.outlook.com (2603:10b6:806:e2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 23:55:35 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::2065:e953:bdd:ae4b]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::2065:e953:bdd:ae4b%7]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 23:55:35 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 3/3] vhost-user: Don't pass file descriptor for
 VHOST_USER_REM_MEM_REG
Thread-Topic: [PATCH 3/3] vhost-user: Don't pass file descriptor for
 VHOST_USER_REM_MEM_REG
Thread-Index: AQHYSoS4u8xOQe6WA0S6xmXEBVZoSazmszoA
Date: Fri, 8 Apr 2022 23:55:35 +0000
Message-ID: <20220408235532.GB10957@raphael-debian-dev>
References: <20220407133657.155281-1-kwolf@redhat.com>
 <20220407133657.155281-4-kwolf@redhat.com>
In-Reply-To: <20220407133657.155281-4-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e058403-77c3-43ed-34ce-08da19bb4636
x-ms-traffictypediagnostic: SA0PR02MB7145:EE_
x-microsoft-antispam-prvs: <SA0PR02MB71457FA90EC230B5A230B64DEAE99@SA0PR02MB7145.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dgy0zSs1PyX4eFywDpBAxHVFfkKpuS1IiGfiPHQshL/lTrGpRM9ZbDOSLLEW6oG/KdYlOP4oOBXi7n5JC8ybRNiNIpdvpErDXRL3HGZ5+cz05Q/KF9bPzPUrE2uVzqT/4HzTrbHpBidaMFJMinMAjwbDAj4CKxOXnBxVqyJu2w0iQEclaEPfGT6PKARHEEvSkIs9GNGqObZGlLxRwVKEXzwRdSXh7NIS77heN6hRKMOgnT+uGpHWK2t2IEImGzSPNfUxpXrBM286tYyBVmYOhY7H0UftAPREUfbjERV7zH5ODhmKO5oXdUczhEqP2VrTNVja4RvNZ8vFiP17k0qXV8jFxX0iNDqG7HRLURNU1O71FE6jaKLgkxbi8Ig/QGfnDYqWYJ+eq83vQk/7DClVjSolCEe+jKyTqBYlCrjlX4VL+NGOlU3aHU0nlcJzwCoCdcwMJm4Q4wkRpcr8N+pL6bm8e1EqNPdJhFlvVJ79BKQ0S9UCKWXeqDPSfW8bPvUos4lhE9tcRsXmSCklISPLNa99OUM/HozgHopcD4tEiPmOwvi1pC6KVu7aFJqVezhkPlNgfUnw1bYMqdDzyHcvj2sNY2Q6UTvtlZKe0syzmjsrQGTevGcymGIV0TAvKBioenhQLjgEZC+zrv76/FOoeBkeGQlKDUenTHiwCs15VYpWemZCEqRC5T0i+pQQUWiaK+g17f24E8OQNpuOaNJkrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(186003)(26005)(316002)(71200400001)(6486002)(122000001)(86362001)(44832011)(33656002)(2906002)(8676002)(8936002)(6512007)(9686003)(64756008)(508600001)(38100700002)(33716001)(83380400001)(4326008)(54906003)(76116006)(91956017)(38070700005)(5660300002)(66556008)(66476007)(6916009)(66446008)(1076003)(66946007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MWQdHO5uSHdLP0loB2KxiPrYU6w7FTG4Eevtoes2yF/Qo4fRO08/K1kOph2z?=
 =?us-ascii?Q?BHjJkQlRyWlsHkIoBLBhID3wbesDg6JjT0ghEv/F5xDbldYV/yV7ZSUtAyGv?=
 =?us-ascii?Q?lXumCg58NBoZgsvdFNq0sINsH2TK0YHXZSCcNPlongbSl2zUBybvVq+yQnRx?=
 =?us-ascii?Q?9nMkJXLzeTLC/A5DDgChTeidcrKQN0KflOhIDBRCZVqQ7F19foqkmi+XF1vA?=
 =?us-ascii?Q?uPGxv5ROCzjJzk8i40c23A7CRXfIVrls0StSW2xgeilCGqdpqCfcQh6IsMyC?=
 =?us-ascii?Q?wa3l/j1dPGNnfpS0RPaKuqjHxFdfgSOsf1QaQEtNO2MQ0MCoF5KvMLYS+MST?=
 =?us-ascii?Q?PdLOhTMQHT/Yjw+ebnhWyt4IjAPZzinQuxb5mssEHGNM40zcLwwA+bsUTlg3?=
 =?us-ascii?Q?Fbbc54ovBR2V+Y5Yn43CWu0ZMsB/bLVPjUGAPhpojclxrBczEBFKQccOt/h/?=
 =?us-ascii?Q?AHFcvXhYZejydRT6ceQtzpp5zsQq+jS2khiqZ4L7kRGwtyarq/l1YlrPQtdd?=
 =?us-ascii?Q?3yMWRkq2d0pvdVof/UGzIt9Ieyc5D2cKnhrH92qPUGYprPURcKRSWF8aBvi7?=
 =?us-ascii?Q?/NmBZmnj55R0wvN20IWm5q8moGINjnuN0Gz+W1iDPLmSkRO1a3XD4oRtDDhE?=
 =?us-ascii?Q?RK1NV8RCgnd9mypxPt+C6IZjppKgyS6esL45KATynyKHTuKoiZmCg6HcG0ve?=
 =?us-ascii?Q?Xy/NJvGoafGna9rQ/z5b6nzRjvBj6bn+Re37fPPvTETVos85XRS2IBIQXNzH?=
 =?us-ascii?Q?6bxcpXJUa/1OYMRJEUKlG2kCLVV46vcDiuo662DTy5f77AliP8/utOzU4fwE?=
 =?us-ascii?Q?jq+qB/fEaDqMXpJi5XujBNYHCu/GD7AsMz0sB/vBm8Lw5sFk+XvBZNKiFtG9?=
 =?us-ascii?Q?Ia4mbDxml3a8ra4Rw8JQuzPdoksHExf/AHjIJqcrI8VVP2keSQGSwkDWAQEk?=
 =?us-ascii?Q?A6BPzvtn7c6D7hLd7A+bQUda/QvmWcJWnPKwKe+5uCxybhIkfrz2F9YYdFEr?=
 =?us-ascii?Q?a8rueQs+a95kgisR7vG/zJIRZJrXMwafVXLgrVe1BV8NR/8J2nj18VszuTsZ?=
 =?us-ascii?Q?/t6Vd8qlVEqIHEkcX8C6aGNRExWNOF1rG7xORXXiXKDxBGwTZ9UVQLOG/olq?=
 =?us-ascii?Q?vU0xJJu3UYFsJX/B0NkzGFBFwdEhSO84qCBxMHAVjBT16jxforHXBsU6T9ek?=
 =?us-ascii?Q?ki7kbh6lW2XJHnWL6Vg9tLnxO/Eck+fHglQnlLsQi5uJdzLMn09OEs5UD6oe?=
 =?us-ascii?Q?px6j6K68ynPMo4goC8be+etHPqlRSCpVv4Z9MFoT1kqSWaO2p3GON0dgyAyb?=
 =?us-ascii?Q?vTdXrJrPI09F4XhGzkgp/LUh2muTjtRw0a+MZTaw63Ke/0QC6jq665DdLuzP?=
 =?us-ascii?Q?wpLsttYw2XbKzWClvZihv1XDgmjd/X2luV2vbisBNMYAFgACLyru0z0S2ZYP?=
 =?us-ascii?Q?BVwU7XXJvQdgzt132WS6LwG/DEBOjVX77NvF+Lr6/FWoerLZAGKDIK7eaGVv?=
 =?us-ascii?Q?3ZK6Y45m3spNhKRKk65mqnOSI+dQVV8dUJ5aZJ8vtMg20801o79Pm4WYg/Mg?=
 =?us-ascii?Q?HqnIhRc3FCmCPWRWzIzzsCHdf1TRhMZp8O9tGSaN+SIxr0iCFa6EEY0DQb4b?=
 =?us-ascii?Q?w34jUIE0V9Hl23kmGQfLJqzUbUOh4KXfchkKa756O4ROq+A68Gic/ubCYCVA?=
 =?us-ascii?Q?aGlilN3W7bTVLgSkj3c69AbA12oaKy7oGqbG8H79pttWfaVGgLHjwpPT7s/3?=
 =?us-ascii?Q?zRPq+bY3IaaRzmS+4JBzb665YVStcdmKQf/YbtvHRSnbueo4OiCO?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EE71EB23EA38A249AAE03EE1DA89B3F9@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e058403-77c3-43ed-34ce-08da19bb4636
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 23:55:35.3101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TzRnEOgXD9oQUKcMfYh6iDsu6oibUmgrUHxJY7zTmVPVPKbBuMM7LMCTPFFrJ2hCVIz/dEvBc1iP/I+ZksiQJcL1fEpzt4lniEqIo+44y3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7145
X-Proofpoint-GUID: kht3tsm_4JW8QCRj5ZT7ocF9a-_Ap_do
X-Proofpoint-ORIG-GUID: kht3tsm_4JW8QCRj5ZT7ocF9a-_Ap_do
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_09,2022-04-08_01,2022-02-23_01
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
Cc: "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 07, 2022 at 03:36:57PM +0200, Kevin Wolf wrote:
> The spec clarifies now that QEMU should not send a file descriptor in a
> request to remove a memory region. Change it accordingly.
>=20
> For libvhost-user, this is a bug fix that makes it compatible with
> rust-vmm's implementation that doesn't send a file descriptor. Keep
> accepting, but ignoring a file descriptor for compatibility with older
> QEMU versions.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/virtio/vhost-user.c                    | 2 +-
>  subprojects/libvhost-user/libvhost-user.c | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 6abbc9da32..82caf607e5 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -751,7 +751,7 @@ static int send_remove_regions(struct vhost_dev *dev,
>              vhost_user_fill_msg_region(&region_buffer, shadow_reg, 0);
>              msg->payload.mem_reg.region =3D region_buffer;
> =20
> -            ret =3D vhost_user_write(dev, msg, &fd, 1);
> +            ret =3D vhost_user_write(dev, msg, NULL, 0);
>              if (ret < 0) {
>                  return ret;
>              }
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index eccaff5168..d0041c864b 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -822,15 +822,15 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      int i;
>      bool found =3D false;
> =20
> -    if (vmsg->fd_num !=3D 1) {
> +    if (vmsg->fd_num > 1) {
>          vmsg_close_fds(vmsg);
> -        vu_panic(dev, "VHOST_USER_REM_MEM_REG received %d fds - only 1 f=
d "
> +        vu_panic(dev, "VHOST_USER_REM_MEM_REG received %d fds - at most =
1 fd "
>                        "should be sent for this message type", vmsg->fd_n=
um);
>          return false;
>      }
> =20
>      if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
> -        close(vmsg->fds[0]);
> +        vmsg_close_fds(vmsg);
>          vu_panic(dev, "VHOST_USER_REM_MEM_REG requires a message size of=
 at "
>                        "least %d bytes and only %d bytes were received",
>                        VHOST_USER_MEM_REG_SIZE, vmsg->size);
> @@ -877,7 +877,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>          vu_panic(dev, "Specified region not found\n");
>      }
> =20
> -    close(vmsg->fds[0]);
> +    vmsg_close_fds(vmsg);
> =20
>      return false;
>  }
> --=20
> 2.35.1
> =

