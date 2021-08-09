Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F083E40E1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 09:34:05 +0200 (CEST)
Received: from localhost ([::1]:43740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCznQ-0000YO-Uy
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 03:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCzli-0008FH-0S
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 03:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mCzle-0005JM-Vb
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 03:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628494334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TypMWRBXZE8F1MKFSJhf6Qj7m8ZDkizijQKpezRuv30=;
 b=DqRC5BVtT8dkgwg7SeexapeTo/TCTS9eNYnw/iOeUkBQeq6ohf52/vi1XsM5ydQl00xJjW
 utpj5zrT+5SDIB3hMnS7iL23jQD1HKGzc/R9VTO4w1tsfvKPGpI7lAIRx6Klpxoj6QGfKC
 tgpbikUxlK7SjjAjDEKvuWCzMqz7Nys=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-aZj4Dyl9NZyUWbr-WAP4-w-1; Mon, 09 Aug 2021 03:32:12 -0400
X-MC-Unique: aZj4Dyl9NZyUWbr-WAP4-w-1
Received: by mail-wr1-f71.google.com with SMTP id
 x18-20020a5d49120000b0290154e9dcf3dbso657835wrq.7
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 00:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TypMWRBXZE8F1MKFSJhf6Qj7m8ZDkizijQKpezRuv30=;
 b=RzotAYp5c72n5rxfZiZMkmqHZIcma+rAxYab37qk3MePDiXKoa8zmrkJMUDgzW0+2f
 +yvJvG+GlvzKOmubJtzzrh30E313nsho1tXiLyfOYs9xYEls8b5/h5FDoLuUhWoJ6epo
 vbIxoUMWBdaVyYLFZvw332l1VHlNEqWRozww7OTDFsaSqXJXJc0QVwfNQKdGKyu7Idu+
 w98+9SzE8EwInnon9P5KgT5pgtI2M7qReSvDBuPUDyATsVe5p6r4XsN7oE2c4tuTolWf
 qNtpBB5NzrbPG21fszh0Q7SaHJDmmjBg/PzKCm8JiI58kOBcPVptXnwG3YhxtHGen9mz
 cwqQ==
X-Gm-Message-State: AOAM530h1Ud2yKWTsrcdJLACgel5DmvcrElZ24mKqcCWblBvC/z6z1vB
 Cxup08eWQs3Xf2nlpF+b8HqYcrIJRrU/60nOHPm/tiCE/zc5FOLtVDZtJh+ot+bhnFTubd9P6bS
 ko/wOPzxNcvopQz4=
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr16342565wmh.32.1628494331118; 
 Mon, 09 Aug 2021 00:32:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6zddPzTV2cv2H3TJhCYcs3lXcMXMBRlwuRd5nbe+7+cQDVchZW1AKhpr4ZfGIqWOSyl6mfw==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr16342544wmh.32.1628494330941; 
 Mon, 09 Aug 2021 00:32:10 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 129sm16709241wmz.26.2021.08.09.00.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 00:32:10 -0700 (PDT)
Subject: Re: [PATCH] vmxnet3: add stub for encapsulation offload
To: Alexander Bulekov <alxndr@bu.edu>
References: <20210806222300.417126-1-alxndr@bu.edu>
 <5a2ac0a5-7b1a-c75d-3d61-4ec849c9eb2d@redhat.com>
 <20210807202518.jrqobxx3nygszbus@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <47ef48b9-7bde-3b6c-03d2-b6474f238557@redhat.com>
Date: Mon, 9 Aug 2021 09:32:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807202518.jrqobxx3nygszbus@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 10:25 PM, Alexander Bulekov wrote:
> On 210807 1019, Philippe Mathieu-Daudé wrote:
>> On 8/7/21 12:23 AM, Alexander Bulekov wrote:
>>> Encapsulation offload (offload mode 1) is a valid mode present in the
>>> kernel that isn't implemented in QEMU, yet.
>>>
>>> https://lore.kernel.org/lkml/20200528015426.8285-4-doshir@vmware.com/
>>>
>>> Add a stub for this mode, to avoid the guest-triggerable assertion.
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/517
>>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>>> ---
>>>  hw/net/vmxnet3.c | 5 +++++
>>>  hw/net/vmxnet3.h | 1 +
>>>  2 files changed, 6 insertions(+)
>>>
>>> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
>>> index 41f796a247..62e11d0e3e 100644
>>> --- a/hw/net/vmxnet3.c
>>> +++ b/hw/net/vmxnet3.c
>>> @@ -443,6 +443,11 @@ vmxnet3_setup_tx_offloads(VMXNET3State *s)
>>>          net_tx_pkt_build_vheader(s->tx_pkt, false, false, 0);
>>>          break;
>>>  
>>> +    case VMXNET3_OM_ENCAP:
>>> +        VMW_PKPRN("Encapsulation offload requested, but not available\n");
>>> +        return false;
>>> +        break;
>>
>> No need to break if you returned (unreachable).
> 
> I included it in case the feature ends up being added, so there is one
> less thing to worry about, but I can remove it. There are a couple of
> places in QEMU where this occurs, so I wasn't sure about the best
> practice.

I don't know if there is an official "best practice". My style /
recommendation is to try to use single exit point when possible
so I can easily add trace events.


