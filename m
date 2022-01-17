Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DC449019B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 06:41:15 +0100 (CET)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9KlW-00064p-6H
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 00:41:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9KeX-0004zL-4X
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 00:34:01 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:61794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9KeU-0008Vh-Ki
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 00:34:00 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20H5KWAD019328;
 Sun, 16 Jan 2022 21:33:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=Fn2pCLTSuDvuCmDCw8OuygzwwFTH3AABoVuLSw70Buw=;
 b=TRciya2PaXKBQgay5+C1aOJ1tvNatFn7KZsBUIh745aurYsfX+y9i27OAwuCizAZEHfx
 Cy0AHX6trLtMz7SEAwjDkR9IsASgT91eoF+gbJxbLT1ACaufSUmtMQFwUeQ205GUbvX/
 hAAvwKsZzpgoiLpDDDG8uB7ZlPD1sn6BDQrPd9DkkS+3R27pOhtL9xAWps5YxczAoT97
 7GtMynRA/dGV/RhSViPSMguM+cvoFT60P4ca9r2vdO1qTCO8wjiQ2IdVGkE1sMrD2cQf
 SzYRNpTHl5gJ4k3hKovUDP3qJSRZAieLF743XEaSR5sya8e5dSsVDT+dFThpymDPQEiq Ig== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3dn27n80ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jan 2022 21:33:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+dXCI+dAQKOUjfoA4imfnKqIlsKj9KKN7m+52KO7M8ztbku7NBJ1NPHOdJNEJZ8YwwdrF8+MPulE+qXP0VH8FmLr7mByHvKoyHqFmhdFXvE93/zZ3K9SyuX8aKR950PfKY4H92YFNJlY2TLB1KV4SHUteEQxGSf0Ibf+FGKvi2f1R0y44TT3oPUICtLxTfYIE5ElhZ76mwghpJC12l61wczqnvh6C2rtEaqtzgrDFR8zvx9cFNIza0F6QrJvyUEZcBvd/m8ZDfwih3LH1jH+H/wqEu/8UxelqUPRF1Q8l/Npg1pJb0J63uHRRSIhXphLaM65+6WzKdk2UKLLiH/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn2pCLTSuDvuCmDCw8OuygzwwFTH3AABoVuLSw70Buw=;
 b=Y4NXi6Ser6+Z3nZbxRhpE308aemAxSzLzYg9uK7J3mmRFWEYgC6eYAcv+d26mH7JTrr1wjMsai905MFAm0l2UZra6TNgCbAL6OJEH0YSz2WvXZeMV2MJUF/yiAvGgjx7l0GemWOl+A9o5jeC3aysX0xhYr/FoatJD/w9A0vJhpnWHf6vWPt2cyVo3xaGgGHzJ7mEnq4yVBjjFTiiis6OSo3lfVAmuwwGqCSiQ7tV1v0BTFa8Eh4zCkdd2KWOiJ7xt5DXylPCGw6lR+u+lp9Glqn+cDYabqHeXSGAg24xtGsXjSrNDlMpfFYnfj187vhBGm/JuFtnsMYI32G2SC9wRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7947.namprd02.prod.outlook.com (2603:10b6:610:104::22)
 by DM6PR02MB4604.namprd02.prod.outlook.com (2603:10b6:5:28::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 05:19:33 +0000
Received: from CH0PR02MB7947.namprd02.prod.outlook.com
 ([fe80::fc55:a061:b476:335]) by CH0PR02MB7947.namprd02.prod.outlook.com
 ([fe80::fc55:a061:b476:335%3]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 05:19:27 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] libvhost-user: Map shared RAM with MAP_NORESERVE to
 support virtio-mem with hugetlb
Thread-Topic: [PATCH v1] libvhost-user: Map shared RAM with MAP_NORESERVE to
 support virtio-mem with hugetlb
Thread-Index: AQHYBuhv+fij+XlK80GlvH4if0E1lKxmtb4A
Date: Mon, 17 Jan 2022 05:19:27 +0000
Message-ID: <20220117051920.GA19940@raphael-debian-dev>
References: <20220111123939.132659-1-david@redhat.com>
In-Reply-To: <20220111123939.132659-1-david@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15e3bc13-88bd-4999-9b73-08d9d978eeb1
x-ms-traffictypediagnostic: DM6PR02MB4604:EE_
x-microsoft-antispam-prvs: <DM6PR02MB4604782208CD4E4DB6742AE9EA579@DM6PR02MB4604.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XMmwb/DZvoGfDKTDDBiLVlhCxS2VLdTbgfgxS4yk69tcz7ifclx3Zym6aqfWpahZONnDGsU1HUldV1xWxJgZ1G7WWKQxQLclEBAU1CAYmBNmvQ1iui5bf+A5AX58e4wl4BLnLZyNIXvqXuy/1sEaynuAqzkKJ78FWrrg3ULNhHYc4RDKs87BjunA1vAC003AtO2Olx0V8O/sCACFMfj0gnghyOLKIn20OQxH5/gSyvcdlOMszDV/me6BACLvNo9BYHNcqrpRl+Y+G3Q9KN4UTWbvFS4g/MTs+vtDYpVcVKqevuYlO3wxLsv3GqX7Wv6YkGa96T75Q5Iz1u1eumqYtioUhzBlyPdQTysV+Ql1QpM/TAKBFsh7MPQLFLqtDGkzFIRmQpduISKRLJGeEx4CHLRd1GBsq9xFWJEqAyG15O/+CYJjPLlzGI9Pd70VAZNRmSI3SyefEOkzOs8iVJcsbuorfC92b0n+YLW/TwYBKtYBqRxwAM7B2kol0yQ3y346eoTKNRnl0RbVYAwjSn3lptkrn4Gmf4b6oUEHWkTtu//Pc4zncVciuAuyrdtkBznCUEBdUOuzJIVsIixOUjWS9rOhtffOhj6X9rxLNV3Un8OgjoM0bkp+21NiDeXMk6uB2RTqQtt6LS/QA7WHVtSlRkqkCNNnrw0Gcy7/LrrONb856cUB+dWoOdmeG7sVwIxGUgwS3WePccUyn81J1K510g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7947.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(76116006)(66946007)(2906002)(4326008)(91956017)(5660300002)(66556008)(66476007)(66446008)(64756008)(71200400001)(122000001)(8676002)(44832011)(33656002)(1076003)(316002)(6486002)(6916009)(6506007)(6512007)(38100700002)(9686003)(33716001)(26005)(186003)(508600001)(8936002)(38070700005)(54906003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jV91Xk+BYZ4vG4kQZfX9y1RA/ackXtNVo1kA2D3LEWYtuzBoybSWRciZk7?=
 =?iso-8859-1?Q?RXrUogFcr8yNNVUvEPuJ8EWinYiFoDkFxTa9uBdRohzRUrRpTGzbRe2GM5?=
 =?iso-8859-1?Q?jao1eNDU2s1fCw09Ui8J085INat4Krk3opLvCSNs7UWu+UVZS2I6qMLp0w?=
 =?iso-8859-1?Q?neVCne7OjF3h4e4JP1NSuGTMe0HqWGCNuvyqm/rlHWzMosQQd8/d1f46Xo?=
 =?iso-8859-1?Q?ZJiidYY8p5iHrhX4wWch89N0gHu+cirdljh0HEHQx+dVqWmdTjfdP5C18K?=
 =?iso-8859-1?Q?pTW89P6H9KA6VutLlo/t7W/r6GceGPkyCaY9b1LrczA44bZHc9lN7w02vv?=
 =?iso-8859-1?Q?RNIbSQ6qAz3eUgkSwergXnwO7ISSqUwsZ0k8IrXLMRuJOBIrg4RN2M6aB6?=
 =?iso-8859-1?Q?Ld8Cqs/Bz1P/U1UFVqcPbM1g9NypgpjCWAjHHDGIOtoQEwGP8R20Rop9m8?=
 =?iso-8859-1?Q?tpURQh3mIEK6jDWvH3zGp/m+itUdGBKTFH2C1JRxUJW7SsIoviz/VCUdcC?=
 =?iso-8859-1?Q?imNnEQFlmjT9Cg26ruDuI+Y/bt1x2l3fxw/kRsITYZH939FKYiHM2n9H4o?=
 =?iso-8859-1?Q?ODV4JjaZFH5Qxj8gx00AAgyb4eSojgehStQlxJDDXa+5rk4KZwebPv+IXr?=
 =?iso-8859-1?Q?olLrkxFIvXFDgD3Z+xuhYZypPoxMRL2R1nj9QEzjMHAdGAKvdn8fjU+r9f?=
 =?iso-8859-1?Q?whruV9DPqjidkzGaIYLrNn/PBprVzVTNv+GbiT2ISb7hYCUQDeR6/u7XQ7?=
 =?iso-8859-1?Q?7nWRnKC1dpMyvQomxvBBy4EMxYHkqiy8BebydklZxpTbaetp0Dpy5tbPm+?=
 =?iso-8859-1?Q?kJDnY99Ebr+6zHCMa4SGerah7+Mv65Ey6lgDEQZegxjvU/zXphoC4yu38H?=
 =?iso-8859-1?Q?6ekUthh9le2SHesTVJZxgoRxDDyYW+f4shM3ffBODPDu16Vbh/cB1f6Ojf?=
 =?iso-8859-1?Q?L98Ax56j3klv3BBMqN1aJDdmXnKAszcCE4Sll0J3bR80BabhEq+dLofXYB?=
 =?iso-8859-1?Q?ymjdvX60ofw4yckNHeL4IXP4+gS332TQzx5K33xLxHtw6s0tqQ4PZfHtN9?=
 =?iso-8859-1?Q?IP48n8Xqj0sq+zDwh4MAARhv5anNfp9ZgMF5g6s5UBMOrR/nZhUb419gAU?=
 =?iso-8859-1?Q?6JXylBkKzbkCLtIgldX7MwjMNt8Sde1ql2vUuhmULQKZOPI0cuUhQhcMfA?=
 =?iso-8859-1?Q?YPWDWmZaeTgS+NCM44xJxhzvOIL/hOj2dK6zU3B8Tebc/5GCBbbRFYmvCx?=
 =?iso-8859-1?Q?0vrUYbeMjXSAy4BOymMON2o4CqdPfONqs4zmtXeUbISZTB+Jan1OU+M20J?=
 =?iso-8859-1?Q?VCCUdhFBAuM/4Fo5LX0MNtmgCrV1iBwaY/NBh1Tvh5TXc1gUh3vqBc8U3K?=
 =?iso-8859-1?Q?huWbwmaZ1EyXcXNfhqYWKp1Qd7IAlQXTR7xMxluJMh+RB6DBF8pmKD50f6?=
 =?iso-8859-1?Q?jGlBd66H2m+WPBsENddKkAQzRI6Bh7UMYqDMT2HEXsXLS23Qm1uGOf6GES?=
 =?iso-8859-1?Q?qAk3zlUWYlYA1esOMVSm0vDXwbiHEtfKsaxs6OwqdpbJ+3rh862II5UWIe?=
 =?iso-8859-1?Q?H+N6WPO7e9pYokpLeyGwqXAgflxLrSHG+sGzqKtDySxiFZcYWssrhQyGVy?=
 =?iso-8859-1?Q?Azsks8lG6U/aORxYGDJC+9/KmDp+eaYunoYjO4NY8c6iKBB/6Uj4S+bKCC?=
 =?iso-8859-1?Q?XJGbrDL7eGh/WRUdJo1vJ9qW0yDXXM5FFjqVDboR985xOk8CkkNDCyixZL?=
 =?iso-8859-1?Q?DWgSZOhewkcXhzci4vr400NOA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <68343CBCE0BAC743AE558F564272562C@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7947.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e3bc13-88bd-4999-9b73-08d9d978eeb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 05:19:27.1837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8eOKQcLRWsvCv80Hj4d/aVzchcx/zE0+FkhZlTk4qYgo0antDaa7q5/2P4aJ7lChdT+VTyyLSFiLxY1SREJD9MG7oIQkWQcAUumBoSYKpiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4604
X-OriginatorOrg: nutanix.com
X-Proofpoint-ORIG-GUID: 3jNY4YbCxrZ5Uye4FrAznfAr4-KDfpzL
X-Proofpoint-GUID: 3jNY4YbCxrZ5Uye4FrAznfAr4-KDfpzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_02,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: "Michael
 S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 01:39:39PM +0100, David Hildenbrand wrote:
> For fd-based shared memory, MAP_NORESERVE is only effective for hugetlb,
> otherwise it's ignored. Older Linux versions that didn't support
> reservation of huge pages ignored MAP_NORESERVE completely.
>=20
> The first client to mmap a hugetlb fd without MAP_NORESERVE will
> trigger reservation of huge pages for the whole mmapped range. There are
> two cases to consider:
>=20
> 1) QEMU mapped RAM without MAP_NORESERVE
>=20
> We're not dealing with a sparse mapping, huge pages for the whole range
> have already been reserved by QEMU. An additional mmap() without
> MAP_NORESERVE won't have any effect on the reservation.
>=20
> 2) QEMU mapped RAM with MAP_NORESERVE
>=20
> We're delaing with a sparse mapping, no huge pages should be reserved.
> Further mappings without MAP_NORESERVE should be avoided.
>=20
> For 1), it doesn't matter if we set MAP_NORESERVE or not, so we can
> simply set it. For 2), we'd be overriding QEMUs decision and trigger
> reservation of huge pages, which might just fail if there are not
> sufficient huge pages around. We must map with MAP_NORESERVE.
>=20
> This change is required to support virtio-mem with hugetlb: a
> virtio-mem device mapped into the guest physical memory corresponds to
> a sparse memory mapping and QEMU maps this memory with MAP_NORESERVE.
> Whenever memory in that sparse region will be accessed by the VM, QEMU
> populates huge pages for the affected range by preallocating memory
> and handling any preallocation errors gracefully.
>=20
> So let's map shared RAM with MAP_NORESERVE. As libvhost-user only
> supports Linux, there shouldn't be anything to take care of in regard of
> other OS support.
>=20
> Without this change, libvhost-user will fail mapping the region if there
> are currently not enough huge pages to perform the reservation:
>  fv_panic: libvhost-user: region mmap error: Cannot allocate memory
>=20
> Cc: "Marc-Andr=E9 Lureau" <marcandre.lureau@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index 787f4d2d4f..3b538930be 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -728,12 +728,12 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>           * accessing it before we userfault.
>           */
>          mmap_addr =3D mmap(0, dev_region->size + dev_region->mmap_offset=
,
> -                         PROT_NONE, MAP_SHARED,
> +                         PROT_NONE, MAP_SHARED | MAP_NORESERVE,
>                           vmsg->fds[0], 0);
>      } else {
>          mmap_addr =3D mmap(0, dev_region->size + dev_region->mmap_offset=
,
> -                         PROT_READ | PROT_WRITE, MAP_SHARED, vmsg->fds[0=
],
> -                         0);
> +                         PROT_READ | PROT_WRITE, MAP_SHARED | MAP_NORESE=
RVE,
> +                         vmsg->fds[0], 0);
>      }
> =20
>      if (mmap_addr =3D=3D MAP_FAILED) {
> @@ -878,7 +878,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserM=
sg *vmsg)
>           * accessing it before we userfault
>           */
>          mmap_addr =3D mmap(0, dev_region->size + dev_region->mmap_offset=
,
> -                         PROT_NONE, MAP_SHARED,
> +                         PROT_NONE, MAP_SHARED | MAP_NORESERVE,
>                           vmsg->fds[i], 0);
> =20
>          if (mmap_addr =3D=3D MAP_FAILED) {
> @@ -965,7 +965,7 @@ vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
>           * mapped address has to be page aligned, and we use huge
>           * pages.  */
>          mmap_addr =3D mmap(0, dev_region->size + dev_region->mmap_offset=
,
> -                         PROT_READ | PROT_WRITE, MAP_SHARED,
> +                         PROT_READ | PROT_WRITE, MAP_SHARED | MAP_NORESE=
RVE,
>                           vmsg->fds[i], 0);
> =20
>          if (mmap_addr =3D=3D MAP_FAILED) {

Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>=

