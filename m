Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721A342DEC5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:58:43 +0200 (CEST)
Received: from localhost ([::1]:48874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb37x-0006iu-7I
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mb33B-0002RS-8Z
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:53:45 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:2256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mb336-00012B-1s
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:53:43 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19EAlVqL010281; 
 Thu, 14 Oct 2021 08:53:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=RyZmlxw8wRCTZqK1c6DoJjktEAClIiWdYMWFAbeqgx4=;
 b=BMTMmGuz4HR0eETvwc1f8xQSSIEF2+QPOvIiP3Xe6588vfNwHfqGPo4vxPJhanPtUqrV
 ieVEcfCN+1rP54plHMH+5VY8COqASc46LEpgZv8cOegWI/zh+tPCf6/2Vl4kJcrjKuxb
 cGcwdT8BCYnRZSOV5l1QvPQNRphkX6ecqkxQLsfHuW2rLbTzvuHXvLTl4NgAOwePf+Sv
 MNKJer0ZZNibZHnX95FNgfP8CH0L7sEjt1IMTlwZJjfG2VFXmvYG8vKJDDLEc1HwJS8G
 sEIvEL58+aful2ab/4WU8rvkmUCyWXNMoaq37bWYf8BaANObiMS+VWwzvUnNbRaz7jVN Dg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3bp8969m60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 08:53:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dzz+zTjwaJCian1vqiwgXkbOcQUrH2OTokKutACHONsL3/Tp4lIvqEwZXTRPV937S1bS9xdSJYf7+qsKp9Oe34KHYXIx/VP9P/urU7UU8A0XfZMsS8HuCJiyaZ4YAKRC2LUr2VRgqyQIDGUAZfejimH7nxcZ+XnFylZYGC5eQ8gwIR4PLA54ijN+5HKPOiyG5i9S2G5qhqRPLLmSVCizfrMRULuxgXeuj7CIilMhVJ75X89AExP/yX3IKGTZ24d+2Yvf6UadlhcmXyIQ4jKXQvju94Rf/7y0Qgh6ha2FpQYLLvVz8nxnIYhg9UmXbBj2WBtBBiqsou9YWmO8zj7Vfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyZmlxw8wRCTZqK1c6DoJjktEAClIiWdYMWFAbeqgx4=;
 b=KlkxthNbsAQKCRJ6ciYPt3mWNto2vXbPyxgH/sSbdPjxoR5AzlWCeILbOukc27JbXKngGI0vJrV/nLnQ5IRcok8FrJNeqJlgE34r+Wbf1+0JgPZd5KURXlB9DGUqEVrGYKKNNXRCUZc4jCZnvDBZYBKqsnY6W+uEI5UfE+el5iSv6iLmKxseVXLZqHWIhrscOPxsVByTgi8dqCNR5SMr2q3MT7cAnp38ZG8AzvfMevdU9OwLsoq4soNMlurerMT5LbqIhQNfRrCjMNmdTwa2L8MhXjlL4aMfyavipOc8GJYyDKK4BKjqQJYdSxsgLGJduIL5i3SaB5rZOf1xgfzslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by MN2PR02MB6096.namprd02.prod.outlook.com (2603:10b6:208:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 14 Oct
 2021 15:53:29 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::804:50eb:bd2:eb3c]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::804:50eb:bd2:eb3c%7]) with mapi id 15.20.4608.017; Thu, 14 Oct 2021
 15:53:29 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG not closing
 the fd
Thread-Topic: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG not closing
 the fd
Thread-Index: AQHXv5h+sI2TRXPscUaomCe3odWO1avQr72AgAAA1gCAAUkaAIAAG0GAgACTH4A=
Date: Thu, 14 Oct 2021 15:53:29 +0000
Message-ID: <20211014155325.GA10680@raphael-debian-dev>
References: <20211012183832.62603-1-david@redhat.com>
 <YWaraVenjaIZXHCc@stefanha-x1.localdomain>
 <76ec743d-afb5-dea5-6c54-2180d176ca1a@redhat.com>
 <20211014052918.GB21284@raphael-debian-dev>
 <9391f500-70be-26cf-bcfc-591d3ee84d4e@redhat.com>
In-Reply-To: <9391f500-70be-26cf-bcfc-591d3ee84d4e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cbe3dfc-3d02-4443-e7e7-08d98f2ac497
x-ms-traffictypediagnostic: MN2PR02MB6096:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR02MB60961C66DE280B3018B00BCDEAB89@MN2PR02MB6096.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ATvMrFKqSt9lcHE0fm4iAYhiprreEnWcoMYQSvHC4mcpbWoL3kLGuJcViEG0QDXk5rCJTATMH0D6uCEJJD31hdsPWxLjtGGh0YNuqIYJCrfzE4jyuqT6lyfS93tbF0rrehXCH1Xlk0rWL4AphDtCfKba61ocYFj8o4f5ZUiBRnhRy+Hn8ITfzCLOqR0N0fF1WnMXQ8BQh10e22U267bc0YrzjzjckYB3fUcSzNByBZpBYmaoz+6Wp6ZPmC8HCSMvvv9ux8rg0WsBAFdgbyaxHG2maiVqQibORoAvyeTslqosY8AK2ApPhZ4YH5pSEBAeOfjmDQOigvZtvqIivSMMUnFB4vYOsBtxh/aUl9MR8xL/TwY/kIRWCatDm6IIjv1JSeEfugvTJ4HcTc5gpnVOmbQFog62E7+rSr4R/HorsK9lWBbvCttK90nrWaRxOLAUMjpc6EpIXqizV5dhAj8tCO2eDH7sI8ZPoctFQO1VGJxRKLgTH5JZHvW6vBp2KELLqbbEsiJHZHBUEN4ZZw2L8X5drZptLYpzYK24rRYoTxbQ7KX+w3e8FM9Pk1d/bq+u4bJWPR82e7mN+NzW80/iJYdIzlRcIVH7JFvDzkv0YwGYxjRzFzf4xZc+kTibmah9JJm1I9yO3mmILSO2JB9IOLc4Q9gbQp39cIRKMCa21Yax0OUlgrQ76tkNs3P3IEfkXAo2a1EHfclbTWJU1dhYcuNWMSiZ/TGQJaa3o2u+0rdxHcdTllv1DqQTmhnul+3IsndV9NERUxg3RATOOp8DoNsLQVKauxwio1OGtEcn+kU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(8676002)(33716001)(33656002)(86362001)(966005)(71200400001)(44832011)(2906002)(54906003)(6916009)(316002)(5660300002)(4326008)(76116006)(38070700005)(83380400001)(91956017)(8936002)(66446008)(66556008)(66946007)(122000001)(38100700002)(66476007)(26005)(508600001)(6512007)(186003)(53546011)(9686003)(6506007)(6486002)(1076003)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?B5+XZh+OwsMf6DV0Z9jyfR2KnVwGkZNqNQ3GYOgIUjqLL4njw+W1AIQEH9?=
 =?iso-8859-1?Q?4UtumNZWh8ehQdS4wNbKnhzH/tULDRplIFb1Vg+SL4zzylimrOtZYcCG00?=
 =?iso-8859-1?Q?ZkqqZ71wGC1Pt/PQ107BTn1sVaiKU83ZAUe+t6MQ4SRK61KGEidr4K+Ei5?=
 =?iso-8859-1?Q?zRZQdmu3Fhf2joLytD6R4ZvyDIAvkmWrkAZxLVaOkIAsxmrO3bDcvqDyTw?=
 =?iso-8859-1?Q?Y0VYdjhvbrG2D4kYvJMdqDYccA4ttDeJNFzi3Djd2svldM7fdcp3lZIV8x?=
 =?iso-8859-1?Q?Ny3+gC8lyX2J1nx/EcXUYbOoLlER0+sFDAxo2XN9Z8r+oh6I5djpFutPet?=
 =?iso-8859-1?Q?tEjLVd33QvVWw992GXLD2EbZGh6FiFLwJPK2j26S5mHJanXsC1o8ARraZo?=
 =?iso-8859-1?Q?ZaC6ybtAwa52/KNHLW+xozENkXAFJaJ1J+gea5CS/q45+oUqAxCGX6WZWH?=
 =?iso-8859-1?Q?l/gVm+gzsDUCRwxNSBgqk8wyLrR68PXmzH6Z2ntTTZZTV93Wgzl4N2VV0B?=
 =?iso-8859-1?Q?eQ9TUKdiof4RLpoYgeVjHar6Paoq67i3OTvRhH9+i5vx+liOTRtaID4gyW?=
 =?iso-8859-1?Q?cU7LEUTPGi1+jffBn454xxItvIPIe8i5HOc/ZDZ+PfBqsUHO7y7xew6ARP?=
 =?iso-8859-1?Q?oxCFLKYuugUDgtCrS6c4Vzp7DpQetJCC7bWrwGQKFFtymnZJhepC2hjXwc?=
 =?iso-8859-1?Q?0gGbY/yZbALJ6zV89VaAunqAW9fDZcopZhSpWQfLy0k2FnqOanIZlBD72Z?=
 =?iso-8859-1?Q?7NI6aLqSFd1eESBEXgRrCpaRlwCuqW7PhAFDQ/ZoakrgH6oP9jwaLool6H?=
 =?iso-8859-1?Q?db0ZghsK5M5asu53vGAgol7cyBXYYsLqk6mO7C9uZQFiLZGzWAKPiPmP1U?=
 =?iso-8859-1?Q?huLbmGgD5gRxBDz2EFzdLS/BFFykmD6tlKa6gk6uYnKLd54ptbUJRdL7df?=
 =?iso-8859-1?Q?VM1CPzfm7pKzkvS0VJHoaE7nArDRJ129Qa6xuuD05CkoyIKJ95lRNcknGS?=
 =?iso-8859-1?Q?T9mToCDcOnVD6eWaq5Qzd72l3WguAf2ZPT9Lm3xJw/qIAGiW9Uo7vD++++?=
 =?iso-8859-1?Q?mV/pNyrze7AXzOCGBHY0FfdkGawg+EqpqkqVt4lKKq9YgwhuYJK+VbtBGj?=
 =?iso-8859-1?Q?FBDNq3k0i00YCcUlBf3XGoe1jFXAK9BBiWJjRAalHx4d8DtUoHEuL4brFK?=
 =?iso-8859-1?Q?3QGHl3+LlbGf+Eh9XGVR9LVx3suy+gNUq5VHKpoK1BKY1TCDMJrqYHOUVG?=
 =?iso-8859-1?Q?ehJ8zaYjAV/ckTe7uCdyKUeudEY+TxhHA1GPV5EudOB76yy4c8xr5sdY2x?=
 =?iso-8859-1?Q?BPIItwhoTTzqDNajqC8vyLZyWqJruq5HhyXw4ndjbtSyFXTCTHlauhBSlx?=
 =?iso-8859-1?Q?deryuqMGxR?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BFEB6EB5993FBB428EED894119654E6A@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbe3dfc-3d02-4443-e7e7-08d98f2ac497
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 15:53:29.7979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vLN+IYg6PAnIfvdpdmXhWhWsrupfg0D4Pi8mqPhhFNm1xaYOOlmVatpNwb2z+m85/hb2dxxFv7jT2+Xu9ImTYp1khGNZJaXJtXPmrSQsl2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6096
X-Proofpoint-ORIG-GUID: bzvD9p_5hcMbboQTWAiG08dWJWxhsBZh
X-Proofpoint-GUID: bzvD9p_5hcMbboQTWAiG08dWJWxhsBZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_09,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 09:06:51AM +0200, David Hildenbrand wrote:
> On 14.10.21 07:29, Raphael Norwitz wrote:
> > On Wed, Oct 13, 2021 at 11:51:24AM +0200, David Hildenbrand wrote:
> >> On 13.10.21 11:48, Stefan Hajnoczi wrote:
> >>> On Tue, Oct 12, 2021 at 08:38:32PM +0200, David Hildenbrand wrote:
> >>>> We end up not closing the file descriptor, resulting in leaking one
> >>>> file descriptor for each VHOST_USER_REM_MEM_REG message.
> >>>>
> >>>> Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-us=
er")
> >>>> Cc: Michael S. Tsirkin <mst@redhat.com>
> >>>> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> >>>> Cc: "Marc-Andr=E9 Lureau" <marcandre.lureau@redhat.com>
> >>>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> >>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
> >>>> Cc: Coiby Xu <coiby.xu@gmail.com>
> >>>> Signed-off-by: David Hildenbrand <david@redhat.com>
> >>>> ---
> >>>>   subprojects/libvhost-user/libvhost-user.c | 2 ++
> >>>>   1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects=
/libvhost-user/libvhost-user.c
> >>>> index bf09693255..bb5c3b3280 100644
> >>>> --- a/subprojects/libvhost-user/libvhost-user.c
> >>>> +++ b/subprojects/libvhost-user/libvhost-user.c
> >>>> @@ -839,6 +839,8 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> >>>>           vu_panic(dev, "Specified region not found\n");
> >>>>       }
> >>>> +    close(vmsg->fds[0]);
> >>>
> >>> Does anything check that exactly 1 fd was received? For example,
> >>> vu_set_log_fd_exec() does:
> >>>
> >>>    if (vmsg->fd_num !=3D 1) {
> >>>        vu_panic(dev, "Invalid log_fd message");
> >>>        return false;
> >>>    }
> >>>
> >>> I think that's necessary both to make vhost-user master development
> >>> easier and because fds[] is not initialized to -1.
> >=20
> > Ack - will add that.
> >=20
> >>
> >> Similarly, vu_add_mem_reg() assumes exactly one was sent AFAIKS.
> >=20
> > Ack
> >=20
> >>
> >> If we panic, do we still have to call vmsg_close_fds() ?
> >>
> >=20
> > I think so. What else will close the FDs?
> >=20
> > AFAICT a vu_panic does not imply that the overall process has to die if=
 that's
> > what you mean. What if one process is exposing multiple devices and onl=
y one of
> > them panics?
>=20
> So IIUC, you'll send some patches to tackle the fd checks?
>

Yes

> While at it, we might want to simplify VHOST_USER_REM_MEM_REG.=20
> I have a patch there that needs tweaking to cover the point Stefan raised
> regarding duplicate ranges. We might want to do the memmove within the lo=
op
> instead and drop the "break" to process all elements.
>=20
>

Sure - let me include this in the series.

> commit 34d71b6531c74a61442432b37e5829a76a7017c5
> Author: David Hildenbrand <david@redhat.com>
> Date:   Tue Oct 12 13:25:43 2021 +0200
>=20
>     libvhost-user: Simplify VHOST_USER_REM_MEM_REG
>    =20
>     Let's avoid having to manually copy all elements. Copy only the ones
>     necessary to close the hole and perform the operation in-place withou=
t
>     a second array.
>    =20
>     Signed-off-by: David Hildenbrand <david@redhat.com>
>=20
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index 7b0e40256e..499c31dc68 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -796,10 +796,8 @@ static inline bool reg_equal(VuDevRegion *vudev_reg,
> =20
>  static bool
>  vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> -    int i, j;
> -    bool found =3D false;
> -    VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] =3D {};
>      VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_region=
 =3D &m;
> +    int i;
> =20
>      DPRINT("Removing region:\n");
>      DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
> @@ -811,28 +809,27 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      DPRINT("    mmap_offset      0x%016"PRIx64"\n",
>             msg_region->mmap_offset);
> =20
> -    for (i =3D 0, j =3D 0; i < dev->nregions; i++) {
> -        if (!reg_equal(&dev->regions[i], msg_region)) {
> -            shadow_regions[j].gpa =3D dev->regions[i].gpa;
> -            shadow_regions[j].size =3D dev->regions[i].size;
> -            shadow_regions[j].qva =3D dev->regions[i].qva;
> -            shadow_regions[j].mmap_addr =3D dev->regions[i].mmap_addr;
> -            shadow_regions[j].mmap_offset =3D dev->regions[i].mmap_offse=
t;
> -            j++;
> -        } else {
> -            found =3D true;
> +    for (i =3D 0; i < dev->nregions; i++) {
> +        if (reg_equal(&dev->regions[i], msg_region)) {
>              VuDevRegion *r =3D &dev->regions[i];
>              void *m =3D (void *) (uintptr_t) r->mmap_addr;
> =20
>              if (m) {
>                  munmap(m, r->size + r->mmap_offset);
>              }
> +            break;
>          }
>      }
> =20
> -    if (found) {
> -        memcpy(dev->regions, shadow_regions,
> -               sizeof(VuDevRegion) * VHOST_USER_MAX_RAM_SLOTS);
> +    if (i < dev->nregions) {
> +        /*
> +         * Shift all affected entries by 1 to close the hole at index i =
and
> +         * zero out the last entry.
> +         */
> +        memmove(dev->regions + i, dev->regions + i + 1,
> +               sizeof(VuDevRegion) * (dev->nregions - i - 1));
> +        memset(dev->regions + dev->nregions - 1, 0,
> +               sizeof(VuDevRegion));
>          DPRINT("Successfully removed a region\n");
>          dev->nregions--;
>          vmsg_set_reply_u64(vmsg, 0);
>=20
>=20
>=20
> On a related note, I proposed in a RFC series to increase the memslot cou=
nt:
>=20
> https://lore.kernel.org/all/20211013103330.26869-1-david@redhat.com/T/#mb=
aa35cebb311e7ab9c029f9f99fb2ba41e993b9f
>

Thanks for pointing that out. I don't see any problem with bumping the
memslot count. I don't expect it will conflict with anything I'm doing
but will keep it in mind.

> --=20
> Thanks,
>=20
> David / dhildenb
> =

