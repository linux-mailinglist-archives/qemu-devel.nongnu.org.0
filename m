Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D5A3C1757
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:47:31 +0200 (CEST)
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XBS-0006au-2r
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1WaN-00064K-2v
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:09:11 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1WaL-0007Fm-AC
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:09:10 -0400
Received: by mail-wr1-x430.google.com with SMTP id i8so8151090wrp.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LboK88pkXdLqQPNKMJBeuz6yTqYEUPo1YVjgoPN/Yv0=;
 b=bZk+Yz6F8cLgnpWToqZCSQKpLkllfrlJEKnzpORu2Brpz8qk19FNESkjSWwyUJudoP
 pqmWAMR6iC9ktf/goN+7BL0Ek/q64M8AAUdG7GJgEPf2ExHzdzD25gwmhPmG8M8CImHo
 qbd6qpZq/1PfUz8z3OHHvaRg3yZbshbucNkkr3R1tAIiPY+hOd0FuSzJRTM/DFhKzVf5
 DLHJ8KInTX4foqZ/ytgdDyGVNgRdO+NmYMImJ+6ICFccpeiU3RhLa5clrEaDtevRex5L
 WFj4m16pW4NF+Hqg4qiVAQxxpjuUn9SSkA9GabhxYPvTHd4mAS7Hya+vnKG0jkKc7m3m
 927A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LboK88pkXdLqQPNKMJBeuz6yTqYEUPo1YVjgoPN/Yv0=;
 b=osY7JgwHAFcv0SjQpoTFn8iucUTq7fmd0H0RlAyF700XlN0tk1TqpT+PzM7GuTnjl4
 vCMv6ocAnKU4gzPOiE0RHn5ecCW1mmdMRCGn6zlWk5g0p5Kc0sTQEuR6DABF1u7We8Up
 sGo95Gv7Nct2SXyvtQMMWl+/NX64Or7PtAXjMKUNrzr6Y9Zhjr7YacFbf3xnYYVyBSZT
 P4Qglx2xrf4e9VG0huZBtZTIKTH+EqX2y1qwFnzdpn54QrkAvi0aiP0RzNgw/ZjX93zz
 HcP89J+PdS7vnpf3QFQWqfAvNpTS6qQWMB7hloVzPeWvnDoGLFETZfJPzLk+dox1p7ix
 wC6g==
X-Gm-Message-State: AOAM531LV27NJ4jc//NqLdE+7HtP6QKpq4uPmk9CIdzrYVX0RDksI1HG
 KnxVpFUZu1ocG2OjmnQfsjU=
X-Google-Smtp-Source: ABdhPJxsYzBKg9eYYjSbqoqLZkEl2/Vy8pytZm3sXUjBtvRzztexC7k/g2RwC5x1X/DveLP23urhlg==
X-Received: by 2002:a5d:4f01:: with SMTP id c1mr36625890wru.266.1625760547944; 
 Thu, 08 Jul 2021 09:09:07 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y3sm1523858wrh.16.2021.07.08.09.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 09:09:07 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] linux-user: Simplify host <-> target errno
 conversion using macros
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-9-f4bug@amsat.org>
 <d3d8214a-69f2-af60-324c-db4196ff7dae@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e36034bf-3eed-d21b-e17c-e78d9e0093f9@amsat.org>
Date: Thu, 8 Jul 2021 18:09:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d3d8214a-69f2-af60-324c-db4196ff7dae@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 5:30 PM, Laurent Vivier wrote:
> Le 08/07/2021 à 16:11, Philippe Mathieu-Daudé a écrit :
>> Convert the host_to_target_errno_table[] array to a switch case
>> to allow compiler optimizations. Extract the errnos list as to
>> a new includible unit, using a generic macro. Remove the code
>> related to target_to_host_errno_table[] initialization.
>>
> 
> Is there some performance penalties by using a switch() rather than an array[] ?

Per Richard suggestion
https://www.mail-archive.com/qemu-devel@nongnu.org/msg821488.html
rather the opposite, it might be now easier for the compiler to
optimize. And we free unused entries in the array (.rodata).

>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  linux-user/syscall.c    | 169 +++++-----------------------------------
>>  linux-user/errnos.c.inc | 140 +++++++++++++++++++++++++++++++++
>>  2 files changed, 161 insertions(+), 148 deletions(-)
>>  create mode 100644 linux-user/errnos.c.inc
>>
> ...
>> diff --git a/linux-user/errnos.c.inc b/linux-user/errnos.c.inc
>> new file mode 100644
>> index 00000000000..807c97ca25e
>> --- /dev/null
>> +++ b/linux-user/errnos.c.inc
>> @@ -0,0 +1,140 @@
> ...
>> +#ifdef ERKFILL
> 
> You fix it in patch 1 but forgot to report it in your patch :)

Grrr :(

