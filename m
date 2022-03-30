Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976504EBDC7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:38:35 +0200 (CEST)
Received: from localhost ([::1]:39670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUmg-0007OK-Ni
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:38:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUfP-00048d-Gm
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:31:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUfN-0003O7-TK
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648632660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dK4KUJ/8kXEFmgLhHTBlrW14puRxLdkjR8U4qgB3LP8=;
 b=AAPlUBmRX4ZoqJPCFXvwRaK30RXmdZ7a7MZx/n7c7zL7iEqCnVmvoSQlJKmaDoyybReUgQ
 sJwDmODtV4AKzlH31p9ra7piu09ZLWt2T/Y2ewX5+p8eGwd6KrexhsHoR0/ivJTToHE1Ky
 A87Pmc8kYWrENLjpIOJ/Iolx0D3vyyg=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-noXvCmOiM4yRrk3ixMewKA-1; Wed, 30 Mar 2022 05:30:59 -0400
X-MC-Unique: noXvCmOiM4yRrk3ixMewKA-1
Received: by mail-lj1-f198.google.com with SMTP id
 t10-20020a2e2d0a000000b002496423e4adso8508515ljt.16
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 02:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dK4KUJ/8kXEFmgLhHTBlrW14puRxLdkjR8U4qgB3LP8=;
 b=Qnp+RPf63f73KKLmQZKOunEuGws1Zwmym1F8ts5O+2ss+FWgcjLB1nm6bdsa5IGWiI
 HTLL1HTzVnyFMY/pOGvvBVcga4exwdxTsBSKV5RAtWhg/ZBqGtPbwIkce+rsTrhydKFe
 b9ir7hdTlRw+V6HVbqczWJ53QESD2+QynHN+sMqcHVBFgYmkc4FdtBUxpXfCmFd02Sm9
 Rkp7bJiREYJcjR+QTC+lz46R2edQ2Q1ZGI/VeeN00hWxm4nSjSmIpi6Ldoo/Uz6HisBq
 4iATSVSlz48DDGyqyxvPjX67YXZDl0/qa6+dqweA5scqEK+C95JJkazzg3feMrC/mcaw
 kXSQ==
X-Gm-Message-State: AOAM530uG45p9iK5TS8nvZvftOTaW4TNgaMKOjC83bGGtVYUCMPOnC4U
 CZ1ML+K8vilGnS+cNWrxsqTCFewc9XGQP3/vvRvPYUcO3L0lDPmUXD20jhbCow/Ifa03usgjJPn
 ORFLkVq0s0llraC0eA6VlzwjuBeHDLTg=
X-Received: by 2002:a2e:5318:0:b0:249:8375:81ab with SMTP id
 h24-20020a2e5318000000b00249837581abmr5760857ljb.243.1648632657824; 
 Wed, 30 Mar 2022 02:30:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFRnVqorUaF8qula2aTrxDdge1mzvMYFjznmQyxYrpN7xqr5nSUb6qlVa8SjN+fYLNy9ACktKALpReqy3EtFo=
X-Received: by 2002:a2e:5318:0:b0:249:8375:81ab with SMTP id
 h24-20020a2e5318000000b00249837581abmr5760849ljb.243.1648632657629; Wed, 30
 Mar 2022 02:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-7-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1648621997-22416-7-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Mar 2022 17:30:46 +0800
Message-ID: <CACGkMEtzf-USQe9fqcdhfdvc+=-u7oEd7WMPFv=9NxMFHpJAbA@mail.gmail.com>
Subject: Re: [PATCH 6/7] vhost-net: fix improper cleanup in vhost_net_start
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> vhost_net_start() missed a corresponding stop_one() upon error from
> vhost_set_vring_enable(). While at it, make the error handling for
> err_start more robust. No real issue was found due to this though.
>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

>  hw/net/vhost_net.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 30379d2..d6d7c51 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -381,6 +381,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>              r = vhost_set_vring_enable(peer, peer->vring_enable);
>
>              if (r < 0) {
> +                vhost_net_stop_one(get_vhost_net(peer), dev);
>                  goto err_start;
>              }
>          }
> @@ -390,7 +391,8 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>
>  err_start:
>      while (--i >= 0) {
> -        peer = qemu_get_peer(ncs , i);
> +        peer = qemu_get_peer(ncs, i < data_queue_pairs ?
> +                                  i : n->max_queue_pairs);
>          vhost_net_stop_one(get_vhost_net(peer), dev);
>      }
>      e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
> --
> 1.8.3.1
>


