Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA4675F2B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 21:56:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIyPh-000451-Cz; Fri, 20 Jan 2023 15:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIyPe-00044Q-LU
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 15:55:02 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIyPc-00071N-9A
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 15:55:02 -0500
Received: by mail-pj1-x1034.google.com with SMTP id lp10so3293286pjb.4
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 12:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+zuvM2l4DFBFxSg2GhwkGde3dfqe7an6vGmKWqfZd5A=;
 b=ahTeXmuGBwODLBpVWFBx3fjoArxAg8jg5xqVWCIczgPqocKiNwg+mSjx4/1K1M9bCy
 7vPI6z2PDsgqzUDGSxPIwRx5w9lgvb1MWKNKvQxDWU3Nj2ZEREaSTShjMbM/kV+9TJdg
 EMZVkr5T2T6MiONM6MPVYUUHCQF9/nz5PREia46Z4wKqX1q+H4Kwq+fZq1soQSSaPgVB
 DTdPkknARqL1pnA3KCPplX4GQLKqdemxWIaYdUpuHwLU+eEpQmOTsZCuNmgiOOp8g76L
 aktsm3yiVP/8dnkbuNBCFrRvfOwKUyRSK5oBO4uI4eZqoTfucds562w0b1yv9owBr0DN
 cxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+zuvM2l4DFBFxSg2GhwkGde3dfqe7an6vGmKWqfZd5A=;
 b=7ZZUmSTZSXDQpp/HqbY2mpiwt3/dXA89VOZedsk7xYZX5K0hkbTYFNDfPL09oaJUHS
 20TLKhLNsduC3HsGz6QNNYxzggiEvmSWyNFA+0miTOvaZObtK8KcByf6OjKH1ff8qL0m
 dZ/wykTJsleOs76m/+covT1wMWOClpdJTf1bQlKbNPAYgi0sRW7JPzx2M2nzrqADPd4o
 0XSO7nMAjROoZ7H1OqM6wgoND2l0pGsUz26dzmn99fgZnigZLT0d+MxC6Eb1cs6Ek1XJ
 yiS+rtG9Pcf+VE8Fcw3zOG5EoH2sj18QJgCeE8c7Xu2X69rr+jdlwLt3meNDSwYFQz1W
 CCxQ==
X-Gm-Message-State: AFqh2kr1p0xO7N9Wlp2JE8J5fRedZkRb3j/Av7+WWzBKWtJMKR9vwO3S
 Yf+eP3WFzoOuJSz+NoZ30HqQoA==
X-Google-Smtp-Source: AMrXdXuTSjGYG5AsKEGq7G49k/CIH3H3Mrt82ocTXIjiwNFTlpvISbuHCOttryzv7sFbija3Gpr8RQ==
X-Received: by 2002:a17:903:2442:b0:195:f06f:84ff with SMTP id
 l2-20020a170903244200b00195f06f84ffmr2345511pls.50.1674248098309; 
 Fri, 20 Jan 2023 12:54:58 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 e2-20020a170902784200b0017d97d13b18sm27283244pln.65.2023.01.20.12.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 12:54:57 -0800 (PST)
Message-ID: <c6a6a2b2-930e-0e9b-400f-cc0e5027cd4e@linaro.org>
Date: Fri, 20 Jan 2023 10:54:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v5 3/9] target/arm: Use "max" as default cpu for the
 virt machine with KVM
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-4-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230120184825.31626-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 1/20/23 08:48, Fabiano Rosas wrote:
> Now that the cortex-a15 is under CONFIG_TCG, use as default CPU for a
> KVM-only build the 'max' cpu.
> 
> Note that we cannot use 'host' here because the qtests can run without
> any other accelerator (than qtest) and 'host' depends on KVM being
> enabled.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Cc: Daniel P. Berrangé<berrange@redhat.com>
> Cc: Thomas Huth<thuth@redhat.com>
> ---
>   hw/arm/virt.c | 4 ++++
>   1 file changed, 4 insertions(+)

It does seem like that path of least resistance.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

