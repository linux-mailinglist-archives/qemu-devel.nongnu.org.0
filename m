Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19733E314D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:44:09 +0200 (CEST)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC7dQ-00038P-GN
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mC7c4-00027A-1I
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:42:44 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mC7c2-0007yk-F4
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:42:43 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so15757889pjn.4
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 14:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sHDHuq4bV7ysIgyjY17if5r6zuInXSoMP8uG47uSlv4=;
 b=P3VurSUMaTa9vL5cZb5VwNDPUilkFuDCz4QzwEnxVxJktJlwuoOgX8GIUEA3YX610w
 A8yBBRnEJDCVOF4au5Uu96zNpNMd3zBTd1YUpGjEM7LDLN/z6o77IhStjo+R6TZMl7v0
 sp6+84CGxZzuYgPYqp8+jqq7WmAyWbpwX9zwjjdJY4Hvz8ceJA2wv2lLiHPXpPKvebTN
 +dGu8k3bv3ssjqt4EacGYXLBlM5aP0dIM1kI8DOs+Oghwp45QdTbD0A3+aeudG410rlZ
 Y4vuZccwTlRM7bpI8ugHLUgO+iZvhsNO+2qsEmEy44YDZNjVeidx26hbj/IACZrGKhHB
 w+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sHDHuq4bV7ysIgyjY17if5r6zuInXSoMP8uG47uSlv4=;
 b=CkgavvONncHFjDe1ySuvyo6DHQx+EyOcYcmJ2khoo60O7YWY5c9wPmsIrLMnHL+b6O
 2bTLLiDCRzTIgS+IBHoZkMt7pmQm9Lm5yHbKWe2x8q1BZzO5Ihg4g8FLxjJty0LpBNoH
 fGq6oXXRlPzuh7R2//UdFIylojzPVuQPlVHd9UgbOpC/xbZS5TGIem6uDhnygsrhTkW0
 n7xAHxBpcVy0f4tvR7iZXCooc1HhUb3dAVbCAFSN7Ah243/9E4pYJsNeTr9SJWrVHVNw
 7vOKkarTcK7yyG3FL3CaHhnGlQNSjXKPu+E0YVwoVAjHEu4f8Ur1lZaOs9Z7k7ccHYgC
 5DQw==
X-Gm-Message-State: AOAM532WaWh0sOs8QJpucpvs4BnudOcWe+o7KVwxXH4FjWbXr03K9AbX
 ZOCwsKnf156CHrSW+SBnzNyrWXEd09tfRg==
X-Google-Smtp-Source: ABdhPJxz9fyoQO08HpD0zQ/7PzXZ5C7Qqe5fgGGh59R+vOUwVwc6RR0zMERsRt+bTHrjJBjMwClBpw==
X-Received: by 2002:a63:2f04:: with SMTP id v4mr922525pgv.380.1628286160410;
 Fri, 06 Aug 2021 14:42:40 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id w18sm11035701pjg.50.2021.08.06.14.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 14:42:39 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 v2 3/5] target/mips: Convert Vr54xx MACC* opcodes
 to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210806210548.8568-1-f4bug@amsat.org>
 <20210806210548.8568-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b1a62cde-a944-d1be-2c12-8560f3c82756@linaro.org>
Date: Fri, 6 Aug 2021 11:42:35 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806210548.8568-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.619,
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
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/21 11:05 AM, Philippe Mathieu-Daudé wrote:
> +/*
> + * Helpers for implementing sets of trans_* functions.
> + * Defer the implementation of NAME to FUNC, with optional extra arguments.
> + */
> +#define TRANS(NAME, FUNC, ...) \
> +    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
> +    { return FUNC(ctx, a, __VA_ARGS__); }
> +

I was thinking this could go in translate.h, for use with the other files at some point.

r~

