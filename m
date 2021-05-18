Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC9386FA7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:53:17 +0200 (CEST)
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liov6-00033S-L0
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lioo1-0003nW-UX
 for qemu-devel@nongnu.org; Mon, 17 May 2021 21:45:58 -0400
Received: from mga07.intel.com ([134.134.136.100]:21665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lionv-0004f2-KH
 for qemu-devel@nongnu.org; Mon, 17 May 2021 21:45:57 -0400
IronPort-SDR: m0fAx7pNiqz5rpUeWeD6jDuvG4kT3beJssZoOHxHD517lHCP+l0BHD2+In+YkK5DNxukIH0mPs
 e54BsUw+3D6w==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="264517729"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="264517729"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 18:45:48 -0700
IronPort-SDR: hwEKMQl2QsevgaElFOEJLSZYQ2XEaGtcdnNLM3xPs18D9ub/SaAxXpvHBnTx9eSN7l3IZoSXRn
 0/cTOa9Yl3Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="460540676"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 17 May 2021 18:45:48 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 17 May 2021 18:45:47 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 18 May 2021 09:45:45 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Tue, 18 May 2021 09:45:45 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "lizhijian@cn.fujitsu.com"
 <lizhijian@cn.fujitsu.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "lukasstraub2@web.de" <lukasstraub2@web.de>
Subject: RE: [PATCH v6 05/10] Add a function named packet_new_nocopy for COLO.
Thread-Topic: [PATCH v6 05/10] Add a function named packet_new_nocopy for COLO.
Thread-Index: AQHXLPJk53haZB8IbkCfVMEnMBq5TKrotOHA
Date: Tue, 18 May 2021 01:45:45 +0000
Message-ID: <0cbc6b655acc4b38bde47ec230088377@intel.com>
References: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
 <1617938456-315058-6-git-send-email-lei.rao@intel.com>
In-Reply-To: <1617938456-315058-6-git-send-email-lei.rao@intel.com>
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
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chen.zhang@intel.com; helo=mga07.intel.com
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
> Sent: Friday, April 9, 2021 11:21 AM
> To: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> jasowang@redhat.com; quintela@redhat.com; dgilbert@redhat.com;
> pbonzini@redhat.com; lukasstraub2@web.de
> Cc: qemu-devel@nongnu.org; Rao, Lei <lei.rao@intel.com>
> Subject: [PATCH v6 05/10] Add a function named packet_new_nocopy for
> COLO.
>=20
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> Use the packet_new_nocopy instead of packet_new in the filter-rewriter
> module. There will be one less memory copy in the processing of each
> network packet.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

Thanks
Chen

> ---
>  net/colo.c            | 25 +++++++++++++++++--------
>  net/colo.h            |  1 +
>  net/filter-rewriter.c |  3 +--
>  3 files changed, 19 insertions(+), 10 deletions(-)
>=20
> diff --git a/net/colo.c b/net/colo.c
> index ef00609..3a3e6e8 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -157,19 +157,28 @@ void connection_destroy(void *opaque)
>=20
>  Packet *packet_new(const void *data, int size, int vnet_hdr_len)  {
> -    Packet *pkt =3D g_slice_new(Packet);
> +    Packet *pkt =3D g_slice_new0(Packet);
>=20
>      pkt->data =3D g_memdup(data, size);
>      pkt->size =3D size;
>      pkt->creation_ms =3D qemu_clock_get_ms(QEMU_CLOCK_HOST);
>      pkt->vnet_hdr_len =3D vnet_hdr_len;
> -    pkt->tcp_seq =3D 0;
> -    pkt->tcp_ack =3D 0;
> -    pkt->seq_end =3D 0;
> -    pkt->header_size =3D 0;
> -    pkt->payload_size =3D 0;
> -    pkt->offset =3D 0;
> -    pkt->flags =3D 0;
> +
> +    return pkt;
> +}
> +
> +/*
> + * packet_new_nocopy will not copy data, so the caller can't release
> + * the data. And it will be released in packet_destroy.
> + */
> +Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len) {
> +    Packet *pkt =3D g_slice_new0(Packet);
> +
> +    pkt->data =3D data;
> +    pkt->size =3D size;
> +    pkt->creation_ms =3D qemu_clock_get_ms(QEMU_CLOCK_HOST);
> +    pkt->vnet_hdr_len =3D vnet_hdr_len;
>=20
>      return pkt;
>  }
> diff --git a/net/colo.h b/net/colo.h
> index 573ab91..d91cd24 100644
> --- a/net/colo.h
> +++ b/net/colo.h
> @@ -101,6 +101,7 @@ bool connection_has_tracked(GHashTable
> *connection_track_table,
>                              ConnectionKey *key);  void
> connection_hashtable_reset(GHashTable *connection_track_table);  Packet
> *packet_new(const void *data, int size, int vnet_hdr_len);
> +Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len);
>  void packet_destroy(void *opaque, void *user_data);  void
> packet_destroy_partial(void *opaque, void *user_data);
>=20
> diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c index 10fe393.=
.cb3a96c
> 100644
> --- a/net/filter-rewriter.c
> +++ b/net/filter-rewriter.c
> @@ -270,8 +270,7 @@ static ssize_t
> colo_rewriter_receive_iov(NetFilterState *nf,
>          vnet_hdr_len =3D nf->netdev->vnet_hdr_len;
>      }
>=20
> -    pkt =3D packet_new(buf, size, vnet_hdr_len);
> -    g_free(buf);
> +    pkt =3D packet_new_nocopy(buf, size, vnet_hdr_len);
>=20
>      /*
>       * if we get tcp packet
> --
> 1.8.3.1


