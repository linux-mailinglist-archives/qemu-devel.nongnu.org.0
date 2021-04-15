Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18913604D0
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 10:47:46 +0200 (CEST)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWxf7-0000ki-CC
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 04:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWxbw-00005P-LI
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:44:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWxbv-0007mS-1G
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:44:28 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so14115076wmy.5
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 01:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nvIVir+MpG4sbzW4/BCCmip13ZLDzoJNS8Cvq/4Tinc=;
 b=fTHL1KAsKznnby9XrtWMsLodurTTMR1NNKgX5ZoEKOSu5ZWSKNGnGJYjRjkSYEpwCn
 wJBW2gWxpQJWpGPF6O5KG2Nli+wtQeqo/M1cItFx2w8WAfuCkckwgQEyPHtXUQIfnaNR
 N5AGGdovSWFkPc0UaYN7KLDo6UHeDdDgPKGKy9NHU5kdfgWnwDb7fKXWCHpNLO+kPsXk
 ydz9EL7WnQMkIGxEvOa8R6DOpSt9YQHQmlvs891/xlwct6laVqDWWbGFWNmjJfGErYDF
 c0bgDThQmpuPN7nxhclJ6HoWwJU3l3BeUVtEgx0tXymqQu2Bv8he0/cwOaPWsgTEgDYA
 K4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nvIVir+MpG4sbzW4/BCCmip13ZLDzoJNS8Cvq/4Tinc=;
 b=qxWp5t38KrKI4QDl28Gh2Rt8dghxEOAWjIAiMznr6SMbdb9Sj+5pmDh7/47i452OOi
 Mng1HLncReduWL84CLUKSr+ybEgp4tdFjQLZTdbuGolXPwVkFbBAsBJW8IO4Q2QMSges
 evsAWyrldttDfgWGs7X/zo/+COHBY95YG1nOiLkoZpGYlgAh7WByYEPJMSQpXZuVp+pg
 b0CMr7/ty3geUphKysxWaXSkiJTKEvKpF59tkM47SSGL9NUtTRRlksvMzH7t80xIP89q
 vCUBFWbbTOYF8aCdsrRsl7jlm/CUGqAscJr7F3Wd+fYjOef7ATh2WUJiohtwXGb21O9W
 ffIA==
X-Gm-Message-State: AOAM532DqGbC+iITQd4n69mEUnRLN+Lfi8zF/h3L70ujwZIMqZEdiCGq
 ONeUICEVOwyKDdV3t9VMPdY=
X-Google-Smtp-Source: ABdhPJyYFka/7/mfnGdIIFZxnX8LpBqYdotNesi1CXhvkUb0ksgWzzqnk/zvdDBgUVJygUVIS2Z9Sg==
X-Received: by 2002:a05:600c:2112:: with SMTP id
 u18mr1958111wml.33.1618476264946; 
 Thu, 15 Apr 2021 01:44:24 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c2sm1617609wmr.22.2021.04.15.01.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 01:44:24 -0700 (PDT)
Subject: Re: [PATCH] hw/elf_ops: clear uninitialized segment space
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210414105838.205019-1-laurent@vivier.eu>
 <c8f39459-5106-bafb-94e5-2116546f75e0@amsat.org>
 <d4874de4-9bf2-f0b6-0b4c-3d0b97d26b0d@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <97b4d188-9fb6-3ba3-183a-82f926ab016c@amsat.org>
Date: Thu, 15 Apr 2021 10:44:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d4874de4-9bf2-f0b6-0b4c-3d0b97d26b0d@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 2:41 PM, Laurent Vivier wrote:
> Le 14/04/2021 à 14:16, Philippe Mathieu-Daudé a écrit :
>> On 4/14/21 12:58 PM, Laurent Vivier wrote:
>>> When the mem_size of the segment is bigger than the file_size,
>>> and if this space doesn't overlap another segment, it needs
>>> to be cleared.
>>>
>>> This bug is very similar to the one we had for linux-user,
>>> 22d113b52f41 ("linux-user: Fix loading of BSS segments"),
>>> where .bss section is encoded as an extension of the the data
>>> one by setting the segment p_memsz > p_filesz.
>>>
>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>> ---
>>>  include/hw/elf_ops.h | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>
>>> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
>>> index 6ee458e7bc3c..e3dcee3ee349 100644
>>> --- a/include/hw/elf_ops.h
>>> +++ b/include/hw/elf_ops.h
>>> @@ -562,6 +562,23 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>>>                      if (res != MEMTX_OK) {
>>>                          goto fail;
>>>                      }
>>> +                    /*
>>> +                     * We need to zero'ify the space that is not copied
>>> +                     * from file
>>> +                     */
>>> +                    if (file_size < mem_size) {
>>> +                        static uint8_t zero[4096];
>>
>> Given it is unlikely, maybe better use:
>>
>>               g_autofree uint8_t *zero = g_new0(uint8_t, 4096);
> 
> I don't know what is the best solution but this seems to introduce a lot of complexity only to have
> a page of 0s.

Less complex alternative is to use dma_memory_set():

   dma_memory_set(as, file_size, 0, mem_size - file_size);

Actually we should extract address_space_set() from it, keeping
the dma_barrier() call in dma_memory_set(), and use address_space_set()
here.

What do you think?

Phil.

