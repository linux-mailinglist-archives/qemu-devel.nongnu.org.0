Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149DD2CF583
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:21:59 +0100 (CET)
Received: from localhost ([::1]:34130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHaY-0000Y6-4U
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klFbt-0007DI-G0
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:15:19 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klFbn-0003MS-RE
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:15:13 -0500
Received: by mail-oi1-x244.google.com with SMTP id x16so7155604oic.3
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 10:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xit7dWkZ/uWg67R5ypkMG8vhmSpZMrHrrLkUOGYkvmQ=;
 b=kwTU2ej5wtGAKMk/t/SF8HMCWQMT90z6Er7H5JjodPi/gdzGi98p/VeIPuI4ij07Dm
 4VRUdbDVQE1hFGYSVpAuX9p2rRAcaTO/1fhYcrKZbqIIhSkVqeQIegHcfzCfmLmbzU60
 esWmyU3vAatDrjvne9Modl4Xv2HQRicbGf1uyk/3Luo0jk0lfWCR/NuUhuInU8yClaYF
 OMP7acLniEQW0ctS42ZmEYsqBxn5cQckXwwcC4JmS/ITj+pJOb6jdbsNdvyoIegn7ArU
 UDEd7tgUooi4zmfTECherwojRZ6ykhq4Vbt0/NlC7griNWmlBEmTT4Ddqg7qnMpaUWpd
 x6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xit7dWkZ/uWg67R5ypkMG8vhmSpZMrHrrLkUOGYkvmQ=;
 b=W98QR0IyFY3PTwN8Yg+WN5L/2DzV9P0HjQhIGOim/7dmp1wOUwamXO0HdN7h4vbF18
 fjM/U8jbTs0JQtLXHS6DourxllQRD2BCEYjGIYxE16TMB7lwGP+yYd/p9AT9UDmgj/yk
 tc8CCFXrD7jk3W9KGEnOcgI21//xJvN0Ewf0S1CwwAVgrGhtlt9aTJPpHfWxRH2NW7w9
 UvhfDNwdluKtEVEbck1q7fvYcLBTl15YyP0GoJEe4HOKE+aDkvbqk58H/cGMuUmJkEgA
 V/F6RrgQ/NlMBG44rhZcpUZIddZJvAFS6F0NJssnTB3P9iK4pxdxeJJrcoxOOY0lDFPm
 2RsA==
X-Gm-Message-State: AOAM5317eKkGeXn69+hSy5xLCy4GlnfPsRDloa1EPIIszUexDZChQUqp
 YJkLpm21G1iC8HVAO3Kvcrz+ZQ==
X-Google-Smtp-Source: ABdhPJwVGvS0KlNyzMEZr8Io3h0bNxMNQr8vTAObJ3nFQlo5BijMVIWuY6ycWapMvlNTr1CF8HRDhA==
X-Received: by 2002:aca:d514:: with SMTP id m20mr4060984oig.22.1607105703333; 
 Fri, 04 Dec 2020 10:15:03 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id w22sm778355otq.22.2020.12.04.10.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 10:15:02 -0800 (PST)
Subject: Re: [PATCH 7/9] target/mips: Extract msa_translate_init() from
 mips_tcg_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-8-f4bug@amsat.org>
 <9a103671-d4e7-bcff-c600-931655efbd2b@linaro.org>
 <1d04e931-015b-116f-f189-3d24e015b087@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <39c6980e-f02c-9eb2-f85e-e8bd26c0920f@linaro.org>
Date: Fri, 4 Dec 2020 12:15:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1d04e931-015b-116f-f189-3d24e015b087@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, kvm@vger.kernel.org,
 Huacai Chen <chenhc@lemote.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 11:23 AM, Philippe Mathieu-Daudé wrote:
> On 12/4/20 5:30 PM, Richard Henderson wrote:
>> On 12/2/20 12:44 PM, Philippe Mathieu-Daudé wrote:
>>> Extract the logic initialization of the MSA registers from
>>> the generic initialization.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  target/mips/translate.c | 35 ++++++++++++++++++++---------------
>>>  1 file changed, 20 insertions(+), 15 deletions(-)
>>
>> Why?
> 
> msa_wr_d[] registers are only used by MSA, so in the next series
> that allows me to move the 'static msa_wr_d[]' in msa_translate.c,
> without having to declare them global with extern.

Ah, sure.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

