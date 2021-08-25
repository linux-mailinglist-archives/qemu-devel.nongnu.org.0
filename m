Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088AE3F76BF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 16:01:07 +0200 (CEST)
Received: from localhost ([::1]:37600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItSj-0003tj-QL
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 10:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mItRd-0002sy-PH
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:59:57 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:47101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mItRc-0006mT-AF
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:59:57 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso4639969wmi.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vg2k2FngYZDCnhVC4ww7pmApwL99T8Y5bOlD5NizfBs=;
 b=cceeD24KMkS9RTzAMR1GfdH8IcIaz3WTYjyordO+0Lvx0Oqe7Vglpbjx2Q6iB6U0Am
 PYCpo1T8OtTQfuLwzfUH1UTmhdHou09tBHTmvfyzIBb4ZbZvTXlp8Ftd+ZwGtuXEazeT
 zQVw6UG3HCXz2o5zunofEk8WkUY9NcbVMKUT/lglECKP5zME+NGFoK5YvEkwAqZlkM/f
 QrK3h946qd2GhqY6kmS3dMJbVwRJOJTb9cMQeUb5CbhqgPtCZ2JDAdVrKRJjs4GUJszM
 IeJNP4HeDNWCafcGJ/yJ0YHKxQdFk3h9diN25WvLWJvx05kZjJiA38gs2lkxSEYu09io
 grrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vg2k2FngYZDCnhVC4ww7pmApwL99T8Y5bOlD5NizfBs=;
 b=oG2/q+7jsKDCV8aW6FE83250Rk5+g/yOpSh3Hi4sWf02GFP3rGWTNKiJFqc7U2mFak
 N6ygNhI7UFCfMxu/pV4+2A951TOJ6eDl0CaVYcEjMNBJe2E3LrzHU5du3sMUKiIKcJ+v
 ViUZq7aRVKSFZxCmGAJNOWMTRZINmh+LtFJJVz+rZ3YEvmp+UlrJbl/5ZXBR4/pim6hM
 6frjE+zYdpGzr3yUOiciF6yQ8MiSv684b/R+y3vrT6TENd0xk+oRYh5lXXxoiN0g77el
 aqU1nm8JeJ+0SQN+Z6942VnW2ZAWoob9QEhDFFkswXaLMfOY7YCq1YmRUZxh62qOQ2go
 q/ew==
X-Gm-Message-State: AOAM531m5lPkRnKqZGFubrRMhyUwFrobCkNEukFOy1GdoV9nV4F1JKu0
 0NT4E3XGhb3qsuzldksLzxQ=
X-Google-Smtp-Source: ABdhPJy4/a0v3p5uVAmAkwnJBpl14gySX8jRpfpg7Lt28QHNgGTmnTa1aFPVuqA0zgsibJkn6E81NA==
X-Received: by 2002:a7b:cbcd:: with SMTP id n13mr3223127wmi.49.1629899994592; 
 Wed, 25 Aug 2021 06:59:54 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 19sm5537471wmo.39.2021.08.25.06.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 06:59:54 -0700 (PDT)
Subject: Re: [PATCH] sun4m: fix setting CPU id when more than one CPU is
 present
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>
References: <20210825095100.20180-1-mark.cave-ayland@ilande.co.uk>
 <74177bc7-384b-60cd-daa7-084d9a3f7c67@amsat.org>
 <6f07e32a-2cec-fac1-10a6-41057698f001@ilande.co.uk>
 <CAAdtpL6Ne3YkG7H-Ha_ROmCw9o9qs24jKn+7aBMNgMQXGC2=MQ@mail.gmail.com>
 <8c6eb54c-d786-f5f7-0fc4-bb9a6d37bb19@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <43f901c7-4a29-6186-92eb-35e3bc486d2b@amsat.org>
Date: Wed, 25 Aug 2021 15:59:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8c6eb54c-d786-f5f7-0fc4-bb9a6d37bb19@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.24,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/21 2:27 PM, Mark Cave-Ayland wrote:
> On 25/08/2021 11:43, Philippe Mathieu-Daudé wrote:
> 
>> +Leon3 maintainers
> 
> Note that despite its presence in CPUSPARCState MXCC isn't part of the
> SPARC CPU but defined as part of the sun4m architecture, so I'm not sure
> it even exists in LEON3 (which is likely another reason it was written
> the way it was).
> 
> Whilst there could potentially be some tidy-up in this area from people
> more knowledgeable about SPARC CPUs, the original patch seems the best
> approach to me since in the absence of experts in multi-CPU SPARC
> systems it simply restores the previous behaviour broken by the
> referenced Fixes: patch.

With that in mind:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
>> On Wed, Aug 25, 2021 at 12:39 PM Mark Cave-Ayland
>> <mark.cave-ayland@ilande.co.uk> wrote:
>>> On 25/08/2021 11:29, Philippe Mathieu-Daudé wrote:
>>>> On 8/25/21 11:51 AM, Mark Cave-Ayland wrote:

>>> Also MXCC is specific to 32-bit SPARC: maybe it was written this way
>>> to allow for
>>> future multi-CPU support for 64-bit SPARC?
>>
>> Will this happen?
> 
> Hopefully one day, as my TODO list gradually gets whittled down...

What is your secret?

