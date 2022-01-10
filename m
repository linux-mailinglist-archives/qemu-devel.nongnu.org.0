Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9648A313
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:41:22 +0100 (CET)
Received: from localhost ([::1]:55400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73Lt-0000T8-DR
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:41:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n73Iv-0007Bj-Hl
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:38:17 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:36886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n73It-0001A9-NH
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:38:17 -0500
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AFiIPg023729;
 Mon, 10 Jan 2022 14:38:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=hC/0vLXHmqdTVPQql08iWXhJ7P4mU1qKHXpPSd1UOlE=;
 b=KkzSUbBLHlfrSfrfJI3LExsBCELpEnE7f9y9vfpH3/RuxzccEK0uIIueQ6JehSmC0x7W
 0WoEKixz8HFu+l1GhmLMgS/8jVMoOd4eexn6c2xrt9sFVxZbWH8w/4fsW8+P3inVJkdy
 gu1muaXWb6RoCFAiJy5btuOSwfG1zpHUlpTsXJP3R56LsQnRLF/KD0HC39wvtuyVCn5m
 DP0y4EMh/Yr9bp8GKnYUnDzYLFkZOn/3tONNxD/aCI7TqytkxJcjooE/tn3iACKm+w+b
 ZD/Q5w3GzEW9+y6JNY7iFytu2eYyRtMdj1uId6/9yj/ls5ro2JsmWf+7iPeVec43mmwG RA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3dggq09jf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 14:38:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xcy++zT/JLIUFjHIz5T/oEl5pvadWE1b65FJWBc5JBQaLdNsc1jBnb5nTt1NCaLNj7NPpR4Hwf4nLlONC+HZbdYvghk8vPYMu43+HBFVydq57T+ra8Fo1/5D5x2oFNxoeC66PGDxqx7wuEEgZ2wt3iQxLtTT3dctdPpZQeWBctp/GQ1QcdRueG0rm+3KbhFAAda1XYaexRDJJSGKmWHpnfH7EDRPyJxHIpuyutBXYPHSNWM3dFIzt4jW/ZYePcV16m6h4MtzeMZxPPx0uBG1CdmK0nGYTB/hMse00eb6ywKib1B5dzLhPvsvXMBa2CRnUpJhPfKOj2NyQdBkPyOYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hC/0vLXHmqdTVPQql08iWXhJ7P4mU1qKHXpPSd1UOlE=;
 b=YFnbRPKmYtGM1HZz8F440EahTwXNQBbBBc3gz5XsFNDP6l04ZVqIlzXzRspIyddWiiPp3GwD7YZJILjIpgCcXBxFpTSu4bb62mXw8Z2hObf36ZOs3d19Wb/UJtia2KQm5WRJ3PWf0PPCNZTMcQYoUWaCFfb0PTdzRllDTrBrvzJlGDc41vAAb0CHDxoDvbLnU2oRO1JLhv4ajbDaT5YgOvsY8XAyrVK9DxaMRW8PExDxeE+hrvI/silmgeA6OARwgGMVnhFOWKQyd916FvM0w164OgAsFheDKJMqvlZI/sCuBpR/MBvyq98ul2YdIUGTrlTwLsBCZQ5v2MupGUeUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB5508.namprd02.prod.outlook.com (2603:10b6:208:84::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 22:38:12 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:38:12 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/5] libvhost-user: prevent over-running max RAM slots
Thread-Topic: [PATCH v2 4/5] libvhost-user: prevent over-running max RAM slots
Thread-Index: AQHYAslJrasaFPyjv0K0XNFW9OKltaxcBokAgADZYoA=
Date: Mon, 10 Jan 2022 22:38:12 +0000
Message-ID: <20220110223811.GB7976@raphael-debian-dev>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-5-raphael.norwitz@nutanix.com>
 <20220110043727-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220110043727-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f8c784f-6031-4278-733b-08d9d489e24e
x-ms-traffictypediagnostic: BL0PR02MB5508:EE_
x-microsoft-antispam-prvs: <BL0PR02MB55083CECFF3DA20FA6F33373EA509@BL0PR02MB5508.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ye7KDTZkYt3MWgsEQAJy86LTVDBdg5Hww9v+io4NQMdysJZ80hgFzbGG5hT/bIopwSMqb/q5CwNs+yTQIogcuwyGQtQmbcdcHG0Ntm7HsXxm7rke10q23xC3TsACLNSyR/D+dyEiR4K6UYjjVc7tm5b0FBzjmNRw5DdTZIrnGs/6FVzUL/pxxU6hhbiGJ58Y+3RbmdJm02nVZcUp7XDsiaPu/YonF+19sa6kqZiY6f5Q+ab1+2pDqTapj7yONrSBtkKYRBn2Op3wifrtAK9wLO9Fmop53C95l1d5NLVw652+Yk3h9bgHxgQD4VvqWV5CvCgTg2Xb2DKwiZ6ub1aDhXnnIkmDja9Y4jSfM6hMlkz6NJ02dqeiuOvuE8JNrboRkHt4x8u0oMW4E58bC+TcJWHzlV1+Zkn72SD6C7y8hFpc2b4WlgvmBTXFcuh1JDd8sT0I4TrR6GE0ePzLpeRBYH+SYY8mkJVUoAP+bkEq7/KfaIf1zAiyyGL2Ew2Z892m2pNF0KNvJ/kT5FerRtgYDekIzXfiD7/5M/EAhEhxQBdI0Vvc8yl5ZNW1XqIyrGGx+1AhcgxK2FdXpTL/t/1KIlXBceCNBXuBK1deYMFUTxg7bZfIGy19eVxSAVt2AkMwSRTx9+or/fL/+b7i+GLBZ0Fwvu00RDv4aF7enEfiE+aM6iu0Pvpgcgmwb1KNNVV8wHsTVGoj8kTq7S8jewxRgA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(5660300002)(6512007)(508600001)(9686003)(122000001)(26005)(33716001)(38100700002)(38070700005)(44832011)(186003)(54906003)(83380400001)(6486002)(33656002)(71200400001)(91956017)(4326008)(316002)(8936002)(76116006)(1076003)(6916009)(8676002)(2906002)(64756008)(66946007)(66556008)(66446008)(66476007)(86362001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T83pYKvcGKfcdqTbp+EWbWePrb2uDPxB5A6+ztzaqQ972q2NF4MxlwMZrLOO?=
 =?us-ascii?Q?2CwgEHarkglEy6qZjvxXLDHtr6uM4mc28qa9u3INVzjXsgAOktMibZPmAtqr?=
 =?us-ascii?Q?J/1AYLB7UMnhFknsLpO8GEerbuQMzzhqr/K4hXK23ZkowDsOqQ6OslixsssC?=
 =?us-ascii?Q?ftQ0rDug2zusudmDDyPf/o1y3QFC3E6lkMPyVG8yqjottn8R8Invfs9Kv5HW?=
 =?us-ascii?Q?AdH5zXMcgvP9+dKyXQPx7phOL5SnqtMgzsGQCWDD9rbekOUxP9lCMpE8tx7q?=
 =?us-ascii?Q?b3ml7aqflXo4qI7PDI7hRW5jqTtRpe3zeKuNe7UCpfQ1trdKi9upUjSuYQdl?=
 =?us-ascii?Q?ebARhYLNUb4S95v9AjUOnJotevN2Cowc99UyGFs2XFwiGOr2wSSuqd6SetiT?=
 =?us-ascii?Q?XNFuXQulC/cTBJyd5vwsS4fNJS8LpzTg2//IhkH05Vrzm1Ssv7cE5Mr4bXMe?=
 =?us-ascii?Q?TaPQe7mNjJ+1MeFsz/C4It1qpV9lP8LzxL3hE+EmHpuXVPVWJnr7ZdR2FQvE?=
 =?us-ascii?Q?SdnmYRC62dicbP1tTp9MbUHxDD1nmv2E2epUn9ChVKxGSwU+O7dLZ6sAZpH+?=
 =?us-ascii?Q?1DB1OcdKfW284UizYD3WK4xxS1luyFfI1lbjNVn04RkrmVLoB7tR6yVyodBd?=
 =?us-ascii?Q?bRijDCVFsN7oHT8taTM6QlUESUfyPCuc8pHmkJKy6WW/3Jzfp2qVQa24wCUi?=
 =?us-ascii?Q?sZP2fJmBc9AF1Z8rYtA4ZlduQ5TjmEcCPbWTxIGIPISfksjeR+9na4KmKO6E?=
 =?us-ascii?Q?uBN6/0zQDkau3I2vwIBMQX3delAFK0rdWZ6MvUFmj/Kc0GfGUjHdAFnb9/Ct?=
 =?us-ascii?Q?ySriOfVUzcaQopKRpktqpjCpRZx3OgWzTJNY1hpdBY5qXdaW9mV/YJ6vVEt8?=
 =?us-ascii?Q?3L/7VBKbw3PrMkk2fvc8l/vOM+jXPmW+EE0hywy359FFDFHmf4FeLKc1eXva?=
 =?us-ascii?Q?LcAYW+7vBDa7SA5HT+9uL8Q2/GgnmLxC/Vq7TWb6RRllVn5hW0uYFXdybcfB?=
 =?us-ascii?Q?xo9Q3jjDUlDvCJz2avsXOaMdVo9virN4IdgpJtzPqeErWmbtoXwPjUH7KxSD?=
 =?us-ascii?Q?FVFFvjgZCPNSqg8Maz8TsfcMojNzu6X6sxZ+ZNI05pMoRC+D2Z6G4N5kcxwB?=
 =?us-ascii?Q?D3/FKabZIBHkXR5dbakQWVaiP1LjXQCZHkipN82YbaNdaC3D0BtHNVK1Tjmh?=
 =?us-ascii?Q?+jrR3W5wtxz4fVCt4yzGnKOl9gk1bhryxqwXuC4myzv6Bl/FYkeK+Xh1GRsv?=
 =?us-ascii?Q?Z0HcGLlXhsHlgeEP5m4y2WucpQWFC4wNXpS2ZmtLlWmsUCtyduxFPcnc/tHi?=
 =?us-ascii?Q?VNamreTmP37uhSvVU9+F30ifFyeB2t7AWLkKmmq/Q4NTjsv/IyKiddaflJG+?=
 =?us-ascii?Q?Osfejh63mAgDvfozvGju3o1T7G5iPmmxWxTANorrNWB314t2yGbVuKp6pSdn?=
 =?us-ascii?Q?cdnv6fwmbJAfS5+n/AsYE32orQ0q0e3BIm8mJWCbnuXU84m/SkZd5Md578OJ?=
 =?us-ascii?Q?Tm6D8UG9Y4HqMtCfxNrcenWHgiKtMAQqp74SStwbdSFDFxYB97QyPskDhqTd?=
 =?us-ascii?Q?ZlWhqh3iDqrktvWpurtQzq1wbk/ofvNg8WsswyDoPLiE5GUErRuUWG/adnxV?=
 =?us-ascii?Q?Ccg89utyD3rxhRc8gZv6S1Ky/wDUkdzSSkApWv8ax4V4OUKHGHlFaPtPuKXk?=
 =?us-ascii?Q?5Ub1XpB5H24aYN48C99bcb9KNXc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B340FA0E3ACE6047B919B2A5F09D5993@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8c784f-6031-4278-733b-08d9d489e24e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 22:38:12.1723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BGyP4LgvqIzjKyailDm4fwP4N5C5XJk7eALGhJjfAaNaTalWE9XJjDHRKBCs1jYM8KQV5u2xZsl7CXi12uynlDsVL7sLlASBla3q8DQYhpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5508
X-Proofpoint-GUID: k3hCqtaIHv-Og6fRfyUr-WKRRSq5cwyi
X-Proofpoint-ORIG-GUID: k3hCqtaIHv-Og6fRfyUr-WKRRSq5cwyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_10,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 04:40:08AM -0500, Michael S. Tsirkin wrote:
> On Thu, Jan 06, 2022 at 06:47:35AM +0000, Raphael Norwitz wrote:
> > When VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS support was added to
> > libvhost-user, no guardrails were added to protect against QEMU
> > attempting to hot-add too many RAM slots to a VM with a libvhost-user
> > based backed attached.
> >=20
> > This change adds the missing error handling by introducing a check on
> > the number of RAM slots the device has available before proceeding to
> > process the VHOST_USER_ADD_MEM_REG message.
> >=20
> > Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > ---
> >  subprojects/libvhost-user/libvhost-user.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/li=
bvhost-user/libvhost-user.c
> > index 77ddc96ddf..0fe3aa155b 100644
> > --- a/subprojects/libvhost-user/libvhost-user.c
> > +++ b/subprojects/libvhost-user/libvhost-user.c
> > @@ -690,6 +690,11 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> >      VuDevRegion *dev_region =3D &dev->regions[dev->nregions];
> >      void *mmap_addr;
> > =20
> > +    if (dev->nregions =3D=3D VHOST_USER_MAX_RAM_SLOTS) {
> > +        vu_panic(dev, "No free ram slots available");
>=20
> A bit more verbose maybe? Describe what happened to trigger this?
> e.g. adding a region with no free ram slots?
>

Ack

> > +        return false;
> > +    }
> > +
> >      if (vmsg->fd_num !=3D 1 ||
> >          vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
> >          vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple region=
s");
> > --=20
> > 2.20.1
> =

