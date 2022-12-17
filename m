Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF6764FB8B
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 19:25:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6brW-00069z-Fc; Sat, 17 Dec 2022 13:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6brU-00069c-EN
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:24:40 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6brS-0003QC-T7
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:24:40 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so9187908pjs.4
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 10:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Oca56uA1/F9BuqwTVnMqfaL96YFL1DL9fWCShJPgRQ=;
 b=dKjLCfKUsOs0eBCIQLir7iedv19kAd6Mq3VyL3BT8bY2nt5BRiN3EkPf9uXAj/9Ety
 M2sYhufPjYYbNH+gXEQBPn6KF+ms8KD+IdxEWEg+oXHOFdN9hEFo39CbsTGBjaiR3mq/
 mrAe4KE61jQQB6g7zXHDuqPgtUsmj631cbU1WaGbnTfzeGymJ8X/KIc+6OmH9WPtOmiu
 TG4ps1Lq9R9g4es6kQE94fNFJ3ab2X0tyYAEDrtIRl/P1jKl+PclH4LbrlAdiU866XXG
 rXeGXbYbtwX8zX0p9ALuicxmTk5vmCpuZa0po5myTM2AeMaih9UQgXTGjia84UbRLTFt
 8lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Oca56uA1/F9BuqwTVnMqfaL96YFL1DL9fWCShJPgRQ=;
 b=Zl01OP8lMepXVh89cv2lhc6oh4cgumu/YT9PHiDjfD07i4ZttBE+wKbEukhm+F3YXG
 rqvQDA5QBpbXzaHXIOEGgKC6B7Ul36cIHBcM/9prcz2f5bvdvvFlBXroYVdr05a/eHnj
 CV9Fo0WK8hD7Wwur6K7hyK5lt4rVClfzug+EIuyB0DK75HMx/MKsSFVe4M8klUK+0i4E
 +GtVEOs3rSiNRaSe5GkzSOovbE7yn5fGsCSfP+Djv1UGY0wYCHwlwyi2FfJ/OM9o5tFd
 INJqsJ8sxnlhkaGdYm5i6VEnR9e2nls1RNAkX+4VyTpe8HXuyIHhU8QcdU89wfKgPPBt
 8TKg==
X-Gm-Message-State: ANoB5pme1eJtsuTM8IL7B2zH1FCTMkZ7A2dYiwClkkBn7rD/WFp9ymoB
 tvWqeO8PwAqdNr0VITE2f3lqnA==
X-Google-Smtp-Source: AA0mqf4Cn5wwiO9RnMACHNZByi0mKupvtYF44QKg2y/L0pVPV153im8gsrnLQcqqIGoWLOlcnt7Xow==
X-Received: by 2002:a17:902:8bc1:b0:185:441e:2d7a with SMTP id
 r1-20020a1709028bc100b00185441e2d7amr37724961plo.17.1671301475451; 
 Sat, 17 Dec 2022 10:24:35 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:dbe7:d50a:f977:e69b?
 ([2602:47:d48c:8101:dbe7:d50a:f977:e69b])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a1709026b8100b0017fe9b038fdsm3868923plk.14.2022.12.17.10.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 10:24:34 -0800 (PST)
Message-ID: <89ba690d-3417-11f5-4d62-bb3c808c6ffd@linaro.org>
Date: Sat, 17 Dec 2022 10:24:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] target/hppa: Extract FPU helpers to fpu_helper.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221217173219.8715-1-philmd@linaro.org>
 <20221217173219.8715-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221217173219.8715-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 12/17/22 09:32, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/hppa/fpu_helper.c | 450 +++++++++++++++++++++++++++++++++++++++
>   target/hppa/meson.build  |   1 +
>   target/hppa/op_helper.c  | 427 -------------------------------------
>   3 files changed, 451 insertions(+), 427 deletions(-)
>   create mode 100644 target/hppa/fpu_helper.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

