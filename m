Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390F56562F2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 14:53:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9nuD-0004CI-0t; Mon, 26 Dec 2022 08:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p9nuA-0004BR-4b
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 08:52:38 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p9nu8-0004sz-Hb
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 08:52:37 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1441d7d40c6so12645357fac.8
 for <qemu-devel@nongnu.org>; Mon, 26 Dec 2022 05:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ILG8/KA0rUbkqz10+1hrBDXU7jbLvP8SSswKIjjvFZo=;
 b=Bb3OYid0CV3FzEEJ4eQasC4UtVoZOOPifaaywNQAULZRJeeJiRfCRPmKDstBjNCrBI
 MTsKMan5orS+O9iVZD+yi27tEpi8QE8Lxc1ntOnyXFTVa9log/UBJpnaRpvcBcti2wG5
 4kDqO1/gYqvWrj0R1u8tJFtGt4Guii0RhZg6av7NClOrDFhsEtxArpocaSnUbKkks5V8
 AUZwud1PrhnYWmWCETErrGXu+QqejXA/9NqkT4Xtg0r9zmPR3ybLCx2ALuAwSB986WUh
 tqxBXyGgUPQUjZh17jDfUWXfMDtDpOeEuUHAlNFqEQCt99hoUK5MvOVvtdvSf/psjnMX
 ngYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ILG8/KA0rUbkqz10+1hrBDXU7jbLvP8SSswKIjjvFZo=;
 b=4ZDBS7zrGyzLdadTqOU/BgWib67caEauW8Sx9MmEzRLYcdt87TIHG5+2q4Exuwv7V1
 vPlPynG7p78bLCasWtf0MEoIG607UM9umdu1+AbcAvTM1ck+QoUJZkAGfKLhoDzHakzF
 wk7fjeZ6lyBxkBbGWwQeD5/d8HOcaq8nYal8NYKQVt/fZw+6YYJTDga89qafsp2YE0Tv
 gCMyCenSlxKSZSL8PEb6Q2I9sQLZEMpcZzh5QkpPZQtKDjI+hJGBQy6b//SddBp+ft9k
 67Vr0S320nOOz6T3+DTZXzBnfCBUMjtR14Hk3E4bZ75zQ6uRyxD/XmmPk8KcNjjVOhIA
 3bbQ==
X-Gm-Message-State: AFqh2korBwFW64BFgnfbYeQ/Xn9dTfZMzwSmVRZkA2NLyjPjWx0CDpKu
 migTWM9688ACBAozlafxR/eIVw==
X-Google-Smtp-Source: AMrXdXuOIM0uMD6odT/zbElKoZVBROAa9iJJpwrwE0/CtlOrBR7GiatAkAg0qVdWnCjuUwaQf3O0Ag==
X-Received: by 2002:a05:6870:2f01:b0:144:e6fb:b2b4 with SMTP id
 qj1-20020a0568702f0100b00144e6fbb2b4mr8310786oab.20.1672062753429; 
 Mon, 26 Dec 2022 05:52:33 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a056870d39000b00132741e966asm4910867oag.51.2022.12.26.05.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Dec 2022 05:52:32 -0800 (PST)
Message-ID: <1f93616e-3d12-3f86-2267-e13c2416754e@ventanamicro.com>
Date: Mon, 26 Dec 2022 10:52:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 06/15] hw/riscv/spike.c: load initrd right after
 riscv_load_kernel()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-7-dbarboza@ventanamicro.com>
 <CAEUhbmWxGAb_AtjW74nW7sYjT7-j8NwqQxQpmShuaurSMOerzQ@mail.gmail.com>
 <CAEUhbmU6OV+37fBvFZ04-7f7xhDtfgeATH-rJ9COJnmiywE50A@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAEUhbmU6OV+37fBvFZ04-7f7xhDtfgeATH-rJ9COJnmiywE50A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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



On 12/26/22 10:49, Bin Meng wrote:
> On Fri, Dec 23, 2022 at 6:04 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> On Thu, Dec 22, 2022 at 2:28 AM Daniel Henrique Barboza
>> <dbarboza@ventanamicro.com> wrote:
>>> This will make the code more in line with what the other boards are
>>> doing. We'll also avoid an extra check to machine->kernel_filename since
>>> we already checked that before executing riscv_load_kernel().
>>>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   hw/riscv/spike.c | 31 +++++++++++++++----------------
>>>   1 file changed, 15 insertions(+), 16 deletions(-)
>>>
>> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> This change unfortunately breaks the ELF boot on Spike.
>
> I will propose a patch to fix such unexpected dependency.

Interesting.  This is one of the most benign changes I did, or so I thought.

I believe we should wait for you patch fixing it first.


Daniel


>
> Regards,
> Bin


