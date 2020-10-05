Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB832836B1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 15:38:19 +0200 (CEST)
Received: from localhost ([::1]:53638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPQh0-0003Ju-HP
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 09:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kPQfM-0002Rl-HZ
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 09:36:36 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:44483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kPQfI-0006Nn-U9
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 09:36:35 -0400
Received: by mail-oo1-xc42.google.com with SMTP id 4so2214728ooh.11
 for <qemu-devel@nongnu.org>; Mon, 05 Oct 2020 06:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JsTn+TqV2LE8kPFstyHS+jPc5hW/GSnoJ/SFSwZ/Cqg=;
 b=gaLjo8YmCoD2jG5CDaNkxOyjT+ylS9Xlu6XOHWILJ3BLTx1dYyh67htKhOLgNXWcwL
 vzb5HHFZCF1DYsh78YseHYGKKWzgl6pfqBDMhLu/c8OUSpEk1AewoIoFUvq+wLMIyHKz
 MKkId9WdbiaHWdM03cWgcst0jZqY6+KZXaTHPA/wyQpjT1BzzjbNfkhhp/NuNWYp3zeT
 FJMfCFsKlUze6f8hpIQjsnm+eKDWWEa96bF/zbSlqsNiKM/aLL2ejZ/FWMrG8JR6V2JW
 SgIrjbmLX6C5seew4rspbtrjmDHkrrrPhWjenKZhwiAPGKReL0grgZHrn1AIxISDXZKN
 Xx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JsTn+TqV2LE8kPFstyHS+jPc5hW/GSnoJ/SFSwZ/Cqg=;
 b=lSn3OVsJtrbDoRS+o9k4Ao5vSG+ugc7k2+FD9xe2/Ql3oqou/CEE4KmX7BDYl4trBP
 mwHooVYiaQTs4o4hfdneSSoeKqBSzP2zJMGnaZGTvjjMfx0OdIZtuYOzF1Eikl3YGjSP
 iZuJagjz0scKv8MrkNoWDoeBx6Gvy90fZaR+rJEAMq/26zSNX6VPkC9BB7rQaP6Tsc/5
 kldCXCocQUrSTb5RKH1iAY2I26tvTlxudK/U0HVmHliEXwZ/ZkSx4Im8o4p9AfVcZkno
 kMMVMX6y28/BUyRW/pwQqEG5Utk206ACHdulzkv6PAeIjhJV+N/F3hCnMYJ2GPdzkZAu
 3ixQ==
X-Gm-Message-State: AOAM531dJrzLMW1T7qdjVDvLJbr5blqKNGHZZNjrLPPQzI8aD3E3hwJv
 HKy9qa55iAhL9Qqdq0TGgFrHVg==
X-Google-Smtp-Source: ABdhPJyKAQBRAe8TxEBWDnLG61k7RZMj20NGMBhlmHSaFjD9K4/hduD73kqf3v9sf3phhUWxEwnKLw==
X-Received: by 2002:a4a:1e43:: with SMTP id 64mr12467650ooq.7.1601904990968;
 Mon, 05 Oct 2020 06:36:30 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k128sm1514102oib.52.2020.10.05.06.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 06:36:30 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/mips: Simplify loading 64-bit ELF kernels
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200927163943.614604-1-f4bug@amsat.org>
 <20200927163943.614604-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92368d0d-4d45-b2aa-9bff-a2b6544eb5b0@linaro.org>
Date: Mon, 5 Oct 2020 08:36:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200927163943.614604-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/20 11:39 AM, Philippe Mathieu-Daudé wrote:
> Since 82790064116 ("Cast ELF datatypes properly to host 64bit types")
> we don't need to sign-extend the entry_point address. Remove this
> unnecessary code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/mips/mipssim.c | 6 +-----
>  hw/mips/r4k.c     | 6 +-----
>  2 files changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

