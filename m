Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9143D600BCB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:00:03 +0200 (CEST)
Received: from localhost ([::1]:39920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMuf-0002XD-26
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1okMpT-0003IM-Nz
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:54:41 -0400
Received: from mga05.intel.com ([192.55.52.43]:1618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1okMpQ-0006uc-FD
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666000476; x=1697536476;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SdvzmR9tgic6pp8GjstoalBBqSBlo5tGvMrbgTX0paQ=;
 b=KN+G7AZEajJjgLTlT9tEyvtK2RMYQrx72YgrX24fGSv6MF7usNvCwOXE
 u9arEfemqahv8EBqvlFh//3e/6pY7f4okKTfCePr8mraOs0oxqu+DjLOy
 ZL3MP+QIeYvFLobC8KdFyqGQBgpopyClzgZnK43eaUK787PpxAMoCqLxr
 A2/pJI83LznDzlh/PmouXZnrGJVa8j5vabCw0Y/TOqEZSUTzyvcY8opr0
 BTH8rtwjkuS16p73cGsIkyst/kUMxFS2vwXA9gtkmOPIzCBGrFOkywNo3
 e7zyFTEzx+xg+JamallzOrhNtaOtVl5tyPbI5UD8PVwLVdjpL58KO8KsZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="392060543"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="392060543"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 02:54:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="717436260"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="717436260"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2022 02:54:33 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 02:54:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 02:54:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 02:54:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yf5+CdTRNWPrv1TT365v1mCKr6Rb2Iy5L85CW2Wq7TKyaxxAWp+J0oFCe7Q1ErTML/M01JSlWM4GeUvq/vqWZbhf3gGXRatkND5OvQsviiYM2OSYjj0VkbctOf+pstTpVzrk5wvJztUvJHx82OixlPdZ1oSYBK3SPligQMZiNoRE0xGz98kTOpEjIP5Lev3STIX+ksEmExkQBTGz5dP4mqRwaAVD6oowTpLt2D53s8FAWWj1DShQY9oaOwkDPoeAchOPuSHu1C6Ow/nuq6Scu7diDMfVpybksuvpB+Q+w6eDe/c1LlBhA7GPdQfDmxObDtuPEHti1htnaFM9q+nliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqb2VnsUjIKDX59Yzu5YJudk3fGj5YURbASXvTrAacw=;
 b=cW2DZNVRF/E6JellEZnGx2Ev9Axm7RlQlX1o+TrWBQTFEuy22c/gcRAZdMgh9Jg7XNmV94et5OOdnZ4NUYe9kjcAeelxIy9SaslEjzOQQLbirC/VeTc/53Y+k4Xf3lHah8fia8rH7ejqUCjcpy8MztJJvRvSzOCKTsGmAFohkHM9v4cSqQHsx7aOWsnDsGSxkZY4jv4aGw9DZtUUS5EyKINjrDxA5rboTAZeDnop95RtMvNshWKwDrIDtl7LfcA81ItB1WXVwtN/gEq3I+FAESuPEoyNE0/5RvpQk1Gq9gGcy0+ye5yDPgaYT/0sCi/JbC9ccr3iZohWrK0B2ljEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DM8PR11MB5670.namprd11.prod.outlook.com (2603:10b6:8:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 09:54:25 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::500a:9fb6:7396:f43c]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::500a:9fb6:7396:f43c%7]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 09:54:25 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Fiona Ebner <f.ebner@proxmox.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "dgilbert@redhat.com" <dgilbert@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>
Subject: RE: [PATCH v2] migration/channel-block: fix return value for
 qio_channel_block_{readv, writev}
Thread-Topic: [PATCH v2] migration/channel-block: fix return value for
 qio_channel_block_{readv, writev}
Thread-Index: AQHY3ubS9SC6dFY1b0CeqC56j+HSpq4SXMpQ
Date: Mon, 17 Oct 2022 09:54:25 +0000
Message-ID: <MWHPR11MB00318FBF6AB2FCC40F9AEF849B299@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20221013084100.57740-1-f.ebner@proxmox.com>
In-Reply-To: <20221013084100.57740-1-f.ebner@proxmox.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|DM8PR11MB5670:EE_
x-ms-office365-filtering-correlation-id: c674523d-e7aa-4e56-e21d-08dab0259330
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bi22RmJPDI+DgBOoSjR8rqz/WIdZEmPURruwKXQEvjTPmXaswiwgSCCQKCXVvBySCIIAfrLnosuAxpe4z7TU4ZjSGOpaAO5LkWWJ5HrzCcn9laxD/Wo86+sl4Bq8yclaR/qG44a702C4JPnksx7ZWultHAtd0v+5dIyADWXuCAKc8IVGwEGpgtxkc525dlMKckMkrI6CW8FYDCOP/uBL9xfzxjM9XlmnSa1JqO8Vb5Q1BiHMhfiNItIqHcUL3wHzZp7uIed6eoP/q7zBjdV+Y23YaQj7jjAYJGnJ8QYavIJvIM0DpRu8DP4P1hfA0yjICP6EoKwnJBF0RlcqGBvlqLWCovEftTHXMGN45IxMGrIfLvRgGmzxoaSATZYvVjHRNuaTtWaFlu1B3fuNh7ljOd1PIfSeKOHP1AkECINf4neHwqOpVc+byp85Yqrglqm9OVrzohE8A/JSvPDWNPtwKa8FjHQGCitb2Bu1spNiXzIzD9G7Ujhd+sUMy2B24YjILQ2qNhmunlhUAgFzxJ3wMmrYAz+DK258dUbhHxCC3HArEr/9FX8PqvkWNFbOTCS0Z6ZZBB/4EyhjXw8SmvpC7i+SE6HGbJ8GzfmAaYRhG14g4E7tCyO9uFp7MYH5FSd0wVDearzcDZkMHFMCoeg+0n8fnmyh450shI+ueMl1lJMS35EsEBOI2OVTWWhsr/8c1/3z505jSWAWK8PnN0KRKoBP3yogLQk6Vv0EB5taVstleCgAEAXe1ovKUdsGJta6hpo5qHJYAxPLXuwqZ3OaCA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199015)(38070700005)(122000001)(38100700002)(478600001)(82960400001)(186003)(4326008)(33656002)(6506007)(7696005)(54906003)(110136005)(316002)(76116006)(66946007)(66556008)(66476007)(64756008)(66446008)(9686003)(8676002)(55016003)(71200400001)(5660300002)(53546011)(52536014)(2906002)(26005)(8936002)(83380400001)(41300700001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Kw4/UX3GAQjdjMkobalJ8qtgYDfdqBM5O5JQ+Weaq5F/eoMrnuz/NiC5RSzk?=
 =?us-ascii?Q?8pELh9PRIsVLyOzUDcLT8+BxzMWXh7P5WcUjIe2R/FbRhzmD8/SEB8I1ZfQs?=
 =?us-ascii?Q?8l/ctedHXNsP4rRIgnZY93i1hIdWcUasPSg1RyEYRj5SsWjNeWiB0joHk2wW?=
 =?us-ascii?Q?LOZ7vG9QhWr1A8xCd95ecaambx0EjlNnr48cTxg/xQBj/O4raXNJoGM2GRsA?=
 =?us-ascii?Q?hyNII6pkX3EpFKFofL3PZBHFZ1Lzs5HKKpO62HAjknBwaeRg1L2a/aS/jXgw?=
 =?us-ascii?Q?7KWJk2v3W1ZF0EDLjN6fQIGkNjLTMDD4Hx0xWAryftlrme4bxZIzn36VSS8R?=
 =?us-ascii?Q?id4XSUofzKBhdNQ/Elb5dZCjn2Bmk4zi5dbZUJ2EpgZJF+ZvpDejV3WkCQYV?=
 =?us-ascii?Q?clIUekUq61bt7QzocMeAIg/HMzHWD7hDKzVDrYGjbTGpyoPXWf3Aav0Uh5f9?=
 =?us-ascii?Q?d1I9CcyNXNlOP3cW7M/cbjuOJTp/g8rDkhQg5y5VER4Jtnvr5ZcX+s0lMF49?=
 =?us-ascii?Q?TLu9tUD1KbzWzmIyfDOyBZ2TZnbJsvzwLYHMirLGV08VXYqAl4VlBTfmXQG2?=
 =?us-ascii?Q?ODlVH29pC4VPaP0wAO5dgjDy+W0x1ShdH1ZIZldbD4WEl9M7tfsFdRuJHkDD?=
 =?us-ascii?Q?rxXH3aUkGPTu+dQIf83F6A6nJVHWCYR7KmYM3grXyJp7ckLLz2eICkP3eJLW?=
 =?us-ascii?Q?fVYhLsqzHjHaoye6Rtc7cCToP49CmCkFa50+7TwgcmBuVRPfReJGo3mX3RQ4?=
 =?us-ascii?Q?Q82VHEy3thKL8EqAKF8B5iLKbRbLDGwwlmFvnqnm90+6KsHdZ9MGbacoowZo?=
 =?us-ascii?Q?zF9iAmxb90sRHb7rrJBCr/Nqh1HjlcCPfO3ttg9FphYpOhL1ENiM1Y/1fAgU?=
 =?us-ascii?Q?X53cSWawtdW9J579tBkOXrdan80QTCuhFmvwPCrWrbJWKtyHkItQ6HpjIwE6?=
 =?us-ascii?Q?kLJOC92qyCCXWpyPVP9kVdwg4QF5hTw8fnBUCWE5cc31LFwjMqwHPWEb3Ayz?=
 =?us-ascii?Q?xsL/olRSkSGAUqFucirDTcRTPtgQzQ5O/PDN1toLdPBvzpFglWh5CVu6UroV?=
 =?us-ascii?Q?SDcQD7KASGPUyn5xgNRkO43N6Wq9FNXiMVzA0CU9fsDejok1rsnRHJkAFxf+?=
 =?us-ascii?Q?SEbPH+LznItLZSFF+/sD74CXfm7x1lzb4eoidzOUDM7Mh73g6qESoMNzx8JD?=
 =?us-ascii?Q?zoGk+oIqHfOBdPAbAXYEZcMmeR+xXqy+P1WbhOiKnI3xoScpNZsTGZf6uC9O?=
 =?us-ascii?Q?vODmezOYpEf5tl75BDTUXQhPbs7hs2oHwEUjjda+clfINSuWUcSsNqxK5ZJh?=
 =?us-ascii?Q?MdVF/FQt0sZWuwvlqX/zpLWYeTEo8o3gXUPDBAQ+spLqZh09KMuFNroFkzEH?=
 =?us-ascii?Q?jjzGk3GGmXQQEjP4vP0nQYJu0mwC4ALyeK8HhPdMBP8I1iTKcAlJoS6Fw93V?=
 =?us-ascii?Q?keiX215ep5RaBoJL4H1XnBKfWTg3OmweaSpm7sQq/vPWSpsXeW3KI/C534Qj?=
 =?us-ascii?Q?lxnsQIbrazMr6XxbO4tGQ3DQdZ77f/g5EdeNM6zzkuSMmxMPUTONnQR40X16?=
 =?us-ascii?Q?BoYJ1WImLq3JyWq8W1pQp5Cci5zCbabZbm2WF9bf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c674523d-e7aa-4e56-e21d-08dab0259330
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 09:54:25.5454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UMLxV3x3lfnVABJ92g85vSg5DQLuBHEjeUrJMSfnrfZjmFvT6j0hQuZJZ9/WV3f8Cljm1o+8OTfQKq9sdqaFLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5670
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



> -----Original Message-----
> From: Qemu-devel <qemu-devel-bounces+chen.zhang=3Dintel.com@nongnu.org>
> On Behalf Of Fiona Ebner
> Sent: Thursday, October 13, 2022 4:41 PM
> To: qemu-devel@nongnu.org
> Cc: dgilbert@redhat.com; quintela@redhat.com; berrange@redhat.com
> Subject: [PATCH v2] migration/channel-block: fix return value for
> qio_channel_block_{readv, writev}
>=20
> in the error case. The documentation in include/io/channel.h states that =
-1 or
> QIO_CHANNEL_ERR_BLOCK should be returned upon error. Simply passing
> along the return value from the bdrv-functions has the potential to confu=
se
> the call sides. Non-blocking mode is not implemented currently, so -1 it =
is.
>=20
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>

LGTM.
Reviewed-by: Zhang Chen <chen.zhang@intel.com>

But I found the same problem elsewhere, for example:=20
"qio_channel_rdma_writev/readv", "qio_channel_buffer_writev/readv"...etc...

Can you send other patches to fix it?

Thanks
Chen=20


> ---
>=20
> v1 -> v2:
>     * Use error_setg_errno() instead of error_setg().
>     * Use "failed" instead of "returned error" in error message. Now
>       that no numerical error code is used, this sounds a bit nicer
>       IMHO.
>=20
>  migration/channel-block.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/migration/channel-block.c b/migration/channel-block.c index
> c55c8c93ce..f4ab53acdb 100644
> --- a/migration/channel-block.c
> +++ b/migration/channel-block.c
> @@ -62,7 +62,8 @@ qio_channel_block_readv(QIOChannel *ioc,
>      qemu_iovec_init_external(&qiov, (struct iovec *)iov, niov);
>      ret =3D bdrv_readv_vmstate(bioc->bs, &qiov, bioc->offset);
>      if (ret < 0) {
> -        return ret;
> +        error_setg_errno(errp, -ret, "bdrv_readv_vmstate failed");
> +        return -1;
>      }
>=20
>      bioc->offset +=3D qiov.size;
> @@ -86,7 +87,8 @@ qio_channel_block_writev(QIOChannel *ioc,
>      qemu_iovec_init_external(&qiov, (struct iovec *)iov, niov);
>      ret =3D bdrv_writev_vmstate(bioc->bs, &qiov, bioc->offset);
>      if (ret < 0) {
> -        return ret;
> +        error_setg_errno(errp, -ret, "bdrv_writev_vmstate failed");
> +        return -1;
>      }
>=20
>      bioc->offset +=3D qiov.size;
> --
> 2.30.2
>=20
>=20


