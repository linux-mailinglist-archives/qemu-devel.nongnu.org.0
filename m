Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8312357E75
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 10:53:07 +0200 (CEST)
Received: from localhost ([::1]:45902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQPS-0005Xl-RW
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 04:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUQMQ-0003fa-Ao
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:49:58 -0400
Received: from mga05.intel.com ([192.55.52.43]:56427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUQMN-0001Zk-BW
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:49:58 -0400
IronPort-SDR: CvwTzJz1ws199ymZTjxC74bEXFv//q3bCyEcpfOLqhA96vtgGFl2ZDik4Dp+kEpmh15C28J30T
 BQu60csA7L9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="278763907"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="278763907"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 01:49:51 -0700
IronPort-SDR: LJUZQhB1hCMlJWgQbat++RP2JCBBa0QvBsY9trmcGZJ0yzM/an4npBKrbfDVVFmIhx8A4FT842
 MrUOPBwErkvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="530531922"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga004.jf.intel.com with ESMTP; 08 Apr 2021 01:49:50 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 01:49:49 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 16:49:48 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Thu, 8 Apr 2021 16:49:48 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "lizhijian@cn.fujitsu.com"
 <lizhijian@cn.fujitsu.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "lukasstraub2@web.de" <lukasstraub2@web.de>
Subject: RE: [PATCH v5 10/10] Fixed calculation error of pkt->header_size in
 fill_pkt_tcp_info()
Thread-Topic: [PATCH v5 10/10] Fixed calculation error of pkt->header_size in
 fill_pkt_tcp_info()
Thread-Index: AQHXJs6Tws/KvKHh1E6P7QDoaqEx+qqqWpiA
Date: Thu, 8 Apr 2021 08:49:47 +0000
Message-ID: <791fdb82fbe043399ae62b1e39eded42@intel.com>
References: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
 <1617263249-54501-11-git-send-email-lei.rao@intel.com>
In-Reply-To: <1617263249-54501-11-git-send-email-lei.rao@intel.com>
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Rao, Lei <lei.rao@intel.com>
> Sent: Thursday, April 1, 2021 3:47 PM
> To: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> jasowang@redhat.com; quintela@redhat.com; dgilbert@redhat.com;
> pbonzini@redhat.com; lukasstraub2@web.de
> Cc: qemu-devel@nongnu.org; Rao, Lei <lei.rao@intel.com>
> Subject: [PATCH v5 10/10] Fixed calculation error of pkt->header_size in
> fill_pkt_tcp_info()
>=20
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> The data pointer has skipped vnet_hdr_len in the function of
> parse_packet_early().So, we can not subtract vnet_hdr_len again when
> calculating pkt->header_size in fill_pkt_tcp_info(). Otherwise, it will c=
ause
> network packet comparsion errors and greatly increase the frequency of
> checkpoints.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

> ---
>  net/colo-compare.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c index
> 5b538f4..b100e7b 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -211,7 +211,7 @@ static void fill_pkt_tcp_info(void *data, uint32_t
> *max_ack)
>      pkt->tcp_ack =3D ntohl(tcphd->th_ack);
>      *max_ack =3D *max_ack > pkt->tcp_ack ? *max_ack : pkt->tcp_ack;
>      pkt->header_size =3D pkt->transport_header - (uint8_t *)pkt->data
> -                       + (tcphd->th_off << 2) - pkt->vnet_hdr_len;
> +                       + (tcphd->th_off << 2);
>      pkt->payload_size =3D pkt->size - pkt->header_size;
>      pkt->seq_end =3D pkt->tcp_seq + pkt->payload_size;
>      pkt->flags =3D tcphd->th_flags;
> --
> 1.8.3.1


