Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE35440076
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:40:57 +0200 (CEST)
Received: from localhost ([::1]:41090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUw4-00069E-Gu
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUsi-0004g7-TX
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:37:28 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUsg-0001b4-8d
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:37:28 -0400
Received: by mail-pf1-x42b.google.com with SMTP id v193so9739031pfc.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i0UQ3SyOcTaW8TgjXBrffeFfL0FczdYpJy31RPxhghg=;
 b=vCKNkSW/4XiZZnTH0P2ORt9ZDeJewRAtVqnwhSs8je3QBvfGAfBwsCF3kn+DCgH8mJ
 ZxHPjcdraTL6bFffpplhSCKzBVz7G/PwD4qmmlpjZyIN5oZQ/ie+TfFGvwYv9xkcLJVt
 2alIsvXUdfA3Ez1GaGtYA/KYGkKgVjAIvmXA/GNcd+Ivivw/RL3aosjLbwhJnhKk4zrW
 HLjEhlXz+Pb3MATgEII0uDn2lDShrsvXAPG9hm7xVyQoUmCqq+0uKP448HI9+XWnq3yj
 0LbWzhYtLoD0KxTT9dcLSh6jaqx4LbBXt2YXOg+pjnYfzEdEEk4M6I21T+5qc6Bd2Miu
 gU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i0UQ3SyOcTaW8TgjXBrffeFfL0FczdYpJy31RPxhghg=;
 b=2oJ8oaKE5iC/uHshCxROgmCgXsvm7pZ2WGzSk63UVw0U5EREjEfpJIcguI4TUIQYat
 qtswN1aIxmZUQFp3ZxQ2MDoqGTgt+jXfeXRAS975TmXBb7wrWJMYvx92d5TUCXfORiOJ
 6BoIL8Z3OoArtRJF+DwMf64DpWtGkVQmS/p4cOXpLdu3IRYgEr5Ya9zZsifzGZ808H4m
 0JMcM2l6nAaEvjKUF1ZFc8Czqdx/imNVr3288Hw9+JNn7x64/rfKZebCUhZBXQI0lQWy
 S+9uYCXqD9HHLea6U4M9kjsM3EdJw7NDsNDd0ffhChD2gqNKGdOLyYD7K8y0yLJ4mbzJ
 uS7w==
X-Gm-Message-State: AOAM531NbXVfA86YO/wO5Ge45a1vYCjFgK8XJ71pCHel0XRwagFQZQE5
 CogCZBHNJDu5Gi1bNL3PwMD2mw==
X-Google-Smtp-Source: ABdhPJzHNSx/8wcG48Ir9dkbgx4CpnARVx/uvPKYImceSvonufKHMXycUBfVf/hJIKbzi0A2fTPeEg==
X-Received: by 2002:a65:44c4:: with SMTP id g4mr9174934pgs.254.1635525444862; 
 Fri, 29 Oct 2021 09:37:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t4sm7445954pfj.166.2021.10.29.09.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:37:24 -0700 (PDT)
Subject: Re: [PATCH v3 21/32] target/mips: Convert MSA 3R instruction format
 to decodetree (part 2/4)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211028210843.2120802-1-f4bug@amsat.org>
 <20211028210843.2120802-22-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08ea5ea4-371c-3ac0-bb6b-0685d78df1bc@linaro.org>
Date: Fri, 29 Oct 2021 09:37:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028210843.2120802-22-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 2:08 PM, Philippe Mathieu-Daudé wrote:
> Convert 3-register operations to decodetree.
> 
> Per the Encoding of Operation Field for 3R Instruction Format'
> (Table 3.25), these instructions are not defined for the BYTE
> format. Therefore the TRANS_DF_iii_b() macro returns 'false'
> in that case, because no such instruction is decoded.
> 
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v3:
> - Remove TRANS_MSA(), call check_msa_enabled in trans_X()
> ---
>   target/mips/tcg/msa.decode      |  11 ++
>   target/mips/tcg/msa_translate.c | 182 +++++---------------------------
>   2 files changed, 35 insertions(+), 158 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

