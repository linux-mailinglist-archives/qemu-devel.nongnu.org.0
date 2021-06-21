Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF973AE8ED
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:19:13 +0200 (CEST)
Received: from localhost ([::1]:44714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvItU-00034F-CM
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvIsJ-0001wy-O2; Mon, 21 Jun 2021 08:17:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:44758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvIsI-0007AZ-2h; Mon, 21 Jun 2021 08:17:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so8517128wmb.3; 
 Mon, 21 Jun 2021 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ijBWjW1KX72EWbYN0M9Qq+V29cpuviIl3XTmNV1vPrY=;
 b=QMx2pJR8NVIxFCjhh5mUODOmZngO+LIhrJmeAJ2jzq6PXoZDDPAaizg2DquvyZ48xZ
 9VtBX3y38kXcBVnLE8lasp0QFwxqFnTr5lk+zukS3SVBrm4ivrP6AtFh1c/+JV0uYJpA
 NGK34FUlQA3AOXZzCsJjnahoVYsSe4bcLkPMDeNqpKQ23DxTcyMnHipgspJf/79mFd8M
 aCtilyj3SAazB16dsq0Xcw/63mkSPxeQ3cbeslQPXlHtsacnahpLGi0yV/LIt+k7frFP
 Mu04yssGNUp28PiqBHvmY8TRR2u3QgPl7OQdvREo9Ccy9mdTIjgzyPe0AP940XDlT9qY
 0htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ijBWjW1KX72EWbYN0M9Qq+V29cpuviIl3XTmNV1vPrY=;
 b=XPZHFeKDKWCVsc7k/CrICglbesxSNaYxQ/f/DdicBOTx9FeM9Dt5gcfwKHwNyHr5sV
 MtgCo9NZm+LRTI9QAW2aIv1UnxTGvkMHO+Q0hEEtsMTtJNH8m46lF6I3NJfRjF3sHKxu
 o2hDQb2Q5xKIUEAsg2400JW42Nb51xCRRyLfJXuG+ulFGf1QhJECLtvN+3XJsH44ZPrE
 Q+QhNl+0qEDutO0KBP4R/2tV/sEh28TLhuaTNrWDsHpwUYRZBrYTkc6taEm1c177rheG
 vO5QwU5Z6hBMS6RYelRfrRSd/f34vydaWJy+ZSR86Ayp+zOz6cjtbCnAnKgzfEmmZefq
 XLVg==
X-Gm-Message-State: AOAM530g7LTDFXD/nyuM+ASsVk3KmyfGObCq7OlmQgOpzZg5AjtW3EMH
 x6OFZFxZP+yYEDO5IAqsty8=
X-Google-Smtp-Source: ABdhPJx8PUkBY3a67WbO+w9PzOn3P5AqQrwlzN+cy22CrhMWJDQ3MklSuBfu9ubNMm34W2YEHwB2Mw==
X-Received: by 2002:a05:600c:24c:: with SMTP id
 12mr23820591wmj.174.1624277875964; 
 Mon, 21 Jun 2021 05:17:55 -0700 (PDT)
Received: from [192.168.43.238] (47.red-95-127-153.staticip.rima-tde.net.
 [95.127.153.47])
 by smtp.gmail.com with ESMTPSA id t128sm4535585wma.41.2021.06.21.05.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 05:17:55 -0700 (PDT)
Subject: Re: [PATCH] memory: Display MemoryRegion name in read/write ops trace
 events
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210307074833.143106-1-f4bug@amsat.org>
 <8892fbd6-a63c-ef02-78f3-935e4f95dbb1@amsat.org>
 <2def176e-8707-78cc-b524-3fd47456261f@amsat.org>
 <c4b050f9-8d36-28a5-b5fe-343bbbe0efdb@vivier.eu>
 <dadd0b69-e613-a0f6-5f81-a62159b41493@amsat.org>
 <a3660d89-0a2b-bb28-8a78-8d8078b71a01@vivier.eu>
 <ac9ed125-4efa-6068-9050-3dc367066de7@amsat.org>
 <c1f1313c-6d32-c560-30e6-0acd8a6f2090@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <89e922a4-a22d-89ea-f6db-3181e7c2e7ca@amsat.org>
Date: Mon, 21 Jun 2021 14:17:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c1f1313c-6d32-c560-30e6-0acd8a6f2090@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 12:13 PM, Laurent Vivier wrote:
> Le 21/06/2021 à 12:08, Philippe Mathieu-Daudé a écrit :
>> Hi Laurent,
>>
>> On 6/7/21 1:29 PM, Laurent Vivier wrote:
>>> Le 07/06/2021 à 10:28, Philippe Mathieu-Daudé a écrit :
>>>> On 6/7/21 9:33 AM, Laurent Vivier wrote:
>>>>> Le 02/06/2021 à 12:49, Philippe Mathieu-Daudé a écrit :
>>>>>> Cc'ing qemu-trivial@
>>>
>>> So it looks good.
>>
>> Is there something else you expect me to do with this patch?
>> Maybe you expect another R-b to take it, so I should keep
>> pinging for review?
>>
> 
> No, I'm working on a linux-user pull request, once done I'll do a new trivial branch pull request.

No hurry, I just wanted to know if there was something missing on my side :)

> 
> Thanks,
> Laurent
> 

