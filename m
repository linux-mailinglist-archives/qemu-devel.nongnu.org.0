Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440C0323835
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 09:00:39 +0100 (CET)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEp65-0001XT-RM
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 03:00:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEp4k-00014J-AF
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 02:59:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEp4i-0003EZ-Hr
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 02:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614153551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hOBNA142MTP8A+dUYhUYs3QgqaxzgcK/4g3PGvxNaJc=;
 b=ISDdFiECIBG+je5JT2h6T3x8+SXxZnHGSWZ711pP3/gjsK/m3+cFxYLX1msgRU+OQTQxlm
 yGXEFGjvXAgaSQoRL11hhMHwf2PcD3R3gYbVngls2MFav41FVRU673PcFjsy3imdkpMYbB
 FBruT1g9ngrp1USKY46pkUrTa36JFB8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-SgBlS4fxO0aY-lyuz3BGmg-1; Wed, 24 Feb 2021 02:59:08 -0500
X-MC-Unique: SgBlS4fxO0aY-lyuz3BGmg-1
Received: by mail-wr1-f72.google.com with SMTP id p15so667246wre.13
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 23:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hOBNA142MTP8A+dUYhUYs3QgqaxzgcK/4g3PGvxNaJc=;
 b=THSN93d9XYpyWR+3zuZpzuY1jfMDXR1gMglqeoK+NCqxBoLKWo8ID0K06cm0wsF5U2
 0Dj+61TMlaLP3/+xvg3M+p0FL/hgITN9m1xSARtUeTgIRY4D/0YgbteqUW2OKqTTjziK
 R38k7l8X1jkD+zNSDkqZ2Q52lE42q2iq/2nSAKjDzZfLe2VQH6fDHWu3WCFwEl5I1jiz
 xlTZpsa8OtQC++McYAFxOBNrvOiG2jfhYx2UbjBAZh9QcwZiMHVBwHZVpqFOVx7aiu/F
 w4HuBk0DkhU7bgevWN/O7pqnH436GwBJl3UpB5wXOkG4DJylFCEfH4/6zkSfZx7NzTko
 cFow==
X-Gm-Message-State: AOAM531Nooc6kFGOwZkVtJEzebZyDU9tOugL3Do+jJDdWelGvLF1Qpub
 T2J7qFLAtjF9mmEc6AJMkx/X9JF+3xbTQufkytkfFdMwq44yU8fh+uTQi8p5ZJvN6EPjp4MHv4b
 auF0ZYDmn7uOUTaY=
X-Received: by 2002:a5d:6686:: with SMTP id l6mr6594110wru.417.1614153547401; 
 Tue, 23 Feb 2021 23:59:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/DoZD7p3cmcMt+Hb9BY8tdV6B2M1Ve3dBRiZQfKBGrZNA5ZwUpganE/lI3195OEfUXZAb1w==
X-Received: by 2002:a5d:6686:: with SMTP id l6mr6594089wru.417.1614153547234; 
 Tue, 23 Feb 2021 23:59:07 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id p17sm1448226wmq.27.2021.02.23.23.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 23:59:06 -0800 (PST)
Date: Wed, 24 Feb 2021 02:59:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH] virtio-net: Add check for mac address while peer is vdpa
Message-ID: <20210224024852-mutt-send-email-mst@kernel.org>
References: <20210224073333.16035-1-lulu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210224073333.16035-1-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eperezma@redhat.com, jasowang@redhat.com, amorenoz@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> [PATCH] virtio-net: Add check for mac address while peer is vdpa
please do keep numbering patch versions.


On Wed, Feb 24, 2021 at 03:33:33PM +0800, Cindy Lu wrote:
> Sometime vdpa get an all zero mac address from the hardware, this will cause the
> traffic down, So we add the check for in part.if we get an zero mac address we will
> use the default/cmdline mac address instead

How does this differ from v4 of same patch?

Lots of typos above. I guess I can just rewrite the whole log ...

> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  hw/net/virtio-net.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 9179013ac4..f1648fc47d 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -126,6 +126,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>      VirtIONet *n = VIRTIO_NET(vdev);
>      struct virtio_net_config netcfg;
>      NetClientState *nc = qemu_get_queue(n->nic);
> +    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
>  
>      int ret = 0;
>      memset(&netcfg, 0 , sizeof(struct virtio_net_config));
> @@ -151,7 +152,11 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>          ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
>                                     n->config_size);
>          if (ret != -1) {
> -            memcpy(config, &netcfg, n->config_size);

Below needs a huge code comment explaining what is going on.

E.g.  if we get a valid mac from peer, use it.

If we get 0 instead
then we don't know the peer mac but since the
mac is 0 and that is not a legal value,
try to proceed assume something else (management, hardware) sets up the mac
correctly and consistently with the qemu configuration.


> +            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) != 0) {

!= 0 is not necessary

> +                memcpy(config, &netcfg, n->config_size);

> +        } else {
> +                error_report("Get an all zero mac address from hardware");

So why are you skipping the copying of the whole config space? Why not
just skip the mac? Seems quite risky e.g. looks like it will break
things like reporting the link status, right?

> +            }
>          }
>      }
>  }
> -- 
> 2.21.3


