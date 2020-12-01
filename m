Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC99D2CAA4D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:56:45 +0100 (CET)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9tM-0002Zc-TO
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk9cs-0001SS-9L
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:39:42 -0500
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:42252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk9cq-0005GB-P0
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:39:42 -0500
Received: by mail-oo1-xc42.google.com with SMTP id i30so593858ooh.9
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 09:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U6Q/NLcd4xeFXDxQ9jldjP/uQcMyib1ZR5J20NZC0Rw=;
 b=dFfZtJDX83uOJPJrNSXNpdvEk4DvSCEJnI9kP7BYi/EFBLmegvcbXQY5iV2c0zCf6m
 RjlxoZa+fYPYlCKwhdh6okkTN/z8LCJU91AU8wIN/MToRS/yjC2sry3112Ghyyhkd9dX
 loEK2Z/sxejR9RPk6wwVfRe1dBIhbVz2K0JTelk9UcEPfVZGhbx28d9XUVT6CWTLX9OE
 Msj/wf2l74KoZYvObkzMkcqx3oj+tCnThjcoyPcSyKniekFSoGL4wOQgR9dveQu0ZvL4
 DnhJCttJMt+CgrBqw5MaNnsXvCI8/ZuRWQ/UiQRyuLnIqv8Mtb0zf9BPeNwULNzW52Zy
 NWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U6Q/NLcd4xeFXDxQ9jldjP/uQcMyib1ZR5J20NZC0Rw=;
 b=G+WHqsapgh8Xrpu0ZrBoqLiz+l7i06t7ChofWXofc2bLvq27oMHU/pRZk7xUOzFVzJ
 SJQ5dlJh1T7aNTueHfROw1OzvyG7fvrvPs967bXrEf7IxJcpjQ6MsEq1In1VI/QEHTek
 pGO2p+WdV2lWxxj6RgV+9MKsbezhVIf1eqfvsAgKThwe51moOm7wGZ2dkp99IrK0kAE4
 Kx2rz9RPm7BWQUcNRqO5rCaY2UWeqoSW2/eCjKQvnoWv6jKTZxh78bX+3gCH1haw3gfD
 9lei/V/6yIsLmE1fH7DtKMJ+pfthLr31aFmBZiUedzmtuUQbJ/A++IajAx94mSSRGR10
 B0cQ==
X-Gm-Message-State: AOAM530Gh9uqJVNzuFmNfO3lJHytsdLsFqaYQKsMUMqi4jJIHPHlYUz2
 FiyfA76PLJ2OhdjMBL6YBq12VA==
X-Google-Smtp-Source: ABdhPJx8+hb7DEMCbskxajfKItRC+Zi5Y/21y/Avuw/20kwJwRL6iK6cpayXOW5As/WGVUaz9S4Vow==
X-Received: by 2002:a4a:8606:: with SMTP id v6mr2648024ooh.37.1606844379574;
 Tue, 01 Dec 2020 09:39:39 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id k20sm90951ots.53.2020.12.01.09.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 09:39:38 -0800 (PST)
Subject: Re: [PATCH v2 3/6] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_SET() macro
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
References: <20201201133525.2866838-1-f4bug@amsat.org>
 <20201201133525.2866838-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8161016-e323-a152-edcb-491ca2540255@linaro.org>
Date: Tue, 1 Dec 2020 11:39:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201133525.2866838-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc42.google.com
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
> ISA features are usually denoted in read-only bits from
> CPU registers. Add the GET_FEATURE_REG_SET() macro which
> checks if a CPU register has bits set.
> 
> Use the macro to check for MSA (which sets the MSAP bit of
> the Config3 register when the ASE implementation is present).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/elfload.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


