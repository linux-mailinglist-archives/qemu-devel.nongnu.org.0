Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C847699409
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:13:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSd8X-0001eJ-26; Thu, 16 Feb 2023 07:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pSd8U-0001aB-MA
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:13:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pSd8S-0000IQ-QP
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676549591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzlXXMAk95zhv8ufFebYLWNBWLX6UyCVV9YqyY3u/pE=;
 b=PohskfExB7vJuCQXddr5z9tbfDZFLtmcWuspgTl5ZhN3u6I0TFKdmMDcQV3DqX58n1Tvz8
 ucBA4o17n2usF0SXDVgUD2eEJk3vjdF8MOXCs6nlbf9i+3ZuD5n55M0DZ/4WZ/b7JD4qoz
 yjXmI6RgBlJTS33KgGGDNXIM04P6xKs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-YAJcF1cTNlaW8bWg1H9X_w-1; Thu, 16 Feb 2023 07:13:10 -0500
X-MC-Unique: YAJcF1cTNlaW8bWg1H9X_w-1
Received: by mail-wm1-f69.google.com with SMTP id
 h9-20020a05600c350900b003e000facbb1so3030411wmq.9
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TzlXXMAk95zhv8ufFebYLWNBWLX6UyCVV9YqyY3u/pE=;
 b=U3GQB49vdYPd1rEphekEMcoXwShtzOcrUdbJYaF2bsj/WTVDWHjAEka54c3Uy+ebkR
 GhBYxS99hjMzFCwGdj1VMxUlQW8S//tHcpC91dth7R2sX9rdPBA9zZmlnKgX6Rq0EdSe
 b7jfEHpDNaKuoE8VE10OArST9aE8AZdZOaWvu7mwXVfYq6rtQodXCAjvi9k6TPbVLGOv
 K4GpXanh0eZ41f6y9YsCTiPrMCVJZ3c5NIGWiccFnTCGeGaErtsy49Tp15X0wKcBwQPz
 B36NErGLklguuzzZqjdQnuw+HmkFLKhpH0Ncp51z50VykPYrXqK1wxtNRsP0KiVKdqpV
 rd9g==
X-Gm-Message-State: AO0yUKWoI7ELRgZuqcqkxc4B3apdnm2RJjA9PiyaYZUsCkwucU5JeGzb
 RfCQYIPtCaCwWJZaPnUxaJ/uwAa1eEx571VJ7cLeifE5mMxUUDsSA/meEmaFRA72H+4Huulwm//
 SOASvtfJSbcP4XXo=
X-Received: by 2002:a5d:4eca:0:b0:2bf:ae19:d8e4 with SMTP id
 s10-20020a5d4eca000000b002bfae19d8e4mr4365541wrv.16.1676549589551; 
 Thu, 16 Feb 2023 04:13:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/Xm4GN4pVBQmq7cMoPH2+84PwVkbBc+pJVcZmu7SP4OiA4/mWuw38EC4Nn7geYk02ptt1Vbw==
X-Received: by 2002:a5d:4eca:0:b0:2bf:ae19:d8e4 with SMTP id
 s10-20020a5d4eca000000b002bfae19d8e4mr4365523wrv.16.1676549589197; 
 Thu, 16 Feb 2023 04:13:09 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:bc00:2acb:9e46:1412:686a?
 (p200300cbc708bc002acb9e461412686a.dip0.t-ipconnect.de.
 [2003:cb:c708:bc00:2acb:9e46:1412:686a])
 by smtp.gmail.com with ESMTPSA id
 x10-20020adff0ca000000b002c54c9bd71fsm1366159wro.93.2023.02.16.04.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 04:13:08 -0800 (PST)
Message-ID: <92c8b5a0-319f-bca4-3b2e-a7dd68ac8649@redhat.com>
Date: Thu, 16 Feb 2023 13:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/2] vhost: Defer filtering memory sections until
 building the vhost memory structure
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Tiwei Bie <tiwei.bie@intel.com>
References: <20230216114752.198627-1-david@redhat.com>
 <20230216114752.198627-2-david@redhat.com>
 <20230216070037-mutt-send-email-mst@kernel.org>
 <0fe7b18c-507a-2c11-8440-e9e35294b4ba@redhat.com>
Organization: Red Hat
In-Reply-To: <0fe7b18c-507a-2c11-8440-e9e35294b4ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16.02.23 13:10, David Hildenbrand wrote:
> On 16.02.23 13:04, Michael S. Tsirkin wrote:
>> On Thu, Feb 16, 2023 at 12:47:51PM +0100, David Hildenbrand wrote:
>>> Having multiple devices, some filtering memslots and some not filtering
>>> memslots, messes up the "used_memslot" accounting. If we'd have a device
>>> the filters out less memory sections after a device that filters out more,
>>> we'd be in trouble, because our memslot checks stop working reliably.
>>> For example, hotplugging a device that filters out less memslots might end
>>> up passing the checks based on max vs. used memslots, but can run out of
>>> memslots when getting notified about all memory sections.
>>>
>>> Further, it will be helpful in memory device context in the near future
>>> to know that a RAM memory region section will consume a memslot, and be
>>> accounted for in the used vs. free memslots, such that we can implement
>>> reservation of memslots for memory devices properly. Whether a device
>>> filters this out and would theoretically still have a free memslot is
>>> then hidden internally, making overall vhost memslot accounting easier.
>>>
>>> Let's filter the memslots when creating the vhost memory array,
>>> accounting all RAM && !ROM memory regions as "used_memslots" even if
>>> vhost_user isn't interested in anonymous RAM regions, because it needs
>>> an fd.
>>>
>>> When a device actually filters out regions (which should happen rarely
>>> in practice), we might detect a layout change although only filtered
>>> regions changed. We won't bother about optimizing that for now.
>>
>> That caused trouble in the past when using VGA because it is playing
>> with mappings in weird ways.
>> I think we have to optimize it, sorry.
> 
> We still filter them out, just later.

To be precise, we still filter out all DIRTY_MEMORY_VGA as we used to. 
Only the device-specific filtering (vhost-user) is modified.

-- 
Thanks,

David / dhildenb


