Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB3E3F5F7A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 15:51:28 +0200 (CEST)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIWpl-0005nc-6p
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 09:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIWoq-0004aQ-6i
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIWoo-0007L9-Aw
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629813020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ORi6sJgyuhSGqkWkhNjoAkcPgl1sO1msL3N7qn4mvvc=;
 b=BFqDcVFL2tvMN7WJ19euK1kE6EPiYKLz+PS/Irv7Q8Hpbt+0wA2QhAVCozJj6OaGnhCIY/
 AHlK5y6atcaB0vjg6EsDx6M9Gep927VymZjsRyMwLzUBYHvTI6+LX6USZ1aIhf/tW6cAe0
 x+uu05EYkraK9fB4kik/mZyPEeVmgBY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-B0kI9T1AMEyRLceFsB7x5A-1; Tue, 24 Aug 2021 09:50:19 -0400
X-MC-Unique: B0kI9T1AMEyRLceFsB7x5A-1
Received: by mail-wm1-f71.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so1266142wmj.8
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 06:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ORi6sJgyuhSGqkWkhNjoAkcPgl1sO1msL3N7qn4mvvc=;
 b=X514cwsQTgR2VzfkOPXiagAc8+bkkoxSJXXWhjzQz5T1ZVU/uY1VCFiINw4n2FKQVN
 8CW5bj6s3QsOhPQ0MjB4VasfRscCCNTZS57wpmO+EobfGKSPl8lrO+NAxDInJ9bSO67b
 ivJlIpD+BJHf3KMhefsrtXFXGTaU17iinq/ieDhWvSXHsQw1scrj4/u2gHyEbnQiZsqs
 hwPqQPJKj8BMHmMaqHwXR7S0Ch5bLRGI33rFwEDOFkyGGMH3wanzxispXcVMLsWAXawm
 /bUAZMAOYkkMxyJ5tVnGi3j41/jOe7GOqLbACGbeBGVrg1pmtzU9wqjnXet1mLz3zwmX
 c3fQ==
X-Gm-Message-State: AOAM532UGw4lZX6NS3X2Aocg/q42qZ/jqrfPWNOzZO5BkTWEBH9R2tPt
 dg4ERSAIqogmBTomNXOgPveLZo6dgvw2dREjF/nfVCHi7pyeN88JmNt9Od5oDdd3XbHU9ztcP3W
 rULqeFpHBNBrMwws=
X-Received: by 2002:a1c:2905:: with SMTP id p5mr4268411wmp.146.1629813017967; 
 Tue, 24 Aug 2021 06:50:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjIHSiyzXGByMuy4DaBGoDBjp2o4wpyPyAZsct/CfYzDsxedJ3afJfMenFTeqHXO/TfxEtJQ==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr4268387wmp.146.1629813017764; 
 Tue, 24 Aug 2021 06:50:17 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id q22sm2388386wmj.32.2021.08.24.06.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 06:50:17 -0700 (PDT)
Subject: Re: [RFC PATCH v2 5/5] softmmu/physmem: Have flaview API check
 MemTxAttrs::bus_perm field
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-6-philmd@redhat.com>
 <YSTw9VPd44uIZ55L@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <569b3a2f-2d05-700d-cae3-07d8b78fcd55@redhat.com>
Date: Tue, 24 Aug 2021 15:50:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSTw9VPd44uIZ55L@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 3:15 PM, Stefan Hajnoczi wrote:
> On Mon, Aug 23, 2021 at 06:41:57PM +0200, Philippe Mathieu-Daudé wrote:
>> Check bus permission in flatview_access_allowed() before
>> running any bus transaction.
>>
>> There is not change for the default case (MEMTXPERM_UNSPECIFIED).
>>
>> The MEMTXPERM_UNRESTRICTED case works as an allow list. Devices
>> using it won't be checked by flatview_access_allowed().
>>
>> The only deny list equivalent is MEMTXPERM_RAM_DEVICE: devices
>> using this flag will reject transactions and set the optional
>> MemTxResult to MEMTX_BUS_ERROR.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  softmmu/physmem.c | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 0d31a2f4199..329542dba75 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -2772,7 +2772,22 @@ static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
>>                                             hwaddr addr, hwaddr len,
>>                                             MemTxResult *result)
>>  {
>> -    return true;
>> +    if (unlikely(attrs.bus_perm == MEMTXPERM_RAM_DEVICE)) {
>> +        if (memory_region_is_ram(mr) || memory_region_is_ram_device(mr)) {
>> +            return true;
>> +        }
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "Invalid access to non-RAM device at "
>> +                      "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
>> +                      "region '%s'\n", addr, len, memory_region_name(mr));
>> +        if (result) {
>> +            *result |= MEMTX_BUS_ERROR;
> 
> Why bitwise OR?

MemTxResult is not an enum but used as a bitfield.

See access_with_adjusted_size():

    MemTxResult r = MEMTX_OK;
    ...
    if (memory_region_big_endian(mr)) {
        for (i = 0; i < size; i += access_size) {
            r |= access_fn(mr, addr + i, value, access_size,
                        (size - access_size - i) * 8,
                        access_mask, attrs);
        }
    } else {
        for (i = 0; i < size; i += access_size) {
            r |= access_fn(mr, addr + i, value, access_size, i * 8,
                        access_mask, attrs);
        }
    }
    return r;
}

and flatview_read_continue() / flatview_write_continue():

    for (;;) {
        if (!memory_access_is_direct(mr, true)) {
            release_lock |= prepare_mmio_access(mr);
            l = memory_access_size(mr, l, addr1);
            val = ldn_he_p(buf, l);
            result |= memory_region_dispatch_write(mr, addr1, val,
                                                   size_memop(l),
                                                   attrs);
    ...
    return result;
}


