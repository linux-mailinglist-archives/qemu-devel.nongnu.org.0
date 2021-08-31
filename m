Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DE13FC0CD
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 04:25:59 +0200 (CEST)
Received: from localhost ([::1]:33176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKtTK-00063n-3x
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 22:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKtRd-0005M9-Nc
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 22:24:13 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKtRa-0006cs-GC
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 22:24:13 -0400
Received: by mail-pl1-x62d.google.com with SMTP id e1so9679880plt.11
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 19:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GRfOSvP+VMTbrmpir74Tsl5Y7UDu6m/hzPzcsp3WTKE=;
 b=eqEeE2D44ezUK6hu2NIHZ/nN36NqLBDZUezz2Ug8ugVJNmqF7Mrt2Q7/Iu8MdSvoFJ
 rp/QVYS4cbDpkeFAQRJBPDbPuVInhqoBO13r6hh+Jn723Zfi0Q8jSFewQjQ8MrTKhH07
 U1ykgTHNK58X+WkAS0AsqX3Ux9HE5mLUL/b0HJdkk5WySKrP46hgN7IuKqZiHHPTAaN5
 HdBPdk55Zvmfg8sItPoFcheaAxSwHHlqY8DJoOEidgBmEGsEqImiOJ2kb/EJ9Nlq1nlx
 hVP6HMr8wJVv+4l2Zou78f9rx1/B3gZzOUuENTQR9tgs5HAaC1D9baMfN3Ub60poNnZ0
 g4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GRfOSvP+VMTbrmpir74Tsl5Y7UDu6m/hzPzcsp3WTKE=;
 b=q+Ost5COJ4X9cV3Dfa0BZB7wkaamkNIFT4h3vhbH+CUm5972eWYPIAX+2FQ5tsLagm
 8c06VSX42ZtwqQH0qnKTS6YjgpMku8VpStzCh8DKrv1AxKy7dzKkJDuhgWfgrnsg8xeM
 wjmnvxsDjpiPfWue27EM4/Rglu4+EBmK65uD47QJH0rWzx8qZ9RuA0jX3Hi/O1W/bW+9
 7PJhOS/WuAoYRWBXTE8m+cVtUYsSRDxF9jNw9/f4ZEYdprYV7UUWlNygD1IMQJW4dshV
 lEnLOi4nGatBmTamyKfnCzUnghkzsl4G3McbJGIAul9N4B/z2qkLPwpMpeHNnEuSQIUy
 HMVA==
X-Gm-Message-State: AOAM5336hRYe7RrbyB8NvMYS4Rz4GWlr98A5RHrH9QDzvEHz1Exm00mM
 NL+bD7HJjOt/HQ2ucp2qaCLvIw==
X-Google-Smtp-Source: ABdhPJxMDesKv1E6Men8+tMNQGKeeM1iUkZMVGlCvJjskf3RkEkcrgof7/QQcIPVbmhyUykttiBlXQ==
X-Received: by 2002:a17:902:c406:b0:138:c28f:a779 with SMTP id
 k6-20020a170902c40600b00138c28fa779mr2430383plk.1.1630376648804; 
 Mon, 30 Aug 2021 19:24:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id t10sm732733pji.30.2021.08.30.19.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 19:24:08 -0700 (PDT)
Subject: Re: [PATCH 3/8] target/riscv: Addition of 128-bit ldu, lq and sq
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-3-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d494ea6e-4eed-7d74-b9f7-130201a8294f@linaro.org>
Date: Mon, 30 Aug 2021 19:24:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830171638.126325-3-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
 Fabien Portas <fabien.portas@grenoble-inp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 10:16 AM, Frédéric Pétrot wrote:
> +#if defined(TARGET_RISCV128)
> +/*
> + * Accessing signed 64-bit or 128-bit values should be part of MemOp in
> + * include/exec/memop.h
> + * Unfortunately, this requires to change the defines there, as MO_SIGN is 4,
> + * and values 0 to 3 are usual types sizes.
> + * Note that an assert is triggered when MemOp is MO_SIGN|MO_TEQ, this value
> + * being some kind of sentinel.

https://lore.kernel.org/qemu-devel/20210818191920.390759-24-richard.henderson@linaro.org/


r~

