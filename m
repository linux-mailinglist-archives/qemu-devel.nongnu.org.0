Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B51644928
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 17:26:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2ak3-00058k-MK; Tue, 06 Dec 2022 11:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2ajo-00057t-Jh
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:24:13 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2ajm-0004aV-4O
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:24:08 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 p10-20020a9d76ca000000b0066d6c6bce58so9572612otl.7
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 08:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z+/cs+2CvQoo8G5uEaFH4NpwZ6yUNgQ7lp3hod4kfro=;
 b=cc6PChzYq9019AF4geVzYkI5cVnTJGXJ1ATKOsp1LbrTyTmJbxyL8HOyWNhVwZNX+v
 Z9/ybZE/ajLwW27Adus71B2gdt7NFWYUJ8w38+zw27igtcHCfAoDKiU32+wZ4uFtySQ7
 hZt4OHv08xhKc9OfAJHWBOIUtfgcaTlRMEpCaL5+jq7JHLpmKFbN3Nm5KdGPYaiZr5tV
 /IajKzbAqA6FlUi/ev083U86qtidN/LmHKlbDCLk+F402M3X0AlnoX5xt+bcjtGr6NQS
 2W6gCJ4N+XTzv/LaUL3BTy4/vxgdg6AVObXUjSJiUOp9kJxYY4EX5jvuMNMm5ASI4nab
 9FRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+/cs+2CvQoo8G5uEaFH4NpwZ6yUNgQ7lp3hod4kfro=;
 b=BNujdYTkOErrqfQvn4agYtDxcwUaNgzP7Yk9+WZlrl9UzKwZAK0Syw1wteIjcemSTU
 yMDBKz40epcjYmXziPnhdV04PDO3OTzP+QTBDvWZVhK6nwTcmJPgaoPKbd+tLrnc5oOq
 mK4rWKguQ+twacMSCdfRBJEsyi/XQZed/XRwz9zqF9yYKRwugn6nYHGSyjXgVZUoFkHc
 myK2q/x60pkVgPxgXKZ9xbyNGes+/n4wG8r0LLl0ZwdfyN2ZlJ/pSNJ6lRxtL1uuYGNr
 HoG0DrJ50s6bkDBpEpRD7ctNSXONOqjQCsv0OXr4iW2CpLbpmnBLDw4AYPcejNogMZ61
 j6Fg==
X-Gm-Message-State: ANoB5pn7qj375KsRAye8jvzzKw3Szk7WGdcw5v97+knVUmadfbHuOAYG
 4+Bkonl0V8IwwSW7MNLooKWukw==
X-Google-Smtp-Source: AA0mqf50iPyYk8UWLCFUGKMW4isZm4KVtPDcwzVeUd/kn5FuwjsZSwkrVaPwZdf+xUgvgith7DOulA==
X-Received: by 2002:a9d:7ac5:0:b0:637:2a31:f188 with SMTP id
 m5-20020a9d7ac5000000b006372a31f188mr34492618otn.61.1670343843642; 
 Tue, 06 Dec 2022 08:24:03 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:e319:9475:a359:f17a?
 ([2806:102e:18:70b5:e319:9475:a359:f17a])
 by smtp.gmail.com with ESMTPSA id
 109-20020a9d0376000000b0066eb4e9242esm3724809otv.67.2022.12.06.08.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 08:24:03 -0800 (PST)
Message-ID: <14e3dd65-f0f3-8d5d-4c0f-4dc8b1495aeb@linaro.org>
Date: Tue, 6 Dec 2022 10:23:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Thoughts on removing the TARGET_I386 part of
 hw/display/vga/vbe_portio_list[]
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Fabrice Bellard <fabrice@bellard.org>,
 Michael Tokarev <mjt@tls.msk.ru>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 QEMU Developers <qemu-devel@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <fb95bd97-8d5f-b0eb-008b-47a96808a74f@linaro.org>
 <Y4818KfGO7Y9Tsn/@work-vm> <3201e3f9-8b98-613d-5516-e0c6d89a9b9a@linaro.org>
 <CAFEAcA-WeEaMnL3CB1tGGM8jdscGBG+i_si0k86358kHaqdrsA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-WeEaMnL3CB1tGGM8jdscGBG+i_si0k86358kHaqdrsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/6/22 10:02, Peter Maydell wrote:
> On Tue, 6 Dec 2022 at 15:56, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 6/12/22 13:30, Dr. David Alan Gilbert wrote:
>>> I don't know that bit of qemu well enough to know whether the cpu part
>>> of qemu should be splitting the unaligned accesses or not.
>> All I/O accesses are gated thru access_with_adjusted_size() in
>> softmmu/memory.c.
>>
>> There is an old access_with_adjusted_size_unaligned() version [1] from
>> Andrew and a more recent series [2] from Richard. Maybe the latter fixes
>> some long-standing bug [3] we have here?
> 
> There definitely are some unaddressed bugs there -- maybe this
> is the time to work through what semantics we want that
> softmmu code to provide and fix the bugs...

Yes, indeed.  Let's not forget Mark C-A's m68k bug[1] which so far has no resolution.


r~

[1] https://gitlab.com/qemu-project/qemu/-/issues/360

