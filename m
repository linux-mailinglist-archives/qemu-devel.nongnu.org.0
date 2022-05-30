Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6B1537A86
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:18:07 +0200 (CEST)
Received: from localhost ([::1]:52184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nveLV-0005wI-Ux
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nveH4-0002l6-Ny
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:13:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nveH1-0001yI-Pb
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653912806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G92K6FlfsUZNlAMUZMuXO1o5ECVf3BwnoLYlotS3v9w=;
 b=G3+2kFexebr7td8kBxxCLURF8zPzEF5umNk9LZbVUieyFvm3I6RII45hufbcKkiYY3kjBY
 nsqngSI5LE+ttaIyAstS9GeWS/6L0E5NFPel0K8KTEMduSe7nhm93g4sSzJ6xcGDCDpZKM
 U38hFGalcd2A+9JQpxWx0GozAVu71Lg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-UMHv1DQVPJO0YO6Pqq8Q4g-1; Mon, 30 May 2022 08:13:25 -0400
X-MC-Unique: UMHv1DQVPJO0YO6Pqq8Q4g-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg40-20020a05600c3ca800b00394779649b1so9633490wmb.3
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 05:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=G92K6FlfsUZNlAMUZMuXO1o5ECVf3BwnoLYlotS3v9w=;
 b=eczcYXvrE0MlXPKeU8mIyhU5NibDfgd8wYhJSCxrTyVmyREGzgPF1iBcrR2SESMM6h
 WW5yzkuaLSkbFqzDEFY+4k04IkOLeN0PalSeb4ZwzFUE7K2alPOK6ziOqOOXLICeHyKR
 KxtgMN3jz6/8bHholy489qZW9egj8pXl/iaQstVwyU1FqMb0g8gPNkl5nxlsOO1zOUbb
 k8JBRshL+gvnxZQVPQGmtwNNNKBUcDZFEHJV93UAc7AKI0mYd+wCPpvmwB5WLBHFlxdd
 ZT5B7U+EW20r4m5fgJMVj4X5+M1PdA2vHqI1XRc4XmCg5ZxVTfX8UD2jdtDTzlVGKunr
 scWA==
X-Gm-Message-State: AOAM530kIHTGU/U6wFwcfblrvR+NAFP34r1dE7vefWdNN+GKhbOuYXs6
 PzcZMkuQFiseeu1VdFjUv4vON+ZFWEjmfjwhdY2acKPOcBUFCXcQ2HhvJNkxwoMiMW67/DTH9TN
 t0Jbs4uUc70C0mDI=
X-Received: by 2002:adf:db8b:0:b0:20f:fb4f:c3da with SMTP id
 u11-20020adfdb8b000000b0020ffb4fc3damr22621282wri.163.1653912804221; 
 Mon, 30 May 2022 05:13:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtFXlDfdCOGmATmL+w5DzFPuQB2V8FGDEKHU2lxib/d66Jdhv7Fp+6i0kOEaWUEC2Fx9QWfg==
X-Received: by 2002:adf:db8b:0:b0:20f:fb4f:c3da with SMTP id
 u11-20020adfdb8b000000b0020ffb4fc3damr22621253wri.163.1653912803984; 
 Mon, 30 May 2022 05:13:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:7c00:aaa9:2ce5:5aa0:f736?
 (p200300cbc7047c00aaa92ce55aa0f736.dip0.t-ipconnect.de.
 [2003:cb:c704:7c00:aaa9:2ce5:5aa0:f736])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a5d4ccc000000b0020fe61acd09sm8918321wrt.12.2022.05.30.05.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 05:13:23 -0700 (PDT)
Message-ID: <82fc8909-bf73-f2e6-0810-eea8761a417b@redhat.com>
Date: Mon, 30 May 2022 14:13:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/3] memory: Track whether a Device is engaged in IO
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220527161937.328754-1-alxndr@bu.edu>
 <20220527161937.328754-2-alxndr@bu.edu>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220527161937.328754-2-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.05.22 18:19, Alexander Bulekov wrote:
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag should be set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent DMA reentrancy issues. E.g.:
> sdhci pio -> dma write -> sdhci mmio
> nvme bh -> dma write -> nvme mmio
> 
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
> 
> Assumptions:
>  * Devices do not interact with their own PIO/MMIO memory-regions using
>    DMA.
> 
>  * There is now way for there to be multiple simultaneous accesses to a
>    device's PIO/MMIO memory-regions, or for multiple threads to perform
>    DMA accesses simultaneously on behalf of a single device.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

I think this patch should be squashed into the other ones, it doesn't
make particular sense without any actual users.


-- 
Thanks,

David / dhildenb


