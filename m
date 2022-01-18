Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798664921C8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 10:02:58 +0100 (CET)
Received: from localhost ([::1]:51842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kOB-00088s-2c
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 04:02:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9k30-0000K1-Fr
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 03:40:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9k2y-0007U5-3t
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 03:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642495254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVr7Cs+Pwfadzaf8ZFnLQKOq+C2rpKCpCs05P0SzQ14=;
 b=haSDjwkGYDCEy7r7o7yl+ivCBIm/hiXkt0N7au1/da2zwkACtoM/8klyRvPpqb4BY0iHnF
 cq5ChscQ98bW/u53ndl4TFzSab86/ffzu2qEM9NJ8lWXqaPvU44/px+jwVJ8O6m85U3mbx
 mpM2SSZsfFOYYJX7yhy44l4vUED02is=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-vhxvHo0pN1awBqx_jos6dg-1; Tue, 18 Jan 2022 03:40:53 -0500
X-MC-Unique: vhxvHo0pN1awBqx_jos6dg-1
Received: by mail-ed1-f69.google.com with SMTP id
 h11-20020a05640250cb00b003fa024f87c2so16354640edb.4
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 00:40:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AVr7Cs+Pwfadzaf8ZFnLQKOq+C2rpKCpCs05P0SzQ14=;
 b=L2mW9uJVFBRnVvjJL8Vnh30emZM3P6qNI/LLsPf0v/cYwD07lhTT0vGeg5Y74YQlOf
 xO0hQxM3lzuEo+U0l35Nm+pUIP9c8ZpiEyaI5S2c9CJI9PSkFTX+0xVU5CVBGzXWuCr2
 Nb/Do0jjB1xwye4vwn4oo3cLaH9UEgIAaYsHlkMQyodM6eqYS7pPvKwWZEj7YU/lRXld
 Q3QUgJT1HTZtwes3JsQQqIFiOzCeMhsZCGPSVTwb47icqCGHTR25141MGEVus5u81Imb
 QToijBJq1HlzSicqUBcscwOnWtRJ7OltBeRWQlINC5ySpEZ6Kfq1vkMqDVcivxvTXE0l
 d6sw==
X-Gm-Message-State: AOAM5322lUsV2zWl3hNloMLE3VSERbhLL5dveM5iCVWsOTNz+gBsIL2v
 qhD15f9q1FAhQURQHnlHCaTLM+5Zs/dY1N5l4sfwSvRx59G9TxPKct78wQGbkpl47A3/15G/gF+
 bPxV5wPagtlVO+PonOJTDm/XYYBv/eHKdQVm5XpMEsp1JywUvV8N+BHpHuhayOew=
X-Received: by 2002:a05:6402:483:: with SMTP id
 k3mr24286892edv.323.1642495252277; 
 Tue, 18 Jan 2022 00:40:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3DQuaN7wq5pQ5OnAvSyf9cq8Nl6CqIXC6GwziyVHOMIhWdJPi0+VuTNysq/mp8+CAgrNIIA==
X-Received: by 2002:a05:6402:483:: with SMTP id
 k3mr24286867edv.323.1642495251998; 
 Tue, 18 Jan 2022 00:40:51 -0800 (PST)
Received: from ?IPV6:2003:cb:c70c:2500:5b4d:fa8e:5311:1e28?
 (p200300cbc70c25005b4dfa8e53111e28.dip0.t-ipconnect.de.
 [2003:cb:c70c:2500:5b4d:fa8e:5311:1e28])
 by smtp.gmail.com with ESMTPSA id p25sm6811624edw.75.2022.01.18.00.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 00:40:51 -0800 (PST)
Message-ID: <d87e2097-c689-e08e-8e3e-27d08a0e8e8c@redhat.com>
Date: Tue, 18 Jan 2022 09:40:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 0/3] memory: memory_region_is_mapped() cleanups
To: qemu-devel@nongnu.org
References: <20211102164317.45658-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211102164317.45658-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.11.21 17:43, David Hildenbrand wrote:
> Playing with memory_region_is_mapped(), I realized that memory regions
> mapped via an alias behave a little bit "differently", as they don't have
> their ->container set.
> * memory_region_is_mapped() will never succeed for memory regions mapped
>   via an alias
> * memory_region_to_address_space(), memory_region_find(),
>   memory_region_find_rcu(), memory_region_present() won't work, which seems
>   okay, because we don't expect such memory regions getting passed to these
>   functions.
> * memory_region_to_absolute_addr() will result in a wrong address. As
>   the result is only used for tracing, that is tolerable.
> 
> Let's cleanup/fix the code and documentation of memory_region_is_mapped()
> and change one user that really should be checking something else.
> 
> v1 -> v2:
> - "memory: Make memory_region_is_mapped() succeed when mapped via an
>    alias"
> -- Add an assertion
> - Add RBs
> 
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
> 
> David Hildenbrand (3):
>   machine: Use host_memory_backend_is_mapped() in
>     machine_consume_memdev()
>   memory: Make memory_region_is_mapped() succeed when mapped via an
>     alias
>   memory: Update description of memory_region_is_mapped()
> 
>  hw/core/machine.c     |  2 +-
>  include/exec/memory.h |  4 +++-
>  softmmu/memory.c      | 13 ++++++++++++-
>  3 files changed, 16 insertions(+), 3 deletions(-)
> 

Gentle ping

-- 
Thanks,

David / dhildenb


