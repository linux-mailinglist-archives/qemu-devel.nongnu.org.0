Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC8C612165
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 10:29:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oohCr-0007mc-7J; Sat, 29 Oct 2022 04:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oohCd-0007eu-VW
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:28:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oohCb-0003Q1-V7
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667032104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HyhGpqBUZ5eC9Y5LErnxj94RVKJZVWgUu0U+AqV0Dk=;
 b=bcHEDy9rWgK3evneUu/ylY/mil/o6V8mt54nz58JjOoh6kJjHUD+ZGC+GckVK4knXtBJ4v
 30oaBN27s4C7at7dl3R0nbu+x/DEZrkWL0hszSW2X3WxYip3aJt3OGT5oN5mcBHYOtvg8Y
 1hoUUzt3Es93ZpjA8E0W6Ud6unLjM4E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-dfnnNkKuPG6PqFspPA6cOQ-1; Sat, 29 Oct 2022 04:28:22 -0400
X-MC-Unique: dfnnNkKuPG6PqFspPA6cOQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so1956113wmh.6
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 01:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1HyhGpqBUZ5eC9Y5LErnxj94RVKJZVWgUu0U+AqV0Dk=;
 b=SYm4Db06lNAYp4T05FWHuRsSci0+pPKfsvjqDmxRxlGdtSc2uMbhtBtF5lcyBrUwUU
 svfYZB7SvjH55ckOU8H8qmODEixZjnZbOXx3qvKZyAqxhY2taPVLlYgJ16UobpNQtxU6
 RrDnB6JrBVlYIKfbXx0pl13xQw78b5k0YLn3wtE1zrttXAu/XQ3/3broD+qpyPBF6Clu
 MrLuYYRUTw/VlqF+7Fx+Xk99GnhNgjauIqyDRhrVlwOnMv8SEsbkFcQxE5EWEqWi6rPh
 UFWg4UrA3TJTdJBDTQnkpo7pNGVtaHc/xqdDsGgTEtkK+8O95ddhdTamRfkM0Kgrvged
 kt5Q==
X-Gm-Message-State: ACrzQf3ggKpWfzJSdSAiRenV0MHC0DIa2b0wneqV1rQto2imTbmNLq83
 Zp6qmLgMYVkk8oMfzpZZi1uodATPVm0+miq+rZ+LvlLq8dMrY9JZ+XKvSFdS0eC7ASV7b92lZNn
 ZY+GiBZHON7fQ8fI=
X-Received: by 2002:adf:fc12:0:b0:236:9b2e:4843 with SMTP id
 i18-20020adffc12000000b002369b2e4843mr1762412wrr.620.1667032101472; 
 Sat, 29 Oct 2022 01:28:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6hWt4UA4gfVw/UxX4C48z+mLUu7hJVV0bNE6BJx5YWLdEl4zxXWiAxA5+x8M+2jB0462aR1A==
X-Received: by 2002:adf:fc12:0:b0:236:9b2e:4843 with SMTP id
 i18-20020adffc12000000b002369b2e4843mr1762405wrr.620.1667032101243; 
 Sat, 29 Oct 2022 01:28:21 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 f18-20020a1cc912000000b003cf5ec79bf9sm915647wmb.40.2022.10.29.01.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 01:28:20 -0700 (PDT)
Date: Sat, 29 Oct 2022 04:28:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Guoyi Tu <tugy@chinatelecom.cn>
Subject: Re: [PATCH v2 1/2] vhost-user: Refactor vhost acked features saving
Message-ID: <20221029042532-mutt-send-email-mst@kernel.org>
References: <cover.1666977755.git.huangy81@chinatelecom.cn>
 <8f537f6a484cfdac236fd6307f796660ae562226.1666977755.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f537f6a484cfdac236fd6307f796660ae562226.1666977755.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Oct 29, 2022 at 01:25:44AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Abstract vhost acked features saving into
> vhost_user_save_acked_features, export it as util function.
>

Thanks for the patch!

This commit log makes it sound like it's just a refactoring
while it's actually a behaviour change.
This log needs to include analysis of why is saving only if features != 0
safe.

Could you include that pls?

Thanks!
 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> ---
>  include/net/vhost-user.h |  2 ++
>  net/vhost-user.c         | 35 +++++++++++++++++++----------------
>  2 files changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/include/net/vhost-user.h b/include/net/vhost-user.h
> index 5bcd8a6..00d4661 100644
> --- a/include/net/vhost-user.h
> +++ b/include/net/vhost-user.h
> @@ -14,5 +14,7 @@
>  struct vhost_net;
>  struct vhost_net *vhost_user_get_vhost_net(NetClientState *nc);
>  uint64_t vhost_user_get_acked_features(NetClientState *nc);
> +void vhost_user_save_acked_features(NetClientState *nc,
> +                                    bool cleanup);
>  
>  #endif /* VHOST_USER_H */
> diff --git a/net/vhost-user.c b/net/vhost-user.c
> index b1a0247..c512cc9 100644
> --- a/net/vhost-user.c
> +++ b/net/vhost-user.c
> @@ -45,24 +45,31 @@ uint64_t vhost_user_get_acked_features(NetClientState *nc)
>      return s->acked_features;
>  }
>  
> -static void vhost_user_stop(int queues, NetClientState *ncs[])
> +void vhost_user_save_acked_features(NetClientState *nc, bool cleanup)
>  {
>      NetVhostUserState *s;
> +
> +    s = DO_UPCAST(NetVhostUserState, nc, nc);
> +    if (s->vhost_net) {
> +        uint64_t features = vhost_net_get_acked_features(s->vhost_net);
> +        if (features) {
> +            s->acked_features = features;
> +        }
> +
> +        if (cleanup) {
> +            vhost_net_cleanup(s->vhost_net);
> +        }
> +    }
> +}
> +
> +static void vhost_user_stop(int queues, NetClientState *ncs[])
> +{
>      int i;
>  
>      for (i = 0; i < queues; i++) {
>          assert(ncs[i]->info->type == NET_CLIENT_DRIVER_VHOST_USER);
>  
> -        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
> -
> -        if (s->vhost_net) {
> -            /* save acked features */
> -            uint64_t features = vhost_net_get_acked_features(s->vhost_net);
> -            if (features) {
> -                s->acked_features = features;
> -            }
> -            vhost_net_cleanup(s->vhost_net);
> -        }
> +        vhost_user_save_acked_features(ncs[i], true);
>      }
>  }
>  
> @@ -251,11 +258,7 @@ static void chr_closed_bh(void *opaque)
>      s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
>  
>      for (i = queues -1; i >= 0; i--) {
> -        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
> -
> -        if (s->vhost_net) {
> -            s->acked_features = vhost_net_get_acked_features(s->vhost_net);
> -        }
> +        vhost_user_save_acked_features(ncs[i], false);


So this won't do anything if acked features is 0.
When does this have any effect? How about if guest
acked some features, and then reset the device.
Don't we want to reset the features in this case too?


>      }
>  
>      qmp_set_link(name, false, &err);
> -- 
> 1.8.3.1


