Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076932D4653
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:08:01 +0100 (CET)
Received: from localhost ([::1]:42092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn20W-0002rS-0L
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1zh-0002L1-35
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:07:09 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1zf-0006Tx-IG
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:07:08 -0500
Received: by mail-oi1-x241.google.com with SMTP id x16so2244190oic.3
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 08:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kb7f9G+X5qvtFcUePdn3CbJeF7xIHGBTh3nzE/WNNjg=;
 b=BnselUvm9RSyQmzEodPnQVYTsi4/WLBlWLYgSfR/dWQ1P/oP11sPXsf865cNUD7iAd
 farQinQKPC4WSeJD2s2YtneAhc2dR3a/O7Jtf5/UJqHdTIPe883JCR7e6oJ6kuPY0iR3
 Z6M7f/kHphXODv++nstSt+TDNxXJHvQW7or9jHo9+TgKEtSj+XNr1N4iEMfntFvVIrgh
 RGTnXXA6WKaeW6GiNGNaq/XuSjeLaQ3C1+bKFBC6gHTP5NoHL14BF6YAi83sGYnVfgiw
 o/tmxqiNC7Y0MwGz/4MAOUFEQT3qi/9Ai+PhloqaV0szgi3FRbD7UGv/IRcwXWryg/Sq
 1gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kb7f9G+X5qvtFcUePdn3CbJeF7xIHGBTh3nzE/WNNjg=;
 b=japb17jOUw/l/4F2lCcDKCPe7U+oOYgzQDRlMwqTtrfuYOvB5zxlWtePvG37FLDI+d
 byjfAqiwgVsnOSaOawkfiyFMo/QA6d46BRaSLK8q7st3E38Pzx9m1tLWbLtYFlFMNC9Q
 +qvTbsPGJP3PfN9NbRBGVmLbxEJxERsd7isf4SN2qQw5p3BPSI80azUCAeExCjbRooeH
 i+W6AvcMyfr1jvx7CuWJXifsXeqGPJUnahBGZLLHNKdukhcV3LSmoDNatnzFp63vSY/Z
 ngESJKXmdphTKSCBypNFCrZHiCrS2kYeOZvzVp/mWEogdGOpKJc9I+Cou/BSCPTGHCU9
 BLBA==
X-Gm-Message-State: AOAM533vmUDML76Lo1RC5XZwms6uWxiiClssJo+z44edLXxbgUTdpkA/
 aQYuxiTfAfL39V8lL1773wKdWQ==
X-Google-Smtp-Source: ABdhPJwo1MNWmk6u9Lfa4hlnHVFuhCuouFEMEVLJYh32p89UpwMSXUyc3VsZq/NWtbKdmOhYrmVYBQ==
X-Received: by 2002:aca:5197:: with SMTP id f145mr2266597oib.71.1607530026592; 
 Wed, 09 Dec 2020 08:07:06 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y8sm163896oix.43.2020.12.09.08.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 08:07:05 -0800 (PST)
Subject: Re: [PATCH v2 13/15] target/riscv: cpu_helper: Remove compile time
 XLEN checks
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <bfd448b85f5858e24281e14cf6ae69d512efa685.1607467819.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea1a41be-0f38-213b-3ced-fde83a66177e@linaro.org>
Date: Wed, 9 Dec 2020 10:07:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bfd448b85f5858e24281e14cf6ae69d512efa685.1607467819.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 4:56 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

