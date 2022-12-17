Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A4764F5F4
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:15:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Kpw-0002y8-DE; Fri, 16 Dec 2022 19:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Kpu-0002xu-DK
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:13:54 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Kpp-00087o-4V
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:13:54 -0500
Received: by mail-pl1-x636.google.com with SMTP id d15so3842235pls.6
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DRsluQlTEZM4Vyr/Nq91RokMTh2BjVg3+hSA+9YDHoI=;
 b=M2uCjiib+LocLCKTfvvtochERJPIQT6JoOLMEh6WtgkFKOyVCU0eLIFPUeqaHZbm1a
 TPWLG1uHvdKC50mZfAz2whvsfZFUghaaQDZiTUaUgWFv93TcJaasVLKd+0z4Pr6l9R01
 D0/aIUekNC1ltApXkmI07Pfycd3ukGRF9RK6ZHCjYyZNJtjUM55suOQz963hiQWuFXPn
 3hPrqkV0vqJpmAHhzCWqRzfcmyIAGs/CRhj3BVNMJpqnTwLli1jPiilmpaIuFV37CTcN
 tsq9BDfBp1pj9jesXHJGotDydrSxi72eU8fwOano2sFpNjFum/eETxu5nARUdpdhMIzt
 qyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DRsluQlTEZM4Vyr/Nq91RokMTh2BjVg3+hSA+9YDHoI=;
 b=fhMWMfA9EfFkrHWU6sU3Ndxm7BRDprRlrgd2v6alT5i1g5nIpP19GWgdlU09a0Kjsv
 nhWkB4dr8N69xJ7PGiJPty5gbktlOdGTcx9X+J5qBLmSAooU8wMdW3vCXBk32lPZWivc
 +pGz4s7hZ/XD0GEfRSO16RjXS6WK1O+/B7wEV6fQmF64xWSkM/2HqU+cqHB3pZ864ZbD
 mD+ffzX+a2IsNPZ2o/yBidg97/zbwqEsaupxWTyTDLFtpL0bHdFQAMK5kwzI6lwwtqi+
 wQEr3yuZiTvGYAln8nW9Q0iU6vAKLIaDZ5QTCHM0xDK1VH/f9+K0ikHTsNMQVkgvAqg+
 dY5Q==
X-Gm-Message-State: AFqh2koFZfywQPzPcvG5s4cYvlqk7p0N/rX/yEqX0+8IzhfIluW3zBCf
 9ogmO7yUJo6QHUlIQb0NgBb5vg==
X-Google-Smtp-Source: AMrXdXvFfvz6PEBZsrGDU83/ycPsmui3vYyK1MdSVRpwhkA8JEHyznGCb7OcHB4S6XxsDWqt2HbTfw==
X-Received: by 2002:a17:903:285:b0:191:3c6:1748 with SMTP id
 j5-20020a170903028500b0019103c61748mr4147078plr.11.1671236027395; 
 Fri, 16 Dec 2022 16:13:47 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a170903228100b001867fdec154sm2181773plh.224.2022.12.16.16.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:13:46 -0800 (PST)
Message-ID: <7f555a78-1533-7be6-f627-6e594a19c04d@linaro.org>
Date: Fri, 16 Dec 2022 16:13:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/5] target/arm: wrap semihosting and psci calls with
 tcg_enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20221216212944.28229-1-farosas@suse.de>
 <20221216212944.28229-4-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216212944.28229-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/16/22 13:29, Fabiano Rosas wrote:
> -    if (arm_is_psci_call(cpu, cs->exception_index)) {
> -        arm_handle_psci_call(cpu);
> -        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
> -        return;
> -    }
> +    if (tcg_enabled()) {
> +        if (arm_is_psci_call(cpu, cs->exception_index)) {

This could be

     if (tcg_enabled() && arm_is_psci_call(...))

because...

> -    /*
> -     * Semihosting semantics depend on the register width of the code
> -     * that caused the exception, not the target exception level, so
> -     * must be handled here.
> -     */
> +        /*
> +         * Semihosting semantics depend on the register width of the code
> +         * that caused the exception, not the target exception level, so
> +         * must be handled here.
> +         */
>   #ifdef CONFIG_TCG
> -    if (cs->exception_index == EXCP_SEMIHOST) {
> -        tcg_handle_semihosting(cs);
> -        return;
> -    }
> +        if (cs->exception_index == EXCP_SEMIHOST) {

If you were able to replace the ifdef, that would be one thing, but since you aren't I 
don't think this requires a separate check.  There is no way to generate EXCP_SEMIHOST 
except via TCG.

I guess I don't insist, since you're working toward Claudio's much larger patch set, so

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

