Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF6463CF6F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 07:59:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0H4Q-0004Y4-C1; Wed, 30 Nov 2022 01:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0H4M-0004U6-RQ
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:59:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0H4L-0001XK-42
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669791584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lJtoofdeJMuIc9PTKR7itZTKumDxXdTPtFcBbhiFZ6s=;
 b=DOWEHKudTMfty9Pbi/KLbNkrhaq/2qM7efB6l9ujmY1Tq0H2ZDu7v/8FC8TCfLwxveqgti
 /R9YXGzpv5QPoAwh/JUk9g/Z7wQlZhtAiaDP/jTFmLoOE/lT3EC0Diid1ISvqQ1L8vNraG
 AdGALCqZBp4BMPXRxPle9uPrWnUwohw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-501-XkE4nYe1NqGr4DDA1EwT-Q-1; Wed, 30 Nov 2022 01:59:34 -0500
X-MC-Unique: XkE4nYe1NqGr4DDA1EwT-Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay40-20020a05600c1e2800b003cf8aa16377so8983023wmb.7
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 22:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJtoofdeJMuIc9PTKR7itZTKumDxXdTPtFcBbhiFZ6s=;
 b=3HMj5Prt7DVDeaHjJF00RPOZ26011F4SjA6OdC4S4+OIQGe6MprCAJveOM8yK7BuZa
 E/ohJ2LkmAT+yc/qRzopvtcOVmzDBZne4zkdPxAnCpcIUq8D/fWdZn/z0g9jAEhUoiXW
 ntZ3sH391Cv4YVUdDfPSf2WjxLfPO+v/Y6M4q9IeMcdDZclAfjNYTaNddwPpKdyyB9lb
 SuSYIIvmSbsAf3DwF9979L8bubKsxE/0pbk7HziBdIzkiG5KDuphDmwP28FMf2Ez6EBL
 cEmkoffC+zjltnII9lrDoZUSSaZ3d0LBZ5zldiO2ewKhyg6U9OaIC97Ts8PaQ4FE96aQ
 V1Kg==
X-Gm-Message-State: ANoB5pkUNlmlk00Tk2Ffncp55dEwGegUI9kGq1ILyQt1xOjlSMNxbHSA
 W6/nWIMhBUtrnwG5slyAdBVIC+5KLBip54XnTLCflvqcWpd7jEj//zkGD/P0oEg0zUW2sZ84Q2C
 HWYF1xt3oFXH9IVk=
X-Received: by 2002:a05:600c:1f1b:b0:3cf:35c8:289f with SMTP id
 bd27-20020a05600c1f1b00b003cf35c8289fmr35619274wmb.153.1669791572762; 
 Tue, 29 Nov 2022 22:59:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Msp2olkwron2FBppA1elbKc72QwsKFZfwiwHlmAXjEU24A5Ls4crGoRO0moQaboUv6nvabg==
X-Received: by 2002:a05:600c:1f1b:b0:3cf:35c8:289f with SMTP id
 bd27-20020a05600c1f1b00b003cf35c8289fmr35619260wmb.153.1669791572427; 
 Tue, 29 Nov 2022 22:59:32 -0800 (PST)
Received: from redhat.com ([2.52.19.245]) by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4d10000000b00241c712916fsm762773wrt.0.2022.11.29.22.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 22:59:31 -0800 (PST)
Date: Wed, 30 Nov 2022 01:59:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: leixiang <leixiang@kylinos.cn>
Cc: qemu-devel@nongnu.org, xieming@kylinos.cn, zengchi@kylinos.cn
Subject: Re: [RESEND PATCH] virtio-pci: fix vector_irqfd leak in
 virtio_pci_set_guest_notifiers
Message-ID: <20221130015901-mutt-send-email-mst@kernel.org>
References: <20220826030646.1003059-1-leixiang@kylinos.cn>
 <20221130055611.1037023-1-leixiang@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130055611.1037023-1-leixiang@kylinos.cn>
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

On Wed, Nov 30, 2022 at 01:56:11PM +0800, leixiang wrote:
> proxy->vector_irqfd did not free when set guest notifier failed.
> 
> Signed-off-by: Lei Xiang <leixiang@kylinos.cn>
> Tested-by: Zeng Chi <zengchi@kylinos.cn>
> Suggested-by: Xie Ming <xieming@kylinos.cn>

Thanks a lot!  Fixes tag? When was the leak introduced?

> ---
>  hw/virtio/virtio-pci.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index c6b47a9c..4862f83b 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1038,6 +1038,12 @@ assign_error:
>      while (--n >= 0) {
>          virtio_pci_set_guest_notifier(d, n, !assign, with_irqfd);
>      }
> +
> +   g_free(proxy->vector_irqfd);
> +   proxy->vector_irqfd = NULL;
> +
>      return r;
>  }
>  
> -- 
> 
> 
> No virus found
> 		Checked by Hillstone Network AntiVirus


