Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F533F3007
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 17:48:11 +0200 (CEST)
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH6kc-0003fp-5v
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 11:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mH6jb-0002lN-0i
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:47:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mH6jZ-0002vJ-JJ
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629474425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WlcJXE7AYcsMiyRDv7a/mDSfhXNDS3YYokGDRbiSsA=;
 b=AFmz89U4WqFWDeGZDUsqJRQECntuzc68NRN72pIfYkJkJPQb0kHcPsRIuxXAIgb7gCGkyE
 TXlDrCZcnxWaMm5jkhYPxLrPG30J20ZD1gBZbihSbD2J/RtQqfmLwhAgGuJGV0ob9vK5u+
 E9B9oiYJmlqkAWR7as12R7D90zgYO84=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-Xc4S0YMvPAuaY3FNtkhgbA-1; Fri, 20 Aug 2021 11:47:03 -0400
X-MC-Unique: Xc4S0YMvPAuaY3FNtkhgbA-1
Received: by mail-wr1-f69.google.com with SMTP id
 m2-20020a0560000082b0290154f6e2e51fso2972799wrx.12
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 08:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4WlcJXE7AYcsMiyRDv7a/mDSfhXNDS3YYokGDRbiSsA=;
 b=AqXxHe46o8bN0zDpzScVRvGiVOWWF7CcUAsUVTlECeXIGdBKU5uTVPxwsab7i9/lvf
 +TStLBNcoGlyw0WMg9kRLBZzttFxpJnwZ82YqrhLRb3FhG0/s5rw/wdMtbxyfQ7JSKbw
 gjGEkBIOH2Ex8GhH+22Y6JDovxGOzYz4mTi/9ZjhvcQqa1xi+RwkxgsNuCXz2xiZWlM9
 plxgUHtgl6o7vob2+B0tpPO2iLnpgp0Bahg36zGmcwNC22ph/QZj7Djo0YJfFTRSvota
 QEszUp5gtEKtDY1pLoYy/4KY+UdgW3owcpfohRxn5nHXiu61mHvwXQVT2v9++3pSiPQE
 ieqw==
X-Gm-Message-State: AOAM533wAQn8d4iPzjE38CCbnnhNQwSo7Zkewa4pGrorgf1K2YVlp8WB
 i3PUfABJcjBC18pojzX9s46CjGB2mtOTptKbeIo5IwtMpY69BxqhGgqr3O8/UWkExOi1wI9pkZw
 Cmqb38XIFSc5oUAE=
X-Received: by 2002:a1c:2202:: with SMTP id i2mr4672357wmi.78.1629474422561;
 Fri, 20 Aug 2021 08:47:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyKYsvyKTvb4pSRkMGSeFDuHYqHXOXZK8P9lEXRKbW3LxOZ7DHpufVX3Tk4G6Qw5fk6tyLsg==
X-Received: by 2002:a1c:2202:: with SMTP id i2mr4672329wmi.78.1629474422290;
 Fri, 20 Aug 2021 08:47:02 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id h11sm12374713wmc.23.2021.08.20.08.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 08:47:01 -0700 (PDT)
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
 <20210820174402.47a14625@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <199dc732-1876-d6f9-4569-1802ba7ebf93@redhat.com>
Date: Fri, 20 Aug 2021 17:47:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820174402.47a14625@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.08.21 17:44, Igor Mammedov wrote:
> On Fri, 20 Aug 2021 15:39:27 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
>> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com> wrote:
>>>
>>> On 20.08.21 16:22, Bin Meng wrote:
>>>> Hi Philippe,
>>>>
>>>> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daudé
>>>> <philmd@redhat.com> wrote:
>>>>>
>>>>> Hi Bin,
>>>>>
>>>>> On 8/20/21 4:04 PM, Bin Meng wrote:
>>>>>> Hi,
>>>>>>
>>>>>> The following command used to work on QEMU 4.2.0, but is now broken
>>>>>> with QEMU head.
>>>>>>
>>>>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
>>>>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -device
>>>>>> loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
>>>>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
>>>>>> allocate memory
>>
>>> -m 40000000
>>>
>>> corresponds to 38 TB if I am not wrong. Is that really what you want?
>>
>> Probably not, because the zynq board's init function does:
>>
>>      if (machine->ram_size > 2 * GiB) {
>>          error_report("RAM size more than 2 GiB is not supported");
>>          exit(EXIT_FAILURE);
>>      }
>>
>> It seems a bit daft that we allocate the memory before we do
>> the size check. This didn't use to be this way around...
>>
>> Anyway, I think the cause of this change is commit c9800965c1be6c39
>> from Igor. We used to silently cap the RAM size to 2GB; now we
>> complain. Or at least we would complain if we hadn't already
>> tried to allocate the memory and fallen over...
> 
> That's because RAM (as host resource) is now separated
> from device model (machine limits) and is allocated as
> part of memory backend initialization (in this case
> 'create_default_memdev') before machine_run_board_init()
> is run.
> 
> Maybe we can consolidate max limit checks in
> create_default_memdev() by adding MachineClass::max_ram_size
> but that can work only in default usecase (only '-m' is used).

We do have a workaround for s390x already: mc->fixup_ram_size

That should be called before the memory backend is created and seems to 
do just what we want, no?

-- 
Thanks,

David / dhildenb


