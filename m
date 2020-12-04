Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D322D2CF6FD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:42:19 +0100 (CET)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJmM-0003Va-8A
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJku-0002lS-VL
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:40:49 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:45659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJko-00042U-OF
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:40:43 -0500
Received: by mail-ed1-x543.google.com with SMTP id r5so7429403eda.12
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 14:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yFuZpM48mzNWDi1/O1LkUT35WuH/+Ad0bs1eLP76xjw=;
 b=jn992NARi2yX6RVBXCl//T9T4jOqKAnXHCYRnLRqrPFYpIsTLqJZFp5kDe+dWbCzKC
 Q4dGRgVGr+z/+TikJaAhD2ebdRgSOWKp+gm1LNA1vZS38U16ybpLTP+YryMirJCUfAvW
 Oq1KyhL7HYN2kkIRd+dBujP0NNNd5S0O7rY28Ff6VNXhpkuIOxakPc+Aav8/y+JPJY4d
 6/2NYwjyUEJPgCkSgvBxltPZuCgFzI8XsdgbSoNnkUGE8z4fCwcM9EbCoop7Z5SUeJCR
 gabQlbTwFA4TiDfH8XIV4XOOCKCOx6VZ7yzNDnWV9zv1TlUOvszh4WH2AlkwzekCxTYi
 J9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yFuZpM48mzNWDi1/O1LkUT35WuH/+Ad0bs1eLP76xjw=;
 b=bN74nvVvPkO5Ms2YA8UtIzcBXawb9d/p6YTQevJOkGDN/4EHp9DtyL0K8k06l4/6Gq
 oVJq47bzYZ+DKmeaiN2IGmiYeo+ACNZhQW5C+eqZqBNSZb837rCgryivJjPPF2QLS7uU
 o1qwy7ooX3LZxhPPXtckPW+62azZ3HN9fJjRaksOMA3Kmnfi1KZ83uCSTGY2Bjd3wFLq
 JoHSj0Ow/EAQpMQ6bPjBIJTcqVVX2yr9CZbXywF22NUJN+MZucPnBO/Cp2H+OO5uHBrP
 lnMEbVNJYCyA+/tVC51spq3JnqXuF8JuNoYlk2ZunfpkzL58ef/ZxhXTeljsi3EXASzZ
 8lLg==
X-Gm-Message-State: AOAM533ZK4ep5nTXoqqMDYTdu0l1aJBfTgtB44tsnB17wLP3C0MN0akh
 X4FOpKAWK0DkH8iHmCD8HPQ=
X-Google-Smtp-Source: ABdhPJzympze9tyI6snkyWlCdfjmFbZCPUnQfJl2h34rcd2QwgUzg4LF92mQVV6Y40WN7i9rDWK6xw==
X-Received: by 2002:a50:9d4f:: with SMTP id j15mr9833060edk.69.1607121640667; 
 Fri, 04 Dec 2020 14:40:40 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id q23sm4168605edt.32.2020.12.04.14.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 14:40:39 -0800 (PST)
Subject: Re: [PATCH 6/9] target/mips: Alias MSA vector registers on FPU scalar
 registers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-7-f4bug@amsat.org>
 <ac68e51c-650a-55df-c050-c22a1df355b5@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f528a49d-2476-8e8f-e6e8-afc115864b1b@amsat.org>
Date: Fri, 4 Dec 2020 23:40:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ac68e51c-650a-55df-c050-c22a1df355b5@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, kvm@vger.kernel.org,
 Huacai Chen <chenhc@lemote.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 5:28 PM, Richard Henderson wrote:
> On 12/2/20 12:44 PM, Philippe Mathieu-Daudé wrote:
>> Commits 863f264d10f ("add msa_reset(), global msa register") and
>> cb269f273fd ("fix multiple TCG registers covering same data")
>> removed the FPU scalar registers and replaced them by aliases to
>> the MSA vector registers.
>> While this might be the case for CPU implementing MSA, this makes
>> QEMU code incoherent for CPU not implementing it. It is simpler
>> to inverse the logic and alias the MSA vector registers on the
>> FPU scalar ones.
> 
> How does it make things incoherent?  I'm missing how the logic has actually
> changed, as opposed to an order of assignments.

I guess my wording isn't clear.

By "incoherent" I want to say it is odd to disable MSA and have
FPU registers displayed with MSA register names, instead of their
proper FPU names.

The MIPS ISA represents the ASE as onion rings that extend an ISA.
I'd like to model it that way, have ASE optional (and that we can
even not compile).
You can have CPU without FPU, CPU with FPU, CPU with MSA (you
implicitly have a FPU). If FPU depends on MSA, we can not take the
MSA implementation out of the equation.

Back to the patch, instead of aliasing FPU registers to the MSA ones
(even when MSA is absent), we now alias the MSA ones to the FPU ones
(only when MSA is present). This is what I call the "inverted logic".

BTW the point of this change is simply to be able to extract the MSA
code out of the huge translate.c.

Regards,

Phil.

