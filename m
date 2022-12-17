Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB32564F583
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:03:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6KfE-0007yN-IL; Fri, 16 Dec 2022 19:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Kf2-0007xT-6l
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:02:40 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Kez-0005TQ-W0
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:02:39 -0500
Received: by mail-pl1-x634.google.com with SMTP id s7so3826726plk.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FTNF8GdetRsvzolrB/PraAedUHNM71Iq3K54zGZxPzQ=;
 b=TnQbJa12FYmbTVjdm7XIT7wVQwhaUtDJenSyThd6Ul5VJVOSEnEhG00QD2WFlcammw
 bCwx5C3ToMQLCBgBZn7VQBkC/ckoyFqJDNs47mp4SJ5W25RAAd/9k9vrRuQZBHvMVATz
 Yd4U3RR/z/C6nFhfdxKfPhVuBEqeF3nlruZfuJFaiZWUP3WnW/Sw6pRwRw8Ux6D5V91f
 lZSFPnhNX6o8wujgjdgz0bKN1ebPzm0JI1sgPYbjuTO+ZElJCHCYXiMNJgq4E4P+4+P+
 Fz5Y4XmGw3ICYFqdN83grh6oxSl507uhlih/1Jf4dnAnHR7QxUBgv7ZwVeOSrACuL6Wm
 YuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FTNF8GdetRsvzolrB/PraAedUHNM71Iq3K54zGZxPzQ=;
 b=fZYRitf+jlEx0z4HS7f67z5oHH4sAYRIpSg/KxuF7DJlcp629DuQTK6Ne572XY4cr7
 rWnlImOwkYqFMSYcvMwvvcRtHH5hNPFHyrJlHuG0ynBIgaFfnS1/Ob9IxWPDSYRXAGfK
 C3yLt+yircj2Wz83E37d+rSD4r4LPrcAeVM1aykq0WvvlGKlKmkqznefWDQJikMHcJW/
 prs2rIRtxmFEUUv1RtUv4a00tvucZqMQ1p9WGG+z42Oe0q0FXVPD6/tC3Ayao++UzmZf
 +vxmZvN8Dxggedb/LpBU7MlwuSHsODfw67QFaB4HZ3n2ZImX9mJGlgcWaBxmoWZyZeAt
 aF8A==
X-Gm-Message-State: AFqh2koZ9CsMzUbQDMLUc2iEsKb/Kb6e+eJ5FUJDaaTyijz1Y+PrRAyG
 YMUK3BaZdHhkIS8rZzdvCiaF6g==
X-Google-Smtp-Source: AMrXdXvEoMsclP3IdRIOqc0jUs+tPWd6GnWs2+EniG1hT8vIHHubL75tYjp47V/SNIIwo8MUoHqflA==
X-Received: by 2002:a05:6a20:8ba5:b0:ad:f2bf:bc2b with SMTP id
 m37-20020a056a208ba500b000adf2bfbc2bmr164002pzh.60.1671235356551; 
 Fri, 16 Dec 2022 16:02:36 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a621b11000000b00576a89978e5sm2025821pfb.63.2022.12.16.16.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:02:36 -0800 (PST)
Message-ID: <afce49b9-c2f0-cb74-86af-b4c9b50165cc@linaro.org>
Date: Fri, 16 Dec 2022 16:02:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/5] target/arm: rename handle_semihosting to
 tcg_handle_semihosting
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20221216212944.28229-1-farosas@suse.de>
 <20221216212944.28229-3-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216212944.28229-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/16/22 13:29, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> make it clearer from the name that this is a tcg-only function.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> This function moves elsewhere in the original series, but the name
> change doesn't need to wait.
> 
> Originally from:
> [RFC v14 38/80] target/arm: rename handle_semihosting to tcg_handle_semihosting
> https://lore.kernel.org/r/20210416162824.25131-39-cfontana@suse.de

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

