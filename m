Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656C3624A01
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 19:57:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otCj6-0002ic-RL; Thu, 10 Nov 2022 13:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otCj5-0002iJ-G7
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 13:56:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otCj4-000116-1k
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 13:56:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668106593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I9A7OVzBzomzuyobMdO+zM+X5EsuzJlWIgQ+T4di2fM=;
 b=RoMiKghpWAixntRmSbA5QLYegPF4+BAu3iAZoG1HQ5+Lkv2xv3cCzo7fJGTUam24UqN8RH
 /qDKE8xoQE/gSgmfSS0G0T1yqTn5z/pfF4JevudffvlJfyf0DPoSaRbKkD008JiB5m47nJ
 x2cg2sh1WRfUeJKCnwlbLTftDpZAmdk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-f7LLZYavPJ-j8etPN-rG5w-1; Thu, 10 Nov 2022 13:56:31 -0500
X-MC-Unique: f7LLZYavPJ-j8etPN-rG5w-1
Received: by mail-wm1-f72.google.com with SMTP id
 x10-20020a05600c420a00b003cfa33f2e7cso1402758wmh.2
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 10:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I9A7OVzBzomzuyobMdO+zM+X5EsuzJlWIgQ+T4di2fM=;
 b=IhEqPv837Ky4c7ytVtiOj5T4NKS4wTP5hB82ZjmPIM5mzx2fgWVimqZpyhXsKtSJuT
 tBJo79BR79Cl4ocW8hRF87xdrXA+wpqHy4oNnTikQIP7bJeJ21gsksjrsHX7QYO1+1L+
 iUlMTts7L516e642twR4RWU3vMIGSNw3F5LH2g217zCvyJN0lcExMG/BqzeNDsOjJPsS
 bSZkUTOP31glyTIIzS3Okc1UpPMO/v1q56UpR6J60shGtAUYt0TZOhfzWhxYyJqL6C0Y
 AIRywADJDmm5dIDVkTNPHcz+atFydMudN4xIaWGL0ZcLOba2Uu9e5LKEzxbz2h+I/v6K
 8F2Q==
X-Gm-Message-State: ACrzQf2xXKZ1uNFDZfKZqY7BqnJZ5CqzWjySjgXFu2yZ1QuMjNuIMWj2
 OeDLjM3hpnkMZKvqklSjQaUVJQf8ceromcOi1IpyQBlmbhxkUYKwm2vHuh2W11F5t9u9Anl4lFB
 hIVSJcV0HuObF6IQ=
X-Received: by 2002:adf:f688:0:b0:235:f9ec:ae54 with SMTP id
 v8-20020adff688000000b00235f9ecae54mr41404834wrp.319.1668106590651; 
 Thu, 10 Nov 2022 10:56:30 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4tuPNvC/AYQtNhVEeHjMJ6q9y8a9Yd28S7mQNuPm6KGGHqVGzWFF497JpNhbrLehP1hoFpeQ==
X-Received: by 2002:adf:f688:0:b0:235:f9ec:ae54 with SMTP id
 v8-20020adff688000000b00235f9ecae54mr41404825wrp.319.1668106590435; 
 Thu, 10 Nov 2022 10:56:30 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 bg1-20020a05600c3c8100b003cfaae07f68sm6445425wmb.17.2022.11.10.10.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 10:56:29 -0800 (PST)
Date: Thu, 10 Nov 2022 13:56:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Guoyi Tu <tugy@chinatelecom.cn>
Subject: Re: [PATCH v3 1/2] vhost-user: Refactor vhost acked features saving
Message-ID: <20221110135334-mutt-send-email-mst@kernel.org>
References: <cover.1667136717.git.huangy81@chinatelecom.cn>
 <2c9618e155b29b6fb811de112fc03d9585c85070.1667136717.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c9618e155b29b6fb811de112fc03d9585c85070.1667136717.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Sun, Oct 30, 2022 at 09:52:38PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Abstract vhost acked features saving into
> vhost_user_save_acked_features, export it as util function.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> ---
>  include/net/vhost-user.h |  2 ++
>  net/vhost-user.c         | 29 ++++++++++++++++++-----------
>  2 files changed, 20 insertions(+), 11 deletions(-)
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
> index b1a0247..74f349c 100644
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

I can't figure out what is going on here.  Why is there a cleanup flag?
What does cleanup have to do with saving acked features?
I suspect it's better to just leave this part in the caller.

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
> -- 
> 1.8.3.1


