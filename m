Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9780538A90
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 06:31:29 +0200 (CEST)
Received: from localhost ([::1]:42348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvtXU-0003rD-Fl
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 00:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nvtVX-00032Z-J6
 for qemu-devel@nongnu.org; Tue, 31 May 2022 00:29:29 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:4512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nvtVT-00069F-Qv
 for qemu-devel@nongnu.org; Tue, 31 May 2022 00:29:25 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24V2tLku030285;
 Mon, 30 May 2022 21:29:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=rewdtj4eMHNFoUlBg1raIhkI/+t0WFQ1NNIDmuXivE8=;
 b=fPsRXed61lZ3TS/R+tk0/VrSqRcO+29G77RTXja+qcef7H9vo8S5smebSyJKW0xDqaoK
 ltiOYzmrF6SG2TvlFrqn8azKzt9KILgEsmbuIM4iB8RCb20YO3nrsxzHC46s+15yJWWw
 BnBjqzkDMNlZwyCRm6kqpCvKu2XguD6NlmL/cR5P32uFLa6ElekWSv4LsroMJ4EuD0C6
 OQfx1m+oX9otCbEJPVdKzcv8zXnPbqY/qTf/sGM+cZC0VuehxcDfVhAIuyEQi4BgEsf6
 LEUWapUupJoM+THJZ9H10v/4OPneL9dwsbbSOpR+n4/OD6nCSPf/iLZ6yjtsLltj5w6o hA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3gbjtev81x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 May 2022 21:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASSirnycU0AAMUU5rV2LAFi2XXF6+rThyHR7oiUt5vfo97BXPo2SiKIE0+XbrishFNJKHsZ5416QfulUMi8paimWPyE7MywuAugWs53iUYuUjjCmpSIY2K/tkGuCcyMLCtg7oQ9NDDNyf+lFbe24LoJcbSJ2V5bd9VwNlPkucVynaKqvVl8TdMmbEoAuXxF2gmILhUceI8WNUxjujUfXgyc0NMT0bVObkzZJWUExa2uzb6IxhX5pWDm/AVUwsKc2r1ZiC/5P29WrhtCpV2I+cbnaeIkVlxH9+SGkNswt/NucEAyk2V6293Av9ugFXV0jWG4pjqZx0XlE6xuczYji3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rewdtj4eMHNFoUlBg1raIhkI/+t0WFQ1NNIDmuXivE8=;
 b=aPjD+f2a5XU2QBiwzgyJZqGNH8NZs8w3mwcVtAqhQMm3mrhfaDZi8sO01tUySaR2fFp9H27fF46cAJvMqDMablFEZWzzxxvh2Nf60E2ymgYITzeUPXFuX+i6bDdSPI6+XZ2Gc0c/VJx7TrSJkq9EPNUsze36Ldbnm/JKI/YMusOZIGhC7neyG7ilPyzdn3cSXpK58/jV/quKmN0jO0KKZ3hooQ1aEOrK81RXFOUeFFyBgboqJHFgqOi9DNb4g3IB+40QeffFJiKoDorKQZ47RjZjV0wVQ53cQT/wjq6sIvMUpjfgGmBxTX46NWP5OPvq/M6KWQ5b+325uaVzGfGNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by SN6PR02MB3934.namprd02.prod.outlook.com (2603:10b6:805:2c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Tue, 31 May
 2022 04:29:16 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e%9]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 04:29:16 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "slp@redhat.com"
 <slp@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "mathieu.poirier@linaro.org"
 <mathieu.poirier@linaro.org>, "viresh.kumar@linaro.org"
 <viresh.kumar@linaro.org>, Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH  v2 01/15] contrib/vhost-user-blk: fix 32 bit build and
 enable
Thread-Topic: [PATCH  v2 01/15] contrib/vhost-user-blk: fix 32 bit build and
 enable
Thread-Index: AQHYb4SvEqSEFQChw0yNXIoTE7iK7q04buyA
Date: Tue, 31 May 2022 04:29:16 +0000
Message-ID: <20220531042913.GB8262@raphael-debian-dev>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <20220524154056.2896913-2-alex.bennee@linaro.org>
In-Reply-To: <20220524154056.2896913-2-alex.bennee@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dee54dec-1225-4b80-103c-08da42be1f60
x-ms-traffictypediagnostic: SN6PR02MB3934:EE_
x-microsoft-antispam-prvs: <SN6PR02MB393414E332B0530716806EF3EADC9@SN6PR02MB3934.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5x8RPYKtD/n9GBTofX5dUibcswkc3e8vaWLvLDZWgwCVzL6GsjOcxrmFeMnwbrM8SNQpKQ+t2Wh/BLof4TaBt8oNgxa7EJLiFiTxc+UV575NDFqTRhAf77pGdOs1L8emLTVQpyEpd4X4QVLb7U7G8g+t/3uxT1FEOlNmSklXXlUIVV2HK71+ATf1zqjKMV/dGlQ3RUdS2vhZbQoqNLYay84h9+LfkZghH2xypZllNm8tqXkq/oHs9u9zzbK1sTsFTi0JoqtA6v1eh2gy5v6wCd957mwkjwevEYmAWTHrcVcLF3tmzsq0Zqi8nM6Q9vSzKcRHolh/mzk6uIsdbaopsy7jT3UnjXisObfb4a3Xs9KxqfUC40oQvjxsVcSWfE9d4jl2o8+W5Mzc0tURcEipVkyQKoR/zg+OzZi8GysRdd84ev7XQGsReP/j7fviVtXEkkxAwryKQ3SXr/wycTDTPaANmQmFN1CcbDhYs6Zcyay0mxrmdSm0cY0DdptMo3yz4C+4T0LzLRVUSU76hbQ7qTOOPpB7gksPsBZyX2qBU0ZJUC5AmTb5z/5RAw9IRVbZp26RhaA73iP0cI3fvKO9ejTXCR0FfF3yYAGo+SGTIyIEcVzdTaZun525xc7zid5RGhzlex+H5ARMVhMq+WN93Kzow/uBfOPVQz9kK7CRYrD3VBgJmPK6UFVpZK2/YOfTQj/ZVEOSlnxIiyP3LNNFgg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(91956017)(316002)(6916009)(54906003)(66556008)(66476007)(83380400001)(64756008)(71200400001)(66446008)(8676002)(38100700002)(66946007)(66574015)(76116006)(33716001)(4326008)(1076003)(508600001)(44832011)(186003)(107886003)(6486002)(86362001)(8936002)(26005)(6512007)(9686003)(5660300002)(38070700005)(122000001)(2906002)(33656002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Yy5hUpoarOAFnAEV4aaVJsIGxxBna9m9+TChRxexpM2FoPkZnswLDmQ+PH?=
 =?iso-8859-1?Q?8CSz6pIN46AMDMQX0bCP6IQVTRA4CNUDZZjMADTkHTGRervwDh77GUkcIK?=
 =?iso-8859-1?Q?ekYi0jmy21ojNeofU3Q8hMjH2YVSgIhxUl498EEzAt6cSiYGQK9ExCWV04?=
 =?iso-8859-1?Q?c8/vXD9/2tv/9Gdp4kX+dLJT0IQR55cAq9xn15OsuQNu4JiCG3oOWmimV7?=
 =?iso-8859-1?Q?OHSPVKkj5YaMuMEIq3lIPhj4GWUaKXQgi4G3D1zaSQcDJvOSxSzFGEybxv?=
 =?iso-8859-1?Q?UwXgLfuW14+7O43FJUgKudJUF5wtFnApI6YyLk2l6dFL+/GeksSdbPZzas?=
 =?iso-8859-1?Q?kaGyjvpgSPirE3RT4GCSfIEM2WAq1hrJB1iJW2yt7B1Wno0fISCYPcVMdW?=
 =?iso-8859-1?Q?4keEILCfvDwcNpx0tmTUj6VOL8/Ps4IUtFdNf6iM6dCOI48bu2oqWWHV5R?=
 =?iso-8859-1?Q?4o/3JbkgvJnHNLMvhN8fvRpyzy8B7I4DjeTyXHuqnfskdxZT5PImsea/Mo?=
 =?iso-8859-1?Q?zXJqXDEu49o4BfXQTJFsuimysgZKWgE+3ODEIVgROZq2piDWdcBcSjOwNd?=
 =?iso-8859-1?Q?5Ex+eg2yrCG6Rk8snQlyiWItTufeUETdImayZzvRM0iMhOj5dF2ME9/HvC?=
 =?iso-8859-1?Q?hAy/Ma7PTYetzF4DFJiazgsqsph3plkauE7BBJnCRyjMXEdBtFX6XVd7zz?=
 =?iso-8859-1?Q?OaLDXPpKUC9uFXXVV9ltFdNkWL1iHrPLmEb50grGgzKdtujS8MFh3nX3Mg?=
 =?iso-8859-1?Q?OGn0xKfps2qEYEEwmU39la4cQoKjN47RbKcliilFIkTKS5gDaENH3qZHbI?=
 =?iso-8859-1?Q?UBjpPeOdew7lYrOjQJBsMYEhVGSvrGe3C5HGNEjbmGkLoPC07r6jR3Tkh7?=
 =?iso-8859-1?Q?LwQGQbdhHKcz8eygoJGIYGGnkGqITTdgMssvcILxEBm9k4IDsxmJWL8St9?=
 =?iso-8859-1?Q?YVmOO25k/lTZZoknAJprNYHcXNqwyaiOf2LN43WAd6N9+fZL+vyZPDPWy/?=
 =?iso-8859-1?Q?WWvp0dW8pXDUwfBe3dhj9rYpCNRPVivHytEYTPsK58QD01HgYutwaTpIrF?=
 =?iso-8859-1?Q?TsNrBnbG4HKd0SwdB414nxn2+Z8cF+gxssqZIbwybLyj4+L6LHlGADwrd9?=
 =?iso-8859-1?Q?s+X6Folw61R+z3+idPruG636rg/9MqAGQcCfV5lA6UXrHX+MOUdXrZgyiu?=
 =?iso-8859-1?Q?ymwGnAhlQP+M4Na/YtQsPPlHMtCmdaDPPPDp8I0KOGClrWX/k9LObmWOQG?=
 =?iso-8859-1?Q?+k+yU/UthXdmUGPPQFVFiZrLN3YSmG7jrlfB3EqRxxUK62mtnwOI7euiUh?=
 =?iso-8859-1?Q?kTQX2W6wbGt+5vfwAfEZ1n8KDp2vn2xf8fQubi/FrD6Qd9IOGu7wzxG74W?=
 =?iso-8859-1?Q?Ez0iKeEabPJeMsY/9b3sMh0tvhBO9r1pSpPgkOjszlYs+fe0ghTgmR1j7l?=
 =?iso-8859-1?Q?czu6cs0fWayGw2sufsrtOoodSbyz72YhErrZ04KAck/nracYVoWXfoFKoy?=
 =?iso-8859-1?Q?0+V7bqV4FROFeLJR7fb4wVCtsCPah8maig2yGiHSN/11QJHgArmuqn57rC?=
 =?iso-8859-1?Q?+vjWZ94TfNQOHcXDgoLQiNmoUwELPuL1D6+GDjBSbmP75L12NqvEM+mRrH?=
 =?iso-8859-1?Q?CixvBY8Iy2ESsiBhUFKqRKkOIXOaK+cNmpLcVOxbvShr6f3nwBcFTUQU8k?=
 =?iso-8859-1?Q?lUMCqvhXGHc3ZO9cvLSdV7nJ2yPwbr6KnbLyTU5OFOkby5zbzBO7jMWe9T?=
 =?iso-8859-1?Q?c+Pj9OzMnkxuU1im3pzzjfovPxK3Ojd5xyHzbF0ylkc/wbt6N+fnsrRJ7v?=
 =?iso-8859-1?Q?TKSew5htBs5A+aOkQ6LyL6dMnAsOp6QaM2QCgysXvyuZoimdlXKZ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0D8623350717FA438954560909AE9DFA@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee54dec-1225-4b80-103c-08da42be1f60
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 04:29:16.3486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lRM6AieABumjnPOpXqvYz4mDQ3pufl7cO3BOfujL8ScEak0Jd4/UhRnj2oPZmxAevQdKKoRNW8i+PIgCVez2TR6bT5E4koj/KMd0gfKgj9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB3934
X-Proofpoint-ORIG-GUID: VwIv9yD8S9rc8KjPSa90iMtqgTDIvAHs
X-Proofpoint-GUID: VwIv9yD8S9rc8KjPSa90iMtqgTDIvAHs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-31_01,2022-05-30_03,2022-02-23_01
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 24, 2022 at 04:40:42PM +0100, Alex Benn=E9e wrote:
> We were not building the vhost-user-blk server due to 32 bit
> compilation problems. The problem was due to format string types so
> fix that and then enable the build. Tweak the rule to follow the same
> rules as other vhost-user daemons.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Message-Id: <20220321153037.3622127-12-alex.bennee@linaro.org>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  meson.build                             | 2 +-
>  contrib/vhost-user-blk/vhost-user-blk.c | 6 +++---
>  contrib/vhost-user-blk/meson.build      | 3 +--
>  3 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/meson.build b/meson.build
> index 9ebc00f032..a33ed52b7a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1489,7 +1489,7 @@ have_vhost_user_blk_server =3D get_option('vhost_us=
er_blk_server') \
>             error_message: 'vhost_user_blk_server requires linux') \
>    .require(have_vhost_user,
>             error_message: 'vhost_user_blk_server requires vhost-user sup=
port') \
> -  .disable_auto_if(not have_system) \
> +  .disable_auto_if(not have_tools and not have_system) \
>    .allowed()
> =20
>  if get_option('fuse').disabled() and get_option('fuse_lseek').enabled()
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user=
-blk/vhost-user-blk.c
> index cd4a5d7335..9cb78ca1d0 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -146,7 +146,7 @@ vub_readv(VubReq *req, struct iovec *iov, uint32_t io=
vcnt)
>      req->size =3D vub_iov_size(iov, iovcnt);
>      rc =3D preadv(vdev_blk->blk_fd, iov, iovcnt, req->sector_num * 512);
>      if (rc < 0) {
> -        fprintf(stderr, "%s, Sector %"PRIu64", Size %lu failed with %s\n=
",
> +        fprintf(stderr, "%s, Sector %"PRIu64", Size %zu failed with %s\n=
",
>                  vdev_blk->blk_name, req->sector_num, req->size,
>                  strerror(errno));
>          return -1;
> @@ -169,7 +169,7 @@ vub_writev(VubReq *req, struct iovec *iov, uint32_t i=
ovcnt)
>      req->size =3D vub_iov_size(iov, iovcnt);
>      rc =3D pwritev(vdev_blk->blk_fd, iov, iovcnt, req->sector_num * 512)=
;
>      if (rc < 0) {
> -        fprintf(stderr, "%s, Sector %"PRIu64", Size %lu failed with %s\n=
",
> +        fprintf(stderr, "%s, Sector %"PRIu64", Size %zu failed with %s\n=
",
>                  vdev_blk->blk_name, req->sector_num, req->size,
>                  strerror(errno));
>          return -1;
> @@ -188,7 +188,7 @@ vub_discard_write_zeroes(VubReq *req, struct iovec *i=
ov, uint32_t iovcnt,
> =20
>      size =3D vub_iov_size(iov, iovcnt);
>      if (size !=3D sizeof(*desc)) {
> -        fprintf(stderr, "Invalid size %ld, expect %ld\n", size, sizeof(*=
desc));
> +        fprintf(stderr, "Invalid size %zd, expect %zd\n", size, sizeof(*=
desc));
>          return -1;
>      }
>      buf =3D g_new0(char, size);
> diff --git a/contrib/vhost-user-blk/meson.build b/contrib/vhost-user-blk/=
meson.build
> index 601ea15ef5..dcb9e2ffcd 100644
> --- a/contrib/vhost-user-blk/meson.build
> +++ b/contrib/vhost-user-blk/meson.build
> @@ -1,5 +1,4 @@
> -# FIXME: broken on 32-bit architectures
>  executable('vhost-user-blk', files('vhost-user-blk.c'),
>             dependencies: [qemuutil, vhost_user],
> -           build_by_default: false,
> +           build_by_default: targetos =3D=3D 'linux',
>             install: false)
> --=20
> 2.30.2
> =

