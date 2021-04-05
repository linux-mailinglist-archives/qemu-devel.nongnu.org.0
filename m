Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF562354314
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:59:13 +0200 (CEST)
Received: from localhost ([::1]:56902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQh7-0000oM-1V
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQWQ-0004vc-4I
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:48:10 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQWO-0001hU-EV
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:48:09 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so7970769pjh.1
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rfn51idzLeRAFF0CwK4jKPnPia4ImnoFgs2RGvcvCSI=;
 b=IFXMst9cX4f77n9+i0eean0PJ1nJ7O/Xfe2TBLOpDx6nasCxaARJ3ffKeVzbXB6jJ7
 TYKk6yRl/fKMQ0k/0MIsK7URFh5qhSmSpey+Eg/Af08CDbWpTGj/FdW2t9PnjqkZH39O
 VnYyAo3vduA/4xD7eYOWM4EfGQkh4rc7eltubP1yEdP9oW23Zr4/T36ufJfdI/KrsEuD
 OuFRxDuyA1731gcd7vR1AKoqqB6a1990CeJGVIh+137nOihM/Zg0JwogoyOJ3N/1IFm+
 WkjYaZMJRuT/fZa3QjShOYf8M/xDSRTlVljhwPOk7ipmwYGIA69TJ3PQl45xKXJs5wAY
 WivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rfn51idzLeRAFF0CwK4jKPnPia4ImnoFgs2RGvcvCSI=;
 b=RK6riz825xCJuIGXle9ZybJm+TSy/QYf1nrZ8I2/HCliMG6eqgSDZhdaOu5DbSuODx
 MmWS2PpdlDiU/SgnK7XDUnzTWGar5E06JVEwnD7Fhj+o1tDdR8M+23y5QwMxcN7jCCIF
 owQpELNcmf7qx2KDzY3YbixlieDiCRpgX51SoGifPCmR30gnflV8JkEA9LQbxC3p+DXF
 YYd24El10PU6Kq8orDI8wowhXacRXyY4uCExwFSgMaUvKQlRFcZ9YS5Zmxr17Z1Ww8Yd
 uOvwqc2lLeKXCAvC9PhmO7ecf9i3GHosxHJt2FnpnZnpq1Yk67gQOgTWet+EEVS62BWb
 /miQ==
X-Gm-Message-State: AOAM532iFc6zg9znr1tZvnkEgsVDlI+vhnZpVKBZD6IQ+8moq1fQu3DX
 4uFesj2lmbjx9yDN9jnQbEUmCw==
X-Google-Smtp-Source: ABdhPJyhOHWsp676GLIoeyR5izWzkgsWJFcKZjd6ey8swKM6bx546x2pW6IzDTp8uXuX6YuzQSGlyg==
X-Received: by 2002:a17:903:2281:b029:e9:f78:751c with SMTP id
 b1-20020a1709032281b02900e90f78751cmr4980779plh.19.1617634087250; 
 Mon, 05 Apr 2021 07:48:07 -0700 (PDT)
Received: from [192.168.73.67] (50-200-230-211-static.hfc.comcastbusiness.net.
 [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id m9sm15879309pgt.65.2021.04.05.07.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 07:48:06 -0700 (PDT)
Subject: Re: [PATCH v1 1/8] target/riscv: Remove the hardcoded RVXLEN macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <8c175fde1809d8ca97409eb86cd3e92216e115d6.1617393702.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08a5589b-6af1-4397-f327-ebb62e910f58@linaro.org>
Date: Mon, 5 Apr 2021 07:48:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8c175fde1809d8ca97409eb86cd3e92216e115d6.1617393702.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 4/2/21 1:02 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.h | 6 ------
>   target/riscv/cpu.c | 6 +++++-
>   2 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


