Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED84B67A4F6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 22:27:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKQoS-0007kf-I0; Tue, 24 Jan 2023 16:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKQoQ-0007kN-QH
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:26:38 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKQoP-0007l0-By
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:26:38 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 h5-20020a17090a9c0500b0022bb85eb35dso10941777pjp.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 13:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GbNkp/pKuIBiZ4ypNW3WoRMK+2cUL/berwP7DHIUh6A=;
 b=MmLGIskhTuCYr/i8CiOxoy5gzEdwB7lBTd5179asJDsSB0bY4CiM5gqruaKhVjoBOb
 m2GdGbqvNz30dkp99GBVA6jV6oi03S74rmXWn7mmXxYCX55HH3pNP+uPk8kLStNub6wi
 BSTq3RSNQhHh5Oz2antGH1Rm2MdZf38R5YUxqbADLdU15IAghTfjFHNIfeecNWjgkUpp
 n/m5YwArEp2rMxI7PrBPM5gphMDxi1Ttc4xuCd5BuPo5GcwJddzhQdO8ON0BUvGUFfnu
 I/vzbbCZ7ZIj6B978xNut+dxfqdvyt0G1PRJpoULIIOgz3w4JuQO30O6dIcgnbQGD8pX
 D2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GbNkp/pKuIBiZ4ypNW3WoRMK+2cUL/berwP7DHIUh6A=;
 b=p8ihrBFO4i3CJw0QTfYzcNBTy/b3nXda8rChnXTGVlwujbv9gwl13qA+F62dXR4Yo0
 kpKKHoBQifpL58PjLII0InKfLGuT3QB+9KjvA/uKZVB6AIsBUGSEvbkO410hLpfECSHk
 l3nqUrR6D1zqwtjYVPQlPvrGak+sE1tMazV14hz0gcrvh2b7aq6A/dpiaT3vudJkvUZ7
 ZnMs1NFxpM2s4oEIaLPinMdZOFffdpSSj9swHiRiV9JCVycNFBwXLShLdnoaZ9X8ewfF
 MSVr0YXOApUcRrDW/c4H4Vrb0J+Ez19ZDa7ghjdWkfz3V+Fg+xujNcjnNpY46bFs6DsU
 O4+g==
X-Gm-Message-State: AO0yUKXzPgWWjIW3oWSB9rDoTmFRuD4Fesb9ff8f1dYu8XIC9lwVRPjZ
 1pBOGvIp90CYKfkH9dbS756Nlg==
X-Google-Smtp-Source: AK7set8zbCKoWKuCKSr270Flhoty93/6CQfOrX4peU1JScmZL0v45+wRjWATQ1r2JIuO/XRRs4A2yQ==
X-Received: by 2002:a17:902:db08:b0:196:11b1:1024 with SMTP id
 m8-20020a170902db0800b0019611b11024mr4999997plx.7.1674595595775; 
 Tue, 24 Jan 2023 13:26:35 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 jl16-20020a170903135000b001869ba04c83sm2114872plb.245.2023.01.24.13.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 13:26:35 -0800 (PST)
Message-ID: <64af1437-b910-e5b3-c462-0ef0c416ba39@linaro.org>
Date: Tue, 24 Jan 2023 11:26:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 12/14] RISC-V: Add initial support for T-Head C906
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-13-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230124195945.181842-13-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/24/23 09:59, Christoph Muellner wrote:
> +++ b/target/riscv/cpu.h
> @@ -27,6 +27,7 @@
>   #include "qom/object.h"
>   #include "qemu/int128.h"
>   #include "cpu_bits.h"
> +#include "cpu_vendorid.h"

I don't see that this ID is required for all users of riscv/cpu.h.
This include should be limited to cpu.c.


r~

