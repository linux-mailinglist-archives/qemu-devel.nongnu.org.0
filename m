Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C35F7AC7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:44:20 +0200 (CEST)
Received: from localhost ([::1]:51264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpWN-0007v0-ON
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ognux-0001yw-0H
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:01:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ognut-0000tq-BA
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 10:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665151290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DUwO1jG6Xc78Ngc8B0KThoKBQhgMuqGsJvE8cSOkOg=;
 b=W54V/ciMW05gSXjUPKVKcb7RUo6qij6gYGnZ+J2AF3wPpRmC+qa8L62ZzfIXdwmt0Z0IKc
 OmBrWWFcL4FUk6QJ8vYeq1Gul0cRzynnNM80iPga8J5T3nFuQIUN+koDcsgAdATJLb9K06
 JFHLYyY0tii/kznAvF4ehspJK8lx0bs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-294-eXuL3yFuOtalEanBNFFYkQ-1; Fri, 07 Oct 2022 10:01:29 -0400
X-MC-Unique: eXuL3yFuOtalEanBNFFYkQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 e14-20020adf9bce000000b0022d18139c79so1459089wrc.5
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 07:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6DUwO1jG6Xc78Ngc8B0KThoKBQhgMuqGsJvE8cSOkOg=;
 b=XlLVJPxQsRWz4RGqdgc6qdBGkO0ZD/YNn3h/YiJaavd8qQhNYFK9eGXa67SeInFr1b
 OAB3fJ5vJQ/rUMMd+u0V21IZtJJHeHf+i+6rUZf2AGFYKXtW/8dgXHFNs/7ogHwwouWl
 IAbzAbSF7/aCTf+P2OLtJCFENsMNJ1NmBKqvQuZmve7MuULX94/Gijrcy+nGjCW/1jxg
 SehH68vxMnenBWLuZM2KOagunAA0pInsOfBYLY4vgRlgrBWqR9XQ4ySPclhcJOQHq3Z1
 o7NUi1lQTMiG3quyqE0Hy3qZqf+bLvkdP0e22WVO1ek3BKme1O0JQwbWLO/hqW0H6xP7
 mV7w==
X-Gm-Message-State: ACrzQf2R+6BkZdMKWmkhCJRNdBNMSWPsuybWZaOsZMBb8FEya53DW+HJ
 5T9X75Y4570UDnod0HNZJry0YhQiUfjq9E8ScFnSluonq+a74JHvZz8+oQYXw+oMEPO2rHroGHC
 DAU1I24SXOgvfnAM=
X-Received: by 2002:a05:600c:1ca4:b0:3bf:a5ca:3fd1 with SMTP id
 k36-20020a05600c1ca400b003bfa5ca3fd1mr3464653wms.40.1665151287732; 
 Fri, 07 Oct 2022 07:01:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6QBmu/NMhyLQA4v7CFYYmRnN4kEQsM64xrmnupjlZfaePRvRzIcFOS6XILxIWnNg3tOYdIXA==
X-Received: by 2002:a05:600c:1ca4:b0:3bf:a5ca:3fd1 with SMTP id
 k36-20020a05600c1ca400b003bfa5ca3fd1mr3464632wms.40.1665151287457; 
 Fri, 07 Oct 2022 07:01:27 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 c18-20020adfed92000000b0022e2c38f8basm2222671wro.14.2022.10.07.07.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 07:01:26 -0700 (PDT)
Date: Fri, 7 Oct 2022 10:01:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 tugy@chinatelecom.cn, baiyw2@chinatelecom.cn,
 dengpc12@chinatelecom.cn, liuym16@chinatelecom.cn,
 yangchg@chinatelecom.cn, yuanmh12@chinatelecom.cn,
 zhoupx@chinatelecom.cn, lic121@chinatelecom.cn,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH 1/2] vhost-user: Refactor vhost acked features saving
Message-ID: <20221007095800-mutt-send-email-mst@kernel.org>
References: <20220926063641.25038-1-huangy81@chinatelecom.cn>
 <20220926063641.25038-2-huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220926063641.25038-2-huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 26, 2022 at 02:36:40PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Abstract vhost acked features saving into
> vhost_user_save_acked_features, export it as util function.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> ---
>  include/net/vhost-user.h |  2 ++
>  net/vhost-user.c         | 35 +++++++++++++++++++----------------
>  2 files changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/include/net/vhost-user.h b/include/net/vhost-user.h
> index 5bcd8a6285..00d46613d3 100644
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
> index b1a0247b59..c512cc9727 100644
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

Note it does not set  acked_features if features are 0.
Which might be the case for legacy ...
I will need to analyze this more to figure out what's
the correct behaviour....

Stefano? Raphael?

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
>      }
>  
>      qmp_set_link(name, false, &err);
> -- 
> 2.27.0


