Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6FE3F2E2C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:35:42 +0200 (CEST)
Received: from localhost ([::1]:45042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5cT-0007S7-Oo
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mH5b9-00066y-NW
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:34:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mH5b7-0007uz-Ak
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629470055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFMoMHsX3acG/G4fMeysK41r9vXpZscRxxVrpMvbbFw=;
 b=JCJ1hri6yIWisldTKRNo4286IIGArXrNUuWWV0xWobaxcbHX4Cc67J8qET8AJpHwF50ZNo
 VgZ/LHafv+7/Sl84VbI4zhVwotuKNWf68GC3UBYLwWgnBECPfyTc0s+JKAqm7qtbRevV3Z
 FMqL+hYwUaTI8E+/g16UmqOFQ/NOlgM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-Figt0lylNoSqKa0kVmucmg-1; Fri, 20 Aug 2021 10:34:14 -0400
X-MC-Unique: Figt0lylNoSqKa0kVmucmg-1
Received: by mail-wr1-f69.google.com with SMTP id
 m2-20020a0560000082b0290154f6e2e51fso2902631wrx.12
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 07:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IFMoMHsX3acG/G4fMeysK41r9vXpZscRxxVrpMvbbFw=;
 b=bPybvHHtpP9nxw6QaXVVgZm7XF9OjFr/cYj+I5bxJ1pq6TjiO39bzszWu7C7N5yySe
 OyX6ditfYoMYvQ/gS62Zzgai8TraEHlctGcAWXrpsTCOUJA5sYeRO1f8Kyi2SBpN03LJ
 3AfC34VNbvzXqIW44Ohvvdzmm9Fkr510F9AA4tv9dSiftpjHkHHq9gIWTG9Byfzexiyj
 M53K9oAAdHP5AemyyLQyVyLFfD1U1RWgXUWIi9yQMEyg+4ILxYBdAk65kCapQ7bIIr/l
 pJsHKe1szjfHzgBoCc8wwbDlPoi/pcdiubmHRAWkxd0PaTOhTmFtVXyZR8IYTLq9V0+4
 L3iw==
X-Gm-Message-State: AOAM531DFKXuqgAI479WgV02KhZQNp2x08XULVKpTF9AP/EGmZ9uzaUe
 wTJhv2M+9tgzOnnaxyiG8gJUadTvj7pocIiDi+CKVnBzVrLQC0xf5X91gJ8oxxK7gZgRx1fLcHD
 lrNvcbiuh6JuiN5s=
X-Received: by 2002:a05:600c:a4b:: with SMTP id
 c11mr4279086wmq.97.1629470053434; 
 Fri, 20 Aug 2021 07:34:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSU6huqLOqpa+Wn3RhzN6eyDmE0Nl1bhrYH+hI4NoH+BMVieid6CXYPUME2b8fSDW1MyJb7A==
X-Received: by 2002:a05:600c:a4b:: with SMTP id
 c11mr4279057wmq.97.1629470053213; 
 Fri, 20 Aug 2021 07:34:13 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id s10sm7380156wrv.54.2021.08.20.07.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 07:34:12 -0700 (PDT)
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
Date: Fri, 20 Aug 2021 16:34:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.08.21 16:22, Bin Meng wrote:
> Hi Philippe,
> 
> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> Hi Bin,
>>
>> On 8/20/21 4:04 PM, Bin Meng wrote:
>>> Hi,
>>>
>>> The following command used to work on QEMU 4.2.0, but is now broken
>>> with QEMU head.
>>>
>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -device
>>> loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
>>> allocate memory
>>>
>>> Any ideas?
>>
>> Richard hit that recently too.
> 
> I hit this when in the VM on Azure pipelines, but I was able to
> reproduce this issue on my local machine.
> 
>>
>> Can you provide:
>>
>> cat /proc/sys/vm/overcommit_kbytes
>> cat /proc/sys/vm/overcommit_memory
>> cat /proc/sys/vm/overcommit_ratio
> 
> $ cat /proc/sys/vm/overcommit_kbytes
> 0
> $ cat /proc/sys/vm/overcommit_memory
> 0
> $ cat /proc/sys/vm/overcommit_ratio
> 50
> 
>>
>> and
>>
>> cat /proc/meminfo
>>
>> (CommitLimit, Committed_AS)
> 
> $ cat /proc/meminfo
> 
> CommitLimit:    12388820 kB
> Committed_AS:    5019088 kB
> 
>> and OOM messages.
> 
> I did not see any OOM messages.

-m 40000000

corresponds to 38 TB if I am not wrong. Is that really what you want?

How much main memory does your system have?

-- 
Thanks,

David / dhildenb


