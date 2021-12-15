Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D812C47614A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:00:57 +0100 (CET)
Received: from localhost ([::1]:60934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZWK-0008OI-OZ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:00:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXo6-0000Hh-Ff
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:11:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXo2-0006Cy-Hd
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639588265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBk5xCr9fbCBCffCAuyfaBOmPKNPJg+oUOEHDvF+gnk=;
 b=SOB/fTrQhUvve/mtcmSqojFFlKTc+9L7XdWKvWQK/bXG7lc3yQ5ybjL8nPl4agZgCD2UPP
 HPy0Ceul77QGL852XjHY17MUtFL6WMKx5owpMNNS9aw0QA63WYGgAG9ss2dx4RHEjA1Yev
 VNV5vQPM4svlCeeynjTb2WUO1gPWo3I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-5uIck5J-O3W8EK-6bmv5aw-1; Wed, 15 Dec 2021 12:11:04 -0500
X-MC-Unique: 5uIck5J-O3W8EK-6bmv5aw-1
Received: by mail-wm1-f71.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so12878346wma.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 09:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aBk5xCr9fbCBCffCAuyfaBOmPKNPJg+oUOEHDvF+gnk=;
 b=yRowPhdj+WMdlA3KzbAh83o6b8wbJ3fYia+8VoH30zJOeeonxf+Ha8UBhSIa8e/AhI
 LdTc1k8vbC9ZbZ7kA+aiTNGuE4WQF10wtJa2wqTF+ApLyxfjWIc83S0YlnHfjfjUiqth
 vw5gq1iKvecrn1m7GdAcflaWNBWluQKCbfBaQ8ROogoo8i+K3zgmSegGfr6Y1k4tlTfF
 +BLDFlptV3149v7KhUDPYmdtAvXGkOkkC4W+YSR3VDPbODwaME7yM8k0PlbAmzgInX20
 QRzhOcZ5+qwaaPuGIULnq2Uk1X5Rc0E1aXhnyW9lhh39+vpjeNseaH0jIVFkF1CPau3W
 iXMA==
X-Gm-Message-State: AOAM531Bv42NLDuuAJc3LieLkKpfD8h3fULOqEgWMZQFDfGLHMJlKC5L
 3r0fRjAHDxyQGgwnoFqu4fqX3MOp15pKPvY1jcCOZ42wGsDfn68GdSovNowWIfNrgpdRX0QeXb7
 LEGD7QL6PROrWCLE=
X-Received: by 2002:a05:600c:4c96:: with SMTP id
 g22mr886288wmp.46.1639588263132; 
 Wed, 15 Dec 2021 09:11:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5SwuWf//NzCO4qol7WhwoGjYjsEGJuLoJj+4h4JKziP7dHnxP6VHsTKM//NvSYay92gkjEQ==
X-Received: by 2002:a05:600c:4c96:: with SMTP id
 g22mr886248wmp.46.1639588262892; 
 Wed, 15 Dec 2021 09:11:02 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o9sm2430667wrs.4.2021.12.15.09.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 09:11:02 -0800 (PST)
Message-ID: <f2ea84f5-156c-7dfe-7aa0-e7848ebe1859@redhat.com>
Date: Wed, 15 Dec 2021 18:11:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH v2 3/5] exec/memattrs: Introduce MemTxAttrs::bus_perm
 field
To: Stefan Hajnoczi <stefanha@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-4-philmd@redhat.com>
 <YSTvSlU5fk8JuY0u@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YSTvSlU5fk8JuY0u@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 15:08, Stefan Hajnoczi wrote:
> On Mon, Aug 23, 2021 at 06:41:55PM +0200, Philippe Mathieu-Daudé wrote:
>> Add the 'direct_access' bit to the memory attributes to restrict
>> bus master access to ROM/RAM.
>> Have read/write accessors return MEMTX_BUS_ERROR if an access is
>> restricted and the region is not ROM/RAM ('direct').
>> Add corresponding trace events.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/exec/memattrs.h | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
>> index 95f2d20d55b..7a94ee75a88 100644
>> --- a/include/exec/memattrs.h
>> +++ b/include/exec/memattrs.h
>> @@ -14,6 +14,13 @@
>>  #ifndef MEMATTRS_H
>>  #define MEMATTRS_H
>>  
>> +/* Permission to restrict bus memory accesses. See MemTxAttrs::bus_perm */
>> +enum {
>> +    MEMTXPERM_UNSPECIFIED   = 0,
>> +    MEMTXPERM_UNRESTRICTED  = 1,
>> +    MEMTXPERM_RAM_DEVICE    = 2,
>> +};
>> +
>>  /* Every memory transaction has associated with it a set of
>>   * attributes. Some of these are generic (such as the ID of
>>   * the bus master); some are specific to a particular kind of
>> @@ -35,6 +42,19 @@ typedef struct MemTxAttrs {
>>      unsigned int secure:1;
>>      /* Memory access is usermode (unprivileged) */
>>      unsigned int user:1;
>> +    /*
>> +     * Bus memory access permission.
>> +     *
>> +     * Some devices (such DMA) might be restricted to only access
>> +     * some type of device, such RAM devices. By default memory
>> +     * accesses are unspecified (MEMTXPERM_UNSPECIFIED), but could be
>> +     * unrestricted (MEMTXPERM_UNRESTRICTED, similar to an allow list)
>> +     * or restricted to a type of devices (similar to a deny list).
>> +     * Currently only RAM devices can be restricted (MEMTXPERM_RAM_DEVICE).
> 
> I don't understand these 3 categories.
> 
> MEMTXPERM_UNSPECIFIED means any MemoryRegion can be accessed?

MEMTXPERM_UNSPECIFIED means no change in the current behavior.
IOW we haven't reviewed the device, and don't know whether it has
to be restricted or not.

> What does MEMTXPERM_UNRESTRICTED mean? How does this differ from
> MEMTXPERM_UNSPECIFIED?

We set MEMTXPERM_UNRESTRICTED when we reviewed a device and are sure
it can be accessed any region (even being re-entrant on itself).
I understand it like connected via a dual-port on the bus, and
allowing read *and* write accesses at the same time... So the device
is allowed to access itself, i.e. it can re-program itself in loop
and so on. IIUC this is a requested feature for this API.

> What exactly does MEMTXPERM_RAM_DEVICE mean? Maybe that only
> MemoryRegions where memory_region_is_ram() is true can be accessed?

No, it means, while we don't know which bus owner will access the
device, the device itself can only access RAMd regions on the bus.

I added MEMTXPERM_RAM_DEVICE as the first example, thinking it is
the more generic use case. But maybe it is too generic and unuseful,
and we need a real bus permission matrix?


