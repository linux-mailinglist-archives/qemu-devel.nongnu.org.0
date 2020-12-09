Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8022D4406
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:17:21 +0100 (CET)
Received: from localhost ([::1]:51092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0HQ-0008Rj-7p
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0Eh-0007I4-9N
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:14:36 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:32814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0Ef-00074j-1Y
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:14:31 -0500
Received: by mail-ot1-x341.google.com with SMTP id b18so1469160ots.0
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bCTFs8CE4Y0AS+k0RbjwzPQyNCYSNa4/fJuO4AVv0UI=;
 b=HzEo6a+aQGz0/Wx+qB4820YnRjLCExK6rJNSNbOXK0CTFrwpR/5TyF2SBvzLDDfxQ1
 ij1hNzIabAaqR53hqx6HmkyqdJEfhA1Us8F5CMkAh6UpcEVxcRzHV9ebQbLJpwCl6zoi
 yneq+xR5K/t2/Q4MIuX8dAE9ldzJs5dJOrtLEp4o3d+J5BtZ56iSaDjjLom1UUqXh0Ve
 ViAeLrE+H+28WWTxZQMT3+sfjS0+J/RYSq40sA6z/WQuBHD+W7SX/NbB6O+XybDUvD6s
 AaVa7v7Jc9W/cvj7y/4+wuEGosEz2rmZCoNSB7G+zXsx5CBW5etRqNUoZo8F/3xBFwn7
 gKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bCTFs8CE4Y0AS+k0RbjwzPQyNCYSNa4/fJuO4AVv0UI=;
 b=dulDAU2C+uLkwlcThE+sjbmTingR9a49hJdEC1Vyi+jZ3+2nof//uEo6hX6wWda7gA
 1nKx2Hhg0TMyNpyFwADXyQxs3OtfQQ9kKr3gh0P9kIVpTQXy1CBWGz5/oz1sUaWwlg+9
 dizGCfxDPhnc4aTpBp3tTbbJ0qCT8QpdNvxXx70ZaOdQl3QqapcYbDoLg5JM3afNSO9Z
 d60uhFyenaXiU0Kp/mZNywcibv1RshND5alPOT2XfPWUpJppQoYrXsJcdekPDcsUct/L
 4YvZUB7buo0A5wUqvHnLFeBc8SkIR+BYM2hmFmPpvqtRiXFwoNtbioeH1HUJ+KoLfvy2
 w4lA==
X-Gm-Message-State: AOAM530NONpzetO2kl+2CCsA4eWxEWjwvyLs5THOxJ96jaHt2VKu8q+R
 5492F+AaPQdeDPT34ajOhgU3FZDKiBnCrbzs
X-Google-Smtp-Source: ABdhPJzQQhCbXZvkZHr12GgF0+nCXjabP5kbvlolUUbT+C0YAuFMFwQ+Lf/jP4mlREkHnr/hz/AdFA==
X-Received: by 2002:a05:6830:22eb:: with SMTP id
 t11mr2017379otc.114.1607523267259; 
 Wed, 09 Dec 2020 06:14:27 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g3sm328114oif.26.2020.12.09.06.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:14:26 -0800 (PST)
Subject: Re: [PATCH 03/13] target/mips: Introduce decodetree helpers for MSA
 LSA/DLSA opcodes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7f6f5999-8ff3-3b92-8405-889ff9cf49f8@linaro.org>
Date: Wed, 9 Dec 2020 08:14:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 2:36 PM, Philippe Mathieu-Daudé wrote:
> Add the LSA opcode to the MSA32 decodetree config, add DLSA
> to a new config for the MSA64 ASE, and call decode_msa64()
> in the main decode_opc() loop.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h         |  3 +++
>  target/mips/mod-msa32.decode    |  4 ++++
>  target/mips/mod-msa64.decode    | 17 +++++++++++++++++
>  target/mips/mod-msa_translate.c | 15 +++++++++++++++
>  target/mips/translate.c         |  5 +++++
>  target/mips/meson.build         |  5 +++++
>  6 files changed, 49 insertions(+)
>  create mode 100644 target/mips/mod-msa64.decode

Assuming nothing better can be done about the ifdefs,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

