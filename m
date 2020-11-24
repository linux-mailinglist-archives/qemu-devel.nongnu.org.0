Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B882C2017
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 09:34:37 +0100 (CET)
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khTmV-0000bE-NN
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 03:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khTlO-00009V-6v
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 03:33:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khTlI-0003zH-1q
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 03:33:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606206797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnAYmsPViEhqN2m37FNkFkq8Xbc6dXJNG2pIYQG2UAU=;
 b=gDMaR+ttl0SxFJTVzjunQ2CxKI7S+RmN5w5sqWlKJdIQFh0a7DmDMqWq9pWdgKstqUKBbk
 3EebyWJlXP5joQPDYvjuzn/XR92zXLzhG3rNug9g53uPH9uljOUsJvtruanRN3QopWfco4
 g/yh9ht6cn4XdaQS9sYeMKF0aZw7uDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-js8eqwcNPJi6Nxxi0ig05g-1; Tue, 24 Nov 2020 03:33:14 -0500
X-MC-Unique: js8eqwcNPJi6Nxxi0ig05g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB55B9CC12;
 Tue, 24 Nov 2020 08:33:12 +0000 (UTC)
Received: from [10.72.13.120] (ovpn-13-120.pek2.redhat.com [10.72.13.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CB1F5C1A3;
 Tue, 24 Nov 2020 08:33:05 +0000 (UTC)
Subject: Re: [RFC PATCH v2 3/5] ebpf: Added eBPF RSS loader.
To: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com
References: <20201119111305.485202-1-andrew@daynix.com>
 <20201119111305.485202-4-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cb43f9bf-13e4-9ff2-2cf0-b1bd2848edf3@redhat.com>
Date: Tue, 24 Nov 2020 16:33:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119111305.485202-4-andrew@daynix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/19 下午7:13, Andrew Melnychenko wrote:
> From: Andrew <andrew@daynix.com>
>
> Added function that loads RSS eBPF program.
> Added stub functions for RSS eBPF loader.
> Added meson and configuration options.
>
> By default, eBPF feature enabled if libbpf is present in the build system.
> libbpf checked in configuration shell script and meson script.
>
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>   configure            |  33 ++++++++
>   ebpf/ebpf_rss-stub.c |  40 +++++++++
>   ebpf/ebpf_rss.c      | 187 +++++++++++++++++++++++++++++++++++++++++++
>   ebpf/ebpf_rss.h      |  44 ++++++++++
>   ebpf/meson.build     |   1 +
>   ebpf/trace-events    |   4 +
>   ebpf/trace.h         |   2 +
>   meson.build          |  11 +++
>   8 files changed, 322 insertions(+)
>   create mode 100644 ebpf/ebpf_rss-stub.c
>   create mode 100644 ebpf/ebpf_rss.c
>   create mode 100644 ebpf/ebpf_rss.h
>   create mode 100644 ebpf/meson.build
>   create mode 100644 ebpf/trace-events
>   create mode 100644 ebpf/trace.h
>
> diff --git a/configure b/configure
> index 6df4306c88..97455950f6 100755
> --- a/configure
> +++ b/configure
> @@ -330,6 +330,7 @@ vhost_scsi=""
>   vhost_vsock=""
>   vhost_user=""
>   vhost_user_fs=""
> +bpf=""
>   kvm="auto"
>   hax="auto"
>   hvf="auto"
> @@ -1210,6 +1211,10 @@ for opt do
>     ;;
>     --enable-membarrier) membarrier="yes"
>     ;;
> +  --disable-bpf) bpf="no"
> +  ;;
> +  --enable-bpf) bpf="yes"
> +  ;;
>     --disable-blobs) blobs="false"
>     ;;
>     --with-pkgversion=*) pkgversion="$optarg"
> @@ -1792,6 +1797,7 @@ disabled with --disable-FEATURE, default is enabled if available:
>     vhost-kernel    vhost kernel backend support
>     vhost-user      vhost-user backend support
>     vhost-vdpa      vhost-vdpa kernel backend support
> +  bpf             BPF kernel support
>     spice           spice
>     rbd             rados block device (rbd)
>     libiscsi        iscsi support
> @@ -5347,6 +5353,30 @@ else
>       membarrier=no
>   fi
>   
> +##########################################
> +# check for usable bpf system call
> +if test "$bpf" = ""; then
> +    have_bpf=no
> +    if test "$linux" = "yes" -a "$bigendian" != "yes"; then
> +        cat > $TMPC << EOF
> +    #include <stdlib.h>
> +    #include <bpf/libbpf.h>
> +    int main(void) {
> +        struct bpf_object *obj = NULL;
> +        bpf_object__load(obj);


Do we need a test of btf here?


> +        exit(0);
> +    }
> +EOF
> +        if compile_prog "" "-lbpf" ; then
> +            have_bpf=yes
> +            bpf=yes
> +        fi
> +    fi
> +    if test "$have_bpf" = "no"; then
> +      feature_not_found "bpf" "the libbpf is not available"
> +    fi
> +fi
> +
>   ##########################################
>   # check if rtnetlink.h exists and is useful
>   have_rtnetlink=no
> @@ -6279,6 +6309,9 @@ fi
>   if test "$membarrier" = "yes" ; then
>     echo "CONFIG_MEMBARRIER=y" >> $config_host_mak
>   fi
> +if test "$bpf" = "yes" -a "$bigendian" != "yes" -a "$linux" = "yes" ; then
> +  echo "CONFIG_EBPF=y" >> $config_host_mak
> +fi
>   if test "$signalfd" = "yes" ; then
>     echo "CONFIG_SIGNALFD=y" >> $config_host_mak
>   fi
> diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
> new file mode 100644
> index 0000000000..e71e229190
> --- /dev/null
> +++ b/ebpf/ebpf_rss-stub.c
> @@ -0,0 +1,40 @@
> +/*
> + * eBPF RSS stub file
> + *
> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> + *
> + * Authors:
> + *  Yuri Benditovich <yuri.benditovich@daynix.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "ebpf/ebpf_rss.h"
> +
> +void ebpf_rss_init(struct EBPFRSSContext *ctx)
> +{
> +
> +}
> +
> +bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx)
> +{
> +    return false;
> +}
> +
> +bool ebpf_rss_load(struct EBPFRSSContext *ctx)
> +{
> +    return false;
> +}
> +
> +bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
> +                      uint16_t *indirections_table, uint8_t *toeplitz_key)
> +{
> +    return false;
> +}
> +
> +void ebpf_rss_unload(struct EBPFRSSContext *ctx)
> +{
> +
> +}
> diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
> new file mode 100644
> index 0000000000..d07fac6904
> --- /dev/null
> +++ b/ebpf/ebpf_rss.c
> @@ -0,0 +1,187 @@
> +/*
> + * eBPF RSS loader
> + *
> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> + *
> + * Authors:
> + *  Andrew Melnychenko <andrew@daynix.com>
> + *  Yuri Benditovich <yuri.benditovich@daynix.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +
> +#include <bpf/libbpf.h>
> +#include <bpf/bpf.h>
> +
> +#include "hw/virtio/virtio-net.h" /* VIRTIO_NET_RSS_MAX_TABLE_LEN */
> +
> +#include "ebpf/ebpf_rss.h"
> +#include "ebpf/tun_rss_steering.h"
> +#include "trace.h"
> +
> +void ebpf_rss_init(struct EBPFRSSContext *ctx)
> +{
> +    if (ctx != NULL) {
> +        ctx->obj = NULL;
> +    }
> +}
> +
> +bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx)
> +{
> +    return ctx != NULL && ctx->obj != NULL;
> +}
> +
> +bool ebpf_rss_load(struct EBPFRSSContext *ctx)
> +{
> +    struct bpf_object *object = NULL;
> +    struct bpf_program *prog  = NULL;


Unnecessary initialization.


> +
> +    if (ctx == NULL) {
> +        return false;
> +    }
> +
> +    object = bpf_object__open_mem(data_tun_rss_steering,
> +                                  sizeof(data_tun_rss_steering), NULL);
> +    if (object == NULL) {
> +        trace_ebpf_error("eBPF RSS", "can not open eBPF object");
> +        return false;
> +    }
> +
> +    prog = bpf_object__find_program_by_title(object, "tun_rss_steering");
> +    if (prog == NULL) {
> +        trace_ebpf_error("eBPF RSS", "can not find RSS program");
> +        goto l_issue;
> +    }
> +
> +    bpf_program__set_socket_filter(prog);
> +
> +    if (bpf_object__load(object)) {
> +        trace_ebpf_error("eBPF RSS", "can not load RSS program");


It would be useful for getting the verbose log via extack but I'm not 
sure if libbpf support this. If yes, it's better to add the output to 
the trace.


> +        goto l_issue;
> +    }
> +
> +    ctx->obj = object;
> +    ctx->program_fd = bpf_program__fd(prog);
> +
> +    ctx->map_configuration =
> +            bpf_object__find_map_fd_by_name(object,
> +                                            "tap_rss_map_configurations");
> +    if (ctx->map_configuration < 0) {
> +        trace_ebpf_error("eBPF RSS", "can not find MAP for configurations");
> +        goto l_issue;
> +    }
> +
> +    ctx->map_toeplitz_key =
> +            bpf_object__find_map_fd_by_name(object,
> +                                            "tap_rss_map_toeplitz_key");
> +    if (ctx->map_toeplitz_key < 0) {
> +        trace_ebpf_error("eBPF RSS", "can not find MAP for toeplitz key");
> +        goto l_issue;
> +    }
> +
> +    ctx->map_indirections_table =
> +            bpf_object__find_map_fd_by_name(object,
> +                                            "tap_rss_map_indirection_table");
> +    if (ctx->map_indirections_table < 0) {
> +        trace_ebpf_error("eBPF RSS", "can not find MAP for indirections table");
> +        goto l_issue;
> +    }
> +
> +    return true;
> +
> +l_issue:
> +    bpf_object__close(object);
> +    ctx->obj = NULL;


Do we need to clean other member of ctx?


> +    return false;
> +}
> +
> +static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
> +                                struct EBPFRSSConfig *config)
> +{
> +    if (!ebpf_rss_is_loaded(ctx)) {
> +        return false;
> +    }
> +    uint32_t map_key = 0;
> +    if (bpf_map_update_elem(ctx->map_configuration,
> +                            &map_key, config, 0) < 0) {
> +        return false;
> +    }
> +    return true;
> +}
> +
> +static bool ebpf_rss_set_indirections_table(struct EBPFRSSContext *ctx,
> +                                            uint16_t *indirections_table,
> +                                            size_t len)
> +{
> +    if (!ebpf_rss_is_loaded(ctx) || indirections_table == NULL ||
> +       len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
> +        return false;
> +    }
> +    uint32_t i = 0;
> +
> +    for (; i < len; ++i) {
> +        if (bpf_map_update_elem(ctx->map_indirections_table, &i,
> +                                indirections_table + i, 0) < 0) {
> +            return false;
> +        }
> +    }


Do we need to delete the elem in the range of [i, len)?


> +    return true;
> +}
> +
> +static bool ebpf_rss_set_toepliz_key(struct EBPFRSSContext *ctx,
> +                                     uint8_t *toeplitz_key)
> +{
> +    if (!ebpf_rss_is_loaded(ctx) || toeplitz_key == NULL) {
> +        return false;
> +    }
> +    uint32_t map_key = 0;
> +
> +    /* prepare toeplitz key */
> +    uint8_t toe[VIRTIO_NET_RSS_MAX_KEY_SIZE] = {};


Compilers may warn about such declaration after statement.


> +    memcpy(toe, toeplitz_key, VIRTIO_NET_RSS_MAX_KEY_SIZE);
> +    *(uint32_t *)toe = ntohl(*(uint32_t *)toe);
> +
> +    if (bpf_map_update_elem(ctx->map_toeplitz_key, &map_key, toe,
> +                            0) < 0) {
> +        return false;
> +    }
> +    return true;
> +}
> +
> +bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
> +                      uint16_t *indirections_table, uint8_t *toeplitz_key)
> +{
> +    if (!ebpf_rss_is_loaded(ctx) || config == NULL ||
> +        indirections_table == NULL || toeplitz_key == NULL) {
> +        return false;
> +    }
> +
> +    if (!ebpf_rss_set_config(ctx, config)) {
> +        return false;
> +    }
> +
> +    if (!ebpf_rss_set_indirections_table(ctx, indirections_table,
> +                                      config->indirections_len)) {
> +        return false;
> +    }
> +
> +    if (!ebpf_rss_set_toepliz_key(ctx, toeplitz_key)) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +void ebpf_rss_unload(struct EBPFRSSContext *ctx)
> +{
> +    if (!ebpf_rss_is_loaded(ctx)) {
> +        return;
> +    }
> +
> +    bpf_object__close(ctx->obj);
> +    ctx->obj = NULL;
> +}
> diff --git a/ebpf/ebpf_rss.h b/ebpf/ebpf_rss.h
> new file mode 100644
> index 0000000000..0fcb4e010f
> --- /dev/null
> +++ b/ebpf/ebpf_rss.h
> @@ -0,0 +1,44 @@
> +/*
> + * eBPF RSS header
> + *
> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> + *
> + * Authors:
> + *  Andrew Melnychenko <andrew@daynix.com>
> + *  Yuri Benditovich <yuri.benditovich@daynix.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#ifndef QEMU_EBPF_RSS_H
> +#define QEMU_EBPF_RSS_H
> +
> +struct EBPFRSSContext {
> +    void *obj;
> +    int program_fd;
> +    int map_configuration;
> +    int map_toeplitz_key;
> +    int map_indirections_table;
> +};
> +
> +struct EBPFRSSConfig {
> +    uint8_t redirect;
> +    uint8_t populate_hash;
> +    uint32_t hash_types;
> +    uint16_t indirections_len;
> +    uint16_t default_queue;
> +};
> +
> +void ebpf_rss_init(struct EBPFRSSContext *ctx);
> +
> +bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx);
> +
> +bool ebpf_rss_load(struct EBPFRSSContext *ctx);
> +
> +bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
> +                      uint16_t *indirections_table, uint8_t *toeplitz_key);
> +
> +void ebpf_rss_unload(struct EBPFRSSContext *ctx);
> +
> +#endif /* QEMU_EBPF_RSS_H */
> diff --git a/ebpf/meson.build b/ebpf/meson.build
> new file mode 100644
> index 0000000000..f5bd5a0f01
> --- /dev/null
> +++ b/ebpf/meson.build
> @@ -0,0 +1 @@
> +common_ss.add(when: 'CONFIG_EBPF', if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
> diff --git a/ebpf/trace-events b/ebpf/trace-events
> new file mode 100644
> index 0000000000..411b1e2be3
> --- /dev/null
> +++ b/ebpf/trace-events
> @@ -0,0 +1,4 @@
> +# See docs/devel/tracing.txt for syntax documentation.
> +
> +# ebpf-rss.c
> +ebpf_error(const char *s1, const char *s2) "error in %s: %s"
> diff --git a/ebpf/trace.h b/ebpf/trace.h
> new file mode 100644
> index 0000000000..ad570e6691
> --- /dev/null
> +++ b/ebpf/trace.h
> @@ -0,0 +1,2 @@
> +#include "trace/trace-ebpf.h"
> +
> diff --git a/meson.build b/meson.build
> index 47e32e1fcb..374ec88c2e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -736,6 +736,12 @@ if not has_malloc_trim and get_option('malloc_trim').enabled()
>     endif
>   endif
>   
> +# libbpf
> +libbpf = not_found
> +if 'CONFIG_EBPF' in config_host
> +  libbpf = cc.find_library('bpf', required: true)
> +endif
> +
>   #################
>   # config-host.h #
>   #################
> @@ -1368,6 +1374,7 @@ if have_system
>       'backends',
>       'backends/tpm',
>       'chardev',
> +    'ebpf',
>       'hw/9pfs',
>       'hw/acpi',
>       'hw/alpha',
> @@ -1530,6 +1537,9 @@ subdir('accel')
>   subdir('plugins')
>   subdir('bsd-user')
>   subdir('linux-user')
> +subdir('ebpf')
> +
> +common_ss.add(libbpf)
>   
>   bsd_user_ss.add(files('gdbstub.c'))
>   specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
> @@ -2093,6 +2103,7 @@ summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK'
>   summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_KERNEL')}
>   summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
>   summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
> +summary_info += {'bpf support': config_host.has_key('CONFIG_EBPF')}
>   summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
>   if config_host['TRACE_BACKENDS'].split().contains('simple')
>     summary_info += {'Trace output file': config_host['CONFIG_TRACE_FILE'] + '-<pid>'}


