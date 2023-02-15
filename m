Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5016975FF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 06:50:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSAga-0003dS-5U; Wed, 15 Feb 2023 00:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSAg7-0003d5-So
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 00:50:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSAg5-0006In-DP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 00:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676440200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JFsRztYCRkUu0vhLpWrEA9nWF3Fmaf5S01ogyxQkGNY=;
 b=NkvYBaMzwpgcdSSgLoF4gl34UejcNklXkdocsKrIzG1IIHYlrtQci9FMA+EDCOdOO2PWu8
 4fqJeD8wrTmYIMZif5lbmsF0yL3auQvGgQ6j3EOwI6t+hUu1XhNSTxIyCgBruzw7QSpVq+
 FXdoBCstS2HyM9/DMOnVc3zbdr21qLA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-310-L9tGBlo4MjGmTPTbbBKSDg-1; Wed, 15 Feb 2023 00:49:58 -0500
X-MC-Unique: L9tGBlo4MjGmTPTbbBKSDg-1
Received: by mail-qk1-f200.google.com with SMTP id
 ay10-20020a05620a178a00b0072db6346c39so10906807qkb.16
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 21:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JFsRztYCRkUu0vhLpWrEA9nWF3Fmaf5S01ogyxQkGNY=;
 b=D7iF97UEE5og5pP2bUitIIXEqplE0TkwNViKrkq4B4VAwAccVYhtnzoHOqeAsReuER
 FrSjTq1t2JK9n4cAejg8MK0f91bnlMPPAZLhMRwQuDUuCW3xGLI9syMV4m2uPIvQHQUB
 L/SITaR/c9+FBMKjDB50uUeLgwLzWBtVkAApXgj3Sg3fZsFJF4l58U6RaSmbVrMzkdpS
 x7xLT4eifXJG0kl3B2t2xSS7lVRIczZP2UB1Od4F37/5tVZsxMKNQ04gkIeE4+F8zCUr
 elyZFSVtUeXU6G3CCQFz71BPR0Hi8reLqZZR37S/lGxUSOEJJTGhLTPDDeqQyAG79WN0
 i+RA==
X-Gm-Message-State: AO0yUKVFCjRsruDB2D/jxsQLEZ/s2MZ0EgfYVb/YGamY8L1qWraRhZ21
 DdQ5TP8LcHwfkivn1rrZxZe9VEzr+x8QOsfSj3yjN8gw3Lq1N5+j60+deKb6hIQeoN0VvNQpDKh
 75fbit1ho6mDE5sY=
X-Received: by 2002:a05:622a:1ba4:b0:3b9:b112:e86b with SMTP id
 bp36-20020a05622a1ba400b003b9b112e86bmr1727108qtb.13.1676440198463; 
 Tue, 14 Feb 2023 21:49:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9FHEY7AbyMp4uRNsG3WHBsoq30EOhx6TYrMkumiQK8R16/u94IdYSw5slotj3rMygKU7rGYA==
X-Received: by 2002:a05:622a:1ba4:b0:3b9:b112:e86b with SMTP id
 bp36-20020a05622a1ba400b003b9b112e86bmr1727092qtb.13.1676440198243; 
 Tue, 14 Feb 2023 21:49:58 -0800 (PST)
Received: from [192.168.8.100] (tmo-116-65.customers.d1-online.com.
 [80.187.116.65]) by smtp.gmail.com with ESMTPSA id
 f30-20020ac8015e000000b003b9bd163403sm12585247qtg.4.2023.02.14.21.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 21:49:57 -0800 (PST)
Message-ID: <2be93997-8074-46e2-d602-56aaa17648c1@redhat.com>
Date: Wed, 15 Feb 2023 06:49:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] target/s390x/arch_dump: Fix memory corruption in
 s390x_write_elf64_notes()
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 frankja@linux.ibm.com
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230214141056.680969-1-thuth@redhat.com>
 <24404a86-3583-0561-09ea-f3e4e38bb952@linaro.org>
 <6803d5ee-3d73-8894-d591-bb127a1bd015@redhat.com>
In-Reply-To: <6803d5ee-3d73-8894-d591-bb127a1bd015@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15/02/2023 06.20, Thomas Huth wrote:
> On 14/02/2023 15.58, Philippe Mathieu-Daudé wrote:
>> On 14/2/23 15:10, Thomas Huth wrote:
>>> "note_size" can be smaller than sizeof(note), so unconditionally calling
>>> memset(notep, 0, sizeof(note)) could cause a memory corruption here in
>>> case notep has been allocated dynamically, thus let's use note_size as
>>> length argument for memset() instead.
>>
>> Correct.
>>
>> I wonder why use one notep* pointing to a stack allocated or a heap
>> allocated buffer. This isn't hot path, one heap use could simplify
>> this code complexity IMO.
> 
> You've got a point. I'll give it a try and send a v2.

Actually, it looked better as a separate, independent patch, so I sent it as 
"Simplify memory allocation in s390x_write_elf64_notes()" (based on this one 
here).

  Thomas


