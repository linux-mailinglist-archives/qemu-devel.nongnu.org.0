Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007AB2DF130
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 20:11:17 +0100 (CET)
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqhdN-000288-1i
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 14:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqhV8-0000DH-33
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 14:02:51 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqhV5-0005tt-Ty
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 14:02:45 -0500
Received: by mail-wr1-x430.google.com with SMTP id q18so6607231wrn.1
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 11:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Bzd9QMYYPOdOyrEmR8/rSrj6egQLbAPof1Gf7IdrDg=;
 b=t4Yf5jNv57WxTneCZwbF8aSVozPCxnU/gnUErR0FQjfer4okQZcMaEQLLDE5Sl+iJ/
 JEyL1gZuh6yug/i0jQ9H3sU4b9jpk7O3TXKs+MF9JlhPnhdMS8LmtZYCqoA/yUMvTR+j
 OkuGGuVZAr5d/Yyl7CEibRn1Z4cziYSiJWOcdh9xjal9/Xw9gm7gQBE60gGh5ld2nCVA
 MQueqoVDvMgoFNKdJ2DULWQY+eDBh1d4ZY+mCGGAuiusYhR0uy9ZYfNlcYE54fKtW8Rh
 Gr3J7SdhPfzWTLoQapmC1/JtujvyMljm6t8obM3+sBzICXjXho6BEdQr8FD+j5lWo/Ro
 10bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Bzd9QMYYPOdOyrEmR8/rSrj6egQLbAPof1Gf7IdrDg=;
 b=fNeH+hOEXfjja0sPZNbONR1Aw8+TKvi7b7jLsA+JnL/8qjmUU69OkKcpi8rxy0i9DJ
 yigSo0RM0ICIfYpNeFtg+FwHWZDKYvFFdUUw0YVs+WCjZaEVfiNQVji8CPIRh9x/c1mw
 UDPWvRgLsQCVq6Y7IyGTIi+2rIlnYUzqW9AijJaCFWVbbmN76kf8hX676mLdjm1ggoKb
 jo/AQVF4eTteCJ6E3JJv/t2iqDIxDeciuOmYpQXWEtQwyyaVr0oLpZvXN8s//Kj7hLMq
 85RA75uB3TDxsRJbUTE04jdGPcQgKXoZZJPygfvU/c1NQBDXe+lzXu7Uldm6FrmhJDgA
 vtuQ==
X-Gm-Message-State: AOAM531azH70gTTnMy0K9rZURlZQ6txvjGZ+8YdE6UC8XF8C5asvUAoi
 1QKeXtByvs3oJ16VgLDeU9A=
X-Google-Smtp-Source: ABdhPJwbiTMuObdVLNR1E6Q6bKLaMdCKQ+0RsCD+arhP+qThEdmBk2POA28nR2ph8voaDbM5uB7Isw==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr10505318wrw.386.1608404561041; 
 Sat, 19 Dec 2020 11:02:41 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id d8sm15658671wmb.11.2020.12.19.11.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Dec 2020 11:02:40 -0800 (PST)
Subject: Re: [PATCH v2 7/8] hw/mips/fuloong2e: Add highmem support
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219072326.40157-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <538aba2b-4af3-ec35-2020-08ad0f5894f8@amsat.org>
Date: Sat, 19 Dec 2020 20:02:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201219072326.40157-1-jiaxun.yang@flygoat.com>
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
Cc: chenhuacai@kernel.org, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/20 8:23 AM, Jiaxun Yang wrote:
> highmem started from 0x20000000.
> Now we can have up to 2G RAM.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2: Handle SPD for dual DIMM correctly.
> ---
>  hw/mips/fuloong2e.c | 61 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 49 insertions(+), 12 deletions(-)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

