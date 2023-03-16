Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968206BCA27
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 09:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcjPC-0005Kc-DB; Thu, 16 Mar 2023 04:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcjPA-0005KF-Bz
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:56:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pcjP8-0006fA-FU
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678956968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CV2jxPLkXLkM+ckMbPXOmoR6s3m44SyNieq5VDL5uo0=;
 b=LkFNbwwyORmEPmnQU750DIDQwXMaxabuOtg8U9s6N5eMdlj7nGeZsKOCzUaK9Ho1ggJEmz
 u/IdRZuIeQeGMBO2eZayUWUb8QV3AhpolNXt5eptgxB4vDhCbuZqeq80gU05wbVPPaX2Xq
 5J2FBvU+3/1qf1G2upvd5oxIFeGYMmM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-_2z9n44rPNem3pqbKSnkqQ-1; Thu, 16 Mar 2023 04:56:06 -0400
X-MC-Unique: _2z9n44rPNem3pqbKSnkqQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so454336wmb.8
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 01:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956964;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CV2jxPLkXLkM+ckMbPXOmoR6s3m44SyNieq5VDL5uo0=;
 b=pkVrqLBonLn7UkXIawuQyOTRJOtB06M7NHazIEr3AUBgtOmzkZVG88BmRB9iN0zCc/
 B8QY0hJefqreG4DtyqImtZZw8c1dqgFRJnqRGziae91GlooNJnPWyQSp817982N6Wqxx
 DcawTSoQWfRGPoQaVlqG35izomGMJkfNNEgaMQrZ+6bPbmua79lQfzVC3lyYWfN4lCA8
 8vOWmBWAX2D3sBFyVL1wl6G6EzS0nJzF15P+37Gg8D0pdAJsMPA1Xt30lFc/JoN8dWtG
 7VVTmzwWuGJpkJxb8mJtQDQd+o/IKMBcjeH2MYxh3/Trcpchi1sBUvm0k6TvRPNUY0rF
 Rqnw==
X-Gm-Message-State: AO0yUKWoHFBn708v4KE8pFgcfhUBAlc+o6UaFxY2MUf72PddECUadbv9
 SFmdbn5XBDjceqsN03juAw+V1Z6CkQkt274qRZ6+0/r3+4RFCcdq/bIKz9ocfaSbQ/U96mBTvEp
 A/5q1a5ZYxPEHvVo=
X-Received: by 2002:a05:600c:58d:b0:3ed:6022:df7e with SMTP id
 o13-20020a05600c058d00b003ed6022df7emr591637wmd.4.1678956964801; 
 Thu, 16 Mar 2023 01:56:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set9NCtxlSH4gDEdPtNR/7yus0Xm5xKq4vypcSU8Kx6Mc0i49bSNYzsPYkHdKZ+rwq2eStprj/A==
X-Received: by 2002:a05:600c:58d:b0:3ed:6022:df7e with SMTP id
 o13-20020a05600c058d00b003ed6022df7emr591619wmd.4.1678956964502; 
 Thu, 16 Mar 2023 01:56:04 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a7bc403000000b003ed1f69c967sm4405316wmi.9.2023.03.16.01.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:56:04 -0700 (PDT)
Message-ID: <6e74861c-eefc-2118-6ab5-077ac74b96ab@redhat.com>
Date: Thu, 16 Mar 2023 09:56:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0] exec/memory: Fix kernel-doc warning
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230315072552.47117-1-shentey@gmail.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230315072552.47117-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 15.03.23 08:25, Bernhard Beschow wrote:
> During build the kernel-doc script complains about the following issue:
> 
>    src/docs/../include/exec/memory.h:1741: warning: Function parameter or member 'n' not described in 'memory_region_unmap_iommu_notifier_range'
>    src/docs/../include/exec/memory.h:1741: warning: Excess function parameter 'notifier' description in 'memory_region_unmap_iommu_notifier_range'
> 
> Settle on "notifier" for consistency with other memory functions.
> 
> Fixes: 7caebbf9ea53
>         ("memory: introduce memory_region_unmap_iommu_notifier_range()")
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


