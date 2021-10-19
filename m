Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A830433052
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:00:58 +0200 (CEST)
Received: from localhost ([::1]:33644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mck3N-00073s-JW
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mcji9-000066-KM
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mcji6-0001gt-1v
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634629137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIXgp1se4AnKy26+DcQbHVRD5UV9zdHAPLjmVLP5pvY=;
 b=B6uJiChzeFJVZmLJDB8ukPJGDg/cMapHSlA/JP+Y8K+1JTXSVPZLlv+Qc2/3xChwCwfFaG
 cVdz/+vHZ2JZ+Z/dSpS4mAOFlagwkMEtqO+cz+jNL79L3M/EFIi28s5sje7fPiyQ1Ibdmy
 igPJq1sLEwm7hHKVsfL0mjINTL1H3Gs=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-HsdwX5REMFmeGYtlIiOA3A-1; Tue, 19 Oct 2021 03:38:56 -0400
X-MC-Unique: HsdwX5REMFmeGYtlIiOA3A-1
Received: by mail-pf1-f198.google.com with SMTP id
 d10-20020a621d0a000000b0044ca56b97f5so10546020pfd.2
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 00:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VIXgp1se4AnKy26+DcQbHVRD5UV9zdHAPLjmVLP5pvY=;
 b=LpbQhF+qDJLDunf4evh4W24a/2q2Q0Am2pT+qXA9wYRjoVy39WmMxcHmlntnG/l/nk
 pa2MbnvY8gx1ueqZDN6OVqPFzq/wXRWZCIVDpSxWC6+CYzougtPe6KO9qz5+3YFz23Ee
 yqAugVzUMx7FE58+8PFqGnQIRcSxb6JhDRQT6Rc8Gdi4aSlcxJ4d33unLnugBPJiuTva
 puAvnVV/iaWbYy1kWigTIZZkeF009IZIRDi31kBHSxZOaiAWyf9EC2XFG07KtMT6geQn
 r/XxCFuCafvAZYNjQOp41fZOFv0XoexxBqaHNWR5S/QdzsvXpmcuN5YBz/mc95RGQmEW
 bT9g==
X-Gm-Message-State: AOAM531LaDK+epTVu93fPJ9isaoDMZrzOiNz5mYF61Qq5U9Meyiiavkw
 2TM7GOEBts/wpzLv9oz/pE6nSKizvqKJO9cnPAga4IHgt2pkBCnHaY0/hNOCGUydP4kr17/B1j9
 yk45XcecwKYPQzZU=
X-Received: by 2002:a62:3287:0:b0:439:bfec:8374 with SMTP id
 y129-20020a623287000000b00439bfec8374mr33760695pfy.15.1634629134975; 
 Tue, 19 Oct 2021 00:38:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB5SpGNkOtIc9Bh24vj6V3HnHK8L1ROFoOWjehlSlBGl5Fg+axGjO00tAf6n7L1iiyo/vFqg==
X-Received: by 2002:a62:3287:0:b0:439:bfec:8374 with SMTP id
 y129-20020a623287000000b00439bfec8374mr33760664pfy.15.1634629134568; 
 Tue, 19 Oct 2021 00:38:54 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id u24sm9663603pgo.73.2021.10.19.00.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 00:38:53 -0700 (PDT)
Subject: Re: [PATCH V3] net/colo: check vnet_hdr_support flag when using
 virtio-net
To: Zhang Chen <chen.zhang@intel.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210918020437.1822937-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3f1ead6c-4429-3edc-75cd-d48ecac317fc@redhat.com>
Date: Tue, 19 Oct 2021 15:38:45 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210918020437.1822937-1-chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Tao Xu <tao3.xu@intel.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/9/18 ÉÏÎç10:04, Zhang Chen Ð´µÀ:
> When COLO use only one vnet_hdr_support parameter between
> COLO network filter(filter-mirror, filter-redirector or
> filter-rewriter and colo-compare, packet will not be parsed
> correctly. Acquire network driver related to COLO, if it is
> nirtio-net,


Typo.


>   check vnet_hdr_support flag of COLO network filter
> and colo-compare.
>
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>
> Changelog:
> v3:
>      Fix some typos.
>      Rebased for Qemu 6.2.
>
> v2:
>      Detect virtio-net driver and apply vnet_hdr_support
>      automatically. (Jason)
> ---
>   net/colo-compare.c    | 57 +++++++++++++++++++++++++++++++++++++++++++
>   net/colo.c            | 20 +++++++++++++++
>   net/colo.h            |  4 +++
>   net/filter-mirror.c   | 21 ++++++++++++++++
>   net/filter-rewriter.c | 10 ++++++++
>   qapi/qom.json         |  6 +++++
>   qemu-options.hx       |  6 +++--
>   7 files changed, 122 insertions(+), 2 deletions(-)
>
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index b100e7b51f..870bd05a41 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -110,6 +110,7 @@ struct CompareState {
>       char *sec_indev;
>       char *outdev;
>       char *notify_dev;
> +    char *netdev;
>       CharBackend chr_pri_in;
>       CharBackend chr_sec_in;
>       CharBackend chr_out;
> @@ -838,6 +839,28 @@ static int compare_chr_can_read(void *opaque)
>       return COMPARE_READ_LEN_MAX;
>   }
>   
> +static int colo_set_default_netdev(void *opaque, QemuOpts *opts, Error **errp)
> +{
> +    const char *colo_obj_type, *netdev_from_filter;
> +    char **netdev = (char **)opaque;
> +
> +    colo_obj_type = qemu_opt_get(opts, "qom-type");
> +
> +    if (colo_obj_type &&
> +        (strcmp(colo_obj_type, "filter-mirror") == 0 ||
> +         strcmp(colo_obj_type, "filter-redirector") == 0 ||
> +         strcmp(colo_obj_type, "filter-rewriter") == 0)) {
> +        netdev_from_filter = qemu_opt_get(opts, "netdev");
> +        if (*netdev == NULL) {
> +            *netdev = g_strdup(netdev_from_filter);
> +        } else if (strcmp(*netdev, netdev_from_filter) != 0) {
> +            warn_report("%s is using a different netdev from other COLO "
> +                        "component", colo_obj_type);
> +        }
> +    }
> +    return 0;
> +}
> +
>   /*
>    * Called from the main thread on the primary for packets
>    * arriving over the socket from the primary.
> @@ -1050,6 +1073,21 @@ static void compare_set_vnet_hdr(Object *obj,
>       s->vnet_hdr = value;
>   }
>   
> +static char *compare_get_netdev(Object *obj, Error **errp)
> +{
> +    CompareState *s = COLO_COMPARE(obj);
> +
> +    return g_strdup(s->netdev);
> +}
> +
> +static void compare_set_netdev(Object *obj, const char *value, Error **errp)
> +{
> +    CompareState *s = COLO_COMPARE(obj);
> +
> +    g_free(s->netdev);
> +    s->netdev = g_strdup(value);
> +}
> +
>   static char *compare_get_notify_dev(Object *obj, Error **errp)
>   {
>       CompareState *s = COLO_COMPARE(obj);
> @@ -1274,6 +1312,12 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
>           max_queue_size = MAX_QUEUE_SIZE;
>       }
>   
> +    if (!s->netdev) {
> +        /* Set default netdev as the first colo netfilter found */
> +        qemu_opts_foreach(qemu_find_opts("object"),
> +                          colo_set_default_netdev, &s->netdev, NULL);
> +    }
> +
>       if (find_and_check_chardev(&chr, s->pri_indev, errp) ||
>           !qemu_chr_fe_init(&s->chr_pri_in, chr, errp)) {
>           return;
> @@ -1289,6 +1333,16 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
>           return;
>       }
>   
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                          vnet_driver_check, s->netdev, NULL)) {
> +        /*
> +         * colo compare needs 'vnet_hdr_support' when it works on virtio-net,
> +         * add 'vnet_hdr_support' automatically
> +         */
> +        s->vnet_hdr = true;
> +    }
> +
>       net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet_hdr);
>       net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize, s->vnet_hdr);
>   
> @@ -1400,6 +1454,9 @@ static void colo_compare_init(Object *obj)
>       s->vnet_hdr = false;
>       object_property_add_bool(obj, "vnet_hdr_support", compare_get_vnet_hdr,
>                                compare_set_vnet_hdr);
> +    /* colo compare can't varify that netdev is correct */
> +    object_property_add_str(obj, "netdev", compare_get_netdev,
> +                            compare_set_netdev);
>   }
>   
>   void colo_compare_cleanup(void)
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
> index f20240cc9f..69ca9c9839 100644
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
> @@ -224,6 +225,16 @@ static void filter_mirror_setup(NetFilterState *nf, Error **errp)
>           return;
>       }
>   
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                          vnet_driver_check, nf->netdev_id, NULL)) {
> +        /*
> +         * filter mirror needs 'vnet_hdr_support' when colo filter modules
> +         * work on virtio-net, add 'vnet_hdr_support' automatically
> +         */
> +        s->vnet_hdr = true;
> +    }
> +
>       qemu_chr_fe_init(&s->chr_out, chr, errp);
>   }
>   
> @@ -252,6 +263,16 @@ static void filter_redirector_setup(NetFilterState *nf, Error **errp)
>           }
>       }
>   
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                          vnet_driver_check, nf->netdev_id, NULL)) {
> +        /*
> +         * filter redirector needs 'vnet_hdr_support' when colo filter modules
> +         * work on virtio-net, add 'vnet_hdr_support' automatically
> +         */
> +        s->vnet_hdr = true;
> +    }
> +
>       net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
>   
>       if (s->indev) {
> diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
> index cb3a96cde1..637ef4ce71 100644
> --- a/net/filter-rewriter.c
> +++ b/net/filter-rewriter.c
> @@ -388,6 +388,16 @@ static void colo_rewriter_setup(NetFilterState *nf, Error **errp)
>   {
>       RewriterState *s = FILTER_REWRITER(nf);
>   
> +    if (!s->vnet_hdr &&
> +        qemu_opts_foreach(qemu_find_opts("device"),
> +                          vnet_driver_check, nf->netdev_id, NULL)) {
> +        /*
> +         * filter rewriter needs 'vnet_hdr_support' when colo filter modules
> +         * work on virtio-net, add 'vnet_hdr_support' automatically
> +         */
> +        s->vnet_hdr = true;
> +    }
> +
>       s->connection_track_table = g_hash_table_new_full(connection_key_hash,
>                                                         connection_key_equal,
>                                                         g_free,
> diff --git a/qapi/qom.json b/qapi/qom.json
> index a25616bc7a..5760107160 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -241,6 +241,11 @@
>   # @notify_dev: name of the character device backend to be used to communicate
>   #              with the remote colo-frame (only for Xen COLO)
>   #
> +# @netdev: id of the network device backend to colo-compare. Although
> +#          colo-compare doesn't depend on network device directly, this
> +#          parameter helps colo-compare know what network driver it is
> +#          working on.(since 6.2)


This looks kind of not elegant. We don't want to couple COLO with netdev.

I wonder if we can do this without adding netdev.

Thanks


> +#
>   # @compare_timeout: the maximum time to hold a packet from @primary_in for
>   #                   comparison with an incoming packet on @secondary_in in
>   #                   milliseconds (default: 3000)
> @@ -264,6 +269,7 @@
>               'outdev': 'str',
>               'iothread': 'str',
>               '*notify_dev': 'str',
> +            '*netdev': 'str',
>               '*compare_timeout': 'uint64',
>               '*expired_scan_cycle': 'uint32',
>               '*max_queue_size': 'uint32',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8f603cc7e6..250937fbbf 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4964,12 +4964,14 @@ SRST
>           stored. The file format is libpcap, so it can be analyzed with
>           tools such as tcpdump or Wireshark.
>   
> -    ``-object colo-compare,id=id,primary_in=chardevid,secondary_in=chardevid,outdev=chardevid,iothread=id[,vnet_hdr_support][,notify_dev=id][,compare_timeout=@var{ms}][,expired_scan_cycle=@var{ms}][,max_queue_size=@var{size}]``
> +    ``-object colo-compare,id=id,primary_in=chardevid,secondary_in=chardevid,outdev=chardevid,iothread=id[,netdev=netdevid][,vnet_hdr_support][,notify_dev=id][,compare_timeout=@var{ms}][,expired_scan_cycle=@var{ms}][,max_queue_size=@var{size}]``
>           Colo-compare gets packet from primary\_in chardevid and
>           secondary\_in, then compare whether the payload of primary packet
>           and secondary packet are the same. If same, it will output
>           primary packet to out\_dev, else it will notify COLO-framework to do
> -        checkpoint and send primary packet to out\_dev. In order to
> +        checkpoint and send primary packet to out\_dev. Although colo-compare
> +        does not depend on network device directly, netdevid helps
> +        colo-compare know what network driver it is working on. In order to
>           improve efficiency, we need to put the task of comparison in
>           another iothread. If it has the vnet\_hdr\_support flag,
>           colo compare will send/recv packet with vnet\_hdr\_len.


