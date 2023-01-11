Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7082665C0E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 14:03:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFajb-0005C6-Eo; Wed, 11 Jan 2023 08:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFaj2-000563-4l
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFaj0-0006BN-KJ
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673442055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fH76dWLRm4qvw1afrGBWOaF1gspGKCsHj2wwuT9B7DU=;
 b=MruAp+jbbYmrMmAv6M8mgL7oW4Lz89HjmXPj3ul6w9xxUitMq4PBQYXNSyV/8HbwzZ2HoD
 8zXjO+w0Ny0Y5qBPUgrbPF9Lo/MzsmbTyEvbjRexUFphugBksrIy1sAAIRJbLSsgmtvUoA
 BIjSj98m0m5yyaNEESFCDdCJoxOZdFk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-B1tcA4oSMNyw4-_w3WayFA-1; Wed, 11 Jan 2023 08:00:54 -0500
X-MC-Unique: B1tcA4oSMNyw4-_w3WayFA-1
Received: by mail-qk1-f197.google.com with SMTP id
 bm30-20020a05620a199e00b006ff813575b1so10956521qkb.16
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 05:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fH76dWLRm4qvw1afrGBWOaF1gspGKCsHj2wwuT9B7DU=;
 b=rsVX5gywZyWI6DPqf7BELL8EHlqNzs1dE7VI2kA649RC/lrd7H+eMA/+2HyZE9f6MG
 W1slSBcoF92oByFaGsZLY6lNUYqS5DFaW06pd+YMlU0l9hb2Oovkuv0XvSt0RrrV5mP8
 o5EyR+ndXpIRXkPUxLAKhlXvyRpIGx+nodhFW6mMYpQdbroBtNLE6PMdSwXQhr4HAEsn
 WIkHRTQm2iEcp9clFrSRBUYYtgLBdTYTQZSKthRJkp8CVbUqBB0lQrcDLI2xXlylm9w6
 q2709oOswNYtl64tlgLjbWiR/9xtuJvmQ1OgU0y3/6PPNj9BpNmzL77q7F35aEAWL4Cs
 Fm6g==
X-Gm-Message-State: AFqh2koCtIwLjowz8CAsLDQkrhYNv7ugiVIovr+/QUBLF5LvijefSFKN
 zwWjdIEDSqq0sGvT9Zb14Ec1MCwzD2atZUNICUv9lVaUiPD/YpJk3m20rvA7GxOWMl/QWRD9JBY
 aV2i9LuI1fuBE2BQ=
X-Received: by 2002:ac8:5413:0:b0:3a5:27f6:4d4e with SMTP id
 b19-20020ac85413000000b003a527f64d4emr91967743qtq.65.1673442053265; 
 Wed, 11 Jan 2023 05:00:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuk4zdme+D6RazZ5+1IQymw7+TfOTIgk8ZgjpKXRi6FAjggg9RGqM1xc4dkxw7q8VjfeqA2Iw==
X-Received: by 2002:ac8:5413:0:b0:3a5:27f6:4d4e with SMTP id
 b19-20020ac85413000000b003a527f64d4emr91967620qtq.65.1673442052499; 
 Wed, 11 Jan 2023 05:00:52 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-91.web.vodafone.de.
 [109.43.176.91]) by smtp.gmail.com with ESMTPSA id
 7-20020ac85647000000b0039cc82a319asm7551010qtt.76.2023.01.11.05.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 05:00:52 -0800 (PST)
Message-ID: <cfc5086d-299c-cb31-1b14-da8490fcada0@redhat.com>
Date: Wed, 11 Jan 2023 14:00:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] virtio-rng-pci: fix migration compat for vectors
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, mst@redhat.com, eduardo@habkost.net,
 stefanha@redhat.com, david.daney@fungible.com, qemu-stable@nongnu.org
References: <20230109105809.163975-1-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230109105809.163975-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 09/01/2023 11.58, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Fixup the migration compatibility for existing machine types
> so that they do not enable msi-x.
> 
> Symptom:
> 
> (qemu) qemu: get_pci_config_device: Bad config data: i=0x34 read: 84 device: 98 cmask: ff wmask: 0 w1cmask:0
> qemu: Failed to load PCIDevice:config
> qemu: Failed to load virtio-rng:virtio
> qemu: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-rng'
> qemu: load of migration failed: Invalid argument
> 
> Note: This fix will break migration from 7.2->7.2-fixed with this patch
> 
> bz: https://bugzilla.redhat.com/show_bug.cgi?id=2155749
> Fixes: 9ea02e8f1 ("virtio-rng-pci: Allow setting nvectors, so we can use MSI-X")
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   hw/core/machine.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f589b92909..45459d1cef 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -45,6 +45,7 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
>   
>   GlobalProperty hw_compat_7_1[] = {
>       { "virtio-device", "queue_reset", "false" },
> +    { "virtio-rng-pci", "vectors", "0" },
>   };
>   const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


