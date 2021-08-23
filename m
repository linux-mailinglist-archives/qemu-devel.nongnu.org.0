Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5435B3F4862
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:14:10 +0200 (CEST)
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI6y1-0004DB-FZ
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI6wo-0002zD-Gm
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI6wn-0003Ej-2U
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629713572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GeLPk7G2+pxyORsdp8p/5LI55sPYrs7SLER2qGOD20=;
 b=L8WTwgSIa6IC4L7Q1pOXLfQzZozzYfG0aj2NO3cGWA4StEdigX5OWGmcV2meqQQH4XBwUE
 CdIehKaYUAzY0TlcPKCjzmT5Vufq7kRKHZXypr4xfBXWtYhk4nT4HRbnSkAYw1A9vza3fP
 KuYhqH/u37LAzFUR5KfKiY1jilTPgPc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-TA0Z7qf3MmunJrFZnVKojg-1; Mon, 23 Aug 2021 06:12:51 -0400
X-MC-Unique: TA0Z7qf3MmunJrFZnVKojg-1
Received: by mail-wr1-f72.google.com with SMTP id
 h15-20020adff18f000000b001574654fbc2so1540126wro.10
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 03:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1GeLPk7G2+pxyORsdp8p/5LI55sPYrs7SLER2qGOD20=;
 b=WUE0Wqr0XC7CHgbuiC14pu7IRfwQDjZ35oRpqBYUj8x0JHTm6HwLt+gpi6yxa1yqUe
 no550zIduCm61VJ1tKrqm/qSvZCkHoMsZP9cCWQc6DTtCnOGPy9sm4CgTTQzxWYunweW
 XUZDIQGmR3GkOOBn+5knZHWfDLBF5LGaksA1xR1sUucPhl3d2cMbCdpWyTxJUHj609j0
 jiOm2IcsAeDjCy1sMqP+Sb72tAU3eHxjLVyH7maC+cz+dLhPvgM0jtvbpm2/V/dyNTfR
 mBi/b8noleDfbgCCRj8J8hnm9yvH9g824nGwLVbxvXjlw7AAnaFTNLHBqnCsUWzlP5G0
 Zk3Q==
X-Gm-Message-State: AOAM531ojVXp+GO5X0G5ac2Z77kZemm1UVOBXXfQLd0BL+mCiDy7oXsR
 m7OL0xegET9Rqaskw5xCWVaDJYL+swRouu0WnOXW2gL1RFDgtxb7z099/7M3dVToN2bY4cnFjeG
 FLV0CDDXKzZhHofQ=
X-Received: by 2002:a5d:4d12:: with SMTP id z18mr12755716wrt.195.1629713570204; 
 Mon, 23 Aug 2021 03:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw1YPyatco+oVvthw7vdJ0VKE81F7MqkjY2P8LL3lVHGenibk2m8TuetU0G9xHKFyBxvcneQ==
X-Received: by 2002:a5d:4d12:: with SMTP id z18mr12755616wrt.195.1629713568848; 
 Mon, 23 Aug 2021 03:12:48 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k12sm15271419wrd.75.2021.08.23.03.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 03:12:48 -0700 (PDT)
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
 <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
 <d3cdb3bb-e05f-f909-1a98-ba45ff9b2b28@redhat.com>
 <CAFEAcA8V6gaGZeWeXOwdts771Ni11Eo8vYR2nXNy-w8dEsxdpg@mail.gmail.com>
 <6165f86e-1ce7-d178-1f5c-4b3c5110f0c1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1a63c2d2-7420-5fc1-1023-0504a67dc40b@redhat.com>
Date: Mon, 23 Aug 2021 12:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6165f86e-1ce7-d178-1f5c-4b3c5110f0c1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 11:29 AM, David Hildenbrand wrote:
> On 23.08.21 11:23, Peter Maydell wrote:
>> On Mon, 23 Aug 2021 at 09:40, David Hildenbrand <david@redhat.com> wrote:
>>> Not opposed to printing the size, although I doubt that it will really
>>> stop similar questions/problems getting raised.
>>
>> The case that triggered this was somebody thinking
>> -m took a byte count, so very likely that an error message
>> saying "you tried to allocate 38TB" would have made their
>> mistake clear in a way that just "allocation failed" did not.
>> It also means that if a future user asks us for help then
>> we can look at the error message and immediately tell them
>> the problem, rather than going "hmm, what are all the possible
>> ways that allocation might have failed" and going off down
>> rabbitholes like VM overcommit settings...
> 
> We've had similar issues recently where Linux memory overcommit handling
> rejected the allocation -- and the user was well aware about the actual
> size. You won't be able to catch such reports, because people don't
> understand how Linux memory overcommit handling works or was configured.
> 
> "I have 3 GiB of free memory, why can't I create a 3 GiB VM". "I have 3
> GiB of RAM, why can't I create a 3 GiB VM even if it won't make use of
> all 3 GiB of memory".
> 
> Thus my comment, it will only stop very basic usage issues. And I agree
> that looking at the error *might* help. It didn't help for the cases I
> just described, because we need much more system information to make a
> guess what the user error actually is.

Is it possible to get the maximal overcommitable amount on Linux?


