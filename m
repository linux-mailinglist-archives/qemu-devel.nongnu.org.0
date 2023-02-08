Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A303068F09F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:23:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlLD-0004eF-Qg; Wed, 08 Feb 2023 09:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPlL5-0004cH-CQ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:22:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPlL3-0003SB-Jr
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675866134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2wSKWvA4RLe/iRVYdDPKdks2meI07cg1L4lnzah9ibI=;
 b=Q7jGOgExjvd2VVh+kEG3c3CkUFU3RZLM+VXZZibNPi2kzMwe/lfH3q61gKotMBgXZv0FSd
 K5LZ1Dm/5IPf29h3LE9N04Dd4UAndBNJbcSRgNsTuxx27DD0SsJBSRO3Ap3x0q+g7vvaz3
 Ue4rZE9KE3uALzM17myhnwnPr4y/63I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-EzIFVnAHPC2BSRstFZlXug-1; Wed, 08 Feb 2023 09:22:06 -0500
X-MC-Unique: EzIFVnAHPC2BSRstFZlXug-1
Received: by mail-ej1-f72.google.com with SMTP id
 z2-20020a1709060be200b0088b579825f9so13310932ejg.18
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 06:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2wSKWvA4RLe/iRVYdDPKdks2meI07cg1L4lnzah9ibI=;
 b=X/caiBkdpXSvJvuKWO+TJ2IPbUMyy28mtpnEECtdjX3eFqOwbY17RoabyZCHw9suos
 PGodagmh9JHelH1d19i2WfXi0kNw42YVNGZO2Z24NmfdlAwrbnt5v/5EU7Hb5BXlR8FD
 AzLs/fI1oCyybXXVML0ehGsyAkMi95suFwdiN5jcOumclhSDla1sLo4CQBrKRaWsS9dF
 yLTTTrxsbLERFBvPx8P1MR3foy58g01gKhE4hdd1wkIkL7rf90zn5KS9IvcO4lRdK0B5
 egNS78rKXhGaQBer8Ra4vKWMHWii3NtnalQGzPEiDLDbffyfZno8CpesgKlOxfNmZ8cz
 ECNA==
X-Gm-Message-State: AO0yUKXG6JAcrFqR8GybOMAiIfwoLmtlbv0RlXLXJcUTPB+hqEi9Ku8y
 aMIYXz7xtBludgARBNnZqE5KzTKRuG5fdmWAlLk28RU+PxOpvk4y6K1Uj5wt8sadlTEQaPhz9WC
 8ARVZq5Q1PLizvGg=
X-Received: by 2002:a17:906:919:b0:883:fe6b:814 with SMTP id
 i25-20020a170906091900b00883fe6b0814mr7007939ejd.37.1675866123118; 
 Wed, 08 Feb 2023 06:22:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+BDeQtbrGkpVSfcKktBL0GVt0jPU4Cn3LSE/P7LWMB6WsdMG5SIkWrAX6GAhSFU/YiLJNScA==
X-Received: by 2002:a17:906:919:b0:883:fe6b:814 with SMTP id
 i25-20020a170906091900b00883fe6b0814mr7007928ejd.37.1675866122897; 
 Wed, 08 Feb 2023 06:22:02 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 g21-20020a1709061e1500b0087bd629e9e4sm8471466ejj.179.2023.02.08.06.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 06:22:02 -0800 (PST)
Date: Wed, 8 Feb 2023 09:21:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] virtio-blk: add missing AioContext lock
Message-ID: <20230208092137-mutt-send-email-mst@kernel.org>
References: <20230208111148.1040083-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208111148.1040083-1-eesposit@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Feb 08, 2023 at 06:11:48AM -0500, Emanuele Giuseppe Esposito wrote:
> virtio_blk_update_config() calls blk_get_geometry and blk_getlength,
> and both functions eventually end up calling bdrv_poll_co when not
> running in a coroutine:
> - blk_getlength is a co_wrapper_mixed function
> - blk_get_geometry calls bdrv_get_geometry -> bdrv_nb_sectors, a
>   co_wrapper_mixed function too
> 
> Since we are not running in a coroutine, we need to take s->blk
> AioContext lock, otherwise bdrv_poll_co will inevitably call
> AIO_WAIT_WHILE and therefore try to un unlock() an AioContext lock
> that was never acquired.
> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2167838
> 
> Steps to reproduce the issue: simply boot a VM with
> -object '{"qom-type":"iothread","id":"iothread1"}' \
> -blockdev '{"driver":"file","filename":"$QCOW2","aio":"native","node-name":"libvirt-1-storage","cache":{"direct":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"}' \
> -blockdev '{"node-name":"libvirt-1-format","read-only":false,"cache":{"direct":true,"no-flush":false},"driver":"qcow2","file":"libvirt-1-storage"}' \
> -device virtio-blk-pci,iothread=iothread1,drive=libvirt-1-format,id=virtio-disk0,bootindex=1,write-cache=on
> 
> and observe that it will fail not manage to boot with "qemu_mutex_unlock_impl: Operation not permitted"
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


looks reasonable

Acked-by: Michael S. Tsirkin <mst@redhat.com>

merge in block tree pls.

> ---
>  hw/block/virtio-blk.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index 1762517878..cefca93b31 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -894,6 +894,10 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
>      uint64_t capacity;
>      int64_t length;
>      int blk_size = conf->logical_block_size;
> +    AioContext *ctx;
> +
> +    ctx = blk_get_aio_context(s->blk);
> +    aio_context_acquire(ctx);
>  
>      blk_get_geometry(s->blk, &capacity);
>      memset(&blkcfg, 0, sizeof(blkcfg));
> @@ -917,6 +921,7 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
>       * per track (cylinder).
>       */
>      length = blk_getlength(s->blk);
> +    aio_context_release(ctx);
>      if (length > 0 && length / conf->heads / conf->secs % blk_size) {
>          blkcfg.geometry.sectors = conf->secs & ~s->sector_mask;
>      } else {
> -- 
> 2.39.1


