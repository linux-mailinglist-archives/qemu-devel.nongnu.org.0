Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E57439EC3B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 04:37:25 +0200 (CEST)
Received: from localhost ([::1]:52482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqRcK-00088U-Hb
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 22:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lqRbE-0007Mk-Ad
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 22:36:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lqRbC-0006uX-Qb
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 22:36:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623119774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2Drzxu4Hsot2hGAnHP1CexjSZmwVI2U4KHJ7exdzFs=;
 b=XgvF99pVJZ3tVFONwiAoLtvmrIp6+JXWjMZ8TOuSSy5Krj1X6B2ac06fmqbi3iKoBYGeBO
 wzG51qNWrYEgm1Ytv7Uj4vCXdbBWIr5qXtUPG28IySJhGMPyRk/SN3TuUTAQn5evyjfrXR
 yrhmrQn8uyAZbUcsHZDfq3aSbNGsiCQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-ZqbcTxEsOmGzIgHhmgROFA-1; Mon, 07 Jun 2021 22:36:12 -0400
X-MC-Unique: ZqbcTxEsOmGzIgHhmgROFA-1
Received: by mail-pj1-f71.google.com with SMTP id
 b23-20020a17090ae397b0290163949acb4dso15727947pjz.9
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 19:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=f2Drzxu4Hsot2hGAnHP1CexjSZmwVI2U4KHJ7exdzFs=;
 b=lEGa2yPD7hr4lapum//S/DcZ3FmS/RGkW0hKYskkS2dH1fpg+43MUK91VYFUVf31CB
 FljtfetiTXCJNyyg/BiSnQwPEDvsmrCuyxE10tpZ4Hix8+aKbTCPm4p8L/lDh6tiAFMB
 kWY7Iq1DXtq0iJExy03JOe8QkNJ7R98djZauiFjmf/T9DTY8LhOk1DlidvbuE3so5rQ5
 57tO+Q9shBkknwbOsIQwyH5NfBDgt5ZWX9jbh6dawKYKjvOJUoar1OCzB3XA+HPCQVBE
 haEmI+/W1q5wL+Zq1hq0b0OWZx6Vd6ZJKXIi2we+igJFO7pbM4cxwmqOzTp81HJlfugm
 VBYg==
X-Gm-Message-State: AOAM531y6UFe05dOenohK5VQ+WOPmyRBxrqi8l0jPNSVCpBK+pklkOC9
 KXHQYpA7ETkxVEzk/8BNZiFVHmkMb2IDx+GGHPN3h/CwJYb/LqxT8VWb/kIo3VTZQ3WWw0ro+w6
 wr0No4K+ZoePaG/w=
X-Received: by 2002:a65:64c4:: with SMTP id t4mr20655904pgv.222.1623119771506; 
 Mon, 07 Jun 2021 19:36:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxqpYCZCHbB0xTyq7MHnXRO/QfaF6IN3YvcKBJhxyU8enynR4QMLngL0dJlSr31O18QopIWg==
X-Received: by 2002:a65:64c4:: with SMTP id t4mr20655883pgv.222.1623119771216; 
 Mon, 07 Jun 2021 19:36:11 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id s24sm9338239pfh.104.2021.06.07.19.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 19:36:10 -0700 (PDT)
Subject: Re: [PATCH 2/2] vhost-vdpa: remove the unused
 vhost_vdpa_get_acked_features()
To: Gautam Dawar <gdawar@xilinx.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210602033127.40149-1-jasowang@redhat.com>
 <20210602033127.40149-2-jasowang@redhat.com>
 <BY5PR02MB6980AA337402F4FBD3F14301B13A9@BY5PR02MB6980.namprd02.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d7bbfcaf-db09-529b-826d-936172cbb84c@redhat.com>
Date: Tue, 8 Jun 2021 10:36:06 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BY5PR02MB6980AA337402F4FBD3F14301B13A9@BY5PR02MB6980.namprd02.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "lulu@redhat.com" <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/6/6 ÉÏÎç1:19, Gautam Dawar Ð´µÀ:
> No user for this helper, let's remove it.
>
> [GD>>]  These patches seem unrelated to me. Do you think they should be part of one patch series?


It doesn't harm.

I've queued this patch.

Thanks


>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>   include/net/vhost-vdpa.h | 1 -
>   net/vhost-vdpa.c         | 9 ---------
>   2 files changed, 10 deletions(-)
>
> diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h index 45e34b7cfc..b81f9a6f2a 100644
> --- a/include/net/vhost-vdpa.h
> +++ b/include/net/vhost-vdpa.h
> @@ -15,7 +15,6 @@
>   #define TYPE_VHOST_VDPA "vhost-vdpa"
>   
>   struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc); -uint64_t vhost_vdpa_get_acked_features(NetClientState *nc);
>   
>   extern const int vdpa_feature_bits[];
>   
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c index fe659ec9e2..8dc86332a6 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -66,15 +66,6 @@ VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
>       return s->vhost_net;
>   }
>   
> -uint64_t vhost_vdpa_get_acked_features(NetClientState *nc) -{
> -    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> -    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> -    s->acked_features = vhost_net_get_acked_features(s->vhost_net);
> -
> -    return s->acked_features;
> -}
> -
>   static int vhost_vdpa_net_check_device_id(struct vhost_net *net)  {
>       uint32_t device_id;
> --
> 2.25.1
>


