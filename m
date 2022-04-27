Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAB2511030
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 06:30:57 +0200 (CEST)
Received: from localhost ([::1]:44516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njZKK-0005mu-L7
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 00:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1njZIa-00052b-EG
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:29:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1njZIX-0005vQ-5H
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 00:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651033742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4k5sbwy8/sUydnN9LyP6JY0OurDC+OoZ8DNV2a2exY=;
 b=AAUzi8RKbtbMF9Opy7NUc08DsPxvEw+TTJtlJCn94AaOkqtXq4+NC9UiqUYFh/sSVFOvy/
 43VgBA+QY+b7Iy36DTV1yX37mF3wyVAMHzOa41OSpdo1FxiasoGNHkq4TPm3Rr8spycpmH
 z6r7+CRJgxPZUUEP69oixiEB6Qpfmjs=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-387VNf4FPqeUmxuH4AoiFg-1; Wed, 27 Apr 2022 00:29:01 -0400
X-MC-Unique: 387VNf4FPqeUmxuH4AoiFg-1
Received: by mail-pf1-f197.google.com with SMTP id
 g5-20020a62e305000000b0050d2dba0c5dso447464pfh.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 21:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V4k5sbwy8/sUydnN9LyP6JY0OurDC+OoZ8DNV2a2exY=;
 b=F/D8KuLdPzRdeEsM7Mka2R7GMicuKFg+5BSNkpN7siTTHMX790ePv4S3Ky9EPE+R+b
 OO3mRmKLlsMQ/Bkvt/1qpJw1rw6gpq6//GHQSAI/pIBamVtaHKG1DuTGYxgc3Z4VErU+
 pXoKJTlyvag5aB/Xo6g99r3d1hS9W2eOokg3EtcM8wlYOwGD3IuO7uHJ4FdYYfrwo+AR
 8KdeETlv1gU9MaRc683RnAVTIrcIDYffJ6xdweV+UNeDqIRIxWK/aqOdRb6aN8ZW41K+
 EdeT0LTBJMihHgDrqrB/fI47N6JyPSc7XK7sTdzUnvkN4/b9wuwUi72Tzpv6aVFD79D2
 vhAQ==
X-Gm-Message-State: AOAM530NftH4CHqZxuN0zdIdwp9OstAGZFuyNjuxlvGzeLXp6po1FL5M
 8y84Gh4C7F4ueli09AKJFi/WOHbul29BjYctnNS/jZTyzPT/iUpXEbHAV0Hk7INUkjmhTECX9Wp
 xhYJsqZRlCu2k58k=
X-Received: by 2002:a62:15d1:0:b0:50d:3db1:babd with SMTP id
 200-20020a6215d1000000b0050d3db1babdmr14719420pfv.19.1651033740024; 
 Tue, 26 Apr 2022 21:29:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzXGcCa5rhRrJobzOC+ZLikGxUtICewJSBWf6S0iFTs1HBtRNGfwRagw2HuB4r6EBLchnhlA==
X-Received: by 2002:a62:15d1:0:b0:50d:3db1:babd with SMTP id
 200-20020a6215d1000000b0050d3db1babdmr14719405pfv.19.1651033739733; 
 Tue, 26 Apr 2022 21:28:59 -0700 (PDT)
Received: from [10.72.12.60] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090ad49600b001cd4989fee1sm4803627pju.45.2022.04.26.21.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 21:28:59 -0700 (PDT)
Message-ID: <6d7d0a27-beca-6693-ebea-780bca80fd9f@redhat.com>
Date: Wed, 27 Apr 2022 12:28:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 0/7] vhost-vdpa multiqueue fixes
Content-Language: en-US
To: Si-Wei Liu <si-wei.liu@oracle.com>, qemu-devel@nongnu.org
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eperezma@redhat.com, eli@mellanox.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/3/30 14:33, Si-Wei Liu 写道:
> Hi,
>
> This patch series attempt to fix a few issues in vhost-vdpa multiqueue functionality.
>
> Patch #1 is the formal submission for RFC patch in:
> https://lore.kernel.org/qemu-devel/c3e931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com/
>
> Patch #2 and #3 were taken from a previous patchset posted on qemu-devel:
> https://lore.kernel.org/qemu-devel/20211117192851.65529-1-eperezma@redhat.com/
>
> albeit abandoned, two patches in that set turn out to be useful for patch #4, which is to fix a QEMU crash due to race condition.
>
> Patch #5 through #7 are obviously small bug fixes. Please find the description of each in the commit log.
>
> Thanks,
> -Siwei


Hi Si Wei:

I think we need another version of this series?

Thanks


>
> ---
>
> Eugenio Pérez (2):
>    virtio-net: Fix indentation
>    virtio-net: Only enable userland vq if using tap backend
>
> Si-Wei Liu (5):
>    virtio-net: align ctrl_vq index for non-mq guest for vhost_vdpa
>    virtio: don't read pending event on host notifier if disabled
>    vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
>    vhost-net: fix improper cleanup in vhost_net_start
>    vhost-vdpa: backend feature should set only once
>
>   hw/net/vhost_net.c         |  4 +++-
>   hw/net/virtio-net.c        | 25 +++++++++++++++++++++----
>   hw/virtio/vhost-vdpa.c     |  2 +-
>   hw/virtio/virtio-bus.c     |  3 ++-
>   hw/virtio/virtio.c         | 21 +++++++++++++--------
>   include/hw/virtio/virtio.h |  2 ++
>   net/vhost-vdpa.c           |  4 +++-
>   7 files changed, 45 insertions(+), 16 deletions(-)
>


