Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D141E351C03
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:24:16 +0200 (CEST)
Received: from localhost ([::1]:47606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1zL-0000lz-RI
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lS1hW-0004ry-8b
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:05:55 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lS1hT-0007E9-13
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:05:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso3270979wmi.3
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 11:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xvWtabnOQcPId3sA+NwCbWJCmFb8w7anWDmod0vHqxM=;
 b=q1toBM/zMYhAQB8LiHOLpwB6FSnNPCxLxXaKmHcEXOs6j41PVpQRXegof1WYrsO9uL
 JzbMwfv+QNjBgxQ/KxPAdB6a3YfH0MisxawWMmMlwCKpPbkbNa7PCuj3gErZv9UzjN0z
 5TeYfxb3+nYBd4+Y5tnRmVSZtxVpsYsl6cUpv4QQljuSclUOAYfwB1s5CYfOr08dV+X0
 zbbvMtyH5PrONwZKDYLgEAi7JYh4zPmhhWIDc7R93vdz1HrrzPrmcsqMfEd+GNf9hcj+
 q6ljMLzDQVra2WcZMYmuZNLcIC5DA+LC5c9u80RCES2h7cujXs16RYJuNmDTU5mvL6c7
 e75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xvWtabnOQcPId3sA+NwCbWJCmFb8w7anWDmod0vHqxM=;
 b=e2AMKdg6UBjSn3GdvVdIaSEU/HV/SkyoDGF27kYJtvY0cz6I3mRsZTKI08dRqPVTYo
 tttk/Y2r/ehD917+PB/1zIOXaiKk57v6bgOLIRk+j329r7yBB7fqVQLZAdjD811wQGKG
 H2G5IZMJM09TMeQ6oV1yEHqMVALxL/5tFIO9WAK7FjY5VKHBe5CR3yWpqXR/4yvBKDtD
 jiXjeShthtttyKwvpHzvqcQ1lBdnsXCzW2VHJcfIjnW7lI60XSh2ORTkpkalkYGhKy8V
 c7WVNVbJG6RtLvTcYbIbataNlpof+k/0xoefLI00BoUm2OG1aO3BdJXVjkCBqNHB7HVn
 OB2Q==
X-Gm-Message-State: AOAM532jM6KXwIZoW52Jl8WmJcYyJGt6DU60TGevsUFxZcuj436l/xlm
 C7IX1whEZ0SXktJy1aY7NM8=
X-Google-Smtp-Source: ABdhPJzHMy6LwOzDzH/NnSDuYi7HbN+cFl1qm/Ykg2hnLT9v2zbFwmNPK+5+Z9e5/CBXArKDrnvYIg==
X-Received: by 2002:a1c:b4c6:: with SMTP id d189mr9061175wmf.72.1617300343911; 
 Thu, 01 Apr 2021 11:05:43 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m3sm10947022wme.40.2021.04.01.11.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 11:05:43 -0700 (PDT)
Subject: Re: [PATCH v3 05/11] esp: introduce esp_fifo_pop_buf() and use it
 instead of fifo8_pop_buf()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-6-mark.cave-ayland@ilande.co.uk>
 <0c3900c2-fa72-47ea-d48c-625dd1b40734@amsat.org>
 <854e3d13-4610-8780-e27c-a7cb72b54dd1@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <27a538a1-be1a-2368-800f-247661f71d70@amsat.org>
Date: Thu, 1 Apr 2021 20:05:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <854e3d13-4610-8780-e27c-a7cb72b54dd1@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 12:51 PM, Mark Cave-Ayland wrote:
> On 01/04/2021 10:34, Philippe Mathieu-Daudé wrote:
>> On 4/1/21 9:49 AM, Mark Cave-Ayland wrote:
>>> The const pointer returned by fifo8_pop_buf() lies directly within
>>> the array used
>>> to model the FIFO. Building with address sanitisers enabled shows
>>> that if the
>>
>> Typo "sanitizers"
> 
> Ha. It's definitely "sanitiser" here in the UK (UK English) as opposed
> to "sanitizer" (US English).

Oh OK, TIL :)

> I don't really mind either way, but I can
> fix this if it needs a v4 following Paolo's comments.

Not needed since it is correct.

>>> caller expects a minimum number of bytes present then if the FIFO is
>>> nearly full,
>>> the caller may unexpectedly access past the end of the array.
>>
>> Why isn't it a problem with the other models? Because the pointed
>> buffer is consumed directly?
> 
> Yes that's correct, which is why Fifo8 currently doesn't support
> wraparound. I haven't analysed how other devices have used it but I
> would imagine there would be an ASan hit if it were being misused this way.
> 
>>> Introduce esp_fifo_pop_buf() which takes a destination buffer and
>>> performs a
>>> memcpy() in it to guarantee that the caller cannot overwrite the FIFO
>>> array and
>>> update all callers to use it. Similarly add underflow protection
>>> similar to
>>> esp_fifo_push() and esp_fifo_pop() so that instead of triggering an
>>> assert()
>>> the operation becomes a no-op.
>>
>> This is OK for your ESP model.
>>
>> Now thinking loudly about the Fifo8 API, shouldn't this be part of it?
>>
>> Something prototype like:
>>
>>    /**
>>     * fifo8_pop_buf:
>>     * @do_copy: If %true, also copy data to @bufptr.
>>     */
>>    size_t fifo8_pop_buf(Fifo8 *fifo,
>>                         void **bufptr,
>>                         size_t buflen,
>>                         bool do_copy);
> 
> That could work, and may even allow support for wraparound in future. I
> suspect things would become clearer after looking at the other Fifo8
> users to see if this is worth an API change/alternative API.

Thanks for the feedback!

Phil.

