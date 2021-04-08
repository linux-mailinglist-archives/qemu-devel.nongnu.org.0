Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05897357BD0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 07:25:35 +0200 (CEST)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUNAc-0000Hx-24
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 01:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUN8K-00074z-9b
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 01:23:14 -0400
Received: from mga14.intel.com ([192.55.52.115]:2252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lUN8F-0003E1-O3
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 01:23:12 -0400
IronPort-SDR: 63uKVEsDpc4RMJIEhtU1xxP4yBtzscXwYlsR310qQXiSMYj/hkkr5QQF037HNUDskoxV31HeJ3
 JYmWBUeUAtKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="193002173"
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="193002173"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 22:23:05 -0700
IronPort-SDR: kXKW9p2KE5NSuloLz+tKlSur8NC3IVaD9cSzHsZaNIVVxvBQ491l5vZM1HUb843UZrmLPw+80f
 3R6S/dG6FiLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="419023777"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga007.jf.intel.com with ESMTP; 07 Apr 2021 22:23:05 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 22:23:04 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 13:23:03 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Thu, 8 Apr 2021 13:23:03 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Rao, Lei" <lei.rao@intel.com>, "lizhijian@cn.fujitsu.com"
 <lizhijian@cn.fujitsu.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "lukasstraub2@web.de" <lukasstraub2@web.de>
Subject: RE: [PATCH v5 03/10] Optimize the function of filter_send
Thread-Topic: [PATCH v5 03/10] Optimize the function of filter_send
Thread-Index: AQHXJs6Eq6yX/xB+eU6wL96Kho3L7aqqIMZw
Date: Thu, 8 Apr 2021 05:23:02 +0000
Message-ID: <c99ef124caaf40179a5a6580818e5843@intel.com>
References: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
 <1617263249-54501-4-git-send-email-lei.rao@intel.com>
In-Reply-To: <1617263249-54501-4-git-send-email-lei.rao@intel.com>
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
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
> Subject: [PATCH v5 03/10] Optimize the function of filter_send
>=20
> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> The iov_size has been calculated in filter_send(). we can directly return=
 the
> size.In this way, this is no need to repeat calculations in
> filter_redirector_receive_iov();
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>

Reviewed-by: Zhang Chen <chen.zhang@intel.com>

> ---
>  net/filter-mirror.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c index f8e6500..f20=
240c
> 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -88,7 +88,7 @@ static int filter_send(MirrorState *s,
>          goto err;
>      }
>=20
> -    return 0;
> +    return size;
>=20
>  err:
>      return ret < 0 ? ret : -EIO;
> @@ -159,7 +159,7 @@ static ssize_t filter_mirror_receive_iov(NetFilterSta=
te
> *nf,
>      int ret;
>=20
>      ret =3D filter_send(s, iov, iovcnt);
> -    if (ret) {
> +    if (ret < 0) {
>          error_report("filter mirror send failed(%s)", strerror(-ret));
>      }
>=20
> @@ -182,10 +182,10 @@ static ssize_t
> filter_redirector_receive_iov(NetFilterState *nf,
>=20
>      if (qemu_chr_fe_backend_connected(&s->chr_out)) {
>          ret =3D filter_send(s, iov, iovcnt);
> -        if (ret) {
> +        if (ret < 0) {
>              error_report("filter redirector send failed(%s)", strerror(-=
ret));
>          }
> -        return iov_size(iov, iovcnt);
> +        return ret;
>      } else {
>          return 0;
>      }
> --
> 1.8.3.1


