Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43D84746A1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:40:03 +0100 (CET)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9uM-0004dG-IJ
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:40:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx9tJ-0003wy-25
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:38:57 -0500
Received: from [2a00:1450:4864:20::333] (port=37423
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx9tH-0006J0-Gj
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:38:56 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso16550432wms.2
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 07:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=61RVRICaZjXa3HmowZQ6HbmxThCdcccueLpMQIJxWtE=;
 b=lGS5q+dmIBcmhLPZjSt45P2tqQi6Ef4V+69MRSvmhJEv2zWL1rRFIZcNJSNOJaXmlL
 SHWgNrvtTqxolrDCmqeAmsONpmXS2tuPyhRD6ufeh2voTIOjigFlK1xVOTjoiw5m1zBh
 AtCVEyntlI8HvnESdCPOQWWpMawe5uxl/bl5F36/CcwrtOH3vVE9KARSpERxiOheIwBH
 b1OlE37w3/kTUAQijIIJrcjh4lZEmUidbEDMuvH0yXtTG8o184sTbMMpVYn21pgjZMXq
 q0O4g5cCjg6X2jFPaAud7cUUv1zE4s+6c72nHMfSw99dWSe0w7BXtdoIu1/n/uulOnWi
 +Ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=61RVRICaZjXa3HmowZQ6HbmxThCdcccueLpMQIJxWtE=;
 b=iyitkqVuOdI6oLIfnz7R6iDmkvwVtFg1eY1Oh8YlPP8fgVTErnbMd8A5Fq4v0wi6PB
 RFZVsy4C/Y+xFT+DW5cYZgXMuPdb1ZptQ6IKXkrOMqUa93Y0sQHoPZcv0Tz89YrrEgp+
 JZMYtvr6BsESewwvqmb9hBpGeYNMVa7uDzOzTrGWwgO7Rhnzgbuo/Gh/DUR3ypdfnUAm
 UaHtjVp894OcLwj3jsCLVbD0o5GSmN4HSMtursd5H5bTyGcyubMQYwvTSH12NLg+a7ZF
 kDtXhNPNcmOkD7hxMKY9i18mHv1dl+Umgvuv0yIN8gZv3+uAdbk27QVAmD/c9cOpiqUa
 F/AQ==
X-Gm-Message-State: AOAM532dbgWfnBBDwpGRbp4w3vIy8VwFfJH165LhHI/2l9PiEgriZEkN
 K4DHUYTR6nmMTIOyaFtVTXs=
X-Google-Smtp-Source: ABdhPJxKkEo9kwQD5pg1bvXgT+M9oXfi2yCcb082X7NhhmaeuG55cllkTehACCHhKyr2hM7yl9Qgsg==
X-Received: by 2002:a05:600c:4e07:: with SMTP id
 b7mr7781269wmq.16.1639496332848; 
 Tue, 14 Dec 2021 07:38:52 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id h15sm2956440wmq.32.2021.12.14.07.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 07:38:52 -0800 (PST)
Message-ID: <8b1c7f8d-0c53-3e0c-4517-4854dbda04a0@amsat.org>
Date: Tue, 14 Dec 2021 16:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v9 28/31] common-user: Add safe syscall handling for
 loongarch64 hosts
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
References: <20211214080154.196350-1-git@xen0n.name>
 <20211214080154.196350-29-git@xen0n.name>
 <f6218922-c386-e1bf-e1d7-9766aa4d675a@amsat.org>
 <c2fc44e2-3551-35e9-6cd7-39290a7b71b7@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <c2fc44e2-3551-35e9-6cd7-39290a7b71b7@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 16:16, WANG Xuerui wrote:
> Hi Philippe,
> 
> On 12/14/21 21:29, Philippe Mathieu-Daudé wrote:
>> On 12/14/21 09:01, WANG Xuerui wrote:
>>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   .../host/loongarch64/safe-syscall.inc.S       | 81 +++++++++++++++++++
>>>   1 file changed, 81 insertions(+)
>>>   create mode 100644 common-user/host/loongarch64/safe-syscall.inc.S

>>> +safe_syscall_start:
>>> +        /* If signal_pending is non-zero, don't do the call */
>>> +        ld.w    $t1, $t0, 0
>>> +        bnez    $t1, 2f
>>> +        syscall 0
>>> +safe_syscall_end:
>>> +        /* code path for having successfully executed the syscall */
>>> +        li.w    $t2, -4096
>>> +        bgtu    $a0, $t2, 0f
>>> +        jr      $ra
>>> +
>>> +        /* code path setting errno */
>>> +0:      sub.d   $a0, $zero, $a0
>>> +        b       safe_syscall_set_errno_tail
>>> +
>>> +        /* code path when we didn't execute the syscall */
>>> +2:      li.w    $a0, QEMU_ERESTARTSYS
>>> +        b       safe_syscall_set_errno_tail
>>> +        .cfi_endproc
>>> +        .size   safe_syscall_base, .-safe_syscall_base
>>>
>> Why not rename 0 -> set_errno and 2 -> syscall_not_executed
>> for readability? (and eventually drop the comments).
> This is directly taken from the RISC-V version; aside from that, this is
> similar to all other architectures' adaptation, so maybe a future
> refactor should touch all these other files as well, if we do? I
> personally find the readability to be good, because when you look up 0
> or 2 below you can't miss the comments placed close to the labels.

I just noticed that in Richard's "linux-user: simplify safe signal
handling​" series and was going to update here, so we are good :)

>>
>> Otherwise:
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 

