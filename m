Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA14388486
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 03:41:57 +0200 (CEST)
Received: from localhost ([::1]:36096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljBDf-00084F-Kb
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 21:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ljBC4-0007FO-Nx; Tue, 18 May 2021 21:40:16 -0400
Received: from mga03.intel.com ([134.134.136.65]:59269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ljBC1-0002Vm-W1; Tue, 18 May 2021 21:40:16 -0400
IronPort-SDR: MX1zTUxWMgGZx9cthptNKSLQRoJIdRJ6BlXjhdUv14jEWupz6izEl8oVBsL/4NBqYHqhjcTgyg
 D8GMDDwOCA+g==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="200926128"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="200926128"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 18:40:03 -0700
IronPort-SDR: jcG5xmQgwXhYMmPqerItpI/g4IUZ+yWncXmHP3c8+cgMb9jIcP3rmqDNli46tzK+0jWH23XxO9
 Mb9IdoZiWE/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="542257110"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga001.fm.intel.com with ESMTP; 18 May 2021 18:40:03 -0700
Received: from shsmsx604.ccr.corp.intel.com (10.109.6.214) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 18 May 2021 18:40:03 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX604.ccr.corp.intel.com (10.109.6.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 19 May 2021 09:40:01 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Wed, 19 May 2021 09:40:01 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: RE: [PATCH Resend] block/quorum: Provide .bdrv_co_flush instead of
 .bdrv_co_flush_to_disk
Thread-Topic: [PATCH Resend] block/quorum: Provide .bdrv_co_flush instead of
 .bdrv_co_flush_to_disk
Thread-Index: AQHXS9rwsPv74C8lzEKAheS/DOMF16rqB8aQ
Date: Wed, 19 May 2021 01:40:01 +0000
Message-ID: <b78a19caf80f4353b6b83b9cf3f26126@intel.com>
References: <20210518134214.11ccf05f@gecko.fritz.box>
In-Reply-To: <20210518134214.11ccf05f@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>, Minghao Yuan <meeho@qq.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Tuesday, May 18, 2021 7:42 PM
> To: qemu-devel <qemu-devel@nongnu.org>
> Cc: qemu-block <qemu-block@nongnu.org>; Alberto Garcia
> <berto@igalia.com>; Kevin Wolf <kwolf@redhat.com>; Max Reitz
> <mreitz@redhat.com>; Minghao Yuan <meeho@qq.com>; Zhang, Chen
> <chen.zhang@intel.com>; Zhang Chen <zhangckid@gmail.com>
> Subject: [PATCH Resend] block/quorum: Provide .bdrv_co_flush instead
> of .bdrv_co_flush_to_disk
>=20
> The quorum block driver uses a custom flush callback to handle the case
> when some children return io errors. In that case it still returns succes=
s if
> enough children are healthy.
> However, it provides it as the .bdrv_co_flush_to_disk callback, not
> as .bdrv_co_flush. This causes the block layer to do it's own generic flu=
shing
> for the children instead, which doesn't handle errors properly.
>=20
> Fix this by providing .bdrv_co_flush instead of .bdrv_co_flush_to_disk so=
 the
> block layer uses the custom flush callback.
>=20
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Reported-by: Minghao Yuan <meeho@qq.com>

Tested-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>=20
> Resend: git send-mail put a newline in the Subject: header so the mailing=
 list
> rejected it.
>=20
>  block/quorum.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/block/quorum.c b/block/quorum.c index cfc1436abb..f2c0805000
> 100644
> --- a/block/quorum.c
> +++ b/block/quorum.c
> @@ -1279,7 +1279,7 @@ static BlockDriver bdrv_quorum =3D {
>      .bdrv_dirname                       =3D quorum_dirname,
>      .bdrv_co_block_status               =3D quorum_co_block_status,
>=20
> -    .bdrv_co_flush_to_disk              =3D quorum_co_flush,
> +    .bdrv_co_flush                      =3D quorum_co_flush,
>=20
>      .bdrv_getlength                     =3D quorum_getlength,
>=20
> --
> 2.31.1

