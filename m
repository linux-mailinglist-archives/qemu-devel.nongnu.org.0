Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F4030AAD2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:16:45 +0100 (CET)
Received: from localhost ([::1]:47734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6awV-0006e5-H6
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6aus-0005mg-3B
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:15:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6aun-0000mM-Nv
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612192495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozIpMqdD+iWDcSAqUu8JnyllJwpaDgaHUGFapFVXhs4=;
 b=RJjDFif06iWVHu7y0/ZwyIksGUjIJvw96qBJImcjxtA7iCjpov0XeViAvkhPdkp4zlGb87
 impQggHRPyW2DihDZ6s0jgT6K3Em2pVuo+FjUh0KJbccthe6AFrsLEVDyqWIs1TzDTD++O
 OQINHAisSCxNZowByyO2kQlD1Es+6x8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-t919khUmOz2As2Vi-n10lg-1; Mon, 01 Feb 2021 10:14:51 -0500
X-MC-Unique: t919khUmOz2As2Vi-n10lg-1
Received: by mail-ej1-f69.google.com with SMTP id ar27so7309486ejc.22
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ozIpMqdD+iWDcSAqUu8JnyllJwpaDgaHUGFapFVXhs4=;
 b=HFkMqc8C6xAfh4ZkXnI4jBHPrUMjKZaag9z/R4FKyRfXks468S92HuPuqtbCgdxqoH
 FFfZTEr1TLw07bJRgQYWRA2lY3qF3uRExxOMJ6G0qYAWL+eXXyGo62TVMR+J/12XcWYJ
 msm5G3tZfXkWX4ZRs7TurPUG0a7O3APcDrxpSYUbm0109DiOBSk60XcTMfjjIga9PrLP
 cQ11IyDG4fuMbzSTSPqrbn9G/ho+jbEGe0jCOoZtKk3eU49LhEeAJcdgH+6OzEuqy9rA
 IqlL/CQFfvwINMs3LRR5LxRqYu73ywuazDRGB4Pns7OUSgoJMGRJ1eV8tQvjA7VD7wHP
 h9Dg==
X-Gm-Message-State: AOAM531YMlaMRP314Gr35KE7qUUHgisNd04T0TYx4DOUSg79yO0RaWRB
 j+9qWSsjKJl7ko1YAgb9Lf/WXf4kW80IAR/H0IJt6swEykNMMN6d00WE3w/0m0nqcUQ5hx/kzMh
 jwAHymAA7gqxJ8PE=
X-Received: by 2002:a17:906:2b11:: with SMTP id
 a17mr2895249ejg.203.1612192490224; 
 Mon, 01 Feb 2021 07:14:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXlZF+TW4mrA+26ATw+qpSwDnRGpGFo7oajB4U8h44xBqc8IK9tixzY7gowcJEeUW2K7C7fQ==
X-Received: by 2002:a17:906:2b11:: with SMTP id
 a17mr2895213ejg.203.1612192489878; 
 Mon, 01 Feb 2021 07:14:49 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id m26sm8014991ejr.54.2021.02.01.07.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:14:48 -0800 (PST)
Subject: Re: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
To: Keqian Zhu <zhukeqian1@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <20201217014941.22872-3-zhukeqian1@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ef90fe8b-297d-0a57-bad0-ebc6e1d24333@redhat.com>
Date: Mon, 1 Feb 2021 16:14:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201217014941.22872-3-zhukeqian1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 jiangkunkun@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/17/20 2:49 AM, Keqian Zhu wrote:
> The parameters start and size are transfered from QEMU memory
> emulation layer. It can promise that they are TARGET_PAGE_SIZE
> aligned. However, KVM needs they are qemu_real_page_size aligned.
> 
> Though no caller breaks this aligned requirement currently, we'd
> better add an explicit assert to avoid future breaking.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  accel/kvm/kvm-all.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> ---
> v2
>  - Address Andrew's commment (Use assert instead of return err).
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index f6b16a8df8..73b195cc41 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -692,6 +692,10 @@ out:
>  #define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size << KVM_CLEAR_LOG_SHIFT)
>  #define KVM_CLEAR_LOG_MASK   (-KVM_CLEAR_LOG_ALIGN)
>  
> +/*
> + * As the granule of kvm dirty log is qemu_real_host_page_size,
> + * @start and @size are expected and restricted to align to it.
> + */
>  static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>                                    uint64_t size)
>  {
> @@ -701,6 +705,9 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>      unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
>      int ret;
>  
> +    /* Make sure start and size are qemu_real_host_page_size aligned */
> +    assert(QEMU_IS_ALIGNED(start | size, psize));

Why not return an error instead of aborting the VM?

>      /*
>       * We need to extend either the start or the size or both to
>       * satisfy the KVM interface requirement.  Firstly, do the start
> 


