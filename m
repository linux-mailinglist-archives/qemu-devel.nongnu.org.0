Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67F92B3DC8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 08:33:45 +0100 (CET)
Received: from localhost ([::1]:44046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keZ1E-0004mD-TQ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 02:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1keYzK-0003sC-CQ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 02:31:47 -0500
Received: from mga05.intel.com ([192.55.52.43]:12686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1keYzF-0006O9-PL
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 02:31:44 -0500
IronPort-SDR: Gyd36vU7iyHFtazSoqj9eH5+RJowk/5LuTWs55NI/qwWYI9B2rgy/qRx8uc6qUNAXJSH+UQ/6k
 F+Uf0QsKSlMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="255421639"
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="255421639"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2020 23:31:38 -0800
IronPort-SDR: INPItXYeoTpNsz5cis3hriD3LTOqK6i1rXJQ4MNuIMzG80BO6VRxBST+SJFBftjxLFylGec3mM
 R7NxRwAYtdCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="309798706"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 15 Nov 2020 23:31:37 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 15 Nov 2020 23:31:36 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Nov 2020 15:31:35 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.1713.004;
 Mon, 16 Nov 2020 15:31:35 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: RE: [PATCH 2/2] net/colo-compare.c: Optimize removal of secondary
 packet
Thread-Topic: [PATCH 2/2] net/colo-compare.c: Optimize removal of secondary
 packet
Thread-Index: AQHWu0Ez6wMfY2Gix0uxLOw4gf/NdKnKXnMg
Date: Mon, 16 Nov 2020 07:31:35 +0000
Message-ID: <6c2b63ca96aa420195415028c6b7b40d@intel.com>
References: <cover.1605438886.git.lukasstraub2@web.de>
 <fa4d5eb0bb2ea3f247af5bb7792499cf9cd56a14.1605438886.git.lukasstraub2@web.de>
In-Reply-To: <fa4d5eb0bb2ea3f247af5bb7792499cf9cd56a14.1605438886.git.lukasstraub2@web.de>
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
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 02:31:39
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
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
Cc: Jason Wang <jasowang@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Sunday, November 15, 2020 7:19 PM
> To: qemu-devel <qemu-devel@nongnu.org>
> Cc: Zhang, Chen <chen.zhang@intel.com>; Li Zhijian
> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>
> Subject: [PATCH 2/2] net/colo-compare.c: Optimize removal of secondary
> packet
>=20
> g_queue_remove needs to look up the list entry first, but we already have=
 it
> as result and can remove it directly with g_queue_delete_link.
>=20
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  net/colo-compare.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c index
> eed0fbb27b..4e2af8ff00 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -691,7 +691,7 @@ static void colo_compare_packet(CompareState *s,
> Connection *conn,
>          if (result) {
>              colo_release_primary_pkt(s, pkt);
>              packet_destroy(result->data, NULL);
> -            g_queue_remove(&conn->secondary_list, result->data);
> +            g_queue_delete_link(&conn->secondary_list, result);
>          } else {
>              /*
>               * If one packet arrive late, the secondary_list or
> --
> 2.20.1

