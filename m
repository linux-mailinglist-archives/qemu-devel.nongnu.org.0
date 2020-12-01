Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D392B2CAA4E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:57:28 +0100 (CET)
Received: from localhost ([::1]:51104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9u3-0003if-U5
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk9c1-0000Yu-20
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:38:49 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk9bw-0005AA-RB
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:38:48 -0500
Received: by mail-oi1-x242.google.com with SMTP id w15so2585907oie.13
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 09:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xyxi4RGYpP8o4gIUYNdx4ZPt4Uf/yVAuHaREXvwywd4=;
 b=xcES0evE4sftOYepBt8K7LqyCdJVGn2iDzuz1Cpg+lkfuz/KZsWtRyNYEzQQhcs1eA
 PD4FX/ase4MITR66zne2tWFm1pR0oxLwqj/FAWWR89JCZlZZT2a89cF//GkewsDxohoT
 otI8S6PttVObn2bXf3q4yV1/+pKqXHsGS8SEU0fH0OS8YGwwePC+wi2wqds1gcMiBQFm
 M+y2hXG6qv7Is6Ha8OrigGLkHab20x3qQLHg0BvcbB7VF41n0hayFhgEHrhoZE3bZNnK
 PwNtSAIORSOuFUEZs98Kx5BGG1VnZCA5g/vSBsO5Nk9GXAHH6tWd9W4IcPp1gUroaq34
 6DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xyxi4RGYpP8o4gIUYNdx4ZPt4Uf/yVAuHaREXvwywd4=;
 b=NvehrekV1VUt7J2b7xM5Bkv66u8VnH495G2pIpp1p7zrHto7E+K+qnd5WOynWWQ5vX
 pge1kmMqMrZIOaeSFclBNNwV64hCXN6IVLn/46YvaZeK2EuPl3bS3pR7xXxD9O+e597b
 4Ji0eut5twbOYVG6yauoiVD8GIa7tIhA/dDyVzI1ul+P8MTMRt5Nrq8tAHVgiotl5wCm
 yyCoLUNLJG/K7MsKpx1/vl4Ar46qrVnHsCaz3Nj7Q2QeEHfXqU1GUxmgNSYevVMJkhpX
 ylkoltOYqgakrsKdsXcuPTXhqvRRxtJ86smbfuW1C0F6MW+6Ua9GoF00CpAHwB793A+3
 h/yA==
X-Gm-Message-State: AOAM533TO0Vt6Q5s9dFG7+A9WhOXkrcer9WwG4Zd3CH5CqFLtL6jnimD
 cnmU/4tL9Gu2Ztts3KA2duha7A==
X-Google-Smtp-Source: ABdhPJxA8V0XjCX0C0hMYwAofcxtLOgjGYjwwcUUCd6G/F2clK8HKV5CgSxiadh8pqPpjRlenl8OOw==
X-Received: by 2002:aca:c208:: with SMTP id s8mr2509579oif.49.1606844323644;
 Tue, 01 Dec 2020 09:38:43 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id l8sm95553oof.2.2020.12.01.09.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 09:38:42 -0800 (PST)
Subject: Re: [PATCH v2 1/6] linux-user/elfload: Move GET_FEATURE macro out of
 get_elf_hwcap() body
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
References: <20201201133525.2866838-1-f4bug@amsat.org>
 <20201201133525.2866838-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ccdca91-c218-3ec3-42bc-30c748d0ab25@linaro.org>
Date: Tue, 1 Dec 2020 11:38:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201133525.2866838-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 7:35 AM, Philippe Mathieu-Daudé wrote:
> As we are going to add more macros, keep the function body clear.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/elfload.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

