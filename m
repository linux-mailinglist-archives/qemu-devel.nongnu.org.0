Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE6454501C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:05:40 +0200 (CEST)
Received: from localhost ([::1]:37428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJj8-0002oD-Su
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzJF0-0007kR-Pl
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzJEs-0006CL-4r
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654785258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPW+5faa2QW+8Z/lK9Y/JDyNDJu0hl5AZwrGuRsAXbc=;
 b=BaBlojzTRRlVZi/TIbZ9J728iT865HbkC1TwTLD0VI9oBKH3bX9rZ3NdlGCWNTO9dCIkyU
 fQkt1rBrxg6Xa7R6F+Pd1AdSJR/cfV4ibr4+I23r2xHMAn6MqSl+uDEOugAmvSsbk0sMdP
 vl0CruxUZfEenRavs0dxxmcbrFeS6Gw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-5XHUSMK7NOiXPQ8HJly-SA-1; Thu, 09 Jun 2022 10:34:17 -0400
X-MC-Unique: 5XHUSMK7NOiXPQ8HJly-SA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so11415861wms.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 07:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=vPW+5faa2QW+8Z/lK9Y/JDyNDJu0hl5AZwrGuRsAXbc=;
 b=34XGcahqjh6RfNzJlbrNBM6//R2WXGtnA1dWRdImU56/lTnyhz/nlKBHrLknu5RbNv
 LmR3sXeFkpZZc3XpIR730cKLPNsx0ivyjxqlNLpEpWP6Pmoyb/HOTD37FAOZfxZUDhZ7
 nnzVtIg0yBvfyD0evgq/UYf2zJ/638Qo5dvkcRvhWu1nzhpWDtvb7VNfCMaJcYNb/12S
 Oe5Fn5Bs4bHmVN+vdAQ93P8ty1rZQxQmUAVRoKPODE3sSabnExd7orJGF9dpAcH19Bay
 CJl9optWfWVZ529JDDUyDOOotRPxrnsZvQtXLKwuYX1ctREPy9jR3r+HZ2X2boi33gpP
 +pbQ==
X-Gm-Message-State: AOAM533YIupvMoBIflRoiLJcRIsStbIh8Y4Cal5ZivbeNHsuDGumir3U
 RppT0CVtyhztr/6CKtHLng5evFOLBerVbeKe91c0bvHYGlKKZbyZRiMrxdohTSTDxhf5VlMDUt5
 x1SRf3PEY+vSRGpI=
X-Received: by 2002:a05:600c:3d1b:b0:39b:1743:4d84 with SMTP id
 bh27-20020a05600c3d1b00b0039b17434d84mr3601506wmb.118.1654785255630; 
 Thu, 09 Jun 2022 07:34:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzCZVgB42CRM+ghKB6qxPYLvdRvTrnncLhit37Fr09gx780ctT4dUaRXbnXgWNCFOml1waAg==
X-Received: by 2002:a05:600c:3d1b:b0:39b:1743:4d84 with SMTP id
 bh27-20020a05600c3d1b00b0039b17434d84mr3601464wmb.118.1654785255252; 
 Thu, 09 Jun 2022 07:34:15 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-115-130.web.vodafone.de.
 [109.42.115.130]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c350700b0039c3b05540fsm26425084wmq.27.2022.06.09.07.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 07:34:14 -0700 (PDT)
Message-ID: <4d58f632-df78-b709-37b8-f7d86ae536f6@redhat.com>
Date: Thu, 9 Jun 2022 16:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Stefan Pejic
 <stefan.pejic@syrmia.com>, ot_dragan.mladjenovic@mediatek.com
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Matthew Fortune <matthew.fortune@mips.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 ot_stefan.pejic@mediatek.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
 <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
 <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
 <YqG2Anwtba+MfxfH@redhat.com> <209c7aaf-bc7b-cbc2-c6d0-002bbe31258a@suse.de>
 <e29d83e6-e7bb-b370-33d0-88d22aa2eddb@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: What to do with the nanomips disassembler (was: [PATCH] disas: Remove
 libvixl disassembler)
In-Reply-To: <e29d83e6-e7bb-b370-33d0-88d22aa2eddb@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/2022 16.15, Claudio Fontana wrote:
> On 6/9/22 13:27, Claudio Fontana wrote:
>> On 6/9/22 10:57, Daniel P. Berrangé wrote:
>>> On Thu, Jun 09, 2022 at 10:47:24AM +0200, Thomas Huth wrote:
>>>> On 08/06/2022 17.51, Paolo Bonzini wrote:
>>>>> On 6/3/22 19:35, Thomas Huth wrote:
>>>>>> On 03/06/2022 19.26, Claudio Fontana wrote:
[...]
>>>>>>> maybe something we can now drop if there are no more C++ users?
>>>>>>
>>>>>> I thought about that, too, but we still have disas/nanomips.cpp left
>>>>>> and the Windows-related files in qga/vss-win32/* .
>>>>>
>>>>> That is pure C++ so it does not need the extra complication of "detect
>>>>> whether the C and C++ compiler are ABI-compatible" (typically due to
>>>>> different libasan/libtsan implementation between gcc and clang).  So
>>>>> it's really just nanoMIPS that's left.
>>>>
>>>> Ok, so the next theoretical question is: If we get rid of the nanomips.cpp
>>>> file or convert it to plain C, would we then simplify the code in configure
>>>> again (and forbid C++ for the main QEMU code), or would we rather keep the
>>>> current settings in case we want to re-introduce more C++ code again in the
>>>> future?
>>>
>>> It doesn't feel very compelling to have just 1 source file that's
>>> C++ in QEMU. I'm curious how we ended up with this nanomips.cpp
>>> file - perhaps it originated from another project that was C++
>>> based ?
>>>
>>> The code itself doesn't look like it especially needs to be using
>>> C++. There's just 1 class there and every method is associated
>>> with that class, and external entry point from the rest of QEMU
>>> is just one boring method. Feels like it could easily have been
>>> done in C.
>>>
>>> Personally I'd prefer it to be converted to C, and if we want to
>>> add any C++ in future it should be justified & debated on its
>>> merits, rather than as an artifact of any historical artifacts
>>> such as the code in configure happening to still exist.
>>
>> I'll take a look at it, maybe I can turn it to C fairly quickly.
> 
> It seems to be generated code, getting the original authors involved in the thread.

Not sure whether the original mips folks are still around ... but the folks 
from MediaTek recently expressed their interest in nanoMIPS:

 
https://lore.kernel.org/qemu-devel/20220504110403.613168-8-stefan.pejic@syrmia.com/

Maybe they could help with the nanoMIPS disassembler?

I know it's likely a lot of work, but the best solution would maybe be to 
add nanoMIPS support to capstone instead, then other projects could benefit 
from the support in this library, too...

If I googled that right, there is a LLVM implementation of nanoMIPS 
available here:

 
https://github.com/milos1397/nanomips-outliner/tree/master/llvm/lib/Target/Mips

... so maybe that could be used as input for capstone (which is based on llvm)?

  Thomas


