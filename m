Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B2D2B91EB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 13:00:03 +0100 (CET)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfiba-0002jR-Ak
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 07:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfiZA-0001Lp-OP
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:57:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfiZ8-0003Oj-MB
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605787049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bb3sXPzF+RMAbwpEksJR8Qqh1UA+Gme1cltf9t8lGRs=;
 b=EieG6eZZdzp9SksriNTguOT8/9rGObrG9v57lavSn/8C6TpDkdoP6PPElVbb/JVRJlSEQ2
 kv5gPraCextSNEBgYonZMti4pC8hOHyFgy3lVRDBzk4nTfM7BAVi4NpKrgWo88cJTikGtO
 2j+ylRzbfpV2WzR2S3xTyjx0ysUZ+wo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-sFRBq2e6Piyc2cePbyQV3w-1; Thu, 19 Nov 2020 06:57:24 -0500
X-MC-Unique: sFRBq2e6Piyc2cePbyQV3w-1
Received: by mail-wr1-f72.google.com with SMTP id h11so1906539wrq.20
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 03:57:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bb3sXPzF+RMAbwpEksJR8Qqh1UA+Gme1cltf9t8lGRs=;
 b=kR6HHgLpGMZo4RGf0uwSgfiEtC/duK8TGEVUaz+zOiy4Nf/aKdQdXI4m5ja2F2YbRT
 oRn+8RJQxXtwo4kUe4ZqW9VvSYYADUjs/+KgFgzHEaVWXtAsMvfKmbNJJkFZikdJqu1u
 Zaov+Xv5OzMR369kZv/YXj+clxVpRhDXZjT8QjIVtutd+8aA0kgw4bo+uTRXyyFBC0I5
 Sel9HtujdDPyPqb+O5ZTQ+xYz0VDdQHHtyS/uUPDqaghuZJjLTMbxBh8kpgc/ErO83ny
 AtCpzmNsxtfFd5Heae/uMbkh2vIvmkiXTU6UfzpQuM9/ky6WScgAzaJTcs5nci7nfp5K
 F5ew==
X-Gm-Message-State: AOAM532DcmPMhnUa2v0h87OCXMct9yUF2u+FU8OEUsvXIuU9g+0yQkFM
 uTLgvrAIECuzWpQzQNHgI5kjgLImoOFV+s14XSEiFTkeufranM4dLXygY88I5lci1upGjsbDdZM
 DpKT2TFaTtjrPjSSysqtc5YBrBuo8p3ibaGBGVC/USnZHPze0zg2HiNBzD3DBS0Sd
X-Received: by 2002:a7b:cf32:: with SMTP id m18mr4246239wmg.58.1605787043034; 
 Thu, 19 Nov 2020 03:57:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4f9JBJ8E7Lq6RRJnEC/+t/Z4YgZ2VDqUyCTWmt1inbGrcbOzYxfCDcb6GWpnmwvYg+ZLttA==
X-Received: by 2002:a7b:cf32:: with SMTP id m18mr4246209wmg.58.1605787042829; 
 Thu, 19 Nov 2020 03:57:22 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id l16sm37321192wrx.5.2020.11.19.03.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 03:57:22 -0800 (PST)
Subject: Re: [RFC PATCH 0/5] ARM: reduce the memory consumed when mapping UEFI
 flash images
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Ard Biesheuvel <Ard.Biesheuvel@arm.com>, Leif Lindholm <leif@nuviainc.com>
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com>
 <87a6vhxvit.fsf@dusky.pond.sub.org>
 <e54fc218-1eae-be1c-b064-049bc1d46793@redhat.com> <87ft55vad4.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7a87651c-47be-1d61-b88a-d0ee151d67fa@redhat.com>
Date: Thu, 19 Nov 2020 12:57:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87ft55vad4.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
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
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Xu Yandong <xuyandong2@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?B?aGFpYmluemhhbmco5byg5rW35paMKQ==?= <haibinzhang@tencent.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Ard & Leif for EDK2.

On 11/19/20 12:45 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>> On 11/16/20 2:48 PM, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>
>>>> Hi David,
>>>>
>>>> On 11/16/20 11:42 AM, David Edmondson wrote:
>>>>> Currently ARM UEFI images are typically built as 2MB/768kB flash
>>>>> images for code and variables respectively. These images are both then
>>>>> padded out to 64MB before being loaded by QEMU.
>>>>>
>>>>> Because the images are 64MB each, QEMU allocates 128MB of memory to
>>>>> read them, and then proceeds to read all 128MB from disk (dirtying the
>>>>> memory). Of this 128MB less than 3MB is useful - the rest is zero
>>>>> padding.
>>>>
>>>> 2 years ago I commented the same problem, and suggested to access the
>>>> underlying storage by "block", as this is a "block storage".
>>>>
>>>> Back then the response was "do not try to fix something that works".
>>>> This is why we choose the big hammer "do not accept image size not
>>>> matching device size" way.
>>>>
>>>> While your series seems to help, it only postpone the same
>>>> implementation problem. If what you want is use the least memory
>>>> required, I still believe accessing the device by block is the
>>>> best approach.
>>>
>>> "Do not try to fix something that works" is hard to disagree with.
>>> However, at least some users seem to disagree with "this works".  Enough
>>> to overcome the resistance to change?
>>
>> Yeah, at least 3 big users so far:
>>
>> - Huawei
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html
>> - Tencent
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg742066.html
>> - Oracle
>> (this series).
>>
>> Then Huawei tried the MicroVM approach:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg680103.html
>>
>> I simply wanted to save David time by remembering this other approach,
>> since Peter already commented on David's one (see Huawei link).
> 
> IIRC the two questions that came up were:
> 
>   - what would reading memory not covered by a file look like (0's or
>     something more like real HW, 7f?).

For NOR flashes erased bit is high, programmed bit is low, so: 0xff.

> 
>   - what happens when the guest writes beyond the bounds of a backing
>     file?

Report an hardware error, so guest firmware have a chance to do
do something (not sure what, beside rebooting...).

> 
> I'm guessing for these cloudy type applications no one cares about
> persistence of EFI variables? Maybe we just need a formulation for the
> second pflash which is explicit about writes being ephemeral while also
> being accepted?

Someone suggested adding a new machine type to QEMU to be able to use
smaller flash for cloud usage (but I don't remember who). Then EDK2
could be built with for this new flash size.

Regards,

Phil.


