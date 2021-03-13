Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B05C339E72
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 15:12:24 +0100 (CET)
Received: from localhost ([::1]:48454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL50B-0000IP-DJ
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 09:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL4yA-000721-Aj
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:10:18 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:36959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL4y5-0006lT-Bq
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:10:18 -0500
Received: by mail-ot1-x32d.google.com with SMTP id 75so4946700otn.4
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 06:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ks2IIpcRC8qVjdcBYxOZDYofF1rpCbI0bkuU9scgC2U=;
 b=jBZmVknswJcJj40TapII6hNmjfrMGB4GMcKkyzXKtK5C4neRAxkeO68Ea7BHrmuABG
 I9FCJ0SNlEkHYvjXG+O88GlVRVnrvN5tkBGYh1iaJnaPvO7I2fUg/ro+z3uqPPGkADwf
 abOsI8Y+lKdXCfHMyHGOTIfzuBgZYT/PKztSEtOb1YalciHg2T6LI8clS4FcmUFBycAB
 ZbW0aAPdzIvWJlHIFWcT/GrRFQnNa0nsNq3cNau/C0R7JSKvr0i0Ke7IqkJ08mhm5n1H
 JEsfNKfvkBq5MnZWadFh9h5bsReyuTKL09DQdlgxTWLdfisDyVd6Zt3oSPVWxEKDq9tK
 /yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ks2IIpcRC8qVjdcBYxOZDYofF1rpCbI0bkuU9scgC2U=;
 b=OI3rVGl1QnBb3VSoCfosTnSed39EJMYGc5xkNn8eRO0L88N0iRZLZ3ZW9+2vRn33qQ
 t2PLsVyXSDKa48czxCw+uRVr7KKhPFOZVlEZYZhyC9xmIrMUoduOHoFAfJXmu3RkhjMt
 pQkpWfsV3GyjEiccFCkFlWEOPBb0rDtvHy5s7ZsIRNX/kl6t8GrGEvV80esTEbqrHwYP
 RvnlpTQqZqJN2CHxvK1HrYRRFfFHacXyBGA0bG0mBsfaZ81IsySwsVWzkOTY0T0IIFas
 biiUEaPB1tO8x0iaipz5WRxAmCoZ/k5Pydp8vp5AHUetm+OMW1IqgFgWuj+3xawdz2Un
 DH6w==
X-Gm-Message-State: AOAM531I53xe2GHzW3wmY8fcw7l8oVlf7st7YVpwvsRbMs47SwgtcSJ9
 U6TtsyZVQ2v/ubNJTrJH3SbZzg==
X-Google-Smtp-Source: ABdhPJx6YI6b1zMTTlHgrQbMjdEujmH88+B+KYY1HWob5QnlYUiRqKf1b9tG4fTpvmRiyXlt4xJPyw==
X-Received: by 2002:a05:6830:2472:: with SMTP id
 x50mr7243530otr.69.1615644611217; 
 Sat, 13 Mar 2021 06:10:11 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y11sm3169784oiv.19.2021.03.13.06.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 06:10:10 -0800 (PST)
Subject: Re: [RFC PATCH v2 14/22] target/mips/tx79: Introduce PCGT* (Parallel
 Compare for Greater Than)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210309145653.743937-1-f4bug@amsat.org>
 <20210309145653.743937-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb1bfaae-57a9-0a02-0a45-13e504469eb8@linaro.org>
Date: Sat, 13 Mar 2021 08:10:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210309145653.743937-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fredrik Noring <noring@nocrew.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 8:56 AM, Philippe Mathieu-Daudé wrote:
> Introduce the 'Parallel Compare for Greater Than' opcodes:
> 
>   - PCGTB (Parallel Compare for Greater Than Byte)
>   - PCGTH (Parallel Compare for Greater Than Halfword)
>   - PCGTW (Parallel Compare for Greater Than Word)
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Message-Id:<20210214175912.732946-21-f4bug@amsat.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


