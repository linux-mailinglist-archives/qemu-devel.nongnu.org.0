Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430252FA7AA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:39:49 +0100 (CET)
Received: from localhost ([::1]:53162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YVH-0003O9-Rw
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1Y6l-0000j6-L2
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:14:29 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1Y6h-0001dW-Bn
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:14:27 -0500
Received: by mail-pj1-x102b.google.com with SMTP id kx7so678443pjb.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 09:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L6blGcADcdqoO0kIlUgSrPRrlihSpDq3y8mB/cDgPBE=;
 b=x13djRWSXiDRbT7hYBPS2rFxqjAHddLpgzu2caeIL1voIi4mt3J23tta5QWikkyNie
 bYcWZuBB0FhjwSNI+r82CyZVnTDsFgFp2xAS8ad8OEk7Xg764OJ5u75aWS61PiF/XeNl
 gZAZIjRdDzxvlMvWBOe4zgfQ+sygGbaZdO3FGlhNPjV+qw38aGvNaa5oP+P7rVyR7iDU
 PL2mgBmC6pHx9UDCaeVrI0y9DAT+TcfFe1VcyNHq1H95go55bRc8OfpVPq5rrQ2k6s+J
 g6N0iA0t1pEzbwVNj6pfIy6X2SgFO2RoZlv792lo1i0GJbVhKGTfSogxmqJd10bQwKVR
 5/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6blGcADcdqoO0kIlUgSrPRrlihSpDq3y8mB/cDgPBE=;
 b=Qdewz6ZtMowQvUyUWxZOne3xhwtcnb74LdYSWcmviLwcqvxwSrIjUlN8/5GZ1eWnF4
 97raBqntspPtEgsKWG1wrNSXp/P4PX3g1q3RQ+aazlUUgi1cSEqqORySAMme61KvFfEn
 0grIMMm6ecbDRyscKBJZ8rZkvwvRHj/VTBnWDW5WIpIGD7dp7CFaQXjwV2LHMzg9F+kK
 QvgbET4LcmN2IckNHPP4iTVZoMExWOazR1uzhtQ0K3qmQS0VOBK4OR8x2oAlyIb0Qj0n
 ylkyc+/QCyxH5iKNVijw7YjwsgArApn4/pKgr0Gje0yInFnVtdYkA+561fQkBgvO3UmS
 5yPw==
X-Gm-Message-State: AOAM5322At8NtJN2DHI+DE8FnpzSlzzWM31bE1Mif83M75p2CVEDUWAc
 7/dQ9T/RKwgUMEGjdquD15ckRQ==
X-Google-Smtp-Source: ABdhPJzVdN4XOjCcO35HJYH2QDmSBkOM+N4fLKbQ6skVxDQ+f1iU3Okrtwq+kgjVU6z5itTpfRjdhg==
X-Received: by 2002:a17:90a:de03:: with SMTP id m3mr336122pjv.20.1610990057372; 
 Mon, 18 Jan 2021 09:14:17 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id y12sm7511117pfp.166.2021.01.18.09.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 09:14:16 -0800 (PST)
Subject: Re: [PATCH v1 1/1] riscv: Pass RISCVHartArrayState by pointer
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b0a5958-6bc7-1c66-5b0a-8183f854404d@linaro.org>
Date: Mon, 18 Jan 2021 07:14:12 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.194,
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

On 1/15/21 1:00 PM, Alistair Francis wrote:
> +bool riscv_is_32bit(RISCVHartArrayState *harts)
>  {
> -    RISCVCPU hart = harts.harts[0];
> +    RISCVCPU hart = harts->harts[0];

This is a large structure copy as well.


>      return riscv_cpu_is_32bit(&hart.env);
>  }

Better as

  &harts->harts[0].env

surely.


r~

