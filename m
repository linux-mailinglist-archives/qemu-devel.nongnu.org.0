Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E3A3ECCD7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 04:59:37 +0200 (CEST)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFSqe-0004NV-7o
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 22:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mFSpq-0003hp-CL
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 22:58:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mFSpo-0007ZG-IG
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 22:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629082723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yCulImQwEo8sFrufWK0opLuBCIZBlf1kCHDdL534lvs=;
 b=Fu3IXShXdjTm7IZ4ous4mJtga890FbvBYN9itoCd4uybzvfQ1LfmKNrsLPuasyjY3T3cRN
 9CxQpqyQ6SbiPG51iJrizvvSFFUYk81Lv2CJF4W8Bd9SB/Mj6U3oDEj7Jz6E0TApmKTmXu
 DkRX+dCY5P0ytP/3wl8NY58ASwgMNcw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-jekf02j4OKKyIVzFDY9ZzQ-1; Sun, 15 Aug 2021 22:58:42 -0400
X-MC-Unique: jekf02j4OKKyIVzFDY9ZzQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 ns7-20020a17090b250700b0017942fa12a8so5703098pjb.6
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 19:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=yCulImQwEo8sFrufWK0opLuBCIZBlf1kCHDdL534lvs=;
 b=DNPU497NDBhf0iHvyUwyiwaVAwJnqY+lbhQhnewK5s73/Cxzac4Wum4AD81Asjz4Hs
 wh5bvkL/zTvMvyoidi7sljQPmuX0azrCo9E4nOSQlKd67roavfxoOVzta36zOqcZRWwa
 jBHdl4bznSA9lTB8g2x70Idl4Odm5Q/pOsJEsa9szEgbCPtkohS2TGnSlOPj1WEcsuy5
 xkeyjrqG1GGxVpCq2hfFKLyDB/6zGEbfmGSAbaMZiJPBJJk2BEBe5wJy1dGjges2vQSS
 aqN9UNLDabsNRJ6+BR4OJhXWsHGYts+cLVSQgmQYMrOb2647NbhAvIJhfSJUxig///yh
 mFhQ==
X-Gm-Message-State: AOAM530aAtcc254k4p++gOTXbezEm4XW6Ow6Lkd++r5vvbF7AvqhcVC6
 s5E9al/BrnmJWk5x7eQiX1anPiixngMlrbkI2b13J+VG24Q6IC0sgXLCzsvArR9BiXSX25Z0IM2
 tn2R3fxUX8wl/Ll434EOfQ9AWVU4ZULswrDMlSJohHFEJ6w2pSNbbae73j/9146Ceing=
X-Received: by 2002:a17:902:c202:b029:12d:65b0:fd3b with SMTP id
 2-20020a170902c202b029012d65b0fd3bmr11446419pll.25.1629082721183; 
 Sun, 15 Aug 2021 19:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbGtoSOuv4FpVxgEtQmRlcgkFzGRFc2rJEiKoaFqRLqEr4qgiISCqrfc7qNzv9Oiv8KTlN0A==
X-Received: by 2002:a17:902:c202:b029:12d:65b0:fd3b with SMTP id
 2-20020a170902c202b029012d65b0fd3bmr11446394pll.25.1629082720670; 
 Sun, 15 Aug 2021 19:58:40 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q18sm9552865pfj.178.2021.08.15.19.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 19:58:40 -0700 (PDT)
Subject: Re: [PATCH] net/colo: check vnet_hdr_support flag when using
 virtio-net
To: Tao Xu <tao3.xu@intel.com>, chen.zhang@intel.com, lizhijian@cn.fujitsu.com
References: <20210806060837.62774-1-tao3.xu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <60604ba9-73e2-5ce1-e005-6c23e22d9341@redhat.com>
Date: Mon, 16 Aug 2021 10:58:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210806060837.62774-1-tao3.xu@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-2.147, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/8/6 ÏÂÎç2:08, Tao Xu Ð´µÀ:
> When COLO use only one vnet_hdr_support parameter between
> COLO network filter(filter-mirror, filter-redirector or
> filter-rewriter and colo-compare, packet will not be parsed
> correctly. Acquire network driver related to COLO, if it is
> nirtio-net, check vnet_hdr_support flag of COLO network filter
> and colo-compare.
>
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>   net/colo-compare.c    | 25 +++++++++++++++++++++++++
>   net/colo.c            | 20 ++++++++++++++++++++
>   net/colo.h            |  4 ++++
>   net/filter-mirror.c   | 17 +++++++++++++++++
>   net/filter-rewriter.c |  9 +++++++++
>   5 files changed, 75 insertions(+)
>
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index b100e7b51f..bc1cc951c0 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -838,6 +838,23 @@ static int compare_chr_can_read(void *opaque)
>       return COMPARE_READ_LEN_MAX;
>   }
>   
> +/* check vnet_hdr_support flag through COLO filter modules */
> +static int colo_vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp)
> +{
> +    const char *colo_obj_type;
> +
> +    colo_obj_type = qemu_opt_get(opts, "qom-type");
> +
> +    if (strcmp(colo_obj_type, "filter-mirror") == 0 ||
> +        strcmp(colo_obj_type, "filter-redirector") == 0 ||
> +        strcmp(colo_obj_type, "filter-rewriter") == 0) {
> +        if (qemu_opt_get(opts, "vnet_hdr_support")) {
> +            return 1;
> +        }
> +    }
> +    return 0;
> +}
> +
>   /*
>    * Called from the main thread on the primary for packets
>    * arriving over the socket from the primary.
> @@ -1289,6 +1306,14 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
>           return;
>       }
>   
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("object"),
> +                          colo_vnet_driver_check, NULL, NULL)) {
> +        error_setg(errp, "colo compare needs 'vnet_hdr_support' "
> +                   "when colo filter modules work on virtio-net");
> +        return;
> +    }


I wonder if we can detect virtio-net and apply vnet_hdr automatically.

Thanks


> +
>       net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet_hdr);
>       net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize, s->vnet_hdr);
>   
> diff --git a/net/colo.c b/net/colo.c
> index 3a3e6e89a0..4a03780f45 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -243,3 +243,23 @@ bool connection_has_tracked(GHashTable *connection_track_table,
>   
>       return conn ? true : false;
>   }
> +
> +/* check the network driver related to COLO, return 1 if it is virtio-net */
> +int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp)
> +{
> +    const char *driver_type, *netdev_from_driver;
> +    char *netdev_from_filter = (char *)opaque;
> +
> +    driver_type = qemu_opt_get(opts, "driver");
> +    netdev_from_driver = qemu_opt_get(opts, "netdev");
> +
> +    if (!driver_type || !netdev_from_driver || !netdev_from_filter) {
> +        return 0;
> +    }
> +
> +    if (g_str_has_prefix(driver_type, "virtio-net") &&
> +        strcmp(netdev_from_driver, netdev_from_filter) == 0) {
> +        return 1;
> +    }
> +    return 0;
> +}
> diff --git a/net/colo.h b/net/colo.h
> index d91cd245c4..d401fc76b6 100644
> --- a/net/colo.h
> +++ b/net/colo.h
> @@ -18,6 +18,9 @@
>   #include "qemu/jhash.h"
>   #include "qemu/timer.h"
>   #include "net/eth.h"
> +#include "qemu/option.h"
> +#include "qemu/option_int.h"
> +#include "qemu/config-file.h"
>   
>   #define HASHTABLE_MAX_SIZE 16384
>   
> @@ -104,5 +107,6 @@ Packet *packet_new(const void *data, int size, int vnet_hdr_len);
>   Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len);
>   void packet_destroy(void *opaque, void *user_data);
>   void packet_destroy_partial(void *opaque, void *user_data);
> +int vnet_driver_check(void *opaque, QemuOpts *opts, Error **errp);
>   
>   #endif /* NET_COLO_H */
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> index f20240cc9f..b8b3f2fe1d 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -12,6 +12,7 @@
>   #include "qemu/osdep.h"
>   #include "net/filter.h"
>   #include "net/net.h"
> +#include "net/colo.h"
>   #include "qapi/error.h"
>   #include "qom/object.h"
>   #include "qemu/main-loop.h"
> @@ -224,6 +225,14 @@ static void filter_mirror_setup(NetFilterState *nf, Error **errp)
>           return;
>       }
>   
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                         vnet_driver_check, nf->netdev_id, NULL)) {
> +        error_setg(errp, "filter mirror needs 'vnet_hdr_support' "
> +                   "when network driver is virtio-net");
> +        return;
> +    }
> +
>       qemu_chr_fe_init(&s->chr_out, chr, errp);
>   }
>   
> @@ -252,6 +261,14 @@ static void filter_redirector_setup(NetFilterState *nf, Error **errp)
>           }
>       }
>   
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                         vnet_driver_check, nf->netdev_id, NULL)) {
> +        error_setg(errp, "filter redirector needs 'vnet_hdr_support' "
> +                   "when network driver is virtio-net");
> +        return;
> +    }
> +
>       net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
>   
>       if (s->indev) {
> diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
> index cb3a96cde1..0e84eac1f8 100644
> --- a/net/filter-rewriter.c
> +++ b/net/filter-rewriter.c
> @@ -14,6 +14,7 @@
>   #include "colo.h"
>   #include "net/filter.h"
>   #include "net/net.h"
> +#include "qapi/error.h"
>   #include "qemu/error-report.h"
>   #include "qom/object.h"
>   #include "qemu/main-loop.h"
> @@ -388,6 +389,14 @@ static void colo_rewriter_setup(NetFilterState *nf, Error **errp)
>   {
>       RewriterState *s = FILTER_REWRITER(nf);
>   
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                         vnet_driver_check, nf->netdev_id, NULL)) {
> +        error_setg(errp, "filter rewriter needs 'vnet_hdr_support' "
> +                   "when network driver is virtio-net");
> +        return;
> +    }
> +
>       s->connection_track_table = g_hash_table_new_full(connection_key_hash,
>                                                         connection_key_equal,
>                                                         g_free,


