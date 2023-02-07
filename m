Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3F868E31E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 22:48:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPVpQ-0007pE-1E; Tue, 07 Feb 2023 16:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPVpO-0007p1-MM
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:48:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPVpN-0008Lg-4f
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675806516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EC60mKDQ6SyUvTfaxp2LlrcVC4Jms2w7pouegAkAcl4=;
 b=AZZmJ+86r8epS4f/Ua+PUHclx9YwEHgf7X10NurFL7DauMNANZu+uv0W0HvmMyFy06yMsv
 X+BmnDrmVnY7HRl0sVCs7QWKRsAvz/wiTDht3rqwY3/k0b0H7PMbzGsXWgvhmwhetb9IQe
 M44YhYqpv4IbkLddCe8Ph9F0bw1VFC8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-KNWiOSKDPtuNSTV6J6EgvQ-1; Tue, 07 Feb 2023 16:48:34 -0500
X-MC-Unique: KNWiOSKDPtuNSTV6J6EgvQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 x10-20020a05600c21ca00b003dc5584b516so53568wmj.7
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 13:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EC60mKDQ6SyUvTfaxp2LlrcVC4Jms2w7pouegAkAcl4=;
 b=7N4L+5kB42HX7CTSeT+nYaKpgFmh1hrEGw9izw7lx+wGykEeEuNKkU4zpitSlowCC5
 z12VBusq2oA08C0zaYPhjHO5eRkazp9rEX8lcfq1HM5fBSawnd+DvWuv16MvLpWUJWP/
 Z0zwI1RH6DvHRoiztPZxiVts1Z3Vnjl9QHHG3ldnhvYbp6fuocCf/5JP1bfnxydZWKV6
 F7t5JSRyxdIb7uJCuhPEcexfixMe1rjnMXVqLgtge1BkoNB1qijJEQCvsuI8sWFZCIqm
 dRjrHo7IomeGhtuVWH9LEfPtC4xgWSWQFbSQPeeXLNcAEvjKZNvmV8u+/Czwgsj5lPV4
 TtYQ==
X-Gm-Message-State: AO0yUKVXcWC0wNcFGLDo4/IbHwbVKXpx1A7iPqi9V/UWAZ+ADevM/da/
 qsLUGdvNyHIne5pOdMGJeZ2CE8vBsi+VMW1S4kGyfoiKMPqh/F2Wgu+vF33P/FH4KumV1oZgWBT
 c7o/BOGYXj2phVNNKag/w
X-Received: by 2002:a05:6000:1211:b0:2bf:95cc:744f with SMTP id
 e17-20020a056000121100b002bf95cc744fmr3850249wrx.56.1675806513287; 
 Tue, 07 Feb 2023 13:48:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/m9sqOYZ1kU8q4t6a2dT7H0w2hDZLyU9bCQ2Z0cT3BISK8lqerBzVJjAIRf2NggEYNSgCOTg==
X-Received: by 2002:a05:6000:1211:b0:2bf:95cc:744f with SMTP id
 e17-20020a056000121100b002bf95cc744fmr3850237wrx.56.1675806513080; 
 Tue, 07 Feb 2023 13:48:33 -0800 (PST)
Received: from redhat.com ([2.52.8.17]) by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5084000000b002c3db0eec5fsm10406656wrt.62.2023.02.07.13.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 13:48:32 -0800 (PST)
Date: Tue, 7 Feb 2023 16:48:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, philmd@linaro.org,
 david.daney@fungible.com
Subject: Re: [PATCH] virtio-rng-pci: fix transitional migration compat for
 vectors
Message-ID: <20230207164805-mutt-send-email-mst@kernel.org>
References: <20230207174944.138255-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207174944.138255-1-dgilbert@redhat.com>
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

On Tue, Feb 07, 2023 at 05:49:44PM +0000, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> In bad9c5a5166fd5e3a892b7b0477cf2f4bd3a959a I fixed the virito-rng-pci

virtio?

> migration compatibility, but it was discovered that we also need to fix
> the other aliases of the device for the transitional cases.
> 
> Fixes: 9ea02e8f1 ('virtio-rng-pci: Allow setting nvectors, so we can use MSI-X')
> bz: https://bugzilla.redhat.com/show_bug.cgi?id=2162569
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/core/machine.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b5cd42cd8c..4627b274d9 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -49,6 +49,8 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
>  GlobalProperty hw_compat_7_1[] = {
>      { "virtio-device", "queue_reset", "false" },
>      { "virtio-rng-pci", "vectors", "0" },
> +    { "virtio-rng-pci-transitional", "vectors", "0" },
> +    { "virtio-rng-pci-non-transitional", "vectors", "0" },
>  };
>  const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>  
> -- 
> 2.39.1


