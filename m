Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E5364FB8E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 19:28:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6buV-00076l-Tf; Sat, 17 Dec 2022 13:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6buT-00076b-SA
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:27:45 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6buS-0004Je-AT
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:27:45 -0500
Received: by mail-pf1-x436.google.com with SMTP id 65so3760633pfx.9
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 10:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZStSS5uNLoF3vp5JrQvoxupAIbnCxh2Gmm5Ewwrv68k=;
 b=nHHqhGnAPGCKonkqvgnP8gyxtjpRtLMQJ54ETq+huInhJWzxhuztl7hW/7qgAsxNUO
 KLH7vH9qRKYPy6EZMkKmg+hzOsBr43YI1FI7E5r/2ekpyXHh53rpBjZ1Yqp5M1CAuB9o
 lEdsqU3JP8PMWLSCiA/rSaRURWMYM2/n0Y8OxPhrYbe6FNDT3yoqHTns3WwKvQbXfpzV
 IXpB8Zc9oz9QcAKzbMatFsq6Q4rQbNFTtdJcHWGz0InhNuMl7HgWE2gfsrOIBtsn9x+L
 C/YW69iBwW7/ibIv/Oped+y8q36lGVODIVruxdeJq0w5JHn5pEdCWNTlJ6Dl2pppt9eI
 npUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZStSS5uNLoF3vp5JrQvoxupAIbnCxh2Gmm5Ewwrv68k=;
 b=UtoVknTc1QPVYtnQHHSifJGFLeZogDt1VmYYf1DO8E+FnH7BODe52CZnVGb13pIkxb
 /bUbyj0NdyJkTuKz1m22mP2+ggudqTbj2BNeA5SzmOrZBYUfpHnAME7jYGvrOT819Mky
 WE33XPLiGqtVxoMwHmGUmNrtI0SHhEb0AZ7aRlJrVFXRXLB3xTN5TEfYXPif+ETEqawf
 CNFaOlj1kd6Nw39p8AGtierOQxTmfcuvKa5W0b1skcAg+kOCtYgIM+s59hVk8GfmSeF/
 kgsnwfyBaYfXP0Fv1SI+pdEx7ctiZZNETYLGMtnpvUCIqxZ9uXmXjaj6q26RlLAUWg/F
 8b8Q==
X-Gm-Message-State: AFqh2kqJ57sbbRTp4ZKwnaEc5itZDq3hPG/C8Flsu8SAsdcTnJEObFs+
 vVbVK1t45mp6e2IiAY3cGHhwnA==
X-Google-Smtp-Source: AMrXdXtbDs/jTnjOSX8Faayd3xAI60pYot9PSHUJthYg0YsEkyW+5krsR3lYcLGj32GkboKHXXf84g==
X-Received: by 2002:aa7:870f:0:b0:57e:c08b:b7b9 with SMTP id
 b15-20020aa7870f000000b0057ec08bb7b9mr8694086pfo.10.1671301662519; 
 Sat, 17 Dec 2022 10:27:42 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:dbe7:d50a:f977:e69b?
 ([2602:47:d48c:8101:dbe7:d50a:f977:e69b])
 by smtp.gmail.com with ESMTPSA id
 s1-20020aa78bc1000000b0053e468a78a8sm3433143pfd.158.2022.12.17.10.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 10:27:42 -0800 (PST)
Message-ID: <28e8dc31-3f6e-43ed-d302-a1748992d74b@linaro.org>
Date: Sat, 17 Dec 2022 10:27:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] target/hppa: Extract system helpers to sys_helper.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221217173219.8715-1-philmd@linaro.org>
 <20221217173219.8715-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221217173219.8715-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
>   target/hppa/meson.build  |  1 +
>   target/hppa/op_helper.c  | 77 -------------------------------
>   target/hppa/sys_helper.c | 99 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 100 insertions(+), 77 deletions(-)
>   create mode 100644 target/hppa/sys_helper.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

