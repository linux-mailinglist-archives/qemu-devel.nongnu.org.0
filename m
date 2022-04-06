Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38E74F5C13
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 13:22:37 +0200 (CEST)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc3kC-0007hy-Oj
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 07:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nc3iw-0006xY-J6
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 07:21:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nc3it-0001Ly-OP
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 07:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649244074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ePV4XaUkNi9d+dZjnt6ea977kBE6fBmwJM8okNwUVnc=;
 b=KoE/4ITD0LHw/7QeFYbae9lNsQ3IYZqNj5RtOwGzuA5XDVnjlVS5TSf2xvPiz/wKmHgXVh
 EtTDiWO+yXsH/CCG47KKRcV6yngWYk7rrNPPdroQxKXboyJOE3Jme80qWTaEp5Z3hAQXQ8
 TMus9TO07u9APgkmNCsZghHYXsrV0q0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-T-bTjXeFMLCADQu3YqVnDQ-1; Wed, 06 Apr 2022 07:21:13 -0400
X-MC-Unique: T-bTjXeFMLCADQu3YqVnDQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 h33-20020adf9024000000b00203fcba8aadso395020wrh.15
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 04:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ePV4XaUkNi9d+dZjnt6ea977kBE6fBmwJM8okNwUVnc=;
 b=M6BaBASHiVlnVLvO+eahfEAesGyi9/Eb/urYTginyYz81fMtH7ztgsZo+SOQFnN5xf
 fpDMIB9fdmntKZZrBqOttCgUtCwEg9g7iq07W/1ku8pKFonUu3niWM/RuiqZYC3TNWbm
 cpSawpD95NTtAVVg+haRW4mk8BVAGVYiaZ273bkjeKO/MPpAGIox1hsT5l4wgP+aFUVo
 epf8ewJvY4Z0TrTZIhNWnw7ZHSjEaWpP0zHwSBG7EEyLW5PPyUpcz7F6XtCcC49buLBF
 uPyBO4I53R1p2pTbUFxaVRK3bjPyfuW5Rejyfs5kzbh/o/ySVJygZwSb+yvXca2P2YUr
 vKHw==
X-Gm-Message-State: AOAM531/EY8uf3edKVsdP/5q19up6kyt8FdOXt6CrGuuhkZWjblxWX/8
 /7oiLF5HMfIL195bVhivGENzU5uQCtW5cNH4l/IBSdiiXrt5VFiiRCeMBUPcYBAE05WlQC5CZtu
 l22TvXUioSw6bCzg=
X-Received: by 2002:adf:f949:0:b0:203:e87d:1d38 with SMTP id
 q9-20020adff949000000b00203e87d1d38mr6339940wrr.137.1649244072102; 
 Wed, 06 Apr 2022 04:21:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEAMR7Ndq4iEqy2Ya//q/SA3Sw/2Vh2negKfzhXmqMQr3VoWkvJEyJTweuPahzFUAMnnjCgQ==
X-Received: by 2002:adf:f949:0:b0:203:e87d:1d38 with SMTP id
 q9-20020adff949000000b00203e87d1d38mr6339926wrr.137.1649244071810; 
 Wed, 06 Apr 2022 04:21:11 -0700 (PDT)
Received: from redhat.com ([2.53.144.12]) by smtp.gmail.com with ESMTPSA id
 3-20020a5d47a3000000b0020412ba45f6sm17242306wrb.8.2022.04.06.04.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 04:21:10 -0700 (PDT)
Date: Wed, 6 Apr 2022 07:21:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: wliang@stu.xidian.edu.cn
Subject: Re: Fix a potential Use-after-free in virtio_iommu_handle_command()
 (v6.2.0).
Message-ID: <20220406040445-mutt-send-email-mst@kernel.org>
References: <1b79118e.25c5.17f2702b9d5.Coremail.wliang@stu.xidian.edu.cn>
 <3ce08bdb-fecd-549a-5c09-0b5fa65de4ba@redhat.com>
 <a300d2f3-e545-7793-2601-fec1cbbd601a@redhat.com>
 <26faef1d.aa6.17f2f07f0b4.Coremail.wliang@stu.xidian.edu.cn>
MIME-Version: 1.0
In-Reply-To: <26faef1d.aa6.17f2f07f0b4.Coremail.wliang@stu.xidian.edu.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: eric.auger@redhat.com, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 11:58:43AM +0800, wliang@stu.xidian.edu.cn wrote:
> Hi all,
> 
> Here is a new patch with Signed-off-by tags.
> The old one is wrong for it did't have Signed-off-by tags.
> I am looking forward to your confirmation.
> 
> Thanks,
> Wentao

> From 8ece42bda1099a9a0df584cac2478ec5a6e83924 Mon Sep 17 00:00:00 2001
> From: Wentao_Liang <Wentao_Liang_g@163.com>
> Date: Fri, 25 Feb 2022 11:49:54 +0800
> Subject: [PATCH] Fix a potential Use-after-free in
>  virtio_iommu_handle_command() (v6.2.0).
> 
> Signed-off-by: Wentao_Liang <Wentao_Liang_g@163.com>
> ---
>  hw/virtio/virtio-iommu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index aa9c16a17b..a394901347 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -657,6 +657,7 @@ out:
>          virtio_notify(vdev, vq);
>          g_free(elem);
>          g_free(buf);
> +        buf = NULL;
>      }
>  }

I merged this fix, adding the commit log description.
I also note it should be sent inline not as an attachment.

Thanks a lot for the contribution!

> -- 
> 2.25.1
> 


