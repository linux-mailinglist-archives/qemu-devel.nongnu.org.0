Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEA62CD309
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 10:57:53 +0100 (CET)
Received: from localhost ([::1]:36808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklN2-0004bB-Cb
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 04:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kklM6-0003lg-W1
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:56:55 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kklM5-0006ix-9S
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:56:54 -0500
Received: by mail-wr1-x441.google.com with SMTP id t4so1195242wrr.12
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 01:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HNA3AaNstMx/05+j3j1BN4YLiTFK9KwKH5/b5NiOwSM=;
 b=ZRbPpCN9SwYOeJESqocnzsm1eD6fkzgcPPciRQjqBp5iRMpdME7SeO6CmfsbHei0vd
 GD1mj475zeo8KK9p/4qZTkaYk0ICi30WgmLuVRAbevJ/2LdzAwgDlzJT7v/IkO4rErUx
 uDFuMbGQUCRYOjbWER61rPGG9/Fl3XL9zKq4vQ5kRNYqj4LkUL0BCkjaE4Ms042Aoarm
 mgrQxtVi6KMk3tdX/bZVMl45NTR5aqg/3AQd2HrYD0SwJLuZKI3qyhIe3IoH3cFERjVu
 fYn3qts+LNUToiXTt8HrqW7Bvuj+uNu5t9jfqJWISI75vYfaa50aFX0z7YZqjqzr752r
 4Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HNA3AaNstMx/05+j3j1BN4YLiTFK9KwKH5/b5NiOwSM=;
 b=hWGE1JFOmp5ufxx46vIFhW0058uLildvMB48XwtZ83j6le3Mc9F3U70jLx74ZvmKT6
 vwmeokXsX2qinPOljuMYb4OpHdGz8KoZ1rQhYNFRnb0Dmm0jjbunCzZ3t/SHLZgsEFFh
 hqvFUhmRsi6EbgtmnXmf6Q+bzW6LoLYmCP9qCrx/apMxrtlSEg6GhtTPbaoCi5H44SHU
 ngyGosEg022Zw/t0R83GifMoaqaE1qm+S428wyQojMe/2gp6qQ7VJEUYclUMFW8zeKuR
 ObgWcEh3NyI8huxGh2hSPbux5AyA9LN3BPPJXohDQJsYyUJFBcOSXaqSg9kDpeDH1uO+
 IQSw==
X-Gm-Message-State: AOAM530gY+jzZ2BGiVjrqxhPteto1xaxFregHGRcoZbrVjBLAbGjy02M
 okajfbLxQabbuxha6LmJP4g=
X-Google-Smtp-Source: ABdhPJx1Oq2tFG7mE+KRtMGrXgQcU7fFJNmWZj2JkeQTIYC0Vd8mjA7oEG2hpJZLL1Fka1To6AxW+Q==
X-Received: by 2002:a5d:5107:: with SMTP id s7mr2811994wrt.148.1606989410972; 
 Thu, 03 Dec 2020 01:56:50 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id b4sm1072424wrr.30.2020.12.03.01.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 01:56:50 -0800 (PST)
Subject: Re: [PATCH-for 5.2?] hw/core/ressetable: fix reset count decrement
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20201202164055.30864-1-damien.hedde@greensocs.com>
 <6a34f2be-3467-b81a-956b-4472860e4d0b@amsat.org>
 <24772fdf-eb83-b415-956f-52a0c056129c@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <19b44607-8675-58e8-5d3b-42a86d93dcd4@amsat.org>
Date: Thu, 3 Dec 2020 10:56:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <24772fdf-eb83-b415-956f-52a0c056129c@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: peter.maydell@linaro.org, michael.peter@hensoldt-cyber.systems
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/20 9:58 AM, Damien Hedde wrote:
> On 12/2/20 6:10 PM, Philippe Mathieu-Daudé wrote:
>> On 12/2/20 5:40 PM, Damien Hedde wrote:
>>> The reset count was only decremented if the device was in a single
>>> reset.
>>>
>>> Also move the decrement before calling the exit phase method to fix
>>> problem of reset state evaluation during that call. Update the doc
>>> accordingly.
>>>
>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>> Fixes: 1905297 ("Zynq7000 UART clock reset initialization", 2020-11-23)
>>
> 
>> $ git show 1905297
>> fatal: ambiguous argument '1905297': unknown revision or path not in the
>> working tree.
> 
> I put Michael's bug number there. Should I put the incriminated commit
> instead ?

In that case you want:
Buglink: https://bugs.launchpad.net/qemu/+bug/1905297

> 
>>
>> Beside, typo ressetable -> resettable in subject.
> 
> Thanks,
> Damien
> 
> Cc'ing michael new address too
> 
>>
>>> Reported-by: Michael Peter <michael.peter@hensoldt-cyber.com>
>>> --
>>>
>>> Hi all,
>>>
>>> While looking at the bug reported by Michael and his patch. I found another
>>> bug. Apparently I forgot to decrement the reset count if there was several
>>> reset at the same time.
>>>
>>> This patch fixes that.
>>>
>>> I also moved the place of the decrement: before calling the exit phase method.
>>> it globally fixes Michael's reported bug, as I think it will avoid some boiler
>>> plate code in every exit phase method we do.
>>>
>>> Only other place where the reset state is checked is in the
>>> hw/char/cadence-uart.c so it does not have high impact.
>>>
>>> I'm not sure if this meets the condition for 5.2 as it changes a documented
>>> feature. In that case we can just accept Michael solution and I'll fix the
>>> rest later.
>>>
>>> Here's the pointer for the bug and michael's patch.
>>> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05786.html
>>> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg06105.html
>>>
>>> Damien
> 

