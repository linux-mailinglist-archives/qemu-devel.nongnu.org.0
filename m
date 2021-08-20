Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90193F3126
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:09:38 +0200 (CEST)
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH75F-0001j2-3C
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH72W-0006ne-KI
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:06:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH72S-0002Ni-OW
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629475595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ogby1OwcFCQJscqBeYXENsb7Djt1Hm1EHNlhEafj/Lg=;
 b=QBK5LWKYROkMx0+mn/tXugL41t75v3xxO5mQp9lYjR61vNsSxmHhTTdSjkzGNab5tBYU3Y
 Ex9jKF0SNLEEJD6CqJwyvOb9w3tp5v5yRh1mlCcaL84sF31avaudN0OJ+XaT7syMxIwnOG
 nqZPo/dKaO69tkIfTG5uj8Myq0WLCq8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-PEvD31VOOLuF8ogJliy_JQ-1; Fri, 20 Aug 2021 12:06:33 -0400
X-MC-Unique: PEvD31VOOLuF8ogJliy_JQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n20-20020a05600c4f9400b002e6dc6a99b9so2543820wmq.1
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 09:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ogby1OwcFCQJscqBeYXENsb7Djt1Hm1EHNlhEafj/Lg=;
 b=rwJrjR+pkTwcF66r+BJv2ZQ25HSpAaeE1K5hgT7UaMQiL9D/xgbBzgyPlDuVHa4YRF
 yAEpNLQ+USvuiGxqBAXBOmVBfAdDMy/uewiowFwNWvgameLu1tB6nLTbi5GeHW6BQvrP
 Z4M2zHhl7phMRT7Ci6zz0AndLewNcYIxpdS2DLO3trYGkXf+S3kZFhEogEzGARnPv3cv
 9apqk7CFQ0vVyUF9IdQT2lwiJ5HtHlOO1Fwt0F71pTHB2FGxNgb4Yjyej6cS51EVV7PJ
 YvmPstpcdOjXXz2HrCR8Z3nA0J1wfwTzyoPB+qlWNtnAwN6x6EFeyJozL/wJ/hcBZ16z
 c+dA==
X-Gm-Message-State: AOAM533wtc6/qeb7ZDqBLw8YvtiitSTQGWTbN/r33o5c4Fwbx1HsgEZL
 VaCdDiyfAjUZcNlZ4MJSYu+Xg/0JNTy3R9ae6PcT0kSxln9RvE/B7mMauZagYjV2wa0Ek1SpbY6
 0hfaYpVWZwcN6dCg=
X-Received: by 2002:adf:f00d:: with SMTP id j13mr11403134wro.14.1629475592558; 
 Fri, 20 Aug 2021 09:06:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydkzNtinp5AHB4FDvicn8jPNJrhXshbDqQOM2NfikKWpHGHbqJtvivH2lY9m/mtkmpKBaGrQ==
X-Received: by 2002:adf:f00d:: with SMTP id j13mr11403114wro.14.1629475592422; 
 Fri, 20 Aug 2021 09:06:32 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b15sm6924397wru.1.2021.08.20.09.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 09:06:32 -0700 (PDT)
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
 <20210820174402.47a14625@redhat.com>
 <199dc732-1876-d6f9-4569-1802ba7ebf93@redhat.com>
 <20210820180323.7df8751d@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3bbd662f-cc25-0a16-6ba0-444635755234@redhat.com>
Date: Fri, 20 Aug 2021 18:06:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820180323.7df8751d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 6:03 PM, Igor Mammedov wrote:
> On Fri, 20 Aug 2021 17:47:01 +0200
> David Hildenbrand <david@redhat.com> wrote:
> 
>> On 20.08.21 17:44, Igor Mammedov wrote:
>>> On Fri, 20 Aug 2021 15:39:27 +0100
>>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>>   
>>>> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com> wrote:  
>>>>>
>>>>> On 20.08.21 16:22, Bin Meng wrote:  
>>>>>> Hi Philippe,
>>>>>>
>>>>>> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daudé
>>>>>> <philmd@redhat.com> wrote:  
>>>>>>>
>>>>>>> Hi Bin,
>>>>>>>
>>>>>>> On 8/20/21 4:04 PM, Bin Meng wrote:  
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> The following command used to work on QEMU 4.2.0, but is now broken
>>>>>>>> with QEMU head.
>>>>>>>>
>>>>>>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
>>>>>>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -device
>>>>>>>> loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
>>>>>>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
>>>>>>>> allocate memory  
>>>>  
>>>>> -m 40000000
>>>>>
>>>>> corresponds to 38 TB if I am not wrong. Is that really what you want?  
>>>>
>>>> Probably not, because the zynq board's init function does:
>>>>
>>>>      if (machine->ram_size > 2 * GiB) {
>>>>          error_report("RAM size more than 2 GiB is not supported");
>>>>          exit(EXIT_FAILURE);
>>>>      }
>>>>
>>>> It seems a bit daft that we allocate the memory before we do
>>>> the size check. This didn't use to be this way around...
>>>>
>>>> Anyway, I think the cause of this change is commit c9800965c1be6c39
>>>> from Igor. We used to silently cap the RAM size to 2GB; now we
>>>> complain. Or at least we would complain if we hadn't already
>>>> tried to allocate the memory and fallen over...  
>>>
>>> That's because RAM (as host resource) is now separated
>>> from device model (machine limits) and is allocated as
>>> part of memory backend initialization (in this case
>>> 'create_default_memdev') before machine_run_board_init()
>>> is run.
>>>
>>> Maybe we can consolidate max limit checks in
>>> create_default_memdev() by adding MachineClass::max_ram_size
>>> but that can work only in default usecase (only '-m' is used).  
>>
>> We do have a workaround for s390x already: mc->fixup_ram_size
>>
>> That should be called before the memory backend is created and seems to 
>> do just what we want, no?
> 
> it's there for compat sake only if I recall correctly,
> there should be no fixups ever.
> If user asks for nonsence, QEMU should error out and force
> user to correct CLI

Agreed, but this would be cheaper to run the checks *before*
allocating the resources ;)

> (fixups were one of items that were in
> the way of splitting guest RAM into backend/frontend model)
> 


