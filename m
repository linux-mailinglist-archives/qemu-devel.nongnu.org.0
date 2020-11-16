Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60902B3DC7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 08:33:40 +0100 (CET)
Received: from localhost ([::1]:43700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keZ1A-0004df-08
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 02:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1keYyu-0003mn-OC
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 02:31:20 -0500
Received: from mga01.intel.com ([192.55.52.88]:59781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1keYyp-0006GA-UA
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 02:31:20 -0500
IronPort-SDR: roeQA4pLfT2+j9MbDh0eIQQalHdGo7PgSX7wn8VHghVW2l7Ah12dAJUbuEpbl/GkdZDOsa57NW
 dEIGEVuWGjiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="188753481"
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="188753481"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2020 23:31:10 -0800
IronPort-SDR: tLLsOEQixSNcEf1jpNB8YQToLyGja8ECYPIm4T1XSR8cnrKuZsf+v07sfYfp/duIigVOUdpT6A
 e5yhb0RV8j1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="533324241"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2020 23:31:10 -0800
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 15 Nov 2020 23:31:10 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Nov 2020 15:31:08 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.1713.004;
 Mon, 16 Nov 2020 15:31:08 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/2] net/colo-compare.c: Fix memory leak for non-tcp packet
Thread-Topic: [PATCH 1/2] net/colo-compare.c: Fix memory leak for non-tcp
 packet
Thread-Index: AQHWu0Elzuw4zb+K2EeJydnV8hB8B6nKXg4A
Date: Mon, 16 Nov 2020 07:31:08 +0000
Message-ID: <b6eeecfd42aa48cbbfba128866bb139c@intel.com>
References: <cover.1605438886.git.lukasstraub2@web.de>
 <af6051bf9a72151cfc5e7ec8c72dedd30ef6b332.1605438886.git.lukasstraub2@web.de>
In-Reply-To: <af6051bf9a72151cfc5e7ec8c72dedd30ef6b332.1605438886.git.lukasstraub2@web.de>
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
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 02:31:11
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Sunday, November 15, 2020 7:19 PM
> To: qemu-devel <qemu-devel@nongnu.org>
> Cc: Zhang, Chen <chen.zhang@intel.com>; Li Zhijian
> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>
> Subject: [PATCH 1/2] net/colo-compare.c: Fix memory leak for non-tcp
> packet
>=20
> Additional to removing the packet from the secondary queue, we also need
> to free it.
>=20
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Looks good to me.
Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  net/colo-compare.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c index
> 337025b44f..eed0fbb27b 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -690,6 +690,7 @@ static void colo_compare_packet(CompareState *s,
> Connection *conn,
>=20
>          if (result) {
>              colo_release_primary_pkt(s, pkt);
> +            packet_destroy(result->data, NULL);
>              g_queue_remove(&conn->secondary_list, result->data);
>          } else {
>              /*
> --
> 2.20.1


