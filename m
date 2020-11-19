Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE052B9B75
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 20:31:23 +0100 (CET)
Received: from localhost ([::1]:45802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfpeL-00039U-Rv
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 14:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpaS-0002Do-E2
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:27:20 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpaQ-00080C-AF
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 14:27:20 -0500
Received: by mail-pf1-x430.google.com with SMTP id t8so5429717pfg.8
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nwjVNvX2DQT1RMWRMJmIfnKwYhrNqOENfnFyrbtHHro=;
 b=x973mK7p1Diy+MEbw5gdP1tmeAdIUQkzpFUsNlmqvvuFbHM6FcXE6uWR1+lgVluwSX
 xbGhhayNr8UP0C+xnVNI16YglvTir5oMmp6pyttyv0xafkc4Yq5ns1kkNbWE3D6Wdt1C
 /D7WN+bcC2RVWJdu/RbM4QIRvWEqYbgsAUMq3SP7gCP5D7ceYUJg1khyDQ5VPdhvmHK7
 uIgz689Kxco0Pu4xBvM7dcyuOL6nl5ubz2F57HayZ2V4FAPvzlaF7YgqMLorBTIq088V
 mJME5dpriLVvVKiWFIaHjKmb0sHJjsuBWoXhKm8/S/vs59dft0WdggvdA6nr8L0vDJ4o
 hv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nwjVNvX2DQT1RMWRMJmIfnKwYhrNqOENfnFyrbtHHro=;
 b=lY4TmMzr/ECT/nkKVzM0cl4Q/RT3c4buDqYeHbNdxsJXfRRfkFgBZ9uhFLV0E2N147
 zrvFEsLmsORMONfZwMBNT1iWSyQzPvS4yFEypxBQCjOA65sZYXQQSGNxTNXI8RPnDU8/
 GaVbSF0EYXLm3j3OL4DjbQuLFraGJ299TOCu3oS+Jp2IZrL72X6wxRA+w11/85olgpUQ
 yKBxfGIJC2sziY1UepRTQ/l5SrSW9AsGZPbrqCybXiAJL06mWDC0b9Mt3Xv3v5thwSwa
 8dlcEVLM0cuaJ9RcXWbgjr1HSr9+cEAV2rN6dIKnkf99qD5Z1uVP5m0q63nq0jqKxU09
 Ll1g==
X-Gm-Message-State: AOAM533Rw2vIdS4KOzVj0DqjpdmpP1PluH9DcRo5RvSyIUJWtqVjjSgv
 BDl+5CIvVi9ruHfTqW1Rrn4ILA==
X-Google-Smtp-Source: ABdhPJwDirWDOMZoDp5w4gLJ0sCufVnzFDN1VuoHQztRB5SZrhR4qZ0bBvGoNDGC99sRv++D/F7uQw==
X-Received: by 2002:a17:90a:dd46:: with SMTP id
 u6mr6188053pjv.162.1605814036758; 
 Thu, 19 Nov 2020 11:27:16 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t9sm497843pjo.4.2020.11.19.11.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:27:16 -0800 (PST)
Subject: Re: [RFC 03/15] target/riscv: rvb: count bits set
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-4-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <637b3a91-ba90-5d6f-d42e-f6b742da8f18@linaro.org>
Date: Thu, 19 Nov 2020 11:27:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-4-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>  target/riscv/insn32-64.decode           |  1 +
>  target/riscv/insn32.decode              |  1 +
>  target/riscv/insn_trans/trans_rvb.c.inc | 12 ++++++++++++
>  target/riscv/translate.c                | 21 +++++++++++++++++++++
>  4 files changed, 35 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

