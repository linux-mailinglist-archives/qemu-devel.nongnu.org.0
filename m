Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CC16DB7DD
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 02:38:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkwaL-0000Cs-9K; Fri, 07 Apr 2023 20:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkwaI-0000B6-Eq
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 20:37:38 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkwaG-0005yI-UE
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 20:37:38 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-517baf1bc87so33614a12.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 17:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680914255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FlnYyalzN/iYxpFe1DybwocYPl8XORXDn/OIhRtakc4=;
 b=jD/5aTfjyaqC30FvcPzK1FczFQvjqacUTe6hG7h7Zdejg2oqWWAxgluXNmGIKRau7Z
 aCv0iGDV9NKf/eTTyW03asl72Ya09KyKgvltAiInJJ7jP3tIPSLwGu/U8PKdhS+BUSje
 o0IMuUyW0Wp56hmbf1TkgK5jgSn0hDE5uleDPAoa3y6mXvo6uAvglTH0VAD4WsZzqMve
 xHOcVyp1Is8jg2qJ3e1Xs0LP/X147jJLfPm3uHUN5aQ7m4kGtDxuSUfWbi+J105NC+Bo
 FJc1L95ryAhR3qGy+BLef2OPTuiayCPXNzvjEYwZyHqWiCZqWlaChfRFFBJqLFw6IAi7
 SzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680914255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FlnYyalzN/iYxpFe1DybwocYPl8XORXDn/OIhRtakc4=;
 b=hbrwggWHLUhE72CowuLWO+NHyK/x7CJT9IxLpE+EhHEkOHuJfg64wr3driPw226Z9u
 0ecJPE7tjgda6IiBL75/fR5nZRofOzEaTAqGHNRxcRyDUpFL/1doCFxBZLNWDstMkyhl
 CY1O808qQWpDhgOt3TkAh6dcXR/Jpx0vq41xre5MJdqo0rl5IRF3r1juy3hW5AZXMIJd
 Qm2Qe0q/Xk+g1EOIIBug2shWqxGJttk8bFRU0w0058MvLgG+2IpNwcaduT0NVHJQx1RT
 ilUPfnZ83m0UFYWi2vpIyJBD6Y+mxNkmNYbDP5jn8s3BJivW0owDVmH591IsCKJ/fW9X
 /tgw==
X-Gm-Message-State: AAQBX9fC1CN4wJ1qZPDzAgeraePIIvugNT3B/491xIGEwn1gCUWGsfP5
 SyZwVe8BtwsgFzTT0SihXV6y4g==
X-Google-Smtp-Source: AKy350ZFn5BoldKrbBUWslJpxAkAjDJBSYdQq+Ec5vWs6+jDZvrCocT7tagi2MsZlaQ9G0+7PoMgYg==
X-Received: by 2002:a62:3884:0:b0:623:165e:e459 with SMTP id
 f126-20020a623884000000b00623165ee459mr3904159pfa.7.1680914255611; 
 Fri, 07 Apr 2023 17:37:35 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 6-20020a630706000000b00517be28bcf9sm145504pgh.86.2023.04.07.17.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 17:37:35 -0700 (PDT)
Message-ID: <bbb6afe3-60b7-04c5-a65e-62873744d3fe@linaro.org>
Date: Fri, 7 Apr 2023 17:37:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/10] accel/kvm: Declare kvm_direct_msi_allowed in stubs
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> Avoid when calling kvm_direct_msi_enabled() from
> arm_gicv3_its_common.c the next commit:
> 
>    Undefined symbols for architecture arm64:
>      "_kvm_direct_msi_allowed", referenced from:
>          _its_class_name in hw_intc_arm_gicv3_its_common.c.o
>    ld: symbol(s) not found for architecture arm64
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/stubs/kvm-stub.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

