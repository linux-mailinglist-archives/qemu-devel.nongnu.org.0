Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F93B4DDA
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 11:44:33 +0200 (CEST)
Received: from localhost ([::1]:50454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx4rY-00063H-SQ
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 05:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lx4qg-0005E7-1A; Sat, 26 Jun 2021 05:43:38 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lx4qe-0005Fv-7Y; Sat, 26 Jun 2021 05:43:37 -0400
Received: by mail-wr1-x430.google.com with SMTP id g7so8907064wri.7;
 Sat, 26 Jun 2021 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u7kb5XDwrxoPxFyTYq7wPEIoZS2V9QCNIauGeBLJGTw=;
 b=PB0fry57KBgJWC52BvSo+Hh4fuPj8rbSeH00oPhjSbdJKusbZTkqwxGADazFz4cSyx
 FoQMTxs+4rYJi9dDF902b0BDZPdmoJiXpdYGDoPR9Gw8qhyeGxmX6WR4m+7bJ2XOKYhj
 UvgDPw+IWVJfp0npmBnzsV+ohFCe6gQFLzj6Gj0Wur+5ZYohlD2mEH6WPsj6qmTkFg8+
 x7ymeTIjMAlQxL0zCAaMBazREExFOx10vKxaq4wgeXEyhXMRryc64rFxhQUNFJVbUtEw
 nmz9vrmIikmPcuCRg5XSCgujSrda22ZS+Eq5dK/hEMklyb8RdOB6Fmmtbqlr4VuCv8Rj
 15OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u7kb5XDwrxoPxFyTYq7wPEIoZS2V9QCNIauGeBLJGTw=;
 b=daYArIgHKQe7CHMd0Wl/VVDpP9vOtViCbiwCxW9+O0wgkpQ6zZVR3tYdTl6FH/zGKL
 Gadt+kr9XFpZPYaJGEMcbFo1i2z68w4zJJMd66Wrhrd+800iupv9/xhcgZ1NvEFqkmDs
 15D1b9r+CUu1gqfHWLW9GUemG7bnkSWVI/MYy+zTodkD3K+czx5v+/1Ov1JX0XRiygqw
 xGcQdk95fFFC7av4u5ZxtR0yqoG9I5R54qriTSAcR1CLzbk+KmUrsIP3tA7/siFjUGYR
 tDIuG7S45K/TggILiHsA2qU9qKT8ZGe6pyzKEeHMXCPQV8VQBk/vmoEOV6KZRX3NwHpF
 QbzQ==
X-Gm-Message-State: AOAM533lBpra9vdrfL5gRSB1yYi0dUvnwUtjUGSa/GiI355LjW4hePQ5
 SQtfQInMWrwlx8/p9QY34DI=
X-Google-Smtp-Source: ABdhPJw9ozwAdFjKUr9zPy1d61a6lfkGjK/DVP7PhZYt0jttt9FLvsIo4kGF5rJwc6u/DbgIFo9XMg==
X-Received: by 2002:adf:9d8d:: with SMTP id p13mr227659wre.300.1624700614445; 
 Sat, 26 Jun 2021 02:43:34 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o17sm12247028wmh.19.2021.06.26.02.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 02:43:33 -0700 (PDT)
Subject: Re: [RFC PATCH 06/10] hw/sd: Add sd_cmd_unimplemented() handler
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-7-f4bug@amsat.org>
 <CAEUhbmW+k+voLnqx8-3Y53-y=OYNPbVeQ8h-6kZ+Y=gfcdjyfA@mail.gmail.com>
 <e0d9a0c0-b8b9-9aae-a556-e7bf25494ef6@amsat.org>
 <CAEUhbmVVwf8SPLQvu83KYQEy6herCGun6ASd=WaPPaRzO_U4ng@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <389ea232-d928-ace3-2c10-93cd719d8bc9@amsat.org>
Date: Sat, 26 Jun 2021 11:43:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVVwf8SPLQvu83KYQEy6herCGun6ASd=WaPPaRzO_U4ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/26/21 5:31 AM, Bin Meng wrote:
> On Sat, Jun 26, 2021 at 1:17 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 6/25/21 3:49 PM, Bin Meng wrote:
>>> On Thu, Jun 24, 2021 at 10:28 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>  hw/sd/sd.c | 21 ++++++++++++---------
>>>>  1 file changed, 12 insertions(+), 9 deletions(-)
>>
>>>>      qemu_log_mask(LOG_GUEST_ERROR, "SD: ACMD%i in a wrong state\n", req.cmd);
>>>> @@ -2096,6 +2096,9 @@ static const SDProto sd_proto_spi = {
>>>>          [26]        = sd_cmd_illegal,
>>>>          [52 ... 54] = sd_cmd_illegal,
>>>>      },
>>>> +    .cmd = {
>>>> +        [6]         = sd_cmd_unimplemented,
>>>> +    },
>>>>  };
>>>
>>> Does this compile?
>>
>> Yes.
>>
>>> Or is this another GCC extension to C?
>>
>> I haven't checked when this was introduced, but QEMU uses it since
>> quite some time now.
>>
>> Apparently this is:
>> https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html
> 
> Yep, I know designated initialization of a C array, but I don't know
> gcc does not complain two .cmd here

IIUC GCC would warn if we were using -Woverride-init (but we are not):

   -Woverride-init (C and Objective-C only)

       Warn if an initialized field without side effects
       is overridden when using designated initializers.

>>  "In ISO C99 you can give the elements in any order, specifying
>>   the array indices or structure field names they apply to, and
>>   GNU C allows this as an extension in C90 mode as well."
>>
>>> But I think you wanted to say .acmd = ?
>>
>> Oops!
>>
>> Thanks for the review,
> 
> Regards,
> Bin
> 

