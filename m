Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9039458A526
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 05:51:43 +0200 (CEST)
Received: from localhost ([::1]:54558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJoNC-0001Ng-MF
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 23:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJoKn-0006Yh-GG
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:49:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJoKk-0003v6-8I
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659671349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/o+HyNOMpMAGlfs2YG3N4FCF3ufLpg9IfpMPAQq3tAU=;
 b=Wbpl/+h9XuwsMlEGigiu3Iun5GH2R4DBuLg0BPLGSPy3inqmak0hKVYb12ZoLTHoQ0zNwo
 n9YzEjXSrNgWkIq72vcrbrCE1PyjKIKu/NdUaL0rp8JBoYKfh1WNUclEK3+mXA47zmcbBZ
 uepK3bo1W6fbUUebuQYFVJYGrvNk50k=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-wU08nwtYPV2jcm4sS_fWjw-1; Thu, 04 Aug 2022 23:49:07 -0400
X-MC-Unique: wU08nwtYPV2jcm4sS_fWjw-1
Received: by mail-lf1-f70.google.com with SMTP id
 o4-20020ac25e24000000b0048af174d5bdso288942lfg.9
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 20:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/o+HyNOMpMAGlfs2YG3N4FCF3ufLpg9IfpMPAQq3tAU=;
 b=fIU97HlauFBz3jCBStK0kXaGfGXKlsKPhXQYxi1YYKaNvnqtvdvUX3nZtLYHx03Duv
 4UoxxnWzbXpBnLkYPuDl58AsMLfRGedEIPQ5Kb+NsV7aQByPa3bF8KspaVIVsi8em9DK
 E7EC6qodr4UzDnzLXzdO0Ud9tvhiHe/TdgCozpuIPTwdlzL2qElhnb6s5v5KKSFaSk/c
 0C0yyEvbvo2KJ7XfgDalHp/64I7wL+YqUhzW3b0Wb7LLFG/Qoww1wSjMCEe7S1QPkavF
 VXRCXRwWOsuKHGloemWVgpSb6VoSMQxZ05yDGuGtvWrSAUy2+5n69fRFI0UQCQ9SXqRk
 lElQ==
X-Gm-Message-State: ACgBeo0kVB4QHVjHVwozdEmHjRVONY+yQowzOYFNwfoO3/HPDjTxj2VC
 PMriWCu4cL5KZKkd/DhXBfC1RZRa2TAcCmdT9P5k/5LujYf6mthxONW8dAs/gTC+F3FQmOMzjMn
 iNxoCYVxmjpCiR2T/uhYH8IXAXmgctc0=
X-Received: by 2002:a19:ac09:0:b0:48a:d1b5:1791 with SMTP id
 g9-20020a19ac09000000b0048ad1b51791mr1748898lfc.397.1659671346417; 
 Thu, 04 Aug 2022 20:49:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7tDxds+2nmrSBYvjBPCCUrKEsmoR7TvU8PV01HU474+axLLBGfLYT3Y5aEd+072KaMhhpYydOz7pZaCH1mR7o=
X-Received: by 2002:a19:ac09:0:b0:48a:d1b5:1791 with SMTP id
 g9-20020a19ac09000000b0048ad1b51791mr1748875lfc.397.1659671346208; Thu, 04
 Aug 2022 20:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-4-eperezma@redhat.com>
In-Reply-To: <20220804182852.703398-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 Aug 2022 11:48:55 +0800
Message-ID: <CACGkMEsqEakJm_f7hrt0tbBt3Ox4TX=HqUnZx+BAj+EUa7Xxfg@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] vhost: Delete useless read memory barrier
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Eric Blake <eblake@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> As discussed in previous series [1], this memory barrier is useless with
> the atomic read of used idx at vhost_svq_more_used. Deleting it.
>
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02616.htm=
l
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index e6eebd0e8d..1b49bf54f2 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -509,9 +509,6 @@ size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
>          if (unlikely(g_get_monotonic_time() - start_us > 10e6)) {
>              return 0;
>          }
> -
> -        /* Make sure we read new used_idx */
> -        smp_rmb();
>      } while (true);
>  }
>
> --
> 2.31.1
>


