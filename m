Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCB842D0EE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 05:26:07 +0200 (CEST)
Received: from localhost ([::1]:42622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1marNf-0002uC-2H
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 23:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1marLU-0000iJ-La
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 23:23:55 -0400
Received: from usb-smtp-delivery-124.mimecast.com ([170.10.151.124]:51054
 helo=us-smtp-delivery-124.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1marLS-0001r8-MC
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 23:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634181829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5sD2sARpgl0AWicV9C34xPt5Vhbezs/xG9+ccvgxEs=;
 b=h7bljNDr3+bLQvW0lt/qV11nGmPSQ2bdZbbQseGFYJW030m8V+z1l8TmMHXqtAG8ACQ4jB
 lPFQQKlOVYMhcbebdhwalwaKNqEMPFQDK/yfHEfZiA32R+dIAkbYmGeG9jZWUi7Y44R1YT
 R84S/PcIzm6CSAs9j+yvn6mSlP5Sw8Y=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-LF5FwnJbO9-lbOOZwVDEhA-1; Wed, 13 Oct 2021 23:23:48 -0400
X-MC-Unique: LF5FwnJbO9-lbOOZwVDEhA-1
Received: by mail-pj1-f72.google.com with SMTP id
 oc6-20020a17090b1c0600b001a0d6a48b8cso2490178pjb.6
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 20:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=S5sD2sARpgl0AWicV9C34xPt5Vhbezs/xG9+ccvgxEs=;
 b=RVpM55bhuomgyHCzqmPwT9e4Ec0L9aHKirrk+kj1dNw8W8PnaL/PMV44/XJtzmAjPj
 X8HSEex43OnIjeTEI7FVKE9rNGjd6Dm3ADAfJXAig5OL/Gl1T5u97vPr+nxyQ8g4LzzR
 X+t9qiphhQbAfKaXN2J2uOa5bRjml/wCd2BuomxpyS7lXhZMe6C1GxQMBui9jo4P5WS5
 StnFgawd57OTXaxVgGUftamqOEe183NRM404RnumByd9rZeS9udZYgmVbUxshd617SpP
 +Je5K2SYfo56N1pOFZEAvJK3Bfltn9YUOUPIzIDvh8DLCtDjQ+OBdBuD0Sod1OMdqbTz
 Nn3w==
X-Gm-Message-State: AOAM533gGpGytjwC1eHTuTZebj3qeeTJ89jMK/zKg2dGF5DeVF/baajq
 cnuOxgN3sVA3l33dn3alJjNePFHfm1FJn/VJybWkrHOO2Ck7LgPdHNjOr9XWjcU+/7q04akJMa0
 ZsAgH+RIj4Js2T2I=
X-Received: by 2002:a17:90a:307:: with SMTP id 7mr3586647pje.176.1634181827610; 
 Wed, 13 Oct 2021 20:23:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRAb64QaRPTrSalI+di0FxpuUlWyfiZvbnCAu16wi/B1Y/gm+AsxE6v9hmbjZdpVKLyBzQpg==
X-Received: by 2002:a17:90a:307:: with SMTP id 7mr3586620pje.176.1634181827337; 
 Wed, 13 Oct 2021 20:23:47 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id z12sm4295958pjh.51.2021.10.13.20.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 20:23:46 -0700 (PDT)
Subject: Re: [PATCH v2 02/15] net/vhost-user: Fix device compatibility check
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-3-kwolf@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c01d8a15-7af8-4b72-54ce-7a83009e2485@redhat.com>
Date: Thu, 14 Oct 2021 11:23:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211008133442.141332-3-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.151.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: damien.hedde@greensocs.com, lvivier@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, quintela@redhat.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, its@irrelevant.dk, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/10/8 ÏÂÎç9:34, Kevin Wolf Ð´µÀ:
> vhost-user works only with specific devices. At startup, it second
> guesses what the command line option handling will do and error out if
> it thinks a non-virtio device will attach to them.
>
> This second guessing is not only ugly, it can lead to wrong error
> messages ('-device floppy,netdev=foo' should complain about an unknown
> property, not about the wrong kind of network device being attached) and
> completely ignores hotplugging.
>
> Drop the old checks and implement .check_peer_type() instead to fix
> this. As a nice side effect, it also removes one more dependency on the
> legacy QemuOpts infrastructure and even reduces the code size.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   net/vhost-user.c | 41 ++++++++++++++---------------------------
>   1 file changed, 14 insertions(+), 27 deletions(-)
>
> diff --git a/net/vhost-user.c b/net/vhost-user.c
> index 4a939124d2..b1a0247b59 100644
> --- a/net/vhost-user.c
> +++ b/net/vhost-user.c
> @@ -198,6 +198,19 @@ static bool vhost_user_has_ufo(NetClientState *nc)
>       return true;
>   }
>   
> +static bool vhost_user_check_peer_type(NetClientState *nc, ObjectClass *oc,
> +                                       Error **errp)
> +{
> +    const char *driver = object_class_get_name(oc);
> +
> +    if (!g_str_has_prefix(driver, "virtio-net-")) {
> +        error_setg(errp, "vhost-user requires frontend driver virtio-net-*");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>   static NetClientInfo net_vhost_user_info = {
>           .type = NET_CLIENT_DRIVER_VHOST_USER,
>           .size = sizeof(NetVhostUserState),
> @@ -207,6 +220,7 @@ static NetClientInfo net_vhost_user_info = {
>           .has_ufo = vhost_user_has_ufo,
>           .set_vnet_be = vhost_user_set_vnet_endianness,
>           .set_vnet_le = vhost_user_set_vnet_endianness,
> +        .check_peer_type = vhost_user_check_peer_type,
>   };
>   
>   static gboolean net_vhost_user_watch(void *do_not_use, GIOCondition cond,
> @@ -397,27 +411,6 @@ static Chardev *net_vhost_claim_chardev(
>       return chr;
>   }
>   
> -static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error **errp)
> -{
> -    const char *name = opaque;
> -    const char *driver, *netdev;
> -
> -    driver = qemu_opt_get(opts, "driver");
> -    netdev = qemu_opt_get(opts, "netdev");
> -
> -    if (!driver || !netdev) {
> -        return 0;
> -    }
> -
> -    if (strcmp(netdev, name) == 0 &&
> -        !g_str_has_prefix(driver, "virtio-net-")) {
> -        error_setg(errp, "vhost-user requires frontend driver virtio-net-*");
> -        return -1;
> -    }
> -
> -    return 0;
> -}
> -
>   int net_init_vhost_user(const Netdev *netdev, const char *name,
>                           NetClientState *peer, Error **errp)
>   {
> @@ -433,12 +426,6 @@ int net_init_vhost_user(const Netdev *netdev, const char *name,
>           return -1;
>       }
>   
> -    /* verify net frontend */
> -    if (qemu_opts_foreach(qemu_find_opts("device"), net_vhost_check_net,
> -                          (char *)name, errp)) {
> -        return -1;
> -    }
> -
>       queues = vhost_user_opts->has_queues ? vhost_user_opts->queues : 1;
>       if (queues < 1 || queues > MAX_QUEUE_NUM) {
>           error_setg(errp,


