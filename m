Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487CD6F56F5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 13:08:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puAKg-0001Ak-Oe; Wed, 03 May 2023 07:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puAKe-0001Ab-MY
 for qemu-devel@nongnu.org; Wed, 03 May 2023 07:07:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puAKc-0002le-FL
 for qemu-devel@nongnu.org; Wed, 03 May 2023 07:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683112053;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HATKOEGwD/fuhE0+1XCDqLQjKN4vZn/V1cc+FMZ9M1A=;
 b=ZGspuGW7o4IQ2HsdMjx5hzgvJotWOmRvhdMO9VSgjvLys3+C5DirQEqnk67z59udOIG6nL
 RwuHpnpUQ2KuKpuaCWMSIw+SpYC8PdKDXEVel4i/L7HHhATAUnmxBvCtg0hHktnxNS4G77
 SsL0sMd74fZmTDQj2dTLEJXhXHQFJ94=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-JZYjk_jhO6uJ0A-r4liD7A-1; Wed, 03 May 2023 07:07:32 -0400
X-MC-Unique: JZYjk_jhO6uJ0A-r4liD7A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5312185A790;
 Wed,  3 May 2023 11:07:31 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FF16492C13;
 Wed,  3 May 2023 11:07:30 +0000 (UTC)
Date: Wed, 3 May 2023 12:07:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Cc: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com,
 eblake@redhat.com, qemu-devel@nongnu.org,
 yuri.benditovich@daynix.com, yan@daynix.com
Subject: Re: [PATCH 1/5] ebpf: Added eBPF initialization by fds and map update.
Message-ID: <ZFJAbxERGepAmfZT@redhat.com>
References: <20230501072101.22890-1-andrew@daynix.com>
 <20230501072101.22890-2-andrew@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230501072101.22890-2-andrew@daynix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, May 01, 2023 at 10:20:57AM +0300, Andrew Melnychenko wrote:
> Changed eBPF map updates through mmaped array.
> Mmaped arrays provide direct access to map data.
> It should omit using bpf_map_update_elem() call,
> which may require capabilities that are not present.
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  ebpf/ebpf_rss-stub.c |   6 +++
>  ebpf/ebpf_rss.c      | 120 ++++++++++++++++++++++++++++++++++---------
>  ebpf/ebpf_rss.h      |  10 ++++
>  3 files changed, 113 insertions(+), 23 deletions(-)
> 
> diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
> index e71e229190d..8d7fae2ad92 100644
> --- a/ebpf/ebpf_rss-stub.c
> +++ b/ebpf/ebpf_rss-stub.c
> @@ -28,6 +28,12 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
>      return false;
>  }
>  
> +bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
> +                       int config_fd, int toeplitz_fd, int table_fd)
> +{
> +    return false;
> +}
> +
>  bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
>                        uint16_t *indirections_table, uint8_t *toeplitz_key)
>  {
> diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
> index cee658c158b..08015fecb18 100644
> --- a/ebpf/ebpf_rss.c
> +++ b/ebpf/ebpf_rss.c
> @@ -27,19 +27,68 @@ void ebpf_rss_init(struct EBPFRSSContext *ctx)
>  {
>      if (ctx != NULL) {
>          ctx->obj = NULL;
> +        ctx->program_fd = -1;
>      }
>  }
>  
>  bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx)
>  {
> -    return ctx != NULL && ctx->obj != NULL;
> +    return ctx != NULL && (ctx->obj != NULL || ctx->program_fd != -1);
> +}
> +
> +static bool ebpf_rss_mmap(struct EBPFRSSContext *ctx)
> +{
> +    if (!ebpf_rss_is_loaded(ctx)) {
> +        return false;
> +    }
> +
> +    ctx->mmap_configuration = mmap(NULL, qemu_real_host_page_size(),
> +                                   PROT_READ | PROT_WRITE, MAP_SHARED,
> +                                   ctx->map_configuration, 0);
> +    if (ctx->mmap_configuration == MAP_FAILED) {
> +        trace_ebpf_error("eBPF RSS", "can not mmap eBPF configuration array");
> +        return false;
> +    }
> +    ctx->mmap_toeplitz_key = mmap(NULL, qemu_real_host_page_size(),
> +                                   PROT_READ | PROT_WRITE, MAP_SHARED,
> +                                   ctx->map_toeplitz_key, 0);
> +    if (ctx->mmap_toeplitz_key == MAP_FAILED) {
> +        trace_ebpf_error("eBPF RSS", "can not mmap eBPF toeplitz key");
> +        goto toeplitz_fail;
> +    }
> +    ctx->mmap_indirections_table = mmap(NULL, qemu_real_host_page_size(),
> +                                   PROT_READ | PROT_WRITE, MAP_SHARED,
> +                                   ctx->map_indirections_table, 0);
> +    if (ctx->mmap_indirections_table == MAP_FAILED) {
> +        trace_ebpf_error("eBPF RSS", "can not mmap eBPF indirection table");
> +        goto indirection_fail;
> +    }
> +
> +    return true;
> +
> +indirection_fail:
> +    munmap(ctx->mmap_toeplitz_key, qemu_real_host_page_size());
> +toeplitz_fail:
> +    munmap(ctx->mmap_configuration, qemu_real_host_page_size());
> +    return false;
> +}
> +
> +static void ebpf_rss_munmap(struct EBPFRSSContext *ctx)
> +{
> +    if (!ebpf_rss_is_loaded(ctx)) {
> +        return;
> +    }
> +
> +    munmap(ctx->mmap_indirections_table, qemu_real_host_page_size());
> +    munmap(ctx->mmap_toeplitz_key, qemu_real_host_page_size());
> +    munmap(ctx->mmap_configuration, qemu_real_host_page_size());
>  }
>  
>  bool ebpf_rss_load(struct EBPFRSSContext *ctx)
>  {
>      struct rss_bpf *rss_bpf_ctx;
>  
> -    if (ctx == NULL) {
> +    if (ctx == NULL || ebpf_rss_is_loaded(ctx)) {
>          return false;
>      }
>  
> @@ -66,26 +115,51 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
>      ctx->map_toeplitz_key = bpf_map__fd(
>              rss_bpf_ctx->maps.tap_rss_map_toeplitz_key);
>  
> +    if (!ebpf_rss_mmap(ctx)) {
> +        goto error;
> +    }
> +
>      return true;
>  error:
>      rss_bpf__destroy(rss_bpf_ctx);
>      ctx->obj = NULL;
> +    ctx->program_fd = -1;
>  
>      return false;
>  }
>  
> -static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
> -                                struct EBPFRSSConfig *config)
> +bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
> +                       int config_fd, int toeplitz_fd, int table_fd)
>  {
> -    uint32_t map_key = 0;
> +    if (ctx == NULL || ebpf_rss_is_loaded(ctx)) {
> +        return false;
> +    }
>  
> -    if (!ebpf_rss_is_loaded(ctx)) {
> +    if (program_fd < 0 || config_fd < 0 || toeplitz_fd < 0 || table_fd < 0) {
>          return false;
>      }
> -    if (bpf_map_update_elem(ctx->map_configuration,
> -                            &map_key, config, 0) < 0) {
> +
> +    ctx->program_fd = program_fd;
> +    ctx->map_configuration = config_fd;
> +    ctx->map_toeplitz_key = toeplitz_fd;
> +    ctx->map_indirections_table = table_fd;
> +
> +    if (!ebpf_rss_mmap(ctx)) {
> +        ctx->program_fd = -1;
>          return false;
>      }
> +
> +    return true;
> +}
> +
> +static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
> +                                struct EBPFRSSConfig *config)
> +{
> +    if (!ebpf_rss_is_loaded(ctx)) {
> +        return false;
> +    }
> +
> +    memcpy(ctx->mmap_configuration, config, sizeof(*config));
>      return true;
>  }
>  
> @@ -93,27 +167,19 @@ static bool ebpf_rss_set_indirections_table(struct EBPFRSSContext *ctx,
>                                              uint16_t *indirections_table,
>                                              size_t len)
>  {
> -    uint32_t i = 0;
> -
>      if (!ebpf_rss_is_loaded(ctx) || indirections_table == NULL ||
>         len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
>          return false;
>      }
>  
> -    for (; i < len; ++i) {
> -        if (bpf_map_update_elem(ctx->map_indirections_table, &i,
> -                                indirections_table + i, 0) < 0) {
> -            return false;
> -        }
> -    }
> +    memcpy(ctx->mmap_indirections_table, indirections_table,
> +            sizeof(*indirections_table) * len);
>      return true;
>  }
>  
>  static bool ebpf_rss_set_toepliz_key(struct EBPFRSSContext *ctx,
>                                       uint8_t *toeplitz_key)
>  {
> -    uint32_t map_key = 0;
> -
>      /* prepare toeplitz key */
>      uint8_t toe[VIRTIO_NET_RSS_MAX_KEY_SIZE] = {};
>  
> @@ -123,10 +189,7 @@ static bool ebpf_rss_set_toepliz_key(struct EBPFRSSContext *ctx,
>      memcpy(toe, toeplitz_key, VIRTIO_NET_RSS_MAX_KEY_SIZE);
>      *(uint32_t *)toe = ntohl(*(uint32_t *)toe);
>  
> -    if (bpf_map_update_elem(ctx->map_toeplitz_key, &map_key, toe,
> -                            0) < 0) {
> -        return false;
> -    }
> +    memcpy(ctx->mmap_toeplitz_key, toe, VIRTIO_NET_RSS_MAX_KEY_SIZE);
>      return true;
>  }
>  
> @@ -160,6 +223,17 @@ void ebpf_rss_unload(struct EBPFRSSContext *ctx)
>          return;
>      }
>  
> -    rss_bpf__destroy(ctx->obj);
> +    ebpf_rss_munmap(ctx);
> +
> +    if (ctx->obj) {
> +        rss_bpf__destroy(ctx->obj);
> +    } else {
> +        close(ctx->program_fd);
> +        close(ctx->map_configuration);
> +        close(ctx->map_toeplitz_key);
> +        close(ctx->map_indirections_table);

These 4 fds are left uninitialized with 'ctx' is first allocated,
so will either default to 0 (aka stdin's FD num), or worse,
default to uninitialized memory.

Correct sequencing of the API calls will probably operate safely
afaict, but I'd prefer us to proactively initialize all these
to '-1' in ebpf_rss_init(), and check there that they're not
'-1' before trying to close them, and then set them to -1 once
closed.

> +    }
> +
>      ctx->obj = NULL;
> +    ctx->program_fd = -1;
>  }
> diff --git a/ebpf/ebpf_rss.h b/ebpf/ebpf_rss.h
> index bf3f2572c7c..239242b0d26 100644
> --- a/ebpf/ebpf_rss.h
> +++ b/ebpf/ebpf_rss.h
> @@ -14,12 +14,19 @@
>  #ifndef QEMU_EBPF_RSS_H
>  #define QEMU_EBPF_RSS_H
>  
> +#define EBPF_RSS_MAX_FDS 4
> +
>  struct EBPFRSSContext {
>      void *obj;
>      int program_fd;
>      int map_configuration;
>      int map_toeplitz_key;
>      int map_indirections_table;
> +
> +    /* mapped eBPF maps for direct access to omit bpf_map_update_elem() */
> +    void *mmap_configuration;
> +    void *mmap_toeplitz_key;
> +    void *mmap_indirections_table;
>  };
>  
>  struct EBPFRSSConfig {
> @@ -36,6 +43,9 @@ bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx);
>  
>  bool ebpf_rss_load(struct EBPFRSSContext *ctx);
>  
> +bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
> +                       int config_fd, int toeplitz_fd, int table_fd);

I'd probably suggest splitting this into two patches.

One that introduces the mmap'ing to replace bpf_map_update_elem,
and then a second that adds ebpf_rss_load_fds, as the ebpf_rss_load_fds
addition is making the diff output harder to read than it needs to be.

> +
>  bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig *config,
>                        uint16_t *indirections_table, uint8_t *toeplitz_key);
>  
> -- 
> 2.39.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


