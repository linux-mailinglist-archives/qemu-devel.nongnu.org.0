Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763F38FEF5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 12:20:37 +0200 (CEST)
Received: from localhost ([::1]:49276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUAu-0006zP-LC
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 06:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llU8z-00053T-TR
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:18:37 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llU8y-00049M-6l
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:18:37 -0400
Received: by mail-wr1-x432.google.com with SMTP id m18so1898152wrv.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3cDHWhiUeZFGq8t46CgyFeBIt03Da2BJoi0UfEt07xY=;
 b=jhZPaMmoRrh42GOmzrZVmO+VocCCbBr1uWb24EaV0m0JK6iq5KZcTCCzWxjgAKMPBo
 O1qhmSoFlcOdRamdzesp8HdR0jOOL0E8Kq75nEMpWs80REsett2YVb2wrmg/lt8hxBzI
 LZHbQF+OFQipA9H6PMfWxmSOfWlp8yVGL7dZjmijUnXouGbSqfqIbPMW0RbcQCusBn7r
 C4Mxb3s3wbPs8ANnxmV0Hc/kehsHg4rldD9OfDco+Zo5tsf2RMvp7calF6mAbhNko089
 jStk3+4x0b2wCYoV/Wi7f4OtGi6BFdlze3NAD+DRs8VQ53bC0sNn6mjODZOfGxLGXzud
 SPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3cDHWhiUeZFGq8t46CgyFeBIt03Da2BJoi0UfEt07xY=;
 b=fxPHtTzUCPpYg6Pb2CLfm5cbsKyw/hfJTQDJNb4GBQZdw4g1ftVNhZWkDRqGSzfTxA
 W7syjV+dyX9zdd2xGZZggpG6+Al7yvfiBK9o67SasQtY7ONGgOznYLP1MFBv1A3+HXiq
 yzcB5+Gitk3DAjiTcLHYFqme5Iraz+G4GUunfF3eNReywQGNSHi1jbpM9kXSubwpggEi
 Bhs4N/i0WmZqpyvWL54rFsOfPWrKYowH9enCQosoIjMvM3ViWE/r7WwUnoe90KqPfcgP
 eQl8deSLEhGaZDlB67iJKImevDguRQYfoXQwUkNnDN6BUjNtMSBR6tg8BNgOszrbf71p
 sfXQ==
X-Gm-Message-State: AOAM531KmbTJCJQK6e8z6+gJbLlsVuOXOgyjos9jrluve/euq9SDZPVP
 x/hw5RfhgI0oCer/dD91/m8Swe8grxj8cg==
X-Google-Smtp-Source: ABdhPJyesA5pjKr6OQxOpbwM71X+21IB8OFdSwfbGxCW30bOc0doNUES5pQ08m2vSnfZj/blzDkR+g==
X-Received: by 2002:a5d:408f:: with SMTP id o15mr25512991wrp.89.1621937914180; 
 Tue, 25 May 2021 03:18:34 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id h1sm2417601wmq.0.2021.05.25.03.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 03:18:33 -0700 (PDT)
Subject: Re: [PATCH v2 0/9] accel/tcg: Add tlb_flush interface for a range of
 pages
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210509151618.2331764-1-f4bug@amsat.org>
 <CAAdtpL6u_5AF=H7XaRwfWThTVxM3YvUjUktbmmEenbUL=r2nBQ@mail.gmail.com>
 <820e64bb-8ba1-d56f-d42a-458940600ac7@amsat.org>
 <CAFEAcA9m1fYkLYg-bLK7Vg_35ahwH-zLup=wThGo8biuRF12jQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <92c4f1fd-4673-0e2d-5ff8-17bb51cb3102@amsat.org>
Date: Tue, 25 May 2021 12:18:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9m1fYkLYg-bLK7Vg_35ahwH-zLup=wThGo8biuRF12jQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 11:55 AM, Peter Maydell wrote:
> On Tue, 25 May 2021 at 08:56, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> ping?
> 
> I talked to RTH about this yesterday; I actually have it in
> my target-arm queue and reviewed. I'm just waiting for Richard
> to supply some commit messages to fill in the bits you left
> as placeholders/blank...

Oh I forgot about this in tlb_flush_page_bits_by_mmuidx_async_1(),
thanks for being careful. I'll learn from Richard comments then :)

