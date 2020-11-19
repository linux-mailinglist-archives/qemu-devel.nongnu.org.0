Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3817E2B8B63
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 07:10:44 +0100 (CET)
Received: from localhost ([::1]:46780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfd9X-0003HB-8N
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 01:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfd8I-0002Ls-35
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 01:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfd8E-0006CK-Je
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 01:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605766161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xauFzA0LStgYC/5r6IhxYU52HnlDeKQw3PBe1otIzB8=;
 b=PgBRGiQ/9n+4eHa+UIYfUhr0iaZd6Eaqgw1ZqO9V2UeUidrrPm4O0WGQPGt4B5/bK7kEY7
 ZWqTnODmAJ57ra6mK5JcyqEq5QXtzb8cIgBGKOgBwG3daASoFU9KhwfL0yWARniRGfNDxf
 S7GgPYaBdoAaMGQb6hbi2vwyFrVfl3A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-c3KmEpYPNniIv3WFUyqq7A-1; Thu, 19 Nov 2020 01:09:18 -0500
X-MC-Unique: c3KmEpYPNniIv3WFUyqq7A-1
Received: by mail-wm1-f70.google.com with SMTP id o203so2022144wmo.3
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 22:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xauFzA0LStgYC/5r6IhxYU52HnlDeKQw3PBe1otIzB8=;
 b=FhzwiBqbxd8B9vJEXL7YO5t3njvaofaoM0UTciCRWf6O7Wm003SaqNxnOXIE0MgMwv
 uVYrtQBudS31EjF+ieiUpcjOzGVqFlVSbtBM+GNe3MmSlmq1+XH0pNVjq1/HAXRpWnPc
 dGwrl4V8NPtrwySxkolyfK3yeLHhInRXg4Y6ol3O+yoX51OzCeDgl4MmZOx/XLd8Gvsg
 4iiZcBsgFjMtJKmBtfh1/kkttAlZ9yhijStYDRpWUHkWmqXPeT4uEcKshoIEvjNVmRpH
 jnGxx2NX9/9NK+LvXX3gnncWCHyxci78DN/61ywYy8Vf7kdo4nk7I7atIX93DRpyz0re
 vCyA==
X-Gm-Message-State: AOAM533faZDczuNHgPNUSecK/Solq9G1gPtq3LCoIqvnapVsx9tEHVlS
 Q1WftS0yXoJ7kC6PmBwID29iHTeGmQptZOKVinhYH22Kz73y4iXawBVbDV1nGx84byoIsMir2Ra
 FUlV7dEhFvBzNEQ4=
X-Received: by 2002:adf:f00f:: with SMTP id j15mr8279106wro.102.1605766157339; 
 Wed, 18 Nov 2020 22:09:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkCznW0YDXugffoX+ED/mgbVc2UUZ2o+J4QnzMcPi5TFv30BUcnGCOcuYAjCdiI4xAo8TQag==
X-Received: by 2002:adf:f00f:: with SMTP id j15mr8279075wro.102.1605766157085; 
 Wed, 18 Nov 2020 22:09:17 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id h2sm8046103wme.45.2020.11.18.22.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 22:09:16 -0800 (PST)
Subject: Re: [RFC PATCH 0/5] ARM: reduce the memory consumed when mapping UEFI
 flash images
To: Markus Armbruster <armbru@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com>
 <87a6vhxvit.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e54fc218-1eae-be1c-b064-049bc1d46793@redhat.com>
Date: Thu, 19 Nov 2020 07:09:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87a6vhxvit.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 01:09:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Xu Yandong <xuyandong2@huawei.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Zheng Xiang <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 =?UTF-8?B?aGFpYmluemhhbmco5byg5rW35paMKQ==?= <haibinzhang@tencent.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 2:48 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Hi David,
>>
>> On 11/16/20 11:42 AM, David Edmondson wrote:
>>> Currently ARM UEFI images are typically built as 2MB/768kB flash
>>> images for code and variables respectively. These images are both then
>>> padded out to 64MB before being loaded by QEMU.
>>>
>>> Because the images are 64MB each, QEMU allocates 128MB of memory to
>>> read them, and then proceeds to read all 128MB from disk (dirtying the
>>> memory). Of this 128MB less than 3MB is useful - the rest is zero
>>> padding.
>>
>> 2 years ago I commented the same problem, and suggested to access the
>> underlying storage by "block", as this is a "block storage".
>>
>> Back then the response was "do not try to fix something that works".
>> This is why we choose the big hammer "do not accept image size not
>> matching device size" way.
>>
>> While your series seems to help, it only postpone the same
>> implementation problem. If what you want is use the least memory
>> required, I still believe accessing the device by block is the
>> best approach.
> 
> "Do not try to fix something that works" is hard to disagree with.
> However, at least some users seem to disagree with "this works".  Enough
> to overcome the resistance to change?

Yeah, at least 3 big users so far:

- Huawei
https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html
- Tencent
https://www.mail-archive.com/qemu-devel@nongnu.org/msg742066.html
- Oracle
(this series).

Then Huawei tried the MicroVM approach:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg680103.html

I simply wanted to save David time by remembering this other approach,
since Peter already commented on David's one (see Huawei link).

Regards,

Phil.


