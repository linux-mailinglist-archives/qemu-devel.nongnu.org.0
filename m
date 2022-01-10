Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D09E48A065
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:46:02 +0100 (CET)
Received: from localhost ([::1]:51656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n70cD-0005v9-Bb
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:46:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n70ZW-0003Ay-Ky
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:43:14 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:19884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n70ZU-0000j5-If
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:43:14 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AD58xp028165;
 Mon, 10 Jan 2022 11:43:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=E+Q9y6kaX/9BV9uD/uTqNZaGRleRhR8Jh1sBQGGXFsE=;
 b=lEFSTeBZWcakdb9l4UBZx8jcpJ0iZ7wzXCOvzS3zoQ30fPjGz/cNu/kS74QMWdMl6WJ6
 SL32MzitsohzW3WEXbXTebIvNZ9cUkGOovf+jkNTc5RTMGYMDasmpDjxQdqlt6gGeP9b
 JbsrvYpj9xOvhko7zBoK3fWpqnLOjhVxN2i45lTI+E7Lm2txDFJ2PMBSY+yZ6b3l9JRk
 XNqV178OR9y9ydBYno3vORHBmiuAiitNXxgIJYmWPNWWMXi3YuYERwLAkXj9O76T5ZRi
 CS8gF/oEVY/9/Fp6Hn0Uhm/OGefvDuRW4s1dYaBNtDDkJG6wTEYMFQFwwa3Hm85MP468 8A== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3dg9rtst86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 11:43:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ml7i4/yMFNNNMvdfvDbBsJsSzHh6PgsEhPKKb2M/32u8zNz/iurYUkmpTGyTce3B5uWejKjHim78Pvpi2OSKbPfMYuAwdit9AD4hPYZLRCIkFvPn6gPLXu9diUnxBM0f8vWGaz8OjYep75RpnJDawP/1YyE9CVjQBvHKoJfOdYPpLMFmedlqHELMTlD5c7HKTS6jWTxBRte8o7IF+Txp4YQYyNl3YSZwfiiXBZ1cQFAGSdMdepSAz8OWEPUdAnMq6n+mSZ9igMcAidVsycmI0YFv5aSgWqXUj77i+NhaR4OM3i4kcnFV/+h0ASmoCHQWuZMvuPypx0sbRZabQPnLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+Q9y6kaX/9BV9uD/uTqNZaGRleRhR8Jh1sBQGGXFsE=;
 b=QbUHqsVxy7s/pgzL4gbOK1nb/yTvp1PQVZLWOyWJBXVRN85g2h/0kx9g2TkeDMKNBBQ4oTB0Z9uBW7PtBGKGgQIt7ucvb6jzevWmtRfRjz3uFJX35NkJoxxZ1k/i587TX/sHyWRoZLNjpB8O6ELp1R668i5R7W38gNEHj8dsZ9A9quCLdhFiEGOiydrywa6xLSWD5RtmSgY3dW/KXfKcSLNofcRzqnv7CwlJDRviMmYodTP5K4870lvFuK7e0Ijrod9rmi+e8dGcsJJ0DbHC6TiLBYm5h7MBdsx1sh8Np8oU4l5fOOQAT+4RO3iMzZ/Z3hseEAhtNa+kvWL1HoHnrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8233.namprd02.prod.outlook.com (2603:10b6:208:340::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 19:43:07 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 19:43:07 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/5] libvhost-user: Add vu_rem_mem_reg input validation
Thread-Topic: [PATCH v2 1/5] libvhost-user: Add vu_rem_mem_reg input validation
Thread-Index: AQHYAslEhQY8WRvwAEOt3/M7Uq9W0KxcBYoAgACpZ4A=
Date: Mon, 10 Jan 2022 19:43:06 +0000
Message-ID: <20220110194253.GA7751@raphael-debian-dev>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-2-raphael.norwitz@nutanix.com>
 <20220110043354-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220110043354-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94d79563-b487-4fef-808a-08d9d4716cbf
x-ms-traffictypediagnostic: BL3PR02MB8233:EE_
x-microsoft-antispam-prvs: <BL3PR02MB82330346D695AF3F251EAB18EA509@BL3PR02MB8233.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:597;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AvebRywWGnLzNf+3pC4i5pjDrYjjOHvJ+cWfozKAq4Qx81+vceRCKG+K8jAscJeCiOUHvTrI0yF/nJo3QtN3xlFjmDr2bNId//GrdH4sEoRWzG+hKZfVDl5H7V5v3j+KhI2Dr2cYtKkoE5uwGdd++oTCEcXSln/nus+wpEbWMrIW/8qe9JYS6kXjpYprOnD6oCxD3uhMNpYpVbpgaa3PkNio7dGKkDccy38RV4dA9yp/7KVFkhUYmmeiW8LE0Zs5kIRufu+drGN/N+v+8lXZ3ws3GtCU/k3uSKfYo1nGGoj9BkYYo2nV4KM1q1+6CeUDTLeEgtgVNtd1FIAtpwjNEduXlbM7E5VQC4nqZdWoH56U/W977NnBDjuM8eFfpAVL7ugj7okReryX+smC1M/8ON7rat35/nHCeynAaHmBLJ7KIPE1Wmprb/lfVDq3Y0Hl5sT5zT85kv/Uz3ZHdxqQ0W/puMPy4nK6WutZ5qvvdR5qe10na7VysVh4f+gsHbD5UQoMjMj6TKIV9Syiz30HCy9RuWRpxlPvumyOP5MKT4QbzT90CyAm8na+91Oddt/YGzLlGu7iNIIvtzZ4LFXpLNtY7dkyikOTuoWPwNSqmBbgddIAoqqk4AISoaJOfpf/7pigS5W2Ctyu9KdxSaE94dmpPZyUsnubKHUszgs7pSf9wLdKNADP08FaTA5G9l/lVZ5oBDithV8xOyHxT/RBOQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(54906003)(8936002)(6506007)(2906002)(6486002)(508600001)(26005)(186003)(38100700002)(33656002)(122000001)(5660300002)(71200400001)(6916009)(4326008)(8676002)(38070700005)(33716001)(44832011)(83380400001)(86362001)(66556008)(316002)(91956017)(66476007)(66946007)(76116006)(1076003)(6512007)(66446008)(9686003)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Bnp28Lmb7GYtOjieCWRnhjdyaTq9ceLBOP5EZg3m7mnQsADweq9QXYIAWnwz?=
 =?us-ascii?Q?V9bRk2kcqIGV44agzln9f/5E0LDUh8/kQo+AGu0+0+uGCgXZIIuSA1UloyOs?=
 =?us-ascii?Q?CIlx6zCWlYGZU8DY2t1wc+TEnVrJkY08N7mOvHdEkn81wzcrT0GpaWTYkSpJ?=
 =?us-ascii?Q?5CSuwYxk140yZ2RkyJ1tlNeVF0P3MCjHZP+2Lp9osw9G4Tv6imyB9ufmI5y7?=
 =?us-ascii?Q?p5uY/+/HgNzBeSqcntUpBKpq46S+X5SFs7bkOTjE0gwbPQ9Dj2hLizx0O5Wn?=
 =?us-ascii?Q?RAm79+Wdk4mv1TdEEIQ41vXB7kMWTWitB5Aow1cFYj3mpzOgzfAzigAa24qd?=
 =?us-ascii?Q?+8pBPJZ4qxDhLpfv9Pii4Jm4UVhKiGh4aYjk4Nkt7NgN0FC5BrA8VLEZQB5d?=
 =?us-ascii?Q?TnsvIgz4Q3D8Xaoy6YSOWN1X+SkuZq8rXvmIazrDJpOzPtBwG5AkUFWGwfaO?=
 =?us-ascii?Q?yVnKdtnaoe/ekEydTefhPSkUa/BMb+Ne8DKABg+/HwnGh+xCnhZ3eN9JOPlB?=
 =?us-ascii?Q?4/VXUc/LqGfuW9hMT8TV/bFS4WAYzlwlnVLCjdksyakAo8Cy2zMawrtOV2m7?=
 =?us-ascii?Q?Q4tGDfkbAfeCJtJFrUUq5XxNmAx+/PbTOfwsMW5R23qVH1kKIOfnNtoR7cWn?=
 =?us-ascii?Q?WmolfpMWmU+Nv+/zUBqHkwqYXPAGMlRO9quK4uuLSD6t1U57SG7f3rG8XwyC?=
 =?us-ascii?Q?wW6mjq+vJmk8i8mSGeadSTsGJzSghs2pPUPEs3namiogEbKhPR83wg8YKOBE?=
 =?us-ascii?Q?VBgSCBCNawV8vXTPyKXE4TgN+H0wYLaG/1Y79uiitbo1hCvQjcmL0r8VHqMB?=
 =?us-ascii?Q?5aFXMvyU/aBaTc0o+ChcoDUGnPl+VbMbMh71t/CtHLb4em2jc/AePQnRWJVk?=
 =?us-ascii?Q?CPuf+WVgyQNtmASCPfNnbtPH9+MeospYmHAaYW+DC7ee2hqhYBl/SsVF8L29?=
 =?us-ascii?Q?Tta6AhQ2uosCA5pvERmn/68LH00iBLHjfOYsl2KMxIQMFLuqt097pvhbK4pE?=
 =?us-ascii?Q?j2NH6ndIxKknKv4VzHTPbR3zo4rmRjCQVjpbqXCwU6OxS0s2GdU9lynutN69?=
 =?us-ascii?Q?bxh6iZ9bP/PO2Eiyj2D5YeLWxyOPubXR9XwPTo2VPO9uxndegIOZpDEtQEE7?=
 =?us-ascii?Q?XELb02BwTUhlOfz7ZZOEXbXtmNiak/CC6GLOgz9hhTKo1ZGTVjDoK7tYI9a9?=
 =?us-ascii?Q?6NvU4kqxiPaxahNxD1NqndFDbXzd8/tDJk7KK/pF8rEL4ylHx2oMpJNjU1Yx?=
 =?us-ascii?Q?0ZheLejdYgCUqkExRloiXMkAWWhDNa7ajsz36BKjF3R1t8BqhMn776Qd3SOB?=
 =?us-ascii?Q?9I7bpB5DpyGpMDo/lsa0eQfDBKWllaBeTqQpsgvsQHeFN5OclyICpu2WHtZH?=
 =?us-ascii?Q?rSPYZOFTn4da9DfXZJ8+VZ/2b4uraDDZ/hBHeMfjZbjSE/iLcFCoPKSlWq4X?=
 =?us-ascii?Q?KIH3p27T81byRG9pWOrm438eGH2NUIH5rYNXbcuMuUk9130GtXzxAwi+QmSK?=
 =?us-ascii?Q?J1ecLKN82Vj+WD56krpLMxVuD6Pwzi1ObNs42LtFHY9Gb0k+8ml/pYev3Tm2?=
 =?us-ascii?Q?XTHzyL1ubPLTEofjcE0qcTv7/KfBmcNjLYRjuOnnZFYFubr9wwsXLPwKxWyz?=
 =?us-ascii?Q?gCtXSXEZzAd23R0tCpy8wk4hFwXW0jBr8qnxCTD/ggkCOoZkziJy6oatKC4f?=
 =?us-ascii?Q?TY2eOOHXF4n5zBom3yL/5E0N9SU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A299B20EE479CB409C516972CB577D61@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d79563-b487-4fef-808a-08d9d4716cbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 19:43:06.9411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CxIf20u3vyz8Wy6lrF4vFubp1agMpnrin4z4qP6fl8uFIJ6VvMcQMWhTwvxWG020cho6UN18qtcxXX4xzX/cttsB7IIZxouz5NhhEk9F7BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8233
X-Proofpoint-ORIG-GUID: 0e-H_z883SNmUf3kmJdzwFTxhz_RQ_zI
X-Proofpoint-GUID: 0e-H_z883SNmUf3kmJdzwFTxhz_RQ_zI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_08,2022-01-10_02,2021-12-02_01
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

On Mon, Jan 10, 2022 at 04:36:34AM -0500, Michael S. Tsirkin wrote:
> On Thu, Jan 06, 2022 at 06:47:26AM +0000, Raphael Norwitz wrote:
> > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
>=20
>=20
> Raphael any chance you can add a bit more to commit logs?
> E.g. what happens right now if you pass more?
>

Sure - I'll add those details.

> > ---
> >  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/li=
bvhost-user/libvhost-user.c
> > index 787f4d2d4f..a6dadeb637 100644
> > --- a/subprojects/libvhost-user/libvhost-user.c
> > +++ b/subprojects/libvhost-user/libvhost-user.c
> > @@ -801,6 +801,12 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> >      VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] =3D {};
> >      VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_regi=
on =3D &m;
> > =20
> > +    if (vmsg->fd_num !=3D 1 ||
> > +        vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
>=20
> Is there a chance someone is sending larger messages and relying
> on libvhost-user to ignore padding?
>=20

Great point -  I didn't consider padding. I'll drop the vmsg->size check
here.

It looks like we are inconsistent with size checking. For example, in
vu_set_log_base_exec() we also check the size.

Should we make it consistent across the library or am I missing some
details about why the padding is not an issue in that case?

> > +        vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple region=
s");
>=20
> Maybe print the parameters that caused the issue?
>

Ack.

> > +        return false;
> > +    }
> > +
> >      DPRINT("Removing region:\n");
> >      DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
> >             msg_region->guest_phys_addr);
> > --=20
> > 2.20.1
> =

