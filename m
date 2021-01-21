Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18562FE220
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 06:57:25 +0100 (CET)
Received: from localhost ([::1]:47652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2SyD-00063p-2M
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 00:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2SwB-00050S-Dx
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 00:55:19 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2Sw9-0005iS-Rf
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 00:55:19 -0500
Received: by mail-pf1-x42e.google.com with SMTP id j12so845048pfj.12
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 21:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wA4gj7z6VSOz/xDWSM0YxUprikYGiqGFaEFK2iE8JxU=;
 b=aUxDDoSQ5RjDesgOOHL/PiQVBzRgu7suSB1G+i5Cx4NHNfzmlhTBlgRPfJQObiPeZY
 6QY8tKkpH/AlT0ojaIPMkpy0WcIbD7mhrYJQ3yjpzw5rPQ9TPTFD3SYGEV0uGuP0SnJp
 vlI3viqzwnWe+osx30lcfho6sEXbgrggXua5p9WpVW8PZZhMtMkKuQMKZne7hKmL7xV/
 LQCKyjdSmL8mc3DFRuGQd+UuvA+n9a/7BgMKFS8YPmXzZ542Kji73M/APhnthT5ToilF
 Pho+7iaRZI4WmPDsv61SHDusB+w4M7w4ODUMdZjVI5F+VD6FP36GC/qR7Z3WaLmEl2FI
 bJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wA4gj7z6VSOz/xDWSM0YxUprikYGiqGFaEFK2iE8JxU=;
 b=ZK2N3OFPm13UKMpGpngwjdTzZz8XwfNeRhdZGQmi+mI7t/bC2FGyyawcg6ss+PtxoC
 tdTVxpJ2aCQEE/OybZ4QRdwax+yslPrsV4XT7/OiuNfQz8C47CKMI07sn0s67HAxYhtf
 mMIC5jiaLBPyxEAMaYCK2oL8kdK8PZfXL2120o8qpb//UwJSZohEHIfxQ1sbJnpMlbQ0
 cxi7gSkxwleL7ukkdDZX+l+2l86x3qhC4Td8QUMlbQiyNBBbxbQrDBf3hWzOBRMN0E8+
 AEw3fP7EoMuTbgRV6WmUGH2QJDRX+VrGdtKUteBEFqfVja276S7phbeJ1GCxa6aheV06
 ycGw==
X-Gm-Message-State: AOAM530ksNtV3EBOwTmYYuA527mmXI2CjHdOQ5wxj4xb7xA1+K7Y2szO
 JLWtzPkbUltH80OU4VWIOwZlBw==
X-Google-Smtp-Source: ABdhPJyPZKwOiXzBHTbLo8u+XXGrcMTxLyckowlAbQAbLsvsVi6/QeKoKQtw13j+l9F3UB9MzsWBFg==
X-Received: by 2002:a63:f19:: with SMTP id e25mr12833314pgl.220.1611208516174; 
 Wed, 20 Jan 2021 21:55:16 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id gg22sm4250906pjb.24.2021.01.20.21.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 21:55:15 -0800 (PST)
Subject: Re: [PATCH 2/6] accel/tcg: Restrict tb_flush_jmp_cache() from other
 accelerators
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2506bc48-6c1d-ab2f-eb6b-44ff9e1a5e34@linaro.org>
Date: Wed, 20 Jan 2021 19:55:11 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210117164813.4101761-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 6:48 AM, Philippe Mathieu-Daudé wrote:
> tb_flush_jmp_cache() is only called within TCG accelerator,
> declare it locally.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> We could also inline it in cputlb.c, the single user.
> ---

Yes, I think we should move it to cputlb.c.
I have queued a patch to do so.


r~

