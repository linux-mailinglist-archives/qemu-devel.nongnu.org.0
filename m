Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9034BBC57
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 16:44:23 +0100 (CET)
Received: from localhost ([::1]:57676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL5Qj-0004RZ-Lw
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 10:44:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL5PW-0003n8-63
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:43:06 -0500
Received: from [2a00:1450:4864:20::32a] (port=44761
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nL5PR-0006Wv-9v
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:43:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so6684750wmq.3
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 07:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yEDPNOLHcoUCVGLLRrg1qEOR0B2zD3ZMPLBEoLNn4bM=;
 b=UiPseQ5j3eAWfqheXcfnULIQ1q1far90VkJYQMmROcJF1uMq6gU6RLDa5mijp+G4oO
 75tn+4NfeZyX2Grn1evd0KOJyxx2j9Ud10UHbK851smmxzA1u38rYLp74sBUmMyCLFUW
 DS2VMfcIltk/s+liSVT9XPsXOzT4kZxYKKt788g5THHJ/9oN0g1xU6XYlpJFU2QnG1fb
 DQ5EkRGxtuxpZQWUeqUO5d8Q/UXjsh8MVyByIgG02pp2J2vVHe8WEEETwT9NOSCaizc+
 8KxZ+Vrvk8SFMs+ZUDHGiozYObY8K2fsExm8k1peq2fsmUHYRkyNxQNIT8wFIU23CnWE
 b0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yEDPNOLHcoUCVGLLRrg1qEOR0B2zD3ZMPLBEoLNn4bM=;
 b=o6YK4rsnE6Kl9vx38GuZf9jhRdyOpcnXoUwh8YGTnRVxVRSeZ+lTdn3zABwRHvxxwk
 Q9RlROf8sGPzB6aBCQUyeQ0mKc2S5yndxb7Vwe88yvCfxuR/zPcqvwykW6mam79fkRNW
 TNgHZUYOk75TwAPppxBM42XnO+y9aXq8G5W735UIRNYbj6a3AUA1AEbpkJ2u+cvWvAqt
 GlW27/Iiokd8dJPHSU/DcBPXm3iBu/HMAm4XRldC6264F4xSmbHQHgP3l6obJNjM992C
 evB/aHyMB0r3eaxt2bwiz1l6ybLL2Vs1pdgLK1VgfY/Sjwm++R62ujsBIrJ5PTAoDnEi
 w5yw==
X-Gm-Message-State: AOAM531i7UuIvLZd4CX6rIEfHvsZZKFfdINSlTOF0z0UoOkvoG7wLfZj
 Ex1YqaFYJpkTRFX7YUTPiWo=
X-Google-Smtp-Source: ABdhPJwjTanCtOZVS4YnAPPze+frjHAicOFiLUG7JRD0xP3o/70FokwJSiNiOXQoUoYrzMl4h04gFA==
X-Received: by 2002:a1c:7303:0:b0:37c:9270:2ff4 with SMTP id
 d3-20020a1c7303000000b0037c92702ff4mr7675508wmb.99.1645198979804; 
 Fri, 18 Feb 2022 07:42:59 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id k5sm31223099wrw.117.2022.02.18.07.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 07:42:59 -0800 (PST)
Message-ID: <d2275895-1c96-b89e-49a2-612f8656147f@redhat.com>
Date: Fri, 18 Feb 2022 16:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/8] configure: Disable out-of-line atomic operations
 on Aarch64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220215170106.95848-1-f4bug@amsat.org>
 <20220215170106.95848-5-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220215170106.95848-5-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/22 18:01, Philippe Mathieu-Daudé via wrote:
> +
> +case "$cpu" in
> +  aarch64)
> +    write_c_skeleton;
> +    if compile_prog "$CPU_CFLAGS -Werror -mno-outline-atomics" "" ; then
> +      CPU_CFLAGS="-mno-outline-atomics $CPU_CFLAGS"
> +    fi
> +    ;;

Apart from the question of whether/how to work around this issue, this 
should not be added to CPU_CFLAGS.  CPU_CFLAGS is only for things that 
change the ABI.

Paolo

