Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF2F6B7E9D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 18:02:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pblXj-0003Oi-P9; Mon, 13 Mar 2023 13:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pblXb-0003NK-3D
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:00:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pblXZ-0001hU-9T
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678726851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/NTA0m58VYA2FYYSRkiqdmY+kq2aNlBMmAjVBPjoxA=;
 b=Uc9AvQpdrKx026DrWekZbeJYjOa/dWZG2BY6rS1BAi+4n7EMSoBogIP2RjEFUmExrCiMnK
 kJ3GY1lKt9yHuEIoOWaTqoBgSIi7s2xB42vfZasxyhHmg2QO9p/U9JL8irMEuamCHsUD13
 uCemhrQ3G/UqeUC63aiPVXiq5VKHMZs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-vO4CjPytPXu2ZUF7chZS9w-1; Mon, 13 Mar 2023 13:00:50 -0400
X-MC-Unique: vO4CjPytPXu2ZUF7chZS9w-1
Received: by mail-wr1-f72.google.com with SMTP id
 u5-20020a5d6da5000000b002cd82373455so2245071wrs.9
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 10:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678726848;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f/NTA0m58VYA2FYYSRkiqdmY+kq2aNlBMmAjVBPjoxA=;
 b=G40K5w1bltqRBeV/6OIL/658uM5AfkH8swQGT0LVqRUDAjgs+oHiyDb/EACkh3OfRa
 7SFQpudCIwixCw11/FEp53xx2A3zJQdB7WyNcgrLo23gZ4+1NYA59pBx5Wgy0/Cxid1K
 /wMv07Soof0Vprfwfq0USQo4C1vrbblXuQ8pbMQdKJk/x+6T62sq8CZchpXGVq2fFYFY
 1luw1LEsnI/L56k7xjzAhpiwDZH8NAQzJRHSVgY7S5gbZhN5E+ZYR0V5N+Ski4Ssh5IU
 AROEV/tFRuLWohzzfxxjDWoBYMPJDXZHusY7pOpJeCK1UgDLl3EqHMtgH5nhJI7ew5kv
 +9QQ==
X-Gm-Message-State: AO0yUKUipu8XK1v5uaBzyub7wTQT3UdSdfJAb1oAQxGMenwl5PxgVtgT
 pUz241eRUJcOr4laLMbKQ0wETPnRkh0DKCRWS/rCAcLgX9PBocs4lFbFenHi3jAPdL0U/1M8bY0
 51ZIApHQi1t/Cnqo=
X-Received: by 2002:a05:600c:4ed4:b0:3ed:26c1:8e5a with SMTP id
 g20-20020a05600c4ed400b003ed26c18e5amr2554009wmq.10.1678726848174; 
 Mon, 13 Mar 2023 10:00:48 -0700 (PDT)
X-Google-Smtp-Source: AK7set//NAtgBKCJjO9LYNVVphWAqwVkkBHkZ0kKD/pN62ERc3kHO+03ewX/RyRMzm3HwDQfhDlvwg==
X-Received: by 2002:a05:600c:4ed4:b0:3ed:26c1:8e5a with SMTP id
 g20-20020a05600c4ed400b003ed26c18e5amr2553987wmq.10.1678726847921; 
 Mon, 13 Mar 2023 10:00:47 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de.
 [109.43.179.26]) by smtp.gmail.com with ESMTPSA id
 p1-20020a1c7401000000b003e1202744f2sm255637wmc.31.2023.03.13.10.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 10:00:47 -0700 (PDT)
Message-ID: <c57c82bf-1b05-f29b-80fa-04a7279b5d39@redhat.com>
Date: Mon, 13 Mar 2023 18:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 10/11] include/exec: fix kerneldoc definition
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-11-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230310103123.2118519-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/03/2023 11.31, Alex Bennée wrote:
> The kerneldoc processor complains about the mismatched variable name.
> Fix it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/exec/memory.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 6fa0b071f0..15ade918ba 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1738,7 +1738,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>    *
>    * @notifier: the notifier to be notified
>    */
> -void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
> +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier);

I also keep running into this problem ... I wonder whether we should run 
sphinx with "-W" to turn warnings into errors when configure has been run 
with --enable-werror ...?

Anyway, for this patch here:

Reviewed-by: Thomas Huth <thuth@redhat.com>


