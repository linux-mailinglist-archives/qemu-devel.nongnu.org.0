Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D346FC9C4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:01:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOpH-0008As-PU; Tue, 09 May 2023 11:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOpD-0008A9-Cy
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:00:24 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOpB-0004O2-J3
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:00:22 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f42769a0c1so20709655e9.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683644420; x=1686236420;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=11Eih0nRa4OM9V/ZBjRQ1TbCEUUHW4pYY3eSa7TcXmI=;
 b=gIPb2LBMEEMDeKp13ch96mjn7nChM+2VEV7UdSd6ejPET0w1raQE0o8gVgSfkL7HQf
 bTbXWSSkd/QSVuZfxh2ASCf0SK1ccHm8tGH2BUewl2XF7lvxYnrx1ba2wpZA1OsKWle1
 ATTJE9HWXmk+3HHdmmj/ryMYjnZhNOxyCqoGdoB2dswyQEyHFBy+EQCX9GkiAAKI3neH
 P9KKGN7QQnpcu8kpUhnoacgr3CUshv4Uh1b3unRDK//R2rAn2cG5euDR0g1P6cvAuqbR
 xE8mTBXgFqJo5XVHF2e6kJ1KQmePrMZZtWE1d9EKLbzyX1G6/L5bOUCgJY54wxjkYST0
 Z94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683644420; x=1686236420;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=11Eih0nRa4OM9V/ZBjRQ1TbCEUUHW4pYY3eSa7TcXmI=;
 b=kYWyB3hQVhljwkpkuDclQ9P3c3f9oJiVAZ2B4pP9QTwkzMaUiqNifrawaMhdFs7TLr
 vDBjCKIxmivjeRNhhrXKa7m+vut9/y+/ranP2oH7hkqpmqPHtSFTJnJgQ0P5K3LqW+dR
 2xqbH0291po+rr+C1nONUtooMYWjWIdhIqKWq8Wgawt9UHuUxZsBjglcwnBBaK7T8fz1
 X3v4394zC9ZxwUp3vWJsZsKFkthl3i4kqyWE8D3DYPEhVdPLUoWhgtX2SVDyHHSFis+t
 wG5NpnaVburEKY8BMNYqXRZubu3iHtySEl7i7wkA5rKAHK4TzdsDpnyRke8Q5pitFj5P
 0ycg==
X-Gm-Message-State: AC+VfDzE1N8tM3Me8XuNitO2cznmO0H5qDL5wgYdInq9u//TOeeYcn0B
 E3Pv0Ki2UKzu25TGRXu2GyxQ7Q==
X-Google-Smtp-Source: ACHHUZ4r269D/HZaRIIwpgxvQQEz/kAV9jC7fTbwgTnucaf5ZrEPAeqzoym1jc/EPwLuel7dBMbqAg==
X-Received: by 2002:a05:600c:2108:b0:3f4:22ff:812 with SMTP id
 u8-20020a05600c210800b003f422ff0812mr5806756wml.26.1683644419663; 
 Tue, 09 May 2023 08:00:19 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a7bc40e000000b003f4272c2d0csm5285662wmi.36.2023.05.09.08.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 08:00:19 -0700 (PDT)
Message-ID: <83d9c36a-2e85-46b0-0b5d-7674a3cb584b@linaro.org>
Date: Tue, 9 May 2023 16:00:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/i386: fix operand size for VCOMI/VUCOMI
 instructions
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: ricky@rzhou.org, Gabriele Svelto <gsvelto@mozilla.com>
References: <20230509142639.253947-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230509142639.253947-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/9/23 15:26, Paolo Bonzini wrote:
> Compared to other SSE instructions, VUCOMISx and VCOMISx are different:
> the single and double precision versions are distinguished through a
> prefix, however they use no-prefix and 0x66 for SS and SD respectively.
> Scalar values usually are associated with 0xF2 and 0xF3.
> 
> Because of these, they incorrectly perform a 128-bit memory load instead
> of a 32- or 64-bit load.  Fix this by writing a custom decoding function.
> 
> I tested that the reproducer is fixed and the test-avx output does not
> change.
> 
> Reported-by: Gabriele Svelto<gsvelto@mozilla.com>
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1637
> Fixes: f8d19eec0d53 ("target/i386: reimplement 0x0f 0x28-0x2f, add AVX", 2022-10-18)
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

