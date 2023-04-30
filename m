Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446946F27E9
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 09:12:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pt1D4-00018a-MA; Sun, 30 Apr 2023 03:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pt1Ct-000167-DC
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 03:10:53 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pt1Cr-0000Im-HX
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 03:10:51 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso7518295e9.3
 for <qemu-devel@nongnu.org>; Sun, 30 Apr 2023 00:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682838648; x=1685430648;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DGsjRJGpFKSin6aJ1/KLRBV//FsH8I0MO9WXHTpqa0g=;
 b=krUUj230o0zsOVvEGzG4RAccg4zHqVwbnNh2fFJSZ6GoDSuILU4r6hxY5QDP/O4LKX
 z6CLZmUbeE1k/MlPcHqCnFG4Iboj/Q7Qm09BnwT7iFbaYGRdUg9uJ0We4rF9fCo6sCOr
 meOmEMqU8LNQrXrcSzzPw4FdtlQh87v1rxZXZ2oDMH+caSDGJq+jyqyaSQAfIV4hf87Q
 2xhnbiGnSqbl0OGN5KI+GR3q5qOktp9+LGROP426XNurmvU6mRIOwdkX+08icZD29G0B
 /EeXoqeaLJazllKMUjVOoN2s/pTXmK599V0k6GYz/tTryIWQAq5Pk0EPtgUqOxiKCbta
 VN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682838648; x=1685430648;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DGsjRJGpFKSin6aJ1/KLRBV//FsH8I0MO9WXHTpqa0g=;
 b=dlwr7IZPwpjBRFvM0uvvcpyqbHat5jJz/1Xg4l4w2At3k85cTve74nSOy35OMKk7j0
 1YKP9GyWbqY+FKOpeKRS95KCWnJgAxuVnqqYgUzewZ1ZF8ydmfhYq8VEzTnPsu5mdGn9
 09mYOWjJCFyo185T9sP+Tq7qNK/9EsaS5c7bMAwiATXO2E/qr4LasPEKusfbSsQdSWlI
 sRKpYt3wxjlTXND+08jIklf4kKkb4FJtkYw4cbaSHsXwR/bTCHcDi3thrV1RIZ+glffM
 Cou7RJ1UfYUaXP4eBGcVZGAZnnSxhHpaYnKWMSagOBEw097s2lhytoVS8YjfXDfkPBoz
 KuPw==
X-Gm-Message-State: AC+VfDydbe/FfQYMUR3yUnPn5CR3ylmzfz35hla4QsYZ2fZViIT/zWq1
 79eUikTvI+N9Sh05N/9PPrJctA==
X-Google-Smtp-Source: ACHHUZ5oDZwtYBYRBbSoep5TrBUoYIDTMyTkmhxOCgMlEOiTuTRbcNPnSR/bD2CMpJzBIlwuHrPwIw==
X-Received: by 2002:a1c:6a17:0:b0:3f1:7675:fb82 with SMTP id
 f23-20020a1c6a17000000b003f17675fb82mr7616823wmc.10.1682838647787; 
 Sun, 30 Apr 2023 00:10:47 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a05600c215300b003ee20b4b2dasm29139274wml.46.2023.04.30.00.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Apr 2023 00:10:47 -0700 (PDT)
Message-ID: <21fca7e5-7785-51b1-6dbb-02eaca329c67@linaro.org>
Date: Sun, 30 Apr 2023 08:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v2 00/16] Misc patches for 2023-04-29
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230429122024.231495-1-pbonzini@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230429122024.231495-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/29/23 13:20, Paolo Bonzini wrote:
> The following changes since commit 05d50ba2d4668d43a835c5a502efdec9b92646e6:
> 
>    Merge tag 'migration-20230427-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-04-28 08:35:06 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 42abcc584174166342297421209932a87bdb85f1:
> 
>    cpus-common: stop using mb_set/mb_read (2023-04-29 14:19:01 +0200)
> 
> v1->v2: drop hexagon patch
> 
> ----------------------------------------------------------------
> * Fix compilation issues under Debian 10
> * Update kernel headers to 6.3rc5
> * Suppress GCC13 false positive in aio_bh_poll()
> * Add new x86 feature bits
> * Coverity fixes
> * More steps towards removing qatomic_mb_set/read
> * Fix reduced-phys-bits value for AMD SEV

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~




