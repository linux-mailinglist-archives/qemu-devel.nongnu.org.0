Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213BE68921D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:27:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNrOJ-0003vV-BX; Fri, 03 Feb 2023 03:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pNrNj-0003v8-J6
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:25:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pNrNh-0007fK-VF
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:25:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675412712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAwsFm5ldm5tYIqG2gde9vtRk5pAvQojADPO65fBIMA=;
 b=E++G1zV2LCRAsqeL21ZddEsS8302REigWjvem7sv8BXYVLPf118d5e5IrTUAkT56kqzALe
 wP30DzhPkhhN1DC88PNvXGx+2gQ3vv+0kYb+VS1BX9EgOovDOixf6yIq6asyY1MgHE7TQD
 7YN5HHV9c+NZBHD8cEbyM25BFywUnJQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-8m7NT_yEN6CE_LtlKpu80g-1; Fri, 03 Feb 2023 03:25:10 -0500
X-MC-Unique: 8m7NT_yEN6CE_LtlKpu80g-1
Received: by mail-wm1-f71.google.com with SMTP id
 iz20-20020a05600c555400b003dc53fcc88fso2242207wmb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 00:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :content-language:references:cc:to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LAwsFm5ldm5tYIqG2gde9vtRk5pAvQojADPO65fBIMA=;
 b=n/6ASSiTtcUVh5bnqVKzW8OhHkkvxQQM56R36ES6veT+jq4bdvtKuxrDo+ljEdqbaQ
 acOpwYTLUIWnDAxY2DwvSyMHXjXhT/Xk25MfYivwI4ZMOaUcasnQOaQzb7AfrqeWHrbY
 3wF2lsR2Exg2Qe+xgxDQs21n++dkgQJM4Aa2+Te/HP/2Ul1Tx9rx38s2ThKqtzDgzaYY
 Uhvbk95PFNkLrvJh4jV3AwCbuyztIOanOoDpoV3mE2t0zk6v/QLT5S2zW405umwBTmpB
 mW8HFqyAsV1SGXXmxTCUsMy+W6UYx1m7oUnMqh5bv/L8UZ5SBslEX4ZTwh0NGLkMS6f6
 WyKQ==
X-Gm-Message-State: AO0yUKXOOdbrMgvaMYYNpbkEG98XDVdlsbO9ym3+B5dKSyGX7IvwUeEx
 5dJaMi3m05zzIWInhecwdKot5zxb0aizDUvd91VxvHDxHiNzZfPf9kZeLwEJSLOiujOd4XYQyCC
 +Kr3bS37rBrLi/Gc=
X-Received: by 2002:a05:600c:4e8f:b0:3df:e21f:d705 with SMTP id
 f15-20020a05600c4e8f00b003dfe21fd705mr5109716wmq.28.1675412709631; 
 Fri, 03 Feb 2023 00:25:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9r8UekFErtL1wtNtuc3bRzE+JLhsZ48HZ9sHzvMSxwU9gFlSN0sA5r/Xa3l2OQc24460qEow==
X-Received: by 2002:a05:600c:4e8f:b0:3df:e21f:d705 with SMTP id
 f15-20020a05600c4e8f00b003dfe21fd705mr5109692wmq.28.1675412709381; 
 Fri, 03 Feb 2023 00:25:09 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:7900:b84d:7f2e:b638:3092?
 (p200300cbc7067900b84d7f2eb6383092.dip0.t-ipconnect.de.
 [2003:cb:c706:7900:b84d:7f2e:b638:3092])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b003da28dfdedcsm2254268wmo.5.2023.02.03.00.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 00:25:08 -0800 (PST)
Message-ID: <f2a2ac8a-e1f1-02ce-8dfb-72e1a09beef3@redhat.com>
Date: Fri, 3 Feb 2023 09:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Philippe Mathieu-Daude <philmd@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>
References: <20230202225603.27559-1-graf@amazon.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] hostmem-file: add offset option
In-Reply-To: <20230202225603.27559-1-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 02.02.23 23:56, Alexander Graf wrote:
> Add an option for hostmem-file to start the memory object at an offset
> into the target file. This is useful if multiple memory objects reside
> inside the same target file, such as a device node.
> 
> In particular, it's useful to map guest memory directly into /dev/mem
> for experimentation.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---

[...]

>   
> -    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, 0, readonly, errp);
> +    block = qemu_ram_alloc_from_fd(size, mr, ram_flags, fd, offset, readonly,
> +                                   errp);

IIUC, the existing offset implementation is a bit broken:


(1) qemu_ram_alloc_from_fd() does not handle the offset parameter 
correctly: The "file_size > 0 && file_size < size" calculation does not 
seem to consider the offset when checking for file sizes.

(2) file_ram_alloc() most probably does not handle ftruncate() 
correctly. Especially on a yet empty file (where we set truncate=true), 
that might be insufficient.

(3) file_ram_alloc() and/or qemu_ram_alloc_from_fd() do not verify that 
the offset is properly aligned to block->page_size.


-- 
Thanks,

David / dhildenb


