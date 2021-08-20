Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EFD3F3158
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:14:59 +0200 (CEST)
Received: from localhost ([::1]:54188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH7AZ-00078H-0k
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH79Z-0006CL-Mx
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:13:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH79X-0000GM-TQ
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629476034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sD/KlcPy9DYUeD0jEzngGln9HItzOcu8A2NgwgMkkjY=;
 b=egUfkcLDc4nhc9j1ruCh58Pi2LkzGp0WFVHShKpc6VQ/2uy1aX7A3tvkzqM0TcHPNugzf7
 QDg0MDfg/fgfjcy3aWNCRGFiB1d9n9pbGX9i9gqNe/Hh6WhvYO6lI44rILklVkJNbCO+Gz
 YSnknWmoRw9tPtCbbb+lv/8JUTZLe1M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-itApu54QPqGUXJrFtGSHHA-1; Fri, 20 Aug 2021 12:13:52 -0400
X-MC-Unique: itApu54QPqGUXJrFtGSHHA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r11-20020a05600c35cb00b002e706077614so2268793wmq.5
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 09:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sD/KlcPy9DYUeD0jEzngGln9HItzOcu8A2NgwgMkkjY=;
 b=dxLEL7WlgTNFl2OBX88uKK66Cext6VngWyEav18tuHVulNgGegtgKLShhHERq2XUQx
 FDxZFwSY7/nm6OBvdxn3lP4v2pAVbxhA8xQQ81L+NN9yPCVzfqf7oz3z1CFwJ0HeDldK
 316mNd6eoIa9vY6iDAHX2P88cGxozlwPTCCgjP07sjvnU4TMtW4Xjl9FrBCoYfmBa8Md
 3Z6W3XHhkny/+O1SRxtrBZRze1WqBSFGPeMKUTwn9RKnLLe3AJxrNuzrstW3eQDnk4vZ
 GwO7ot8XglWlv1BNNwOKdmMubfXwBcJNgg6SNSdnMiAXp3SXRYIQXQFCORtWgn250x5z
 WoiQ==
X-Gm-Message-State: AOAM5309Fuwa+0KHXTyPJIv/4AjabXJcJWpAIevfPpcJ4ZnWJ8Kg+DkF
 FC5N+6+NKS1o2YcM08FW3AJLJRVE9xLEgseF8DnGhIddv2piyhAcdcHKgAjklwiGgIXH9d363j7
 liWk3+i0+6pUkd3s=
X-Received: by 2002:a05:600c:3b91:: with SMTP id
 n17mr4743587wms.72.1629476031488; 
 Fri, 20 Aug 2021 09:13:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZotxXEGz4HKLB6eri8cKKN5JueOaACU4PSFc+znRk5zZdZFbQPUhLkMkBchLBkgSsxjy0zA==
X-Received: by 2002:a05:600c:3b91:: with SMTP id
 n17mr4743551wms.72.1629476031234; 
 Fri, 20 Aug 2021 09:13:51 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b201sm10471017wmb.6.2021.08.20.09.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 09:13:50 -0700 (PDT)
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: Igor Mammedov <imammedo@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
 <20210820174402.47a14625@redhat.com>
 <199dc732-1876-d6f9-4569-1802ba7ebf93@redhat.com>
 <2bcfd8a3-5049-5496-0ca8-a6323c4388e7@redhat.com>
 <20210820180835.77fd29d3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3007d467-40b3-4319-4512-d483de3b10e1@redhat.com>
Date: Fri, 20 Aug 2021 18:13:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820180835.77fd29d3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
 David Hildenbrand <david@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 6:08 PM, Igor Mammedov wrote:
> On Fri, 20 Aug 2021 17:53:41 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 8/20/21 5:47 PM, David Hildenbrand wrote:
>>> On 20.08.21 17:44, Igor Mammedov wrote:  
>>>> On Fri, 20 Aug 2021 15:39:27 +0100
>>>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>  
>>>>> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com>
>>>>> wrote:  
>>>>>>
>>>>>> On 20.08.21 16:22, Bin Meng wrote:  
>>>>>>> Hi Philippe,
>>>>>>>
>>>>>>> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daudé
>>>>>>> <philmd@redhat.com> wrote:  
>>>>>>>>
>>>>>>>> Hi Bin,
>>>>>>>>
>>>>>>>> On 8/20/21 4:04 PM, Bin Meng wrote:  
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> The following command used to work on QEMU 4.2.0, but is now broken
>>>>>>>>> with QEMU head.
>>>>>>>>>
>>>>>>>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
>>>>>>>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -device
>>>>>>>>> loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
>>>>>>>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
>>>>>>>>> allocate memory  
>>>>>  
>>>>>> -m 40000000
>>>>>>
>>>>>> corresponds to 38 TB if I am not wrong. Is that really what you want?  
>>>>>
>>>>> Probably not, because the zynq board's init function does:
>>>>>
>>>>>      if (machine->ram_size > 2 * GiB) {
>>>>>          error_report("RAM size more than 2 GiB is not supported");
>>>>>          exit(EXIT_FAILURE);
>>>>>      }
>>>>>
>>>>> It seems a bit daft that we allocate the memory before we do
>>>>> the size check. This didn't use to be this way around...
>>>>>
>>>>> Anyway, I think the cause of this change is commit c9800965c1be6c39
>>>>> from Igor. We used to silently cap the RAM size to 2GB; now we
>>>>> complain. Or at least we would complain if we hadn't already
>>>>> tried to allocate the memory and fallen over...  
>>>>
>>>> That's because RAM (as host resource) is now separated
>>>> from device model (machine limits) and is allocated as
>>>> part of memory backend initialization (in this case
>>>> 'create_default_memdev') before machine_run_board_init()
>>>> is run.
>>>>
>>>> Maybe we can consolidate max limit checks in
>>>> create_default_memdev() by adding MachineClass::max_ram_size
>>>> but that can work only in default usecase (only '-m' is used).  
>>>
>>> We do have a workaround for s390x already: mc->fixup_ram_size
>>>
>>> That should be called before the memory backend is created and seems to
>>> do just what we want, no?  
>>
>> Or maybe more explicit adding a MachineClass::check_ram_size() handler?
> 
> On the first glance, just max_size field should be sufficient
> with checking code being generic, which should remove code duplication
> such checks introduce across tree. Is there a specific board for
> which call back is 'must to have'?

Some boards have minimum or set of possible values (i.e. 2
or 4 SIMMs, each a pow2 between 8M-64M).

We could have few generic helpers and reuse them in each
machine, instead of open-coding each machine:
  machine_check_max_ram_size(),
  machine_check_ram_size_in_range(),
  ...


