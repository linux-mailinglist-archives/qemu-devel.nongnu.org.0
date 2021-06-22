Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B3E3B0510
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:45:48 +0200 (CEST)
Received: from localhost ([::1]:42308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfml-0005DY-FA
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvfjp-0003QE-Ev
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:42:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvfjj-0006f5-11
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624365754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwCOCSAG5XURXT0JfTBmm4OEHMuNxFT5DXZBq1inJDU=;
 b=EqeLweeZeuorwZXptMGcrvQrEv+En4rs4x1QM1tBZIYRTOPV5xk9F5jxbuQ+Yq4ZzTWeOu
 8XmXwwmnopEtxFJvmspuG188f3l177Ta3odbv6STBtj+4X1VaT9+8bcgzPt9NXaFTgn4TU
 wqETITgHWvUOTgeaSbo0TXU+EhCErP0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-4G_y9YxgONmD99D-0dAJiQ-1; Tue, 22 Jun 2021 08:42:33 -0400
X-MC-Unique: 4G_y9YxgONmD99D-0dAJiQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso9680131wrh.12
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 05:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cwCOCSAG5XURXT0JfTBmm4OEHMuNxFT5DXZBq1inJDU=;
 b=W6SvtCOcUwRuhSCNlGo0L5yT/vH0+kUYgCdsuO2HdyPaHJZavcl6wWIrOGbaibJvap
 +d3x3dOwhCd/H69GLpMqOSL+0g1EAjP8XLtYqggZrnRZYpIc5RCI0Gzy9i/mtUjF6ZR6
 c/BxsJsCj5fR+7Zh01D05lQvktjjICnredItKnyb0UWs6nucPJa5IMCB5tPdxpyirsT5
 fT2EQVlZqMfOIIUpYvxXN9e8WMEP8EkAqu9OGYYv7c/1wSTUX9X2dlWilbOF+qEga9kH
 cJy7DvvjCHWnCWU6/HAS+kpmGCUkeXoZI1oXC7nFdO8CppEPf+rv+oFDnT40qK3nsxJR
 pXWw==
X-Gm-Message-State: AOAM530WzY2bmYk7Y/v9SdGBXcD6AuQAVinPyjgAC5sERV3Mylx3itIi
 UnMzMAr3pCqPV7WNYeVgYNT/sw+8Da4KelxTkLg7ys74lQaIIReR9bc42uor5qDhcXz/IaGxMvW
 ed7/iVoYE22MSW2U=
X-Received: by 2002:a1c:7d13:: with SMTP id y19mr401552wmc.139.1624365752066; 
 Tue, 22 Jun 2021 05:42:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/+W16+w6DR9YiDtZ1i+MIQTNfozlWHPtSTIf0hXNkR9/wAkti+KUOagUDKDdS8QwHlwJRhg==
X-Received: by 2002:a1c:7d13:: with SMTP id y19mr401538wmc.139.1624365751826; 
 Tue, 22 Jun 2021 05:42:31 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n8sm2619068wmc.45.2021.06.22.05.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 05:42:31 -0700 (PDT)
Subject: Re: [PATCH v2] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Fam Zheng <fam@euphon.net>
References: <20210621093240.4170701-1-philmd@redhat.com>
 <9A674DF3-041E-4E7C-BB49-481AA77B1F7B@euphon.net>
 <6b77db0c-8625-992e-8546-15b9a24ae928@redhat.com>
 <0EF3A65E-39CB-4114-8572-001C2DF05863@euphon.net>
 <a7cd0827-5ce3-0aaf-c222-f13f84cd4f2c@redhat.com>
 <30f81ba5-cd6a-faee-328d-8ccb8ef76202@redhat.com>
Message-ID: <30a1a560-a69f-9b82-a356-88b45cf3ec4e@redhat.com>
Date: Tue, 22 Jun 2021 14:42:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <30f81ba5-cd6a-faee-328d-8ccb8ef76202@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 10:06 AM, Philippe Mathieu-Daudé wrote:
> On 6/22/21 9:29 AM, Philippe Mathieu-Daudé wrote:
>> On 6/21/21 5:36 PM, Fam Zheng wrote:
>>>> On 21 Jun 2021, at 16:13, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>> On 6/21/21 3:18 PM, Fam Zheng wrote:
>>>>>> On 21 Jun 2021, at 10:32, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>>>
>>>>>> When the NVMe block driver was introduced (see commit bdd6a90a9e5,
>>>>>> January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
>>>>>> -ENOMEM in case of error. The driver was correctly handling the
>>>>>> error path to recycle its volatile IOVA mappings.
>>>>>>
>>>>>> To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
>>>>>> DMA mappings per container", April 2019) added the -ENOSPC error to
>>>>>> signal the user exhausted the DMA mappings available for a container.
>>>>>>
>>>>>> The block driver started to mis-behave:
>>>>>>
>>>>>> qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
>>>>>> (qemu)
>>>>>> (qemu) info status
>>>>>> VM status: paused (io-error)
>>>>>> (qemu) c
>>>>>> VFIO_MAP_DMA failed: No space left on device
>>>>>> qemu-system-x86_64: block/block-backend.c:1968: blk_get_aio_context: Assertion `ctx == blk->ctx' failed.
>>>>>
>>>>> Hi Phil,
>>>>>
>>>>>
>>>>> The diff looks good to me, but I’m not sure what exactly caused the assertion failure. There is `if (r) { goto fail; }` that handles -ENOSPC before, so it should be treated as a general case. What am I missing?
>>>>
>>>> Good catch, ENOSPC ends setting BLOCK_DEVICE_IO_STATUS_NOSPACE
>>>> -> BLOCK_ERROR_ACTION_STOP, so the VM is paused with DMA mapping
>>>> exhausted. I don't understand the full "VM resume" path, but this
>>>> is not what we want (IO_NOSPACE is to warn the operator to add
>>>> more storage and resume, which is pointless in our case, resuming
>>>> won't help until we flush the mappings).
>>>>
>>>> IIUC what we want is return ENOMEM to set BLOCK_DEVICE_IO_STATUS_FAILED.
>>>
>>> I agree with that. It just makes me feel there’s another bug in the resuming code path. Can you get a backtrace?
>>
>> It seems the resuming code path bug has been fixed elsewhere:
>>
>> (qemu) info status
>> info status
>> VM status: paused (io-error)
>> (qemu) c
>> c
>> 2021-06-22T07:27:00.745466Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
>> space left on device
>> (qemu) info status
>> info status
>> VM status: paused (io-error)
>> (qemu) c
>> c
>> 2021-06-22T07:27:12.458137Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
>> space left on device
>> (qemu) c
>> c
>> 2021-06-22T07:27:13.439167Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
>> space left on device
>> (qemu) c
>> c
>> 2021-06-22T07:27:14.272071Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
>> space left on device
>> (qemu)
>>
> 
> I tested all releases up to v4.1.0 and could not trigger the
> blk_get_aio_context() assertion. Building using --enable-debug.
> IIRC Gentoo is more aggressive, so I'll restart using -O2.

Took 4h30 to test all releases with -O3, couldn't reproduce :(

I wish I hadn't postponed writing an Ansible test script...

On v1 Michal said he doesn't have access to the machine anymore,
so I'll assume the other issue got fixed elsewhere.


