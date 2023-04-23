Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553B76EBEAD
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:50:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqXHp-0003fp-3c; Sun, 23 Apr 2023 06:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqXHm-0003f5-G0
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:49:38 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqXHk-0000st-Ml
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:49:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so2032744f8f.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682246975; x=1684838975;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mAFdUFz1uLt8+wrzK4MHAZ+dRCZItK5VLk8fdIxT7f8=;
 b=RhYuEwA8dytffg2w5jOqcRx+/y0sY82+VF9lOoGpMnRt17gYYyrpAGK0ssjlWHrKcp
 DxWO1XVmzwdx/zHbo5vlnvp3tS4uyv1/sAh8bLwdmD5S2JsXGfCeXWwm36UmsP7D2+Cv
 4zyt7nTRwkoApQzH4LHgPihzUVIgO5Eynz3dsir2wjZY2WM0CwQmEYpHxs1coe5K1TUP
 g6Syn+cr3RqjZaDFuKkcvBO53UZRfugNeqUZU7wPXTYBAVkZAGTFNNjFG1ZjFVUq+4eC
 0Bg7ETCYED9W+YIVe/DPkH/vbEUTgm4WQwf6fpyHAie/dRR0LVEEtR6uGjhYkOry1BQa
 KK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682246975; x=1684838975;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mAFdUFz1uLt8+wrzK4MHAZ+dRCZItK5VLk8fdIxT7f8=;
 b=aBSSBeQOq6QanBLRtFxR2zzsx+4pa7/kymy4iomXskyS5PbyBu2NK8ynl/APnnmqq6
 6Rhy3tBc8WJ7Z32cwPzIVER/isOwnPMfYThKy1x0QUbIFdSNMMKauIR+/5kNPl7FROjI
 YAdVkgMz3g5tQIv+nz+Xxj9xeQe7C59xymhnnIu3krH8QlSsvaut5A0h4BtW/eIQVEuN
 xMHD2XXkBXEnTLtfYkA4+T90zu/3Zl7taZol4DjGRigpB1qIbIgbKax0Gr/brrCZF1nP
 FX2bZan4Vu1tKtSyk0widbAhWRDnjsvytioKMWFQgQkC3pIPOgMMMWsSX0a9UlKcZLAe
 iq4A==
X-Gm-Message-State: AAQBX9etvoFrtLEKWydI3HR7Y7NDHL8wh4iuvVK/V8tQCyk90Alh/r5J
 6dyNlnKD2/hWNWiIQIYPPv7eNg==
X-Google-Smtp-Source: AKy350Zldb5iwFGZOfB+QN2Bb2idnwJwse9kj9roK4xX7hi7zvx7HaGtx7kuXPkpyv+QN85NcGsD0Q==
X-Received: by 2002:adf:de10:0:b0:2f6:e580:534c with SMTP id
 b16-20020adfde10000000b002f6e580534cmr7625869wrm.61.1682246974997; 
 Sun, 23 Apr 2023 03:49:34 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 s13-20020adfeb0d000000b002fb6a79dea0sm8505777wrn.7.2023.04.23.03.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 03:49:34 -0700 (PDT)
Message-ID: <8f2d0b21-41c7-1f52-9c53-842320f63148@linaro.org>
Date: Sun, 23 Apr 2023 11:49:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 03/11] target/arm: Extract TCG -cpu max code into a
 function
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-4-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230412121829.14452-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/12/23 13:18, Fabiano Rosas wrote:
> Introduce aarch64_max_tcg_initfn that contains the TCG-only part of
> -cpu max configuration. We'll need that to be able to restrict this
> code to a TCG-only config in the next patches.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpu64.c | 32 ++++++++++++++++++--------------
>   1 file changed, 18 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

