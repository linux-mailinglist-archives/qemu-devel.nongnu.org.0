Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2A53CCC3E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 04:27:46 +0200 (CEST)
Received: from localhost ([::1]:36604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5J0T-0000PL-LF
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 22:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m5Iz3-000828-FQ; Sun, 18 Jul 2021 22:26:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:47784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m5Iz0-0004gH-6g; Sun, 18 Jul 2021 22:26:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="198182428"
X-IronPort-AV: E=Sophos;i="5.84,250,1620716400"; d="scan'208";a="198182428"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2021 19:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,250,1620716400"; d="scan'208";a="563869538"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 18 Jul 2021 19:26:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 18 Jul 2021 19:26:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Sun, 18 Jul 2021 19:26:09 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Sun, 18 Jul 2021 19:26:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFR/locCL8SkDCoFvG/FIXU+MwPnsMtUpz3a+7ticokbE6etpD3zAN+YV32LoUk63m/AT5YCetYQSDWkDE9NcI76JPw4+olVKCuNTh51rwGg4kUet12fc7KDCmke1tpe9k8sZIINaxUQpPnf9l5okQZFsxenAIerbUB5IG7jm4PIAIHEdWMh4EmPC/8VqSZP8D3hNHhKkq6bADnoytZy46bb6GutbL+v4gtLSM1tk5/u0yULg30+gLLcVtAXSQlbvsosFBtscvfAgNftGRs+lDfd2Ac169DJFf15rJhyawu8pSwGHWXm25iBrisIL/TFfcNsRV5hcl0Mi7jlLTpbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgR/QQ0qwy27sEC12UXuyqRDX5XNFWCmcmAmMoDLqI0=;
 b=btzfYe665tgAT0BFcr/Y8SkGVIjMzGIVFpWHoBzErW+7lG/x5eSqb5swEdPAfg1bGCyQWQ0E7DH8hf311w3IoUwWBg4wrF5RTv7Q3hqAZzlvyJ89Rcs89Bjzi/7Nqi3a35BUabSWVE5dIXsn6yyDyoR/Xc/EPRwoyGQb/fXWVCFW5DcceL58QnC87zh50I7Ozyujp7VJsHGCpLAPvGoO9Bfh26H1frwb9TfJLF42GqX7fT7luhvSLhKGg6zoMGCzDQc2hPGREzlPWlje5QaoFvFgDkDUZ0JeYYMF3413RxObC5yx27gSfMfgY8+4YnbpRKQB4WxjXDiLdRDuVpuWcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgR/QQ0qwy27sEC12UXuyqRDX5XNFWCmcmAmMoDLqI0=;
 b=mhHP/RFLwxO/4bP5gv2V3sfg6cpz0MhCjuhcrfepCcpDbLVrS+d0vvyhsdyyGXISRUNz8d38pYAkPFJJy4kdSIDUtemgzmjiMs7e0OCLr3DSzTlC8CN46qzwJWqRxg4wI8FXIqyqdeX79FOqb0Tw5wEYbpFtr6VmkQubqCrVfss=
Received: from BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 by BN6PR1101MB2290.namprd11.prod.outlook.com (2603:10b6:405:4e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Mon, 19 Jul
 2021 02:26:07 +0000
Received: from BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::d4a2:4607:7235:c6f6]) by BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::d4a2:4607:7235:c6f6%9]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 02:26:07 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 1/4] replication: Remove s->active_disk
Thread-Topic: [PATCH v6 1/4] replication: Remove s->active_disk
Thread-Index: AQHXe+RXY1IOFAjWM0WS/412Nx48cqtJkguA
Date: Mon, 19 Jul 2021 02:26:06 +0000
Message-ID: <BN0PR11MB5757611BE59D5EFA4094EF5E9BE19@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <cover.1626619393.git.lukasstraub2@web.de>
 <2534f867ea9be5b666dfce19744b7d4e2b96c976.1626619393.git.lukasstraub2@web.de>
In-Reply-To: <2534f867ea9be5b666dfce19744b7d4e2b96c976.1626619393.git.lukasstraub2@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: web.de; dkim=none (message not signed)
 header.d=none;web.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 683859f9-4296-496c-2ac8-08d94a5c9080
x-ms-traffictypediagnostic: BN6PR1101MB2290:
x-microsoft-antispam-prvs: <BN6PR1101MB2290773159E5DA2109B8DDE59BE19@BN6PR1101MB2290.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:252;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mxnHsP2YrHXlhK5zF1JEfs7QJ8v9fOn655uup8VBvyOqQuj00FhLxVDY6ymKeCIvvlYZds1tGotCZCB/zDQPPh7DvsQxQBU6f9ZsnENlFqz9csBnCmlnzuO300iZMR5ZGzPRnv79Q7ctw63QL4gRT+CFgXZgNGSzWfMjbEDOQNXdcz3ELJWP6DNpylJvH6l5W3OAC0DSsiznrKvuk0fB2CQQWKZqzcN0oWWVNlK+Ks/a63poW7W7uoAdzeoExfFpKoNf199al9q8gzlO3q2AWz319XwLsPt9ATaxrgRrBkv3evt+bn8l4kQcejT62rif/eo1nmwx7X5fj+l3C4EuU5zBFHI2CUk97eY8T00izAGH7kKHMNt+3tzzciNuIOzkC6X8rN8IikrFvuQJnblOsfE+0DkVLQ7ROl/l1L4+WMQqu76tMOfQ3+5CKj6L78db8ogTXSC6k8v0803u381H4QPtZTVbJaYnGVGqa798XaJQhDG33ZmFFtViMdTNMptDLRWyY2tWD1trig04W4JGDRukjGn5nZ34oc9Nyq45pSPnFOqfiIcPd/BBEzz2vZgFApV+omkW525cNMudq0lFWAp7IzNgSAVhDma0PMtYTA8g7G15xnENVG9Q2I0nLDkHyTMeg5Pa1fox9JetxVOCUckUL5jqJtBUmpJY0RieDxqbzEE/PPQ1Z1Wv1f6N6pqb/8HaAxYk2FQLUb9KKYJ7IA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(8936002)(4326008)(66446008)(64756008)(66556008)(66476007)(9686003)(66946007)(5660300002)(71200400001)(52536014)(76116006)(478600001)(83380400001)(2906002)(55016002)(54906003)(186003)(316002)(110136005)(122000001)(38100700002)(33656002)(8676002)(26005)(6506007)(53546011)(7696005)(86362001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TtOfF7O3dM6zgWcMXyvpe8tMIsF0v0W5VZ4r7WOPALXQGPtlD6VojExotpZC?=
 =?us-ascii?Q?gGYGwtP3MLkrszl9jgCOSl5gmYXY704Ine9T56Y/vdV5Zab5tdhd68pNNNeu?=
 =?us-ascii?Q?+D1qsrqXonFMMr2rgeV5FQEyiRNfBvJ617Gqy8/IYBYv7gXpH9k9nYBX39Xw?=
 =?us-ascii?Q?Wd+c1SxmzHxalefkrk4lMb9R7wcQCtyip8EflH0Ws8gUd8gLCixdPOIReR6h?=
 =?us-ascii?Q?+3tHNjtETg0XL8g15Zp2y+sAjXVoWEvpLLWSaj+F9yzVGCjBiRfnBrdGrOz4?=
 =?us-ascii?Q?5864EbMVJA1qwF5vqmeFFPkJ7ppdPK/Y5wrPx4xUpy6US8vuxJTdWIyKvgRB?=
 =?us-ascii?Q?i8v9F0rMBINU6Po9mxGqCTtSaA7B4B1EnmwqLvrJxB/FGbZTg3L9vQW2rDzC?=
 =?us-ascii?Q?+696hO3aNCU+VYUXR+9HwS7DZiCBOU6XtCu5HHhMvDX8VZVZDDH8Y9qSPnRz?=
 =?us-ascii?Q?4RlRGPB3as6I18evCjn6+BKsdKAAWR5B370qdIcmjd0lZpjPa39zDZnvXEqN?=
 =?us-ascii?Q?XcBFQ7r13JNvwWjSu5yy3Qjm24jrFwwW01/ktnqlAbUCBuTKBTYIVgWKSnsP?=
 =?us-ascii?Q?WTz9R+cVv7r1oPJlNMhNg9Vj604TxIj4N3uZxxFmjZ0/LH3m2MO+nuESTzgT?=
 =?us-ascii?Q?oX7Xaqnp2pQ1t7NZw1ttshThexVJ+xg0H3+XVnErN+ssU+V2UnKFBHWC6g4f?=
 =?us-ascii?Q?rJ+yYJT8nbQhFxAdqAckTVh6mGJvk93W/49/U66Rd6Y2dgcdrxp7IxnAT2uR?=
 =?us-ascii?Q?mD9BBjsU7+8it1GJ6kqjxvhY4YUueTJDx8GRUD7DIJqJx2MPcXCl8N5DbJwE?=
 =?us-ascii?Q?Z5Ai0fBFNOPW8y6jOOm5N/D2XgdoLGDaqlkNrDY+5SRnTtEicd3xx+RSTdlL?=
 =?us-ascii?Q?pfQAulYy15ZAun+Q7m2ibm0cDfMonPi3BO/+SWN7AoYTWsLq28MUSvr+yD4D?=
 =?us-ascii?Q?MB4zB6EHR9cDblVMFw/yQOvfNkTfhMDZM6b7YNj+NKdz3NGcxZ/0RXPaafke?=
 =?us-ascii?Q?SQ4BY987lEmy7QP1+6nEF1JRhE2qBIAJr/jPEiAW+RS2ARpimWt7tg4MaKyZ?=
 =?us-ascii?Q?WXSYamxhs3IPcGW/1GEoS3+PmhKPBTn5zvLzaYVTD/2ecg/N65Swd22k/qJO?=
 =?us-ascii?Q?3p0sU6mtGsq9QvYfsDzoRBSbEaJLMhK9q0fj3QrYfc5wFtgM/BJ+r6Ue2j85?=
 =?us-ascii?Q?RRSS7QeUnjbxDuAAfTlPuQ8fyIWS2TGyJ4XNJVgcIn7bvy34DDpUWRp1uxnM?=
 =?us-ascii?Q?9/a+ehDwBt/gioL4bMWCYkrm/XLIL00eoFQKPWrunGb0imR9kLCYvZ/Dn9wf?=
 =?us-ascii?Q?pX0pUuaMYzFkyxHP2IX8jrR4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683859f9-4296-496c-2ac8-08d94a5c9080
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 02:26:07.0256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TXjeLehiVAPs7/bLzTnIxSrQWTwf4QTwzX6VBrkoLX+ji7Aa9ZPFFInnOeju5dV0jFWb1N4ILml2yyJ2a4RygQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2290
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Qemu-devel <qemu-devel-
> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Lukas Straub
> Sent: Sunday, July 18, 2021 10:48 PM
> To: qemu-devel <qemu-devel@nongnu.org>
> Cc: Kevin Wolf <kwolf@redhat.com>; Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com>; qemu-block <qemu-block@nongnu.org>;
> Wen Congyang <wencongyang2@huawei.com>; Xie Changlong
> <xiechanglong.d@gmail.com>; Max Reitz <mreitz@redhat.com>
> Subject: [PATCH v6 1/4] replication: Remove s->active_disk
>=20
> s->active_disk is bs->file. Remove it and use local variables instead.
>=20
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Looks good for me.
Reviewed-by: Zhang Chen <chen.zhang@intel.com>

> ---
>  block/replication.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/block/replication.c b/block/replication.c index
> 774e15df16..9ad2dfdc69 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -35,7 +35,6 @@ typedef enum {
>  typedef struct BDRVReplicationState {
>      ReplicationMode mode;
>      ReplicationStage stage;
> -    BdrvChild *active_disk;
>      BlockJob *commit_job;
>      BdrvChild *hidden_disk;
>      BdrvChild *secondary_disk;
> @@ -307,8 +306,10 @@ out:
>      return ret;
>  }
>=20
> -static void secondary_do_checkpoint(BDRVReplicationState *s, Error **err=
p)
> +static void secondary_do_checkpoint(BlockDriverState *bs, Error **errp)
>  {
> +    BDRVReplicationState *s =3D bs->opaque;
> +    BdrvChild *active_disk =3D bs->file;
>      Error *local_err =3D NULL;
>      int ret;
>=20
> @@ -323,13 +324,13 @@ static void
> secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
>          return;
>      }
>=20
> -    if (!s->active_disk->bs->drv) {
> +    if (!active_disk->bs->drv) {
>          error_setg(errp, "Active disk %s is ejected",
> -                   s->active_disk->bs->node_name);
> +                   active_disk->bs->node_name);
>          return;
>      }
>=20
> -    ret =3D bdrv_make_empty(s->active_disk, errp);
> +    ret =3D bdrv_make_empty(active_disk, errp);
>      if (ret < 0) {
>          return;
>      }
> @@ -458,6 +459,7 @@ static void replication_start(ReplicationState *rs,
> ReplicationMode mode,
>      BlockDriverState *bs =3D rs->opaque;
>      BDRVReplicationState *s;
>      BlockDriverState *top_bs;
> +    BdrvChild *active_disk;
>      int64_t active_length, hidden_length, disk_length;
>      AioContext *aio_context;
>      Error *local_err =3D NULL;
> @@ -495,15 +497,14 @@ static void replication_start(ReplicationState *rs,
> ReplicationMode mode,
>      case REPLICATION_MODE_PRIMARY:
>          break;
>      case REPLICATION_MODE_SECONDARY:
> -        s->active_disk =3D bs->file;
> -        if (!s->active_disk || !s->active_disk->bs ||
> -                                    !s->active_disk->bs->backing) {
> +        active_disk =3D bs->file;
> +        if (!active_disk || !active_disk->bs ||
> + !active_disk->bs->backing) {
>              error_setg(errp, "Active disk doesn't have backing file");
>              aio_context_release(aio_context);
>              return;
>          }
>=20
> -        s->hidden_disk =3D s->active_disk->bs->backing;
> +        s->hidden_disk =3D active_disk->bs->backing;
>          if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
>              error_setg(errp, "Hidden disk doesn't have backing file");
>              aio_context_release(aio_context); @@ -518,7 +519,7 @@ static=
 void
> replication_start(ReplicationState *rs, ReplicationMode mode,
>          }
>=20
>          /* verify the length */
> -        active_length =3D bdrv_getlength(s->active_disk->bs);
> +        active_length =3D bdrv_getlength(active_disk->bs);
>          hidden_length =3D bdrv_getlength(s->hidden_disk->bs);
>          disk_length =3D bdrv_getlength(s->secondary_disk->bs);
>          if (active_length < 0 || hidden_length < 0 || disk_length < 0 ||=
 @@ -
> 530,9 +531,9 @@ static void replication_start(ReplicationState *rs,
> ReplicationMode mode,
>          }
>=20
>          /* Must be true, or the bdrv_getlength() calls would have failed=
 */
> -        assert(s->active_disk->bs->drv && s->hidden_disk->bs->drv);
> +        assert(active_disk->bs->drv && s->hidden_disk->bs->drv);
>=20
> -        if (!s->active_disk->bs->drv->bdrv_make_empty ||
> +        if (!active_disk->bs->drv->bdrv_make_empty ||
>              !s->hidden_disk->bs->drv->bdrv_make_empty) {
>              error_setg(errp,
>                         "Active disk or hidden disk doesn't support make_=
empty"); @@ -
> 586,7 +587,7 @@ static void replication_start(ReplicationState *rs,
> ReplicationMode mode,
>      s->stage =3D BLOCK_REPLICATION_RUNNING;
>=20
>      if (s->mode =3D=3D REPLICATION_MODE_SECONDARY) {
> -        secondary_do_checkpoint(s, errp);
> +        secondary_do_checkpoint(bs, errp);
>      }
>=20
>      s->error =3D 0;
> @@ -615,7 +616,7 @@ static void
> replication_do_checkpoint(ReplicationState *rs, Error **errp)
>      }
>=20
>      if (s->mode =3D=3D REPLICATION_MODE_SECONDARY) {
> -        secondary_do_checkpoint(s, errp);
> +        secondary_do_checkpoint(bs, errp);
>      }
>      aio_context_release(aio_context);
>  }
> @@ -652,7 +653,6 @@ static void replication_done(void *opaque, int ret)
>      if (ret =3D=3D 0) {
>          s->stage =3D BLOCK_REPLICATION_DONE;
>=20
> -        s->active_disk =3D NULL;
>          s->secondary_disk =3D NULL;
>          s->hidden_disk =3D NULL;
>          s->error =3D 0;
> @@ -705,7 +705,7 @@ static void replication_stop(ReplicationState *rs, bo=
ol
> failover, Error **errp)
>          }
>=20
>          if (!failover) {
> -            secondary_do_checkpoint(s, errp);
> +            secondary_do_checkpoint(bs, errp);
>              s->stage =3D BLOCK_REPLICATION_DONE;
>              aio_context_release(aio_context);
>              return;
> @@ -713,7 +713,7 @@ static void replication_stop(ReplicationState *rs, bo=
ol
> failover, Error **errp)
>=20
>          s->stage =3D BLOCK_REPLICATION_FAILOVER;
>          s->commit_job =3D commit_active_start(
> -                            NULL, s->active_disk->bs, s->secondary_disk-=
>bs,
> +                            NULL, bs->file->bs, s->secondary_disk->bs,
>                              JOB_INTERNAL, 0, BLOCKDEV_ON_ERROR_REPORT,
>                              NULL, replication_done, bs, true, errp);
>          break;
> --
> 2.20.1


