Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B0583045
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:35:57 +0200 (CEST)
Received: from localhost ([::1]:37800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGkwt-0007fM-Q9
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oGkpu-0001zI-87; Wed, 27 Jul 2022 13:28:43 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:31614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oGkpr-0007JN-OF; Wed, 27 Jul 2022 13:28:41 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RFSr4W031513;
 Wed, 27 Jul 2022 10:28:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=WIGa2x0dBY4GojV2nrU7y0Uoa0qP1ReibHihFh677Rs=;
 b=nPOpV1/qHnCsmGIzhPKyXsZTxBDAStzHfHQmZrmPr9gPIYTujUrWHSSiGuwAH0V2ArPb
 7ft22hdSP/PCcOgl+k2MiNzp7RrxO9geIYiUAenXIGDpOAFcL/TY2jd/LDrLaL7/v7Ml
 1JSnupfgRS3hccXf+7Ykl1XofU/mXE3KCY1C/akEC/799fXI3NtBrU5iJSMziYM5gF8u
 YDGbRllJduCtk0iz0Hg+/hynQ+0xohy8UQztJi/Jw6rYsJ0hvRdmTkKdRLq1wwb91TRq
 u6nQrvOn4Jfoio7c2qsWybtUYJQHjea98frYe4o9WgDpsdI/CJeW6ZCoR491rMN+EHu+ VQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3hggh1t10h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 10:28:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYCpLD67UKi+M4jEg5VsaQ9Ca6AFwOVX1EgdZBoufe5XB8XleaXdxMZ90IwnVPObljH7PcW1q6g3vq4wSKFNaA0wyTX0+u2kvdxKsifq/B1HkVsKbmaEM2jPFYQexCvlINiK56a150gNw5yCttJKCG7aQ9kuOOAYjAyowlKbxIxr7ZAX7WEFFrit9tfGAQZf18tyUR/O22HM/arkNgGO8cz6MCFVLfv6F6kJNEeeXVc+jH51E4S35W0BdLX2DEVeus/qP/wQv2DMFMcSHC4xi7L5RAC1Aq0sLNzLYBO1Qomd1SB76LiuurTPJYIQ6GL9N07zmdwm774CHXuGnl0lMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIGa2x0dBY4GojV2nrU7y0Uoa0qP1ReibHihFh677Rs=;
 b=A3oNmc/+2RfI7vi0Sw1GzvsR/rYRkndJXkFE1A+8XwhiMxuKprVrLdaFTWxaIKa4Ju0efrDOjXa0fkw4+yiiODuCe0FBG0X1uEKie207VCloRnFmv8k/k1nMcmdHqwVbWwZ6ch7t2ScaE3Zycvc415ot8fyBVoxlnaBhYLfxPvA066apgAkWj/MK76b/cdH65UFV6DK4JMjRH/dvuoCkY8XNC3z6b1Te0zYcPDuyWvauyNOStOjWYbd/lWOycxb6ZpDr/c4o5mJZJuAwMeepsgmVQxFW/u8QuSiiFtgojxValRkQaPjglQlcw606NRMp4evViyW/+8xD/anUsmowoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by CH0PR02MB8165.namprd02.prod.outlook.com (2603:10b6:610:10a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 17:28:33 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::6c63:f572:60b4:ca7b]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::6c63:f572:60b4:ca7b%5]) with mapi id 15.20.5482.006; Wed, 27 Jul 2022
 17:28:33 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: Markus Armbruster <armbru@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
Thread-Topic: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
Thread-Index: AQHYjF67NA8c9Xl+IEuiwZXjN6LjG61o7dwAgAATvSyAJ+XGAIABvFKA
Date: Wed, 27 Jul 2022 17:28:33 +0000
Message-ID: <20220727172759.GA30765@raphael-debian-dev>
References: <20220630085219.1305519-1-armbru@redhat.com>
 <20220701043032.GA28338@raphael-debian-dev> <87wncx2xw4.fsf@pond.sub.org>
 <CAFEAcA993Z7ty7FvxEX7JjLZCFWrcPRuy2eMJKwoVTZJ1Z7_vQ@mail.gmail.com>
In-Reply-To: <CAFEAcA993Z7ty7FvxEX7JjLZCFWrcPRuy2eMJKwoVTZJ1Z7_vQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae671c1e-2303-4b8a-64ef-08da6ff56e5c
x-ms-traffictypediagnostic: CH0PR02MB8165:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HvY//s65Y0cindlWSGWYZZdS6Rz6jLlcIkzOEr9FS3aJcnQw67hpujOlisf27WtCKOQTQo92oqtTiK5J0BugMXBqf8AGNPf9tgoyp7GouB/6vQX/pKpGA6sZm8PyaPkS/4V7pn5MbkcsAUHMWRPRMfL9dVJq/GMVFdd9d1RDy3ZxmARnyN/jkoAxQVcD/UaGjZM+I/afjBcTRrOjDzmu0xMkIxDup0hq/oPp8AYepVVHQE/6JU1vzp2c5Veq4ddGzgHibvQ7mb7kl+8YNNfYZYCOLbV5Ufz6wyQQ1AUQcr8Z2/4Tt1/xxyDPqtRvDVZO90Hx4FF0n8z8yFjM4UiSSz2BhnsHadjs2AQ49vOceZGzCMBW8pK6rUu7YQbDJqV33zxnyH7AWkgzdxF0gVDo2Vxx3L+gn3aUfb9Yn8pkyAU0tlRPmjr0SuPyzKmgq5qLZEb9bKhg/TUH+sVrsiNsrw9HW+/L6pNv5y69qkYvQIY0xGFNJgrVTVYHD0f7VyKUV9g8/jyZD8RcS1xNm0pbN4tI5Fbmvaj9CxXZUnFZ3A/PppmUYlnpksKULoytnzkNclB/JuyLe8/q+r1x7M0hFSiQOpVvi3Ei3ZaP5ErTgREBHfMJGB/byhocbhKV9ZS7HGw+pYtnPc7h9UmB3IP67Agd6gLWakSYrP2S54LSv7wsNhmtng8de7ndgYUoby63hONQWWPCVOf3rgeKxYrK5HVFDfJWotSPrSlaW2H2F+ziyf/LteL0Qcen4MlRRCLxmNSApC6+lLCvqQT8wkjO30ZYdKGJ6hu67UqioOTu3TUM586IGeCPQqf2otoJLFma
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(6029001)(7916004)(366004)(346002)(396003)(376002)(136003)(39860400002)(122000001)(186003)(478600001)(1076003)(86362001)(41300700001)(316002)(38070700005)(38100700002)(5660300002)(6506007)(66446008)(6486002)(4326008)(66476007)(44832011)(8936002)(6916009)(6512007)(2906002)(9686003)(91956017)(54906003)(71200400001)(33656002)(26005)(64756008)(76116006)(33716001)(8676002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vNbcEs9aCSocWEk5cLqn0HHuwKJ0kq4dREFiO4PoAp6SqsgJm0fe4wKld/oy?=
 =?us-ascii?Q?XioqQqSBlWfRowiljuLL+LaYG6a3DJgQd+FZW4enTVxWWfZ80NpM/gMccHsG?=
 =?us-ascii?Q?iO3ut7tJ/AmYrP7QDlgD4a2rJ3TbZGWbc35FLF+Ihzy3+mlHK5hc0tTSG9AO?=
 =?us-ascii?Q?rK9mkF8ZzJxTxCs+B0X6RtnedrZWShz5bTWq0YaacqTSHN0IDqxQkZa6g4PB?=
 =?us-ascii?Q?mAYZCnSTT7dgCBjgMVZqAVlcuHXaPQmOLB9UlmRgpRk/qA31kKcbs1aFnPTN?=
 =?us-ascii?Q?NzG/Rb3WF6TrGfqi/SDXe0PKYSYiM3KwJxKxBx+e+NztezBNEU9CEkFmhrzI?=
 =?us-ascii?Q?rcR4eINWMKR+0PVScvQDWlz2E5XX7pKvD/NZVCqBsqe+8DOKZAzYql+uKaqe?=
 =?us-ascii?Q?Jz+aNuQTpo3MWaIZ2V4900BMknXZqRJm/iKltsqJhDz96NA/5jwT/60e2cAA?=
 =?us-ascii?Q?V3VqFnVy9TcLdwG+GZf0bGBS+Lm/8hVDiAudwEPllrlZHWIQI/Qa+/Eiw2Zr?=
 =?us-ascii?Q?kTW3GfByZg2RriNwp4ChScHO1gzK2BlQQ0UZq7I7w0yucrKVgFqrRhuzLECM?=
 =?us-ascii?Q?+ih0zORbaEz24IUgmgYO2FEU5MXeJNhwnGF4RrWI6wFaJDO4hYVR8MtyQAk4?=
 =?us-ascii?Q?FUB8972b6v8Sgsa+qWxMO6G4/mW3PTv96Va1FJYpadDZHXIbcHC0cYhnFTrz?=
 =?us-ascii?Q?4MxxMPfNKRqR4mSDbtCIAwHoOrQZowupCzT6XeNZSOJWtJDVoD+RwSJ3ZTp7?=
 =?us-ascii?Q?0SAbDFqRiS1e/OPALnFy201bqwGyUvDGzRyVZ5yEQOZJXeprAaDCv8RHTpbm?=
 =?us-ascii?Q?jgMzlh68u2nY73sjlJvqC4KdDxxB9HFrfs4RX57q9v5t05q37QFfjdxG7CEo?=
 =?us-ascii?Q?C6GSspzxEN3qBi+qt998W/WKPvZDYSR+8iPAPT2Q81OVByPRryPBJXhQXc9t?=
 =?us-ascii?Q?AuZ+PGsbQ922V6pYx7RmIW0KaYKAT0U1uzb6NhqViXXTl3uUWfTjoMT+ehOs?=
 =?us-ascii?Q?gFhSL9dy6PY1lrOJYzxtw98b9ligcAN4Hj4ORbNr5mkfhNrFD3xOMbxZjqNE?=
 =?us-ascii?Q?5cpFaAFtwBYBIwUPjsk34iannGg1Ne8UFA7dw5m1jgZfFA99Ven88IfFB2xW?=
 =?us-ascii?Q?ZyfxOVEhEPV23YHvuBAxmfN/izRHD72njRV12n8XWXXU8GS/y/7HMXmgd4oP?=
 =?us-ascii?Q?w9hwGUVZmMrgfXNyCNlA3nr7YK+37OrhcgRaw2anBwzweTrxyto/L1kxdB0J?=
 =?us-ascii?Q?FUeSco+AWVxq1IGVQJohiQ3tmZXMSieVqia6IDKrTgl3EwoYfB/4FjbKk8Wd?=
 =?us-ascii?Q?wv24bhOsCFPUlnLF+YLkgJIQH04rM57sAfwiVKpOsLM0gpFRzvqYW1q6oQj7?=
 =?us-ascii?Q?SoCjlI3H7EXROaVnRBMzaFAdegO94c0hH5GsL48QQdhgTil3wy5YJkgVEVLL?=
 =?us-ascii?Q?9lAtbtTzVqN38phmlDGaVS7W4gJFXVEh/Zn9wQs/mA6pCUdEkAWRZkjWzn6/?=
 =?us-ascii?Q?VyQwZB4a7JHbi9BCV9b94YPNcKdMcNJI3HLabEg7IiIlv0Z0j6DLMHszeJfL?=
 =?us-ascii?Q?Jh2/XT+UuRF3NCsl9u859j4AAIsvwU6CQ3qo7Jl995XS9on6pc3w2r7UBRek?=
 =?us-ascii?Q?rjX5upFbCo8bu7kJCEMuKn4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <946B5CA28147284F8FB374287E54AE14@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae671c1e-2303-4b8a-64ef-08da6ff56e5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 17:28:33.5097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1R+sLh4BBsWEWMdBT1ngvlRaHdCS9VT4BZrQCrSJo2N0SZloBZRG8v8XaSdID/nLXTSm30ldV8vZDQ0ScJQFn4HUU5de5VBj6x93QqC9I5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8165
X-Proofpoint-ORIG-GUID: bNcmLcZifvXs8VCKVjx1Vdrm3W8hF7jC
X-Proofpoint-GUID: bNcmLcZifvXs8VCKVjx1Vdrm3W8hF7jC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 26, 2022 at 03:57:42PM +0100, Peter Maydell wrote:
> On Fri, 1 Jul 2022 at 06:41, Markus Armbruster <armbru@redhat.com> wrote:
> > Could we use a contrib/README with an explanation what "contrib" means,
> > and how to build and use the stuff there?
>=20
> I would rather we got rid of contrib/ entirely. Our git repo
> should contain things we care about enough to really support
> and believe in, in which case they should be in top level
> directories matching what they are (eg tools/). If we don't
> believe in these things enough to really support them, then
> we should drop them, and let those who do care maintain them
> as out-of-tree tools if they like.
>

I can't speak for a lot of stuff in contrib/ but I find the vhost-user
backends like vhost-user-blk and vhost-user-scsi helpful for testing and
development. I would like to keep maintaining those two at least.

> subprojects/ is similarly vague.
>=20

Again, I can't say much for other stuff in subprojects/ but
libvhost-user is clearly important. Maybe we move libvhost-user to
another directroy and the libvhost-user based backends there too?

> thanks
> -- PMM=

