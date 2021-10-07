Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C749C425A26
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:59:16 +0200 (CEST)
Received: from localhost ([::1]:54952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXfn-0000TF-R9
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXZp-00064e-JG
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:53:05 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXZo-0002q3-3i
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:53:05 -0400
Received: by mail-pf1-x436.google.com with SMTP id 145so5945339pfz.11
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8qBrST+9sd1tP1NBL1OuDdKGYJvS54xHLBO10eCRpyU=;
 b=bicKQ6CtqUv3NRIwiMwL27Qlh6obTYvPHAE4Y7uQMVU7+wy8Ddrfw7RkFUeovXcCeH
 MhfmkdTTEhOaiklKazPWywhuw2dbt4ZZLiy9bZuSV3U0govQ62v4rqHqWW3HgiBOWeZK
 FNhoQX7AZyCxB6uIfYOojSFNU09YJ9nDPy3qMxKrhw3S9TH1NaiAKgSm2aqZoNZzRWah
 lBbacaIGNDP8zU5bEZ+PPVv1NAiqTE1BKON72Gm5wLXxwgZFyaWGFeaHXC6+MbBw1ODH
 hLfm1D0L8dygtZa7JhXy0LLoWAEvdxcYyIbHEbkTLQrq4iG6arazL9tLL7qVwsHHexoY
 qGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8qBrST+9sd1tP1NBL1OuDdKGYJvS54xHLBO10eCRpyU=;
 b=dXwBGcJGyYessDIHUuSFss6gyy35AS3kocPfYlUuJaoKHzqZbqmCIbg2BK3ij4PneW
 vEDap8K7bsMRlRTCthMNqUN1kEMvQM8NAsIh9ofFtoIdJSVFBQeUtkiUv0GE11Vu91c8
 +OXOXrSkxE6iWcI0slIA7ktFmkovluuHusjor/1Ws5/YUyfqpd3RkZXRkJZ39U++PYih
 8HswrzXEA5LPSGXdY2NAieFEjIIn6j6MHxN3I7L/xWOjeLuMPjtABThqpqUaI2ibIzbt
 5Z64LHd55J4gy/vlPVC78EroWi2al5jaOxzwSRucQ21Pl+y4D10oGYtxreOWJJt/LLZk
 oacw==
X-Gm-Message-State: AOAM530plt7toeDUJA5ybV67uRFPw05asQiwcxLZzendxxbtQjXKmF2b
 KSFNZr9sw5QTeBcTkAFW4e2ZJQ==
X-Google-Smtp-Source: ABdhPJxee7uAoi7lV+G1TLJeQNu4CwQoIRS/0htw/1mZhzA810AbcaAe7YfQcPd+5EJ9MNMZ+d1uKg==
X-Received: by 2002:a63:f40b:: with SMTP id g11mr769333pgi.401.1633629182489; 
 Thu, 07 Oct 2021 10:53:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n202sm74529pfd.160.2021.10.07.10.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 10:53:02 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: Pass the same value to oprsz and maxsz for
 vmv.v.v
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211007081803.1705656-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89fc02c0-4164-64fa-d265-f350704d3eff@linaro.org>
Date: Thu, 7 Oct 2021 10:53:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007081803.1705656-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 1:17 AM, frank.chang@sifive.com wrote:
> From: Frank Chang<frank.chang@sifive.com>
> 
> oprsz and maxsz are passed with the same value in commit: eee2d61e202.
> However, vmv.v.v was missed in that commit and should pass the same
> value as well in its tcg_gen_gvec_2_ptr() call.
> 
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

