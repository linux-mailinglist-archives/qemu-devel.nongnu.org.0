Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320D24203EF
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 22:32:49 +0200 (CEST)
Received: from localhost ([::1]:53630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX8AC-0006I9-6E
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 16:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mX88e-0005Y5-9W
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 16:31:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mX88c-0001aY-Ii
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 16:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633293069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TPG/57PGhSQWmyuzSYU0GMFjF0VCB5EblSG74grG5LA=;
 b=G1PVdUcdudG02227kYZ1xPeHK0kgHoo+T18RC2QD+5QQny+9QWX842coWiS17XWq59VD4A
 4t8uvT4lhE4pofqHJE7LILhOZ39BW8ycW/LVpooL5bsPD3thhZON8V6m64Y7DgjC6pKllL
 nWjkCK9TyUHsY3lKbHiYNUGFMIvMSlk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-OLK1_CwDPxC0pVoXEyv_jw-1; Sun, 03 Oct 2021 16:31:08 -0400
X-MC-Unique: OLK1_CwDPxC0pVoXEyv_jw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k6-20020a05600c0b4600b0030d2a0a259eso6062967wmr.6
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 13:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TPG/57PGhSQWmyuzSYU0GMFjF0VCB5EblSG74grG5LA=;
 b=BTfqaY2UHHGWvQQRvippG51T8A5ROZ4ylP6cJNGe9F8YH1hXjyktNm3uZXdyE8/7Kr
 HzvifvqrZDfyCsMfOhXyq76ghD2q0PqxpzPBJT0mJeTvVuxnf+2Iq0LFcqxE8XejCn5b
 I0c/FWE2IbiaH3BfWqDBQmwgBjXoLTP0DI+I74DTweAJ1KAg4aH1UH6L6l3N23ZNCG1J
 NTlb6NbZ0UNd0Zwsz06W59QqxR3aIFxgVVeAdnOIPaqtAFsVXI4ETI72OMOnXeGpjBTB
 QFru9li8x1Hp7vF/KkMHUvXjIEt0F7EUBxqXsUvASlg/Du7D/caK6aoF2/HQa5Y+CEwZ
 +7cw==
X-Gm-Message-State: AOAM531FKVWIKZdb2fddVYLcTcbLlwrguMmeqv5GgLPoyuLFqkE0zJLV
 ODzHh9Zlsss0FsEMLuNXDYJPJADLHHKPCATsDEmWDvBXbUsbssUPTO8yYOhg2dL5BIdUlA6rXG/
 ygShXOxReURjRGaA=
X-Received: by 2002:adf:ea45:: with SMTP id j5mr10141072wrn.291.1633293067416; 
 Sun, 03 Oct 2021 13:31:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ5lZlfysGSOyBN/sn91GYlNTMf6NuWwoFWmkbya6amebB9HqUv3gONCpEvS33L2L/CRi58g==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr10141057wrn.291.1633293067205; 
 Sun, 03 Oct 2021 13:31:07 -0700 (PDT)
Received: from redhat.com ([2.55.134.94])
 by smtp.gmail.com with ESMTPSA id z18sm5523844wro.25.2021.10.03.13.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 13:31:06 -0700 (PDT)
Date: Sun, 3 Oct 2021 16:31:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Message-ID: <20211003162826-mutt-send-email-mst@kernel.org>
References: <9125826.uuVAOS58fx@silver> <E1mX6En-00047K-As@lizzy.crudebyte.com>
MIME-Version: 1.0
In-Reply-To: <E1mX6En-00047K-As@lizzy.crudebyte.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 03, 2021 at 08:15:36PM +0200, Christian Schoenebeck wrote:
> VIRTQUEUE_MAX_SIZE reflects the absolute theoretical maximum
> queue size possible, which is actually the maximum queue size
> allowed by the virtio protocol. The appropriate value for
> VIRTQUEUE_MAX_SIZE is therefore 32768:
> 
> https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-240006
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Problem is this then exceeds UIO_MAXIOV and e.g. virtio net
assumes that an iovec it gets from guest can be passed directly
to linux. Either we need to remove that restriction
(e.g. by doing an extra copy if iov size is bigger)
or add the limitation in net-specific code. blk and scsi
might be affected too, but these have a per-device
limit which can be tweaked.

> ---
>  include/hw/virtio/virtio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 8bab9cfb75..1f18efa0bc 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -48,7 +48,7 @@ size_t virtio_feature_get_config_size(const VirtIOFeature *features,
>  
>  typedef struct VirtQueue VirtQueue;
>  
> -#define VIRTQUEUE_MAX_SIZE 1024
> +#define VIRTQUEUE_MAX_SIZE 32768
>  
>  typedef struct VirtQueueElement
>  {
> -- 
> 2.20.1


