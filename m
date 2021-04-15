Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E697D360655
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 11:59:25 +0200 (CEST)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWymT-0000a2-2A
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 05:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWykx-00005Z-BY
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:57:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWykv-0000xG-PT
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618480668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q03sG8pYt3WKxiwey6cJCqtSk/C8Mt+neaRBcKrzTE4=;
 b=Z9cyLJLRHcgaJoZ8nxCXPsZt5Ozquxrs8T5pV0MdXOLRVsSu7P/DiH45FaVC+pICuzdJ3f
 3hdU1FSipd15PGP5a8koGboCwSL+mpCkZ3MfhHNwuI8r9dMh7AdxbROR579SzaFWzxCbE9
 zgsxkdPaQLfUM769aob+Q7oabRLf1i0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-CWrVE8-6P12TN9m_U4dd9w-1; Thu, 15 Apr 2021 05:57:47 -0400
X-MC-Unique: CWrVE8-6P12TN9m_U4dd9w-1
Received: by mail-wr1-f71.google.com with SMTP id
 o14-20020a5d474e0000b029010298882dadso2495578wrs.2
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 02:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q03sG8pYt3WKxiwey6cJCqtSk/C8Mt+neaRBcKrzTE4=;
 b=kSTyzmwPv7A00kijuNExTCQrWE3bPjJmTYdZGyR6vbi2N0KcoP3pjAx3dJnpLo9T+U
 IWbn1x6cbT1l5xI8kMNJhKh70HpQ8n3HSimDhinkkaJt8Lbco381L2LAKbjnf/owtXAo
 YS5fRBvTiXBHY0DNWSXWtmSJPYpANr5vZxMO5eFD+Xpp02w9gk7XgqFXfyEQ2wKIrliK
 X4N7GwHaX/bH6yUq9vFiYHg7wsQ2zkF9pJpve9xPoAT+dV15Hdwk5RZO5sQaeNFUbOzt
 wVECNH6mD3DBQahosVLTjA2OaqgL0Ss7Y/76UqRbczD08T5XmuzMU/69NY95eSGk2//D
 RCIQ==
X-Gm-Message-State: AOAM533OX2FTVmh56KDHHBKNJjOHr3S5tG4rBhtNCavw/FhFCYDNOde+
 PBeOr0LEdRTFvYg9/vSjPcFUlXhAXY3GWK36TCHQvzf0Nc5XtGNEQa2FwDjdd5uMal4RZCekYzh
 ZbosYwoqEY7tLZ5Q=
X-Received: by 2002:a05:600c:4f8e:: with SMTP id
 n14mr2342767wmq.34.1618480666183; 
 Thu, 15 Apr 2021 02:57:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhwEeHtHZnmI2j2KsPKR4vqO5u8ZRoFq374pSCkj9yS5xx7g+TMDogGMsa/4tQnt3xhmdkfw==
X-Received: by 2002:a05:600c:4f8e:: with SMTP id
 n14mr2342750wmq.34.1618480665972; 
 Thu, 15 Apr 2021 02:57:45 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n6sm2157706wrt.22.2021.04.15.02.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 02:57:45 -0700 (PDT)
Subject: Re: [PATCH] hw/elf_ops: clear uninitialized segment space
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210414105838.205019-1-laurent@vivier.eu>
 <c8f39459-5106-bafb-94e5-2116546f75e0@amsat.org>
 <d4874de4-9bf2-f0b6-0b4c-3d0b97d26b0d@vivier.eu>
 <97b4d188-9fb6-3ba3-183a-82f926ab016c@amsat.org>
Message-ID: <934a3f68-8800-4774-0326-6881edff94e4@redhat.com>
Date: Thu, 15 Apr 2021 11:57:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <97b4d188-9fb6-3ba3-183a-82f926ab016c@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/15/21 10:44 AM, Philippe Mathieu-Daudé wrote:
> On 4/14/21 2:41 PM, Laurent Vivier wrote:
>> Le 14/04/2021 à 14:16, Philippe Mathieu-Daudé a écrit :
>>> On 4/14/21 12:58 PM, Laurent Vivier wrote:
>>>> When the mem_size of the segment is bigger than the file_size,
>>>> and if this space doesn't overlap another segment, it needs
>>>> to be cleared.
>>>>
>>>> This bug is very similar to the one we had for linux-user,
>>>> 22d113b52f41 ("linux-user: Fix loading of BSS segments"),
>>>> where .bss section is encoded as an extension of the the data
>>>> one by setting the segment p_memsz > p_filesz.
>>>>
>>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>>> ---
>>>>  include/hw/elf_ops.h | 17 +++++++++++++++++
>>>>  1 file changed, 17 insertions(+)
>>>>
>>>> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
>>>> index 6ee458e7bc3c..e3dcee3ee349 100644
>>>> --- a/include/hw/elf_ops.h
>>>> +++ b/include/hw/elf_ops.h
>>>> @@ -562,6 +562,23 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>>>>                      if (res != MEMTX_OK) {
>>>>                          goto fail;
>>>>                      }
>>>> +                    /*
>>>> +                     * We need to zero'ify the space that is not copied
>>>> +                     * from file
>>>> +                     */
>>>> +                    if (file_size < mem_size) {
>>>> +                        static uint8_t zero[4096];
>>>
>>> Given it is unlikely, maybe better use:
>>>
>>>               g_autofree uint8_t *zero = g_new0(uint8_t, 4096);
>>
>> I don't know what is the best solution but this seems to introduce a lot of complexity only to have
>> a page of 0s.
> 
> Less complex alternative is to use dma_memory_set():
> 
>    dma_memory_set(as, file_size, 0, mem_size - file_size);
> 
> Actually we should extract address_space_set() from it, keeping
> the dma_barrier() call in dma_memory_set(), and use address_space_set()
> here.
> 
> What do you think?

I'll post a patch.


