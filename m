Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254C53F1BB4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:37:46 +0200 (CEST)
Received: from localhost ([::1]:42152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjAv-0001iH-8x
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjA1-0000Hv-Ka
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:36:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGj9z-0002zc-VC
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629383807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GnvmcR9nr2c0K4VyZDFjDiNXdISt6DLhK5k4CQjqItg=;
 b=GCL60cV14axgILeHn5Kzcqp2Yj6A23IXCY5yMtQwm9+mp6v0Hx1XwDT1Vb6HFO7Q+1fhzw
 N9nBlp6cVQs3Uip1YRh2MG/SXENhqO+s6JqaLsIwYHxOFi4tJuhY+zWsrykiAxXV8p8kMz
 0lRH0pFM9vhvTKN/ynU9mZVADempQoA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-GJG-TsF7OkiBCt3cWrrpGg-1; Thu, 19 Aug 2021 10:36:22 -0400
X-MC-Unique: GJG-TsF7OkiBCt3cWrrpGg-1
Received: by mail-wm1-f70.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so1388854wmc.3
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GnvmcR9nr2c0K4VyZDFjDiNXdISt6DLhK5k4CQjqItg=;
 b=h4sW/IUKBd++dY2S+wx4V+UtVv5bU/gt82b/HJQpIPmVjdm1Z68DbODaBczo64DHBD
 w+KyPQuzJaZsF7JNKofhhERgDcgSO5G6707dkLan2qkcb1nCamD4qMIgluVwx6JuTw0o
 yGmAQzKfLLqQsN0cBjUcIu9chbXah7DhckMVDikoW3Gom4aTGV7H+Nbfsu5uQgVABw6y
 dTChSEQtbliGz+Rp+/rlZD3hTkTjVVqriR1eAaMeYYtdHiA6QY+HK7KPC8uDAVdT+Bv1
 8T63ogxG+0DLqy9HRoyFEzcGDe4TLgdTvKILyIrKalH4lFYqrMdoNr3MC0PwLVkue8MA
 Zf3w==
X-Gm-Message-State: AOAM533O6Do6xwhyc3tu9Am9OqqSLZWX0I/ToVxmkiMtwS8BmyYFw9s6
 rMJTsYpErKslYeDUO9mXwOPIn7chXrUwb4nzXoFs+kjI9/FjqY92XS/8z8EAh6V+AlveL+oguoj
 qx5XN52Y0HyyXbJk=
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr4285993wrx.147.1629383781390; 
 Thu, 19 Aug 2021 07:36:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz64NCWiWLLpTu5/xjyfbudxlx0ECkIwgsOR9cQygKorGm3dpvbJ+g7xMBcLhbg/hDQVnk6ug==
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr4285975wrx.147.1629383781256; 
 Thu, 19 Aug 2021 07:36:21 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d18sm3272562wrb.16.2021.08.19.07.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 07:36:20 -0700 (PDT)
Subject: Re: [PATCH 2/6] memory: Introduce address_space_create()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-3-philmd@redhat.com>
 <CAFEAcA_GxyOYSfg+Su4iNrGNXyBB-KCfNQ+m+k9RywBGkQa08A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c2935c37-9c08-ed76-31d1-85d69d8c8877@redhat.com>
Date: Thu, 19 Aug 2021 16:36:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_GxyOYSfg+Su4iNrGNXyBB-KCfNQ+m+k9RywBGkQa08A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 4:24 PM, Peter Maydell wrote:
> On Thu, 19 Aug 2021 at 15:20, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Introduce address_space_create(). In is similar to
>> address_space_init() but returns a pointer to a heap
>> allocated  AddressSpace.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/exec/memory.h | 14 ++++++++++++++
>>  softmmu/memory.c      | 10 ++++++++++
>>  2 files changed, 24 insertions(+)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index c3d417d317f..b353a48c25f 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -2418,6 +2418,20 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>>   */
>>  void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name);
>>
>> +/**
>> + * address_space_create: Create and initializes an address space
>> + *
>> + * @root: a #MemoryRegion that routes addresses for the address space
>> + * @name: an address space name.  The name is only used for debugging
>> + *        output.
>> + *
>> + * Returns pointer to initialized #AddressSpace.
>> + *
>> + * The caller is responsible for releasing the pointer returned
>> + * with address_space_destroy() after use.
>> + */
>> +AddressSpace *address_space_create(MemoryRegion *root, const char *name);
>> +
> 
> I'm not really a fan of this as an API -- almost always I think
> devices would do better to have an AddressSpace foo field in
> their device struct and call address_space_init() on that.
> Hiding the heap allocation inside this function makes it harder
> to notice it during code review, I think.

So I understand you rather I discard this (simple) approach and
rather modify 'info mtree' "was designed on the assumption that
there's really only one or two interesting address spaces." [*]

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg829821.html


