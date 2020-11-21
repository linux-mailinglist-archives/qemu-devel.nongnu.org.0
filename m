Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84682BC1C5
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 20:51:03 +0100 (CET)
Received: from localhost ([::1]:35408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgYuU-0002ES-Ty
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 14:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYrE-00081H-EA
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:47:41 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYrC-0005vu-V8
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:47:40 -0500
Received: by mail-pg1-x542.google.com with SMTP id 34so10443689pgp.10
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 11:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7bIXMvO1X1zWBjzWPqqjutV0tsCAAYmdCiDvoydH/Cs=;
 b=p3iYqhP89jdeGJHPQfqAYX8OxrBJfaGu8dRBcxWXDPa0xsjoaIaE3HkWyrhg4EC2sV
 qQH99DO126KytlM+Q/nvQQqK9FghCUh8Pdz9ieP2VdpQkI6Q9LpxGQ4ejjepqz9enG8h
 5WhoHYC3YbIqsESUKFHrq/ff+x42wA6v+1ed/2SZet9bFx858FED1d16lVZveagI5bMP
 X0AdjrvUDBXLq1GyRRQzgo9POSwKY5gGzEoR25+PdY3ooAWJ8fhqcCiLxuWvqEcsXxmw
 6XuY0AaSR6YHEAqkiKwkFSv/V5BAJOlrCfHD5vYyECtsE1DXWqY6OExnUL/BGpE3yPdT
 AWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7bIXMvO1X1zWBjzWPqqjutV0tsCAAYmdCiDvoydH/Cs=;
 b=RgDpU3xh4e+p3dzEXkJbdVWqw3zjptipcebkS6UmfyH/VrCPkVQpxNjCCbFNOrxxzm
 aheYf8cR1SR0hHqs8cc8nI92Sz+EmYhBQQCj7Q2KANM5G04z1tp+T2Yq0TIW+fhrD/Z9
 3n86kv32UbvB6olS9/OQ2BKOnszND8vyP8FlqtZshodrAinvOZCfNP7PavpBw5cK50CZ
 nNJVf4/94HU+mEfDT4Czy1mhkHS2PXlDOxNVpy3THsggCRqzSs6GimYRvL4ItKcs8nEn
 ekA5Eewz1FgNlG/l0sfr74+yE8XC41DU90ybbmrJINP34FYqTsNUsGYWv6sfwaU7Vsv9
 09uw==
X-Gm-Message-State: AOAM530RKmtBFmvWKe8uJqjf9JiiR86+AegwS7xMjFt4Rn1JgFwGy3gO
 IhH8Rjuzh8eymJIFADP/WahjXw==
X-Google-Smtp-Source: ABdhPJx75Ur9jBqZ/JEjaAm8c/uY9RphKZS0nzfTUG7ovQmmVqtv689RV8yzv77HoqNRFS8CR2RSvQ==
X-Received: by 2002:a63:4516:: with SMTP id s22mr21475587pga.45.1605988056684; 
 Sat, 21 Nov 2020 11:47:36 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id na6sm8348213pjb.12.2020.11.21.11.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 11:47:36 -0800 (PST)
Subject: Re: [PATCH 04/26] target/mips: Extract MSA translation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57bae8c8-9f18-3587-cf72-84db5ff34ef4@linaro.org>
Date: Sat, 21 Nov 2020 11:47:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Extract 2200 lines from the huge translate.c to a new file,
> 'mod-mips-msa_translate.c.inc'. As there are too many inter-
> dependencies we don't compile it as another object, but
> keep including it in the big translate.o. We gain in code
> maintainability.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c                  | 2209 +--------------------
>  target/mips/mod-mips-msa_translate.c.inc | 2218 ++++++++++++++++++++++
>  2 files changed, 2219 insertions(+), 2208 deletions(-)
>  create mode 100644 target/mips/mod-mips-msa_translate.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

