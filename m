Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665224539B9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 20:03:38 +0100 (CET)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn3k1-0006g1-37
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 14:03:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mn3iZ-0005Hc-Bj
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:02:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mn3iW-0000Mx-DV
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637089323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nTDxsYAbBNKYWMH4xo9aEtZhUvWIKhU5nvhUf2VtV0=;
 b=YKi2i366NM//G5lATcJHeo6lvjA/YjpS3QmFJQ0dqkCCPm2XBoD9hZ2hhwhb0kQNerr8AX
 f6Ni9F0u+62CMOGLknQV1K0i8XtQon03llX+Zy6IPsZDmUSMfVdHBZP7KR/Wsmrz+r1HP6
 ljk9ZpVL9L37vhw5+ZCoy7mg5PNZyCQ=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-8yufOQvBNPKGe0oA3hiyjg-1; Tue, 16 Nov 2021 14:02:01 -0500
X-MC-Unique: 8yufOQvBNPKGe0oA3hiyjg-1
Received: by mail-ot1-f70.google.com with SMTP id
 h15-20020a9d554f000000b0055c93007430so45517oti.2
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 11:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8nTDxsYAbBNKYWMH4xo9aEtZhUvWIKhU5nvhUf2VtV0=;
 b=NfVAqBIlWvgCRoolc/FKjXvlMA26ToAEcnkDzHMe2CfOhNO43ANS6F+1f/OarlVRyq
 E/DPxassrYyY43vG4/a63Ue/TQtyCdoOYR+ECoCE5TZfUX+ZmlGuM0RxIvs7IQeCUbeT
 vzxxFkESOAZt/AdOVI12nfikkRbaTFKt9AtUedR6QZ6ciJTf1lX+FN01zYt0MFGFIZYg
 odwIykUMVCdGA4/p7Nu75FeYEYI0/ZQ6FybQQHM4glgx7IURPtQG0+xSVoZiH0IQy9Yg
 6ngjIPdNY9tMEkyCOS8l/if6GiQf1Y/JazOdNx/Cj2lU99DL+AC/SkA1FTVqc/THpxvx
 pSSA==
X-Gm-Message-State: AOAM5323KpiQUW8Nv41dhVOzDwhYMQQk9u1o5fCLJp1oHfq9GF6n6u9e
 3bxzs8fqoI1xPJiM+85gpTn/xtRKIp8N6Ev3jkmQ6j7b7dR4OFL/zE9kb+LQ66z/Izd3dDazURV
 cSFmqTKIRV44ZBfA=
X-Received: by 2002:a05:6808:22a6:: with SMTP id
 bo38mr17449423oib.78.1637089318708; 
 Tue, 16 Nov 2021 11:01:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwg/yLVSO2/fs0HbQDUALTy6MQ6nrCSt30+38EYQwJFljvZK+XwjNr15RkWQmBMW0ofL5mmWg==
X-Received: by 2002:a05:6808:22a6:: with SMTP id
 bo38mr17449204oib.78.1637089317007; 
 Tue, 16 Nov 2021 11:01:57 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id e14sm3993497oie.7.2021.11.16.11.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 11:01:56 -0800 (PST)
Date: Tue, 16 Nov 2021 12:01:55 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Peng Liang <liangpeng10@huawei.com>
Subject: Re: [PATCH] vfio: Fix memory leak of hostwin
Message-ID: <20211116120155.109cfd0d.alex.williamson@redhat.com>
In-Reply-To: <20211116115626.1627186-1-liangpeng10@huawei.com>
References: <20211116115626.1627186-1-liangpeng10@huawei.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: zhengchuan@huawei.com, wanghao232@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Nov 2021 19:56:26 +0800
Peng Liang <liangpeng10@huawei.com> wrote:

> hostwin is allocated and added to hostwin_list in vfio_host_win_add, but
> it is only deleted from hostwin_list in vfio_host_win_del, which causes
> a memory leak.  Also, freeing all elements in hostwin_list is missing in
> vfio_disconnect_container.
> 
> Fix: 2e4109de8e58 ("vfio/spapr: Create DMA window dynamically (SPAPR IOMMU v2)")
> CC: qemu-stable@nongnu.org
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> ---
>  hw/vfio/common.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index dd387b0d3959..2cce60c5fac3 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -546,11 +546,12 @@ static void vfio_host_win_add(VFIOContainer *container,
>  static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
>                               hwaddr max_iova)
>  {
> -    VFIOHostDMAWindow *hostwin;
> +    VFIOHostDMAWindow *hostwin, *next;
>  
> -    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
> +    QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next, next) {

Unnecessary conversion to _SAFE variant here, we don't continue to walk
the list after removing an object.

>          if (hostwin->min_iova == min_iova && hostwin->max_iova == max_iova) {
>              QLIST_REMOVE(hostwin, hostwin_next);
> +            g_free(hostwin);
>              return 0;
>          }
>      }
> @@ -2239,6 +2240,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>      if (QLIST_EMPTY(&container->group_list)) {
>          VFIOAddressSpace *space = container->space;
>          VFIOGuestIOMMU *giommu, *tmp;
> +        VFIOHostDMAWindow *hostwin, *next;
>  
>          QLIST_REMOVE(container, next);
>  
> @@ -2249,6 +2251,12 @@ static void vfio_disconnect_container(VFIOGroup *group)
>              g_free(giommu);
>          }
>  
> +        QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
> +                           next) {
> +            QLIST_REMOVE(hostwin, hostwin_next);
> +            g_free(hostwin);
> +        }
> +

This usage looks good.  Thanks,

Alex

>          trace_vfio_disconnect_container(container->fd);
>          close(container->fd);
>          g_free(container);


