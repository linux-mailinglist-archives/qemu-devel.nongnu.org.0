Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9125110E41D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 02:06:25 +0100 (CET)
Received: from localhost ([::1]:57384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibaAS-00027S-28
	for lists+qemu-devel@lfdr.de; Sun, 01 Dec 2019 20:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49072)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iba8s-0001GQ-QU
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 20:04:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iba8q-0008Jo-Vo
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 20:04:46 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38960)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iba8q-0008Ih-HS
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 20:04:44 -0500
Received: by mail-pl1-x642.google.com with SMTP id o9so15480314plk.6
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2019 17:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SLiIwFApKyRJYQkbn+hGHHI5tvOXLagn6im2UeeaUxs=;
 b=B5q++d7+UayccE6vrtsTTCCNRB9JrfTQhRkw+e74HSQMdih5jiuGKodQDnBIk4LRiJ
 6LZMN5fSD45nvT5oGH5vEND71WuEb63a3zfYN8GO6mM3JTXmlzBgcOlS69uBd05aaSo3
 HOicEnkVE//G6LlEVjWG3ZnFrJZ1EHKQdd5ozFRjaNrTYgOcj6CZp4huS2h7vi3ZiivE
 Lso0sLQA3x0eOs8+gCKnfEYMk5vEmwVtQD5OksQnpUFeVJ/WpjbaTGqRovuvaMvZf1my
 YU7oijrygmpXM3JWXt/FPTPhjDjmDJ5EJ6j7JviGik9cfC13cQJtk4vqbOeKoVMMbFhF
 oxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SLiIwFApKyRJYQkbn+hGHHI5tvOXLagn6im2UeeaUxs=;
 b=c9b3uRCCLYrpXrqxtoDf+R+NIldeyMN+tqXM8otqICQNCevXW7vGK9CfniScXz3Sc0
 e2TDs6gVTlPdcdFQKCpvEs+N8g2ZYp5LRMO9sKjafgdbgcVBenNv1DDmx8Oqs/L8dCHZ
 1P+wqXuJOn+GKBGx+TbvkjKpO7xuijxD12OEeLO8YgmkTgCY+QXaqNObpn7/1QElryey
 kr5PQHFrsOZ6BKd2s+Dz6TNXf9xcvniPChqFFoKqP8YNHSkOGtnbzZd+gHY5SyWTetiv
 zWc6hdSk7Ji6/ZbBsfKqNKaY8zR8iWzT23/rRoDm8u12INLF9uS9d46elnfcGx0a8BRv
 NI1g==
X-Gm-Message-State: APjAAAUKcXwoaH2YKJz6upt2TrN3o5as+hEHpQf76m1o9mWmmLPVolR3
 ticYPxez0dTuFeqgO0GwdLJbsA==
X-Google-Smtp-Source: APXvYqx+xKJ5Tu6ZnqvkExAnAIzdD8Z/iZOsJ2c15t82tViD3ZadPzpangNyUMTCxmOjsHbNuQSblg==
X-Received: by 2002:a17:902:8216:: with SMTP id
 x22mr24406738pln.179.1575248682881; 
 Sun, 01 Dec 2019 17:04:42 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t8sm16070523pjg.17.2019.12.01.17.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Dec 2019 17:04:42 -0800 (PST)
Subject: Re: [PATCH v1 1/5] linux-user: convert target_mprotect debug to
 tracepoint
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191128194603.24818-1-alex.bennee@linaro.org>
 <20191128194603.24818-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b60ffffa-651c-b6f0-cf5c-f75304a38021@linaro.org>
Date: Sun, 1 Dec 2019 17:04:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128194603.24818-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/28/19 7:45 PM, Alex Bennée wrote:
> -#ifdef DEBUG_MMAP
> -    printf("mprotect: start=0x" TARGET_ABI_FMT_lx
> -           "len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c\n", start, len,
> -           prot & PROT_READ ? 'r' : '-',
> -           prot & PROT_WRITE ? 'w' : '-',
> -           prot & PROT_EXEC ? 'x' : '-');
> -#endif
> +    if (TRACE_TARGET_MPROTECT_ENABLED) {
> +        char prot_str[4];
> +        prot_str[0] = prot & PROT_READ ? 'r' : '-';
> +        prot_str[1] = prot & PROT_WRITE ? 'w' : '-';
> +        prot_str[2] = prot & PROT_EXEC ? 'x' : '-';
> +        prot_str[3] = 0;
> +        trace_target_mprotect(start, len, prot_str);
> +    }

There are other bits in prot other than these 3.
See especially my linux-user BTI patch set, and
know that the same sort of thing will be in the
as-yet undecided abi for the MTE extension.

Unless you have a good reason otherwise, I think
we should just print the numeric value in hex.


r~

