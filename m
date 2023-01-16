Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A6266BBD4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 11:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHMq7-0006WT-0q; Mon, 16 Jan 2023 05:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pHMpu-0006SG-R9
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 05:35:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pHMpt-0007k8-4I
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 05:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673865327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WOlRSGaXozPw/1A/yCBmJGa4kCtLNa0gDmapxOZDNuc=;
 b=LOw9LVny6j5AovLSrud8uH8zGdV+kCBf06pbrK646OblT4JYt01OwrNcVwS4ij9ceMmp3z
 QyGvxw3IHqlkjQuagW6YM/yqVCXAGuOCHXRdoGP4yO8b1GvkTJNvIfk/y35OwtZjFD2oy/
 /KAPf+oyfupyOj9fgsbMUdT6AEcTaeg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-RHOXxGUaOU2NrWfWmmc3Wg-1; Mon, 16 Jan 2023 05:35:25 -0500
X-MC-Unique: RHOXxGUaOU2NrWfWmmc3Wg-1
Received: by mail-wr1-f72.google.com with SMTP id
 g24-20020adfa498000000b002bbeb5fc4b7so4617698wrb.10
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 02:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WOlRSGaXozPw/1A/yCBmJGa4kCtLNa0gDmapxOZDNuc=;
 b=unsndw+TXV0hB3AlPjID5DS3LfwadC0XpkXkYIRu34OEDGpVRRAVnxftkk9E78xATw
 NqcEr+ZSZxZZ+5ngZ42ckARLept/9qvTFxtI2U7xyTeWeFzIoY+3X+sam4bRL3CTZIrZ
 J53bVSSYngtOjCszMPrjPa0zLoVoZbakz8H8ABZ/yaumu1akpWYE/K6EzYyYBZp1RmdV
 ksP8ig/V+OYmQZB9iJlP0yG6INET4/vkD4euTengQIJmpO+rPiE3qi7QwEje4H967gve
 UDmSMlUNc5DS4QVqP7G6LzvzLaE6uOHiEcPnNKbDZhyMRfh6oUcgT+PceF+H4lMeTo3r
 Ja4w==
X-Gm-Message-State: AFqh2krEr9XLz78+pbPZrQiGSawNtmZIVxV0MYrujNnEJ6xtfS/pk4Ev
 d3/mix5NSySYT5XqiIrN0XqlGn8jTKYVMoQegw9OiunmeTBflDxD/TnVz8/0oXtl5VUTDAvznCP
 AY6eE/i7eKfrcDFA=
X-Received: by 2002:adf:fcc8:0:b0:2bb:edcc:9218 with SMTP id
 f8-20020adffcc8000000b002bbedcc9218mr22145083wrs.28.1673865324443; 
 Mon, 16 Jan 2023 02:35:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsXWuLmAhJb6p1J4CuykW28c8i2ws2MXCqT4GhJK3OS9wBJ0JS+kuOMY+L+LlgV4jkb30tbnQ==
X-Received: by 2002:adf:fcc8:0:b0:2bb:edcc:9218 with SMTP id
 f8-20020adffcc8000000b002bbedcc9218mr22145060wrs.28.1673865324088; 
 Mon, 16 Jan 2023 02:35:24 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:1000:21d5:831d:e107:fbd6?
 (p200300cbc704100021d5831de107fbd6.dip0.t-ipconnect.de.
 [2003:cb:c704:1000:21d5:831d:e107:fbd6])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5186000000b002bbddb89c71sm22171968wrv.67.2023.01.16.02.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 02:35:23 -0800 (PST)
Message-ID: <9d7547c1-c670-2222-c4da-4c816f42a087@redhat.com>
Date: Mon, 16 Jan 2023 11:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/8] migration/savevm: Allow immutable device state to
 be migrated early (i.e., before RAM)
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-4-david@redhat.com> <Y8BJ02EiHNSr6xMv@work-vm>
 <11b7237a-000a-5ad7-3747-246825188d83@redhat.com> <Y8BlCeViRSzyTQ8+@work-vm>
 <Y8CGYZ3F/h1oXV+d@x1n> <Y8CJf7hCy76AtfcF@x1n>
 <fa21267a-c1aa-2d43-799d-eb955318aec3@redhat.com> <Y8F2v+ikvEJa5+qc@x1n>
 <Y8F4eXdyBRKYeY4I@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y8F4eXdyBRKYeY4I@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 13.01.23 16:27, Peter Xu wrote:
> On Fri, Jan 13, 2023 at 10:20:31AM -0500, Peter Xu wrote:
>> On Fri, Jan 13, 2023 at 02:47:24PM +0100, David Hildenbrand wrote:
>>> I'd prefer to not go down that path for now. QEMU_VM_SECTION_START without
>>> QEMU_VM_SECTION_PART and QEMU_VM_SECTION_END feels pretty incomplete and
>>> wrong to me.
>>
>> That's fine.
>>
>>>
>>> If we want to do that in the future, we should conditionally send
>>> QEMU_VM_SECTION_START only if we have se->ops I assume?
>>
>> Yes.  START/FULL frames are mostly replaceable afaiu in the stream ABI, so
>> we always have space to change no matter what.  Let's leave that as-is.
> 
> If so, please consider adding one more paragraph describing the difference
> in vmsd early_setup comments (on using FULL for early vmsd and START for
> save_setup), hopefully it'll make things clearer.

What about the following:

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 7bc0cd9de9..cc910cab0f 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -188,6 +188,11 @@ struct VMStateDescription {
       * One SaveStateEntry should either have the save_setup() specified or
       * the vmsd with early_setup set to true. It should never have both
       * things set.
+     *
+     * Note that for now, a SaveStateEntry cannot have a VMSD and
+     * operations (e.g., save_setup()) set at the same time. For this reason,
+     * also early_setup VMSDs are migrated in a QEMU_VM_SECTION_FULL section,
+     * while save_setup() data is migrated in a QEMU_VM_SECTION_START section.
       */
      bool early_setup;
      int version_id;

Thanks!

-- 
Thanks,

David / dhildenb


