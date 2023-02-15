Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457F86975CF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 06:22:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSAED-0005UJ-1s; Wed, 15 Feb 2023 00:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSAEB-0005Tt-CU
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 00:21:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSAE7-0001zB-Vk
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 00:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676438466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OaYBf9BpQukofYWaVY5Gd/h0IZiPaUKz8zuLwWAo9YE=;
 b=h11/VAQYUrunOfr615lR4RRbAjbRJBkUTrw67Ie43fjqZtOY4CoCc39hB9ZUjZg8lN7idf
 5aZizbtlDGDNVX5i4PVvAkUjvkItN4fMLTo6+4oHh1npKmqrRbCK0g4wjWJX3B1IF2aepP
 jGhsvL5MLrpSEjJPDrakurRaSmJBt8E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-509-tSZeT12KM6uVVfvW5iMWJQ-1; Wed, 15 Feb 2023 00:21:02 -0500
X-MC-Unique: tSZeT12KM6uVVfvW5iMWJQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 fy3-20020a1709069f0300b008a69400909fso11375189ejc.7
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 21:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OaYBf9BpQukofYWaVY5Gd/h0IZiPaUKz8zuLwWAo9YE=;
 b=slk3ioOtpc0VEHz1222vSIFO43zdhF3yvi1+qKMVEysw/dbzUIxA8fdoJw9tPUsL+5
 +pXFSYVbRyMxRzVViYi6MRtGI2Qdq15W2gw/fHJb/EHD4fjpNEJmo4rUXSSXDJgZ/nl0
 t8a1I+YRWzQtWOBFGcsEoe66c1vnm7Myxze9wm2Zed92uuwBylLurPpM5dyxOC+iKzf0
 czJ68hpJsDAIxDkYxCrUKREmUKska6kSvH25X1/VtVsFW3oxzrpzs4ZjCho8wEg3/T7l
 KNY8kPKUmzoqUnMzROKq0dSMsajhjmpnZjDlSm54A0EwAxPekcO8sp9P/jwT/JwdaNz+
 dyyQ==
X-Gm-Message-State: AO0yUKXZwG+3KdQJhpukeVModQ3mlTo5XsLDDzsNhfVGImfzNJp0O60X
 u3vow5ANbXUVsU1vQVMdtNkMyMmHH8VjgfBIFFtO7BVz6E8jBZ26B29bpIhllBWkETZT3FnyQRP
 8zkI61Frs85pidXc=
X-Received: by 2002:a17:906:dc53:b0:8b0:f277:5cde with SMTP id
 yz19-20020a170906dc5300b008b0f2775cdemr1065406ejb.32.1676438461607; 
 Tue, 14 Feb 2023 21:21:01 -0800 (PST)
X-Google-Smtp-Source: AK7set80nmiKqDtiZz0l35c7EhCvxiiajsuObvhWNXPJVY6HKobp1Iwkr71KGx3FL5Z89i2EYpNzLg==
X-Received: by 2002:a17:906:dc53:b0:8b0:f277:5cde with SMTP id
 yz19-20020a170906dc5300b008b0f2775cdemr1065395ejb.32.1676438461448; 
 Tue, 14 Feb 2023 21:21:01 -0800 (PST)
Received: from [192.168.8.100] (tmo-116-65.customers.d1-online.com.
 [80.187.116.65]) by smtp.gmail.com with ESMTPSA id
 t21-20020a170906179500b0088a9e083318sm9137482eje.168.2023.02.14.21.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 21:21:00 -0800 (PST)
Message-ID: <6803d5ee-3d73-8894-d591-bb127a1bd015@redhat.com>
Date: Wed, 15 Feb 2023 06:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] target/s390x/arch_dump: Fix memory corruption in
 s390x_write_elf64_notes()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 frankja@linux.ibm.com
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230214141056.680969-1-thuth@redhat.com>
 <24404a86-3583-0561-09ea-f3e4e38bb952@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <24404a86-3583-0561-09ea-f3e4e38bb952@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 14/02/2023 15.58, Philippe Mathieu-Daudé wrote:
> On 14/2/23 15:10, Thomas Huth wrote:
>> "note_size" can be smaller than sizeof(note), so unconditionally calling
>> memset(notep, 0, sizeof(note)) could cause a memory corruption here in
>> case notep has been allocated dynamically, thus let's use note_size as
>> length argument for memset() instead.
> 
> Correct.
> 
> I wonder why use one notep* pointing to a stack allocated or a heap
> allocated buffer. This isn't hot path, one heap use could simplify
> this code complexity IMO.

You've got a point. I'll give it a try and send a v2.

  Thanks,
    Thomas


