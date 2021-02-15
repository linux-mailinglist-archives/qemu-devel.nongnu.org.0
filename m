Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6717831BED1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:19:57 +0100 (CET)
Received: from localhost ([::1]:50636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgbM-0002vd-GK
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgZS-0001im-Ob
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:17:58 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:39981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgZR-000893-5t
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:17:58 -0500
Received: by mail-pg1-x536.google.com with SMTP id b21so4472527pgk.7
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SiZ5zWhVcb39TbDTBJqVQIjoJ6vkJYjf5FELXvi5rrw=;
 b=vpFogLfNUM+qFctoB+jwKYVJq0d6yk2T9EqvZ/q1P0XP3YREdu0NqkZy7uoWaJI37O
 Ult1D8HujQQ9scJGQ2IqATAKXvatT70IOtQdN72bcveG7p5oUEbrEj1UICt21+YRAz95
 onZVD9s483toHP65llrix88T76aRCbxuqUCSaJCS1pnvfGd8HZQA4gpRQhm435ICmbHf
 4uQY6MHOa4HW/fGPwfQfxcSDYzXotAwbyYEFucJ9/hquXTgNZQVMj6uo3KRv4bWBlWzs
 z+7PrRo8AGFDN1x6opROqWhnUpHgfcbOZJ9UTMh5pABjKyikvaOHDLxVUFImC5F72FGW
 aFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SiZ5zWhVcb39TbDTBJqVQIjoJ6vkJYjf5FELXvi5rrw=;
 b=CrS/a6f7m3nLJ9dkhm3HCWIazVyQqOUEud+VjN/cEJy+nJrpU2JxY8Flh7Z5YT7I5O
 eurLatz4f9GZ4q4nnVFyz84SZW/vstsbe1nsx/72LIyKo4JRAZu9dRxxJpxFM/Y8NWqC
 4EqeI4eBK52RnycfD8uKJnq3jrQC4LKH7qvodszvHGyaJTMFljf2gIEVgSVnAc5wjFBW
 ytd80b6K6K67DkdFO30rsR/VSBf52mSOtdkOaT+uShI3Siobc95+R0xm4gksuUIpyvam
 w4bmYDanW8MID5jDPBmOO0Qw7TlyOoglayJDAvrmpn7KYimi/lU2W1KeEDugzy9dF42p
 quog==
X-Gm-Message-State: AOAM530KrZQrgdf/Zp+aSGQ6C0kFaUWFLbmw3e6tpX8duhr9lfS7b4+1
 gVCdfrXalWNFa/xndLNItr1rUQ==
X-Google-Smtp-Source: ABdhPJy4ZUx1ADCHDzmRb0C/BJa4ntPfHE6eted95f+tBmyNP5w68xH8wEshTKrU3BPAsI1HS2fKvw==
X-Received: by 2002:a63:d710:: with SMTP id d16mr8403742pgg.123.1613405875577; 
 Mon, 15 Feb 2021 08:17:55 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 p9sm18037920pja.51.2021.02.15.08.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:17:55 -0800 (PST)
Subject: Re: [RFC PATCH 07/42] target/mips/translate: Use GPR move functions
 in gen_HILO1_tx79()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8cf56feb-9732-5507-087f-3108db1320a3@linaro.org>
Date: Mon, 15 Feb 2021 08:17:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> We have handy functions to access GPR. Use gen_store_gpr() for
> Move From HI/LO Register and gen_load_gpr() for Move To opcodes.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

