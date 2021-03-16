Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F6033D37F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:04:57 +0100 (CET)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8RT-0002Em-G2
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lM8QM-0001nM-7k
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:03:46 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lM8QK-0003I4-J7
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:03:45 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b9so7299952wrt.8
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1vJqP+RK9gQ8U/uUBqM5cSkJ1u4jTCMSvkvfI3cmRFg=;
 b=vLJRSLGDJy6oN/0PeiSWNVg5LV+W6Aucz+Y6sqYv2/42++kqLllcHp/9UpzVSONIt9
 49bZC8D13RYN4VdbvlzZaclcJMai8mQ9TDY7YYGFZo3N9vyEMhCSsLKJpOQnB3rVwCOo
 3x4qMjZSBZPeIravILqxHE6pEZcqZrk9gVE3HTCXb/p8Pe9E7XhyCfoZ4znb2okC/Kqu
 XdfzQqXxNEaSPtu+EaoharQLjlvG6V5+CqobrQOyikifaarcJxQY5Awcwk5sHy17ntXV
 tIGoKoXRwtrb/mtqk7KtwOSBHEsNiTD33cVx+jqTdEg6p5jY9cYuh6n3nTXtNR0IN0nA
 J+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1vJqP+RK9gQ8U/uUBqM5cSkJ1u4jTCMSvkvfI3cmRFg=;
 b=Ch+UfzvA8EtlB9anyrs4c3X8DGZKXIp9MW/Vhd82gE4wcd8Anv4q0PGingeQDLtqEa
 OJIcK4KZiD20m256Kc/uekIpPc08yqTRUkvLTRLIGvZ5zqxu9uM6W7mVGxqzWGTEGnUT
 5b07YhugnEODT5kn+Rma3xClPT6GoaxO6b0FCphGTcZlBJMdsE7t4G9I2Pqk5i/c4CbN
 scKPXmMrqz2OXhtgTq0UJKtSNaKTltT5SwsK9GGSXfHXW4iZ0jObQAt4PtHANEu9hFuD
 avDU8kjdWFHfjPgugFSX+bg/1uKbptpDmHNnDmE21wKAIdhC6Bp7aXqlUtObGFjjFrS1
 2bqA==
X-Gm-Message-State: AOAM5338FAynNWZwO3YV3bXxAWyNO1EsKml97pe0+Hb9BqYayVhZoq8k
 IJhoOeiy0yx5tC8I/pfS7DM=
X-Google-Smtp-Source: ABdhPJwJqdgaoutkuI1l6IjA1iyyluOabSbpn7lw8ehTOqBdTWRLlkAqsRH+MGXlMLCpdyL0ct3UJg==
X-Received: by 2002:a05:6000:1545:: with SMTP id
 5mr4503238wry.90.1615896222770; 
 Tue, 16 Mar 2021 05:03:42 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v14sm1629690wrd.48.2021.03.16.05.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 05:03:41 -0700 (PDT)
Subject: Re: [PATCH] target/mips/mxu: Rewrite D16MIN / D16MAX opcodes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210315223745.2953548-1-f4bug@amsat.org>
 <CAFEAcA-+m-eADtYini-2Mscom-RiuvzG4cXndMcuSKR80O8dow@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <63e49cce-203a-6674-9b37-4b331f6ef477@amsat.org>
Date: Tue, 16 Mar 2021 13:03:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-+m-eADtYini-2Mscom-RiuvzG4cXndMcuSKR80O8dow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Craig Janeczek <jancraig@amazon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 11:51 AM, Peter Maydell wrote:
> On Mon, 15 Mar 2021 at 22:39, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Coverity reported (CID 1450831) an array overrun in
>> gen_mxu_D16MAX_D16MIN():
>>
>>   1103     } else if (unlikely((XRb == 0) || (XRa == 0))) {
>>   ....
>>   1112         if (opc == OPC_MXU_D16MAX) {
>>   1113             tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
>>   1114         } else {
>>   1115             tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
>>   1116         }
>>
>>>>> Overrunning array "mxu_gpr" of 15 8-byte elements at element
>>     index 4294967295 (byte offset 34359738367) using index "XRa - 1U"
>>     (which evaluates to 4294967295).
>>
>> Because we check if 'XRa == 0' then access 'XRa - 1' in array.
>>
>> I figured it could be easier to rewrite this function to something
>> simpler rather than trying to understand it.
> 
> This seems to drop half of the optimised cases the old
> code had. Wouldn't it be simpler just to fix the bugs
> in the conditions?
> 
> That is:
> 
>>      if (unlikely(pad != 0)) {
>>          /* opcode padding incorrect -> do nothing */
>> -    } else if (unlikely(XRc == 0)) {
>> -        /* destination is zero register -> do nothing */
> 
> This should be "XRa == 0"
> 
>> -    } else if (unlikely((XRb == 0) && (XRa == 0))) {
>> -        /* both operands zero registers -> just set destination to zero */
> 
> This should be "XRb == 0 && XRc == 0"
> 
>> -        tcg_gen_movi_i32(mxu_gpr[XRc - 1], 0);
> 
> This should set mxu_gpr[XRa - 1]
> 
>> -    } else if (unlikely((XRb == 0) || (XRa == 0))) {
> 
> This should be "XRb == 0 || XRc == 0"
> 
> And everything else in the function looks OK to me.

If you have the changes clear, do you mind sending a patch?

Thanks,

Phil.

