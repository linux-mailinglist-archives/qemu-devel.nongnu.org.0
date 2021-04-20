Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CFD365565
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 11:30:32 +0200 (CEST)
Received: from localhost ([::1]:46110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYmiF-0006AB-RT
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 05:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYmfU-0004np-56; Tue, 20 Apr 2021 05:27:44 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYmfS-0004OP-N7; Tue, 20 Apr 2021 05:27:39 -0400
Received: by mail-wr1-x432.google.com with SMTP id j5so35887425wrn.4;
 Tue, 20 Apr 2021 02:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VxwcDm3t/hwTT2d5JXzT6X0NF/ww5PIXjlcSJSzU3KU=;
 b=ETWzlpo26xNysnybPIaq6N3DuEKUaxhIuSvjqZ5dGctut6zOhxl/i1w34kihzss5Ky
 LgeLdX80VuOITfOzTQxPWA+AG5FocSvb8yIwZ2iPwUp4oQyomExIxubudCjar89epbed
 S0VSgtUp2+Lebmam4nxxBkSNQ5zHeVNtPVadvY3D5PLriP8hIakDJSE9St7XlNrNDPpC
 PNY1FFrCo3B88a38QZqV35O2DfxJSAl6A0HaXOg7l0Dl55rfBfgsexEFd2hl45/Ki0uo
 pDfE6h535h9N5oTzbMYlpo6RkMwZ+FgzI0urH97vp73HLjfxCTO5d+UZH9NUtxNCuQ6W
 dNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VxwcDm3t/hwTT2d5JXzT6X0NF/ww5PIXjlcSJSzU3KU=;
 b=V5mLCDQFP9yVBn3aqPhG7Q2wcPbEBIY55/7TvYUdboJRplzn9KyC6EttlgDjrY60MF
 hzFExSpPAAG327MHGXMz1rmp3FxzcGyDc3wnxI1QrLxvv+LWQgGx4EJ73FfGu+WlDcaB
 8n/uJIzu398+ilZA/qKOD/Zy/gaVBqx11awqbBD0S1h2kBsroEbgiOKf3unkyyonw5LN
 srlrWN18ETGj3nJOqM+UwqYZ1jqjsxYTLXIDuaxz18qBt9mMTNeFeCVsHfY5n7olvy8X
 tmJCJP0mWPzrRqnYcB+Z29fdSXJkCpuxdLbzWW5jSplfvP5LnGjvlggIvkvjiAZAF1nl
 xL2Q==
X-Gm-Message-State: AOAM531kAmntP9r8koHUMCQgQllJwDCE4xCDXLnX+eZzYLMwbeATHSFc
 lWSiDYjFvrmkAMpXnDgZXrU=
X-Google-Smtp-Source: ABdhPJwjp8+krHotCxe5qfOfQFoOsAexkX9w7VW1Spn5/KTv4gudJ/bMJHrkwgC6E98nzSU49QWHDA==
X-Received: by 2002:a5d:534e:: with SMTP id t14mr19131063wrv.239.1618910856392; 
 Tue, 20 Apr 2021 02:27:36 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b15sm16180965wrt.57.2021.04.20.02.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 02:27:35 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 8/9] hw/clock: Declare clock_new() internally
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210409062401.2350436-9-f4bug@amsat.org>
 <CAFEAcA9s2hJdRrpa6-qBTaWs6v2AmhyjhOSs7kFrtE28+oFmWA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <42b1385f-c264-a6ce-0dba-ab9edbfef5d3@amsat.org>
Date: Tue, 20 Apr 2021 11:27:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9s2hJdRrpa6-qBTaWs6v2AmhyjhOSs7kFrtE28+oFmWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 4:26 PM, Peter Maydell wrote:
> On Fri, 9 Apr 2021 at 07:24, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> To enforce correct API usage, restrict the clock creation to
>> hw/core/. The only possible ways to create a clock are:
>>
>> - Constant clock at the board level
>>   Using machine_create_constant_clock() in machine_init()
>>
>> - Propagated clock in QDev
>>   Using qdev_init_clock_in() or qdev_init_clock_out() in
>>   TYPE_DEVICE instance_init().
> 
> Why isn't it OK to have a constant clock inside a device ?

I'm not an electronic engineer, so I guessed because I never used
a component which generate a clock source without being externally
excited by a crystal or oscillator. Such exciters are components
on the board. I might be wrong.

Using clock source out of qdev is giving us headache... So I'm
trying to enforce all clocks being used via qdev. Looking at the
resting cases and thinking about hardware, my understanding is
what's left belong to the "(constant) clock source on the board",
added this machine_create_constant_clock() method to complete the
enforced API.

Maybe what I'm trying to fix is a side-effect of the non-qdev reset
problem, and if we get a QOM tree reset, then a clock on a non-qdev
object would properly propagate its constant value to its children.

