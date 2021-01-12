Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B732F39C5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 20:14:45 +0100 (CET)
Received: from localhost ([::1]:42762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzP7s-0001Ef-8V
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 14:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOeX-0001j7-69; Tue, 12 Jan 2021 13:44:25 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOeU-0001Ra-My; Tue, 12 Jan 2021 13:44:24 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c5so3588743wrp.6;
 Tue, 12 Jan 2021 10:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gafi+AcTSCB60SON0vhSVTavhCFJyfDgqwhbcMo1Q5o=;
 b=S0aMQrWx9eHTUGndIeFsPrp0Vvu8ZTsoFA8X0mtgNbfxcQLGlEwLSgL4dRNPOJLUga
 FmFMa7Q7aYyF/PpcGIcVM8A5Xjop4DD+Bi2F5e42j1N7kQv2ychbEBnVTAnftuDPTwN7
 Q/Qh7dFljJMuBq3sNgV092Dy3s+2vnwL7F0u75+diFf5o/nGZA705kzyzHKwITn510ef
 nISCEWJJK9KUlHD55r5TlDjIjLH8qCHxM7+imCT7Z8aZjMUn40eSZeLiA7RxxmEEumwr
 M/g1+daH5c27NcDXiZwBRNXPVe/a3A+cgVooml6tkM5eWQPvuNMi7/wN2pJSyNyVTAn0
 nhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gafi+AcTSCB60SON0vhSVTavhCFJyfDgqwhbcMo1Q5o=;
 b=mtz/cemP5r/ZC9R34UBYqDZzsvxjfYhgUkmaVZAg7NHBFa80pBVwfxMfjMsO5vgKfd
 Qndd62JyLuKP2SWrAJYcFht3KUjoodHLDhGB8/ELcQTbhw9UC5RyhDPz4GFx7RW0eYEG
 /8S1OVRJl40eV/fjBu9G9Or4AsywQEFJxQnzHY+xdWjoucQD9kWfobpI/cQKzASFOnzX
 aXI21UPAeHjsF9PRVu5i847hFyiUKnY6RwL6ewWpkt5HuW8rhO8t8esOjXJCgKMm14GY
 k0fPnaNpu3ILKsly1TynPAjjngd2kilK1wX7q/N85aeAXWvGwXiNPx9MwEanI+WGA7I0
 QGtg==
X-Gm-Message-State: AOAM530j+fJP7+zVoayY9L5S9SwmwpXloKi+tX6xzc0Kd0ImnyJ+huD0
 FgaI0erHgTqVhj7LYOq6QOI=
X-Google-Smtp-Source: ABdhPJwRrSd08XC8ezUjE0YCC4vvSAMOCK7YXGUjfVVLDBpS+i8GbEcUz7qc165fNAWWfbkp4z8FFg==
X-Received: by 2002:adf:a543:: with SMTP id j3mr200307wrb.175.1610477060572;
 Tue, 12 Jan 2021 10:44:20 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id j9sm5985648wrm.14.2021.01.12.10.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 10:44:19 -0800 (PST)
Subject: Re: [PATCH v4 6/6] hw/ssi: imx_spi: Correct tx and rx fifo endianness
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
 <20210110081429.10126-7-bmeng.cn@gmail.com>
 <CAFEAcA-RPxLHSVuGDk=Wn-+2kGG6+L_VQfkiaGNEfJ8X1-Mkzg@mail.gmail.com>
 <CAEUhbmX-M5XJQsZ3J_tE27+pjjG+fhcUOkVX0efSAyMorZfWFw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d5d8e197-8227-579a-36e1-c05504b9af7a@amsat.org>
Date: Tue, 12 Jan 2021 19:44:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmX-M5XJQsZ3J_tE27+pjjG+fhcUOkVX0efSAyMorZfWFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 1:48 PM, Bin Meng wrote:
> On Tue, Jan 12, 2021 at 6:46 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sun, 10 Jan 2021 at 08:15, Bin Meng <bmeng.cn@gmail.com> wrote:
>>>
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> The endianness of data exchange between tx and rx fifo is incorrect.
>>> Earlier bytes are supposed to show up on MSB and later bytes on LSB,
>>> ie: in big endian. The manual does not explicitly say this, but the
>>> U-Boot and Linux driver codes have a swap on the data transferred
>>> to tx fifo and from rx fifo.
[...]
>>
>> This version of the loop definitely looks a lot neater. However,
>> looking at the code I don't think there's anything that forces the
>> guest to set a burst length that's a multiple of 8, so you need
>> to handle that somehow. Otherwise on the last time through the
>> loop (tx_burst - 8) can be negative, which is undefined behaviour
>> when you try to shift by it.
> 
> Yes, that's why I added a patch to log the unimplemented behavior to
> notify the user.
> 
>> I think just rounding tx_burst up to a multiple of 8 before
>> the start of the loop would do the right thing ?
> 
> Probably. Given all flash transfers are normally multiple of 8-bits I
> am not sure what the real hardware behavior is when it is not multiple
> of 8, but I will try to add something in the next version.

FWIW not multiple of 8 use is not that uncommon, see:
https://guruce.com/blogpost/freescale-imx53-and-imx6-ecspi-silicon-bug

