Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FCE37B74F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:59:41 +0200 (CEST)
Received: from localhost ([::1]:40784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjmO-0000Lm-B0
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lgjkz-0007qf-Ce
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:58:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lgjkw-0001bg-Qi
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620806288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yCyMzzPExwNvHBJ3Vi+AiUmS46THxaTUAChzhsF/0as=;
 b=GDH0uAc5ITUHTNCftmHfahuc4Ri4RGZJULpcphoJF4Z654Aehbvq7AckTFH8+8fZJjbL63
 QqXIJpFqDNAidigtcNB2aI8av9y669qHvcg5WG+Xhp1aKcavSxRpmnl+WowWuvGVyZpigx
 3pRBVxaBTqpYAfbclxKljY3z8ESakMo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-4ZLlhEIGN1C4CNCfSFKFxg-1; Wed, 12 May 2021 03:58:07 -0400
X-MC-Unique: 4ZLlhEIGN1C4CNCfSFKFxg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v5-20020adf9e450000b029010e708f05b3so5508094wre.6
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yCyMzzPExwNvHBJ3Vi+AiUmS46THxaTUAChzhsF/0as=;
 b=NypgcaREkVJkLv3CROOrST4FdGXLbbvr42q21VoZzZj1XZ3m4R8Y1iTgC9CcgQPkve
 t4eTAOMZRMid1SIZgisXCgrR2vXHGuvuKrWA4sYw12toVa092E4OBavxMwl23qfHGfX+
 fB5QEjI/1RLbZGivRU8wvGwQmJA3jL5b3NwgxsPvD0/uQ3y8vl6deGIeD2eCDQasDYcH
 RU5zqR8HW14x9TqvmU9y0vhy37uuZ/v8PKxAX/XIX1slCBb+jnDhWaydqzABbddELWht
 lFX1WJ0RCmQ50oYIwDlyAY50gVU9b0QRH9NWBl7IQtRcLwY7lqMgw4Sh1tIYbDaRuymP
 S5wg==
X-Gm-Message-State: AOAM530Pq3nhE/vJLeVvWUwVkBRFEY/tTl/OwEPRqvzmVMjVmwudZeXt
 pRAwRvepxBRN8V5jrNp4NITdP6qOm5c4dm1f/WhB/Fqp28GrG9wRsCTdUsC9XzKHuy/ua6vvgil
 hhRVPtXmM8CI4hZ986VuZyBJRmISMOYqJH2+GHHPNh79LxiKk/ZE9FnkAZjYi
X-Received: by 2002:adf:e4c4:: with SMTP id v4mr999186wrm.346.1620806285693;
 Wed, 12 May 2021 00:58:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVKSvLiE3T5sHvJavcN5cjtTQTuqifqOk/L/zA3yNomrlmoBJU7KnnuCOVSEpj3PaqIQLAFg==
X-Received: by 2002:adf:e4c4:: with SMTP id v4mr999168wrm.346.1620806285496;
 Wed, 12 May 2021 00:58:05 -0700 (PDT)
Received: from redhat.com ([2a10:8004:640e:0:d1db:1802:5043:7b85])
 by smtp.gmail.com with ESMTPSA id v20sm26538025wmj.15.2021.05.12.00.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 00:58:04 -0700 (PDT)
Date: Wed, 12 May 2021 03:58:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PULL v4 34/48] vhost-user: save features of multiqueues if
 chardev is closed
Message-ID: <20210512035732-mutt-send-email-mst@kernel.org>
References: <20200929071948.281157-1-mst@redhat.com>
 <20200929071948.281157-35-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200929071948.281157-35-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 =?utf-8?B?aGFpYmluemhhbmco5byg5rW35paMKQ==?= <haibinzhang@tencent.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 29, 2020 at 03:22:25AM -0400, Michael S. Tsirkin wrote:
> From: haibinzhang(张海斌) <haibinzhang@tencent.com>
> 
> Fore-commit(c6beefd674) only saves features of queue0,
> this makes wrong features of other queues in multiqueues
> situation.
> For examples:
>   qemu-system-aarch64 ... \
>   -chardev socket,id=charnet0,path=/var/run/vhost_sock \
>   -netdev vhost-user,chardev=charnet0,queues=2,id=hostnet0 \
>   ...
> There are two queues in nic assocated with one chardev.
> When chardev is reconnected, it is necessary to save and
> restore features of all queues.
> 
> Signed-of-by: Haibin Zhang <haibinzhang@tencent.com>
> Message-Id: <46CBC206-E0CA-4249-81CD-10F75DA30441@tencent.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Cc: qemu-stable@nongnu.org

> ---
>  net/vhost-user.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/net/vhost-user.c b/net/vhost-user.c
> index 17532daaf3..ffbd94d944 100644
> --- a/net/vhost-user.c
> +++ b/net/vhost-user.c
> @@ -226,7 +226,7 @@ static void chr_closed_bh(void *opaque)
>      NetClientState *ncs[MAX_QUEUE_NUM];
>      NetVhostUserState *s;
>      Error *err = NULL;
> -    int queues;
> +    int queues, i;
>  
>      queues = qemu_find_net_clients_except(name, ncs,
>                                            NET_CLIENT_DRIVER_NIC,
> @@ -235,8 +235,12 @@ static void chr_closed_bh(void *opaque)
>  
>      s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
>  
> -    if (s->vhost_net) {
> -        s->acked_features = vhost_net_get_acked_features(s->vhost_net);
> +    for (i = queues -1; i >= 0; i--) {
> +        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
> +
> +        if (s->vhost_net) {
> +            s->acked_features = vhost_net_get_acked_features(s->vhost_net);
> +        }
>      }
>  
>      qmp_set_link(name, false, &err);
> -- 
> MST
> 


