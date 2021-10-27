Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9CB43D54D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 23:24:22 +0200 (CEST)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfqPF-0008T9-AJ
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 17:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqMt-00066t-0s
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:21:55 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqMr-0004Qp-6C
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:21:54 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y7so3930577pfg.8
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 14:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OXtpvOkOfJyaKhdN0Cf3OsuDBwKmom39Mc+MubB+2dg=;
 b=fUZ5+zQxLqOxM62SHgVyww4wgKH0KIHqfavc23BAszd8Fb6qSUkkYG+iP/0SnY3bib
 JlZteLDdug37uVUKcC5UuPNLfPHufxMP7hN48fyr3MrpdlnN6afwhIr+SARnCMvEmxmH
 ehHhiIZcwRiShpAosPAYvYdJTx2IrP2szMv83vROGu/ydvwYFeFecjrZ3iAetsa1lbF5
 SOgeV928aUIHKYVHB7jCW+zN1q0ht3rwMaZ6IdCXJtaz8MxixQGA5bvrN22dxPv/ArHd
 zPHSLwTvhP/AEv8ggyckTExbvV1mAXVyAiimBT29Ufz8ygBGaqNDS5UN1H5E7fgj3q7/
 3ZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OXtpvOkOfJyaKhdN0Cf3OsuDBwKmom39Mc+MubB+2dg=;
 b=hy2m9OmNQEm3Rmbr1EO/rSnK5F65/B/zNuXuoixsKAovk7AetvoO1cXKvM7sOfjoqA
 ox3lb0u7SzhFfiK8YvPG0+fGbkteLK2/FU2XJVkYp1SI4RS5gH98tXNc3OM985d5r+F9
 rPLFGmmyd16wRtTei1QviOz2JvME5e1CVSZd/oy2pDM9rjd+kxBWkTiShiggIa2Sopfh
 HFr40t6qmiKLALH+boDAEuCqYjttrZlQiaO4tQTSXdMcir2CK1cfmYXanaIabNGfuCIv
 X/hMmGAn3tx7OD+EHGFRlNKkeT138w93AC0Z4bPfca4RE9dBI6RUWL/m0bU+CVoaZqNJ
 klHA==
X-Gm-Message-State: AOAM531QmLdPDSfXBx7kLRK2qLlx6oa+Td3RW9uLfa3v+IOwk420TmfJ
 WPm/Ux2YYBUjK2ZX/0xW28jfpQ==
X-Google-Smtp-Source: ABdhPJxYCXGK7U2tnmzw5yt81JarvBhSXeuXfWufIwHpEviS8Yo+ULbsCWHPSnlh3r9pvo72X+Q7Uw==
X-Received: by 2002:a63:1d23:: with SMTP id d35mr141802pgd.357.1635369711691; 
 Wed, 27 Oct 2021 14:21:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k22sm913954pfu.148.2021.10.27.14.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 14:21:51 -0700 (PDT)
Subject: Re: [PATCH v2 11/32] target/mips: Convert MSA SHF opcode to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3237d86f-fdf6-dd18-4a41-f45160d7646b@linaro.org>
Date: Wed, 27 Oct 2021 14:21:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-12-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> +static bool trans_SHF(DisasContext *ctx, arg_msa_i8 *a)
> +{
> +    if (a->df == DF_DOUBLE) {
> +        gen_reserved_instruction(ctx);
> +        return true;
> +    }

Here you have the option to return false, as you choose.

r~

