Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9246CFC0D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 08:57:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phmDY-0002Cf-TZ; Thu, 30 Mar 2023 02:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phmDW-0002CP-38
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:57:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phmDU-0000yz-4s
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680159419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZ2JqePLmtaYRWfnNp30jLhbh9rJgh57iLJJ7WE9xdg=;
 b=RjnQtoYxqf/XUcpuWptHSqCZW33TFkFl0M+CW/2VA7pBUi7BQ5OqSOSLuuy9cNvVQgCrKw
 l5iujxscTilsp88BPcjsyV5plvdAxePF2m8AqNfFoW8+TvUJBTmsIqaxNNGkJXLRJfHmJu
 04rLaXipZMXqHWERGZPGHi0EBXYKEkk=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-zdceLRomONyZVbOWDsH6gg-1; Thu, 30 Mar 2023 02:56:57 -0400
X-MC-Unique: zdceLRomONyZVbOWDsH6gg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-17a678c2de9so9380902fac.14
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 23:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680159417; x=1682751417;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uZ2JqePLmtaYRWfnNp30jLhbh9rJgh57iLJJ7WE9xdg=;
 b=a9EOe0RhhHGrWP1yb3q+1gNJR3HpbcjGC+Zuc0HQT1LU/xAewnRP0LDKXwXsOVOLcU
 kb7jOs9zmWFzcddrHNoKydBKckJQhCjpCX0FX7pBW6ebYM6RjZO9QUHIxEmA869G8mbv
 wYpopWerfMYyIkk6vREkltyRl5U1GsVAE1wZz7Va2oV0HYBX44BLpR2smjYhCV0X/nRj
 3EC991/wYQ55C07Mob6VHUpdAaWeEH702MqWBYBmvKAuw+jtEMg+EGamIUDIaoPunUTQ
 6vsE0ICAsaWCeb50+ktk90QqhxImDaaM4+0ajWJBdjTFZhToN4KXBk/M3pZtlIIZr5m9
 f8hA==
X-Gm-Message-State: AAQBX9cY86pbXz8P9I7IRq/oCyjzkTsHXOFOs+H94jb7fkHzenrF9ZOw
 8jI0An4DN438TZQ/QbCtBuOpYx0tsVgA/YvFBVFN5YZ2JEI3JBKKvfB6qlJEu/Psyzgj23PKxgi
 i4kcEHt1mwpsbpf2jNcsuySmK4gKJtdk=
X-Received: by 2002:a05:6870:10d4:b0:17e:255e:b1 with SMTP id
 20-20020a05687010d400b0017e255e00b1mr7081692oar.9.1680159417101; 
 Wed, 29 Mar 2023 23:56:57 -0700 (PDT)
X-Google-Smtp-Source: AK7set/j6l26iuCFsdaEXLUSOm+tfOwGzq4QK9wCKrNMjEG78n6rz5ezVBQxrWanqde9GNo8PaSUtWaESG0V8QfUppo=
X-Received: by 2002:a05:6870:10d4:b0:17e:255e:b1 with SMTP id
 20-20020a05687010d400b0017e255e00b1mr7081681oar.9.1680159416775; Wed, 29 Mar
 2023 23:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230330001522.120774-1-andrew@daynix.com>
 <20230330001522.120774-2-andrew@daynix.com>
 <CACGkMEuiEgerMzuZvykQ=8ML5CW9rdi4h6da5tDeuxER-jSPuw@mail.gmail.com>
In-Reply-To: <CACGkMEuiEgerMzuZvykQ=8ML5CW9rdi4h6da5tDeuxER-jSPuw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 30 Mar 2023 14:56:45 +0800
Message-ID: <CACGkMEs=py5sU_1e3qfBoioM5HCgCPpk2TLbxco9CxC0XgEpxA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] ebpf: Added eBPF initialization by fds and map
 update.
To: Andrew Melnychenko <andrew@daynix.com>
Cc: mst@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com, 
 berrange@redhat.com, thuth@redhat.com, philmd@linaro.org, armbru@redhat.com, 
 eblake@redhat.com, qemu-devel@nongnu.org, toke@redhat.com, 
 mprivozn@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 30, 2023 at 2:53=E2=80=AFPM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Thu, Mar 30, 2023 at 8:33=E2=80=AFAM Andrew Melnychenko <andrew@daynix=
.com> wrote:
> >
> > Changed eBPF map updates through mmaped array.
> > Mmaped arrays provide direct access to map data.
> > It should omit using bpf_map_update_elem() call,
> > which may require capabilities that are not present.
>
> This requires kernel support, so after this change, eBPF based RSS
> doesn't work on old kernels that only support syscall based map
> updating.
>
> I think it's better to keep the syscall path and fail the fds passing
> if the kernel doesn't support mmap().
>
> Thanks
>
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >  ebpf/ebpf_rss-stub.c |   6 +++
> >  ebpf/ebpf_rss.c      | 120 ++++++++++++++++++++++++++++++++++---------
> >  ebpf/ebpf_rss.h      |  10 ++++
> >  3 files changed, 113 insertions(+), 23 deletions(-)
> >
> > diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
> > index e71e229190..8d7fae2ad9 100644
> > --- a/ebpf/ebpf_rss-stub.c
> > +++ b/ebpf/ebpf_rss-stub.c
> > @@ -28,6 +28,12 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
> >      return false;
> >  }
> >
> > +bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
> > +                       int config_fd, int toeplitz_fd, int table_fd)
> > +{
> > +    return false;
> > +}
> > +
> >  bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig=
 *config,
> >                        uint16_t *indirections_table, uint8_t *toeplitz_=
key)
> >  {
> > diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
> > index cee658c158..08015fecb1 100644
> > --- a/ebpf/ebpf_rss.c
> > +++ b/ebpf/ebpf_rss.c
> > @@ -27,19 +27,68 @@ void ebpf_rss_init(struct EBPFRSSContext *ctx)
> >  {
> >      if (ctx !=3D NULL) {
> >          ctx->obj =3D NULL;
> > +        ctx->program_fd =3D -1;
> >      }
> >  }
> >
> >  bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx)
> >  {
> > -    return ctx !=3D NULL && ctx->obj !=3D NULL;
> > +    return ctx !=3D NULL && (ctx->obj !=3D NULL || ctx->program_fd !=
=3D -1);
> > +}
> > +
> > +static bool ebpf_rss_mmap(struct EBPFRSSContext *ctx)
> > +{
> > +    if (!ebpf_rss_is_loaded(ctx)) {
> > +        return false;
> > +    }
> > +
> > +    ctx->mmap_configuration =3D mmap(NULL, qemu_real_host_page_size(),
> > +                                   PROT_READ | PROT_WRITE, MAP_SHARED,
> > +                                   ctx->map_configuration, 0);
> > +    if (ctx->mmap_configuration =3D=3D MAP_FAILED) {
> > +        trace_ebpf_error("eBPF RSS", "can not mmap eBPF configuration =
array");
> > +        return false;
> > +    }
> > +    ctx->mmap_toeplitz_key =3D mmap(NULL, qemu_real_host_page_size(),
> > +                                   PROT_READ | PROT_WRITE, MAP_SHARED,
> > +                                   ctx->map_toeplitz_key, 0);
> > +    if (ctx->mmap_toeplitz_key =3D=3D MAP_FAILED) {
> > +        trace_ebpf_error("eBPF RSS", "can not mmap eBPF toeplitz key")=
;
> > +        goto toeplitz_fail;
> > +    }
> > +    ctx->mmap_indirections_table =3D mmap(NULL, qemu_real_host_page_si=
ze(),
> > +                                   PROT_READ | PROT_WRITE, MAP_SHARED,
> > +                                   ctx->map_indirections_table, 0);
> > +    if (ctx->mmap_indirections_table =3D=3D MAP_FAILED) {
> > +        trace_ebpf_error("eBPF RSS", "can not mmap eBPF indirection ta=
ble");
> > +        goto indirection_fail;
> > +    }
> > +
> > +    return true;
> > +
> > +indirection_fail:
> > +    munmap(ctx->mmap_toeplitz_key, qemu_real_host_page_size());
> > +toeplitz_fail:
> > +    munmap(ctx->mmap_configuration, qemu_real_host_page_size());
> > +    return false;
> > +}
> > +
> > +static void ebpf_rss_munmap(struct EBPFRSSContext *ctx)
> > +{
> > +    if (!ebpf_rss_is_loaded(ctx)) {
> > +        return;
> > +    }
> > +
> > +    munmap(ctx->mmap_indirections_table, qemu_real_host_page_size());
> > +    munmap(ctx->mmap_toeplitz_key, qemu_real_host_page_size());
> > +    munmap(ctx->mmap_configuration, qemu_real_host_page_size());
> >  }
> >
> >  bool ebpf_rss_load(struct EBPFRSSContext *ctx)
> >  {
> >      struct rss_bpf *rss_bpf_ctx;
> >
> > -    if (ctx =3D=3D NULL) {
> > +    if (ctx =3D=3D NULL || ebpf_rss_is_loaded(ctx)) {
> >          return false;
> >      }
> >
> > @@ -66,26 +115,51 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
> >      ctx->map_toeplitz_key =3D bpf_map__fd(
> >              rss_bpf_ctx->maps.tap_rss_map_toeplitz_key);
> >
> > +    if (!ebpf_rss_mmap(ctx)) {
> > +        goto error;
> > +    }
> > +
> >      return true;
> >  error:
> >      rss_bpf__destroy(rss_bpf_ctx);
> >      ctx->obj =3D NULL;
> > +    ctx->program_fd =3D -1;
> >
> >      return false;
> >  }
> >
> > -static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
> > -                                struct EBPFRSSConfig *config)
> > +bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
> > +                       int config_fd, int toeplitz_fd, int table_fd)
> >  {
> > -    uint32_t map_key =3D 0;
> > +    if (ctx =3D=3D NULL || ebpf_rss_is_loaded(ctx)) {
> > +        return false;
> > +    }
> >
> > -    if (!ebpf_rss_is_loaded(ctx)) {
> > +    if (program_fd < 0 || config_fd < 0 || toeplitz_fd < 0 || table_fd=
 < 0) {
> >          return false;
> >      }
> > -    if (bpf_map_update_elem(ctx->map_configuration,
> > -                            &map_key, config, 0) < 0) {
> > +
> > +    ctx->program_fd =3D program_fd;
> > +    ctx->map_configuration =3D config_fd;
> > +    ctx->map_toeplitz_key =3D toeplitz_fd;
> > +    ctx->map_indirections_table =3D table_fd;
> > +
> > +    if (!ebpf_rss_mmap(ctx)) {
> > +        ctx->program_fd =3D -1;
> >          return false;
> >      }
> > +
> > +    return true;
> > +}
> > +
> > +static bool ebpf_rss_set_config(struct EBPFRSSContext *ctx,
> > +                                struct EBPFRSSConfig *config)
> > +{
> > +    if (!ebpf_rss_is_loaded(ctx)) {
> > +        return false;
> > +    }
> > +
> > +    memcpy(ctx->mmap_configuration, config, sizeof(*config));
> >      return true;
> >  }
> >
> > @@ -93,27 +167,19 @@ static bool ebpf_rss_set_indirections_table(struct=
 EBPFRSSContext *ctx,
> >                                              uint16_t *indirections_tab=
le,
> >                                              size_t len)
> >  {
> > -    uint32_t i =3D 0;
> > -
> >      if (!ebpf_rss_is_loaded(ctx) || indirections_table =3D=3D NULL ||
> >         len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
> >          return false;
> >      }
> >
> > -    for (; i < len; ++i) {
> > -        if (bpf_map_update_elem(ctx->map_indirections_table, &i,
> > -                                indirections_table + i, 0) < 0) {
> > -            return false;
> > -        }
> > -    }
> > +    memcpy(ctx->mmap_indirections_table, indirections_table,
> > +            sizeof(*indirections_table) * len);

Btw, I wonder what's the atomic requirement here.

Using memcpy may result in byte to byte updating that may result in
unexpected redirection of the flows.

Thanks

> >      return true;
> >  }
> >
> >  static bool ebpf_rss_set_toepliz_key(struct EBPFRSSContext *ctx,
> >                                       uint8_t *toeplitz_key)
> >  {
> > -    uint32_t map_key =3D 0;
> > -
> >      /* prepare toeplitz key */
> >      uint8_t toe[VIRTIO_NET_RSS_MAX_KEY_SIZE] =3D {};
> >
> > @@ -123,10 +189,7 @@ static bool ebpf_rss_set_toepliz_key(struct EBPFRS=
SContext *ctx,
> >      memcpy(toe, toeplitz_key, VIRTIO_NET_RSS_MAX_KEY_SIZE);
> >      *(uint32_t *)toe =3D ntohl(*(uint32_t *)toe);
> >
> > -    if (bpf_map_update_elem(ctx->map_toeplitz_key, &map_key, toe,
> > -                            0) < 0) {
> > -        return false;
> > -    }
> > +    memcpy(ctx->mmap_toeplitz_key, toe, VIRTIO_NET_RSS_MAX_KEY_SIZE);
> >      return true;
> >  }
> >
> > @@ -160,6 +223,17 @@ void ebpf_rss_unload(struct EBPFRSSContext *ctx)
> >          return;
> >      }
> >
> > -    rss_bpf__destroy(ctx->obj);
> > +    ebpf_rss_munmap(ctx);
> > +
> > +    if (ctx->obj) {
> > +        rss_bpf__destroy(ctx->obj);
> > +    } else {
> > +        close(ctx->program_fd);
> > +        close(ctx->map_configuration);
> > +        close(ctx->map_toeplitz_key);
> > +        close(ctx->map_indirections_table);
> > +    }
> > +
> >      ctx->obj =3D NULL;
> > +    ctx->program_fd =3D -1;
> >  }
> > diff --git a/ebpf/ebpf_rss.h b/ebpf/ebpf_rss.h
> > index bf3f2572c7..239242b0d2 100644
> > --- a/ebpf/ebpf_rss.h
> > +++ b/ebpf/ebpf_rss.h
> > @@ -14,12 +14,19 @@
> >  #ifndef QEMU_EBPF_RSS_H
> >  #define QEMU_EBPF_RSS_H
> >
> > +#define EBPF_RSS_MAX_FDS 4
> > +
> >  struct EBPFRSSContext {
> >      void *obj;
> >      int program_fd;
> >      int map_configuration;
> >      int map_toeplitz_key;
> >      int map_indirections_table;
> > +
> > +    /* mapped eBPF maps for direct access to omit bpf_map_update_elem(=
) */
> > +    void *mmap_configuration;
> > +    void *mmap_toeplitz_key;
> > +    void *mmap_indirections_table;
> >  };
> >
> >  struct EBPFRSSConfig {
> > @@ -36,6 +43,9 @@ bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx);
> >
> >  bool ebpf_rss_load(struct EBPFRSSContext *ctx);
> >
> > +bool ebpf_rss_load_fds(struct EBPFRSSContext *ctx, int program_fd,
> > +                       int config_fd, int toeplitz_fd, int table_fd);
> > +
> >  bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig=
 *config,
> >                        uint16_t *indirections_table, uint8_t *toeplitz_=
key);
> >
> > --
> > 2.39.1
> >


