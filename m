Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B5C68E01B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:32:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSlR-0008As-A0; Tue, 07 Feb 2023 13:32:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPSlN-0008AU-NG
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:32:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPSlL-0006L6-Ot
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675794734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fo2at1Butan0naaTyJgYBPvOncceuawf6xc6IYqjxuk=;
 b=QGOkgOBJ2C0FKrPtEWUIHGdllpW4DQzZT0gkOU3/UZQh1lvDua10AI9oS+jCb5HB2i5bA4
 wFV8uGru0TePHtbwY+RnaSFEe+EIEgy77a8vDRhvVt5XznRsIVGzB5qVEWP/oc1i7wXKRG
 IFJALEvg8pY7yYMNEew2Chbys0NrydA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-CTHj0M77NFODxuWdfzntNA-1; Tue, 07 Feb 2023 13:32:13 -0500
X-MC-Unique: CTHj0M77NFODxuWdfzntNA-1
Received: by mail-qk1-f200.google.com with SMTP id
 g6-20020ae9e106000000b00720f9e6e3e2so10473371qkm.13
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 10:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fo2at1Butan0naaTyJgYBPvOncceuawf6xc6IYqjxuk=;
 b=qF3VLBSuu6AY9IqKkzC9eK9Ey+bvtYbYVgHrnU+GBCMwsTgIcq7hwc79lMFyPb7zta
 bgDeCuXff1Ya5SwKjREO3GLtIs4sR7SnfwDR6U1mIL76oPwuw+bwTIf6RpMsB0kNrJJ2
 lOzersMJCADrcOtLs9zptAE2re9R65CccHUSU31BhPkrWHAZI8+jUpLxPYE3nc6uMU2A
 vM2rMKl84MPnFkY95kEtgrHRB+bxdSliK51fmYE+p14+vEXdSvhYUN2K8cKZPmueTQqr
 RoaZo7svqrx0f13ibqUeKqVkTruDAo5hPvrXEQ8C4bvEh8zJ596nX8RDEg+Ns5gehH63
 ZnOQ==
X-Gm-Message-State: AO0yUKXobNEUD5Emh76DtiXcDuy/1itlWYZAqhgZhcJH8fbhy5QlA867
 uNMd5JXbfXDC2DnRX2u1Q72KqAKeuyRD0EsRIXdMvZ296HfLcst6pU6JWuvLUfSJLOyTkrtt6t1
 JhBlT+ud0jd2gtwE=
X-Received: by 2002:a05:6214:c4d:b0:56b:f4ec:abeb with SMTP id
 r13-20020a0562140c4d00b0056bf4ecabebmr6278038qvj.10.1675794732810; 
 Tue, 07 Feb 2023 10:32:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9y8ZsdVmlPDt9A+a//zyMSrbszo5XPB9sbWwOr/ZALydeDP+f+lsxohp4DQlPL5iLeQf0TVQ==
X-Received: by 2002:a05:6214:c4d:b0:56b:f4ec:abeb with SMTP id
 r13-20020a0562140c4d00b0056bf4ecabebmr6278023qvj.10.1675794732577; 
 Tue, 07 Feb 2023 10:32:12 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 bk42-20020a05620a1a2a00b006fa16fe93bbsm10237059qkb.15.2023.02.07.10.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 10:32:11 -0800 (PST)
Message-ID: <728e9ead-6f22-0e22-3c8d-1e31e5f8e294@redhat.com>
Date: Tue, 7 Feb 2023 19:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] virtio-rng-pci: fix transitional migration compat for
 vectors
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, mst@redhat.com, philmd@linaro.org
Cc: david.daney@fungible.com
References: <20230207174944.138255-1-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230207174944.138255-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 07/02/2023 18.49, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> In bad9c5a5166fd5e3a892b7b0477cf2f4bd3a959a I fixed the virito-rng-pci
> migration compatibility, but it was discovered that we also need to fix
> the other aliases of the device for the transitional cases.
> 
> Fixes: 9ea02e8f1 ('virtio-rng-pci: Allow setting nvectors, so we can use MSI-X')
> bz: https://bugzilla.redhat.com/show_bug.cgi?id=2162569
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   hw/core/machine.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b5cd42cd8c..4627b274d9 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -49,6 +49,8 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
>   GlobalProperty hw_compat_7_1[] = {
>       { "virtio-device", "queue_reset", "false" },
>       { "virtio-rng-pci", "vectors", "0" },
> +    { "virtio-rng-pci-transitional", "vectors", "0" },
> +    { "virtio-rng-pci-non-transitional", "vectors", "0" },
>   };
>   const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


