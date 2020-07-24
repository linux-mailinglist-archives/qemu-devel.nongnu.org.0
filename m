Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C3322CDD4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 20:36:04 +0200 (CEST)
Received: from localhost ([::1]:51288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jz2Y7-0005Y0-9l
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 14:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jz2XA-0004w0-5E
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 14:35:04 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:55865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jz2X8-0002f9-Bz
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 14:35:03 -0400
Received: by mail-pj1-x1041.google.com with SMTP id k1so5779770pjt.5
 for <qemu-devel@nongnu.org>; Fri, 24 Jul 2020 11:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B4r5fQvZhpR3Oi/jX9BcVVifWbNDBjd8JGBQGiu8n/w=;
 b=eejb99NhQQSKL+bbQRjeq1VJBcHUdNOd3XB5EDbuN151BKb1uyslYIKWRxkAxip5g8
 ncLv1OpODGZDgDrnW7YRobzA2BHWhF+RBnUJFy6FXXIhAELWgWFZ+bTzdAw7MrSOZ2cl
 ZIYd3Fo2mwwPwupiLczzsx9efO3k5HrMplRmizrdYcH9Sb78msZ2V2HX3bC5KlwYiiO9
 tzGGqv8R4T4C0POfZw6YaciKcDQqHys8bK96fVhmYdnuPbtomFZB7h7JeFYB46w2bFRr
 zrJJs/oLfcLbOg4OH3mqTyAu6XYJQ0h/x9QbluDiPfesYJ8wKuI+eA70cCqbB47aMSna
 odlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B4r5fQvZhpR3Oi/jX9BcVVifWbNDBjd8JGBQGiu8n/w=;
 b=kNB/l8pErpJWToFyg1JFjHJxwzJezdaqBshruee2azJPZm5AvmQqw7CVRLbrr/WQaE
 Bf0NclJp9G/o1bOKefgaDliir1/VzcCpJN5fHsTFxqWgqD4t75fdieVLDW/pVQU5JrKZ
 r8HVCme6nC6FxS2IY33N71cBLiA14vq4qkQZPTja3rjGj5BXu/Sficxz1jYS0bQNSwwb
 hl55mq2N5FAlqTCu3liPTOmQKTGJMM/edaFeCfbq1hAc5JCe32lDcyfq8Va5kePH/d5m
 +1WFrUMJTNrd9qJ5Wr+rQHi2APNOgxOrLIMZGS1maPzjcm2a+IjxpTYGmD3s4r9rdAT5
 msyA==
X-Gm-Message-State: AOAM532O6cNMKoNydEJHR62NzBRg56GgHPw6WAV710fPbUX7+ntlQpvC
 Qev78sdAEd8IPSXae938aWCryg==
X-Google-Smtp-Source: ABdhPJwThtOoo6zaAZVRXOPUn7fB//FFDZy2xtwPvCG+XEsYuUtZWWM4cGQtv58RnuDQUkA4qyjk9Q==
X-Received: by 2002:a17:90a:c094:: with SMTP id
 o20mr6467913pjs.12.1595615700701; 
 Fri, 24 Jul 2020 11:35:00 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 c2sm1186646pgb.52.2020.07.24.11.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jul 2020 11:34:59 -0700 (PDT)
Subject: Re: [PATCH for-5.1?] target/i386: Save cc_op before loop insns
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20200720154028.477457-1-richard.henderson@linaro.org>
Message-ID: <cc3e60e3-e150-4b62-cb8e-abc71920f897@linaro.org>
Date: Fri, 24 Jul 2020 11:34:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720154028.477457-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

On 7/20/20 8:40 AM, Richard Henderson wrote:
> We forgot to update cc_op before these branch insns,
> which lead to losing track of the current eflags.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1888165
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/translate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/i386/translate.c b/target/i386/translate.c
> index a1d31f09c1..caea6f5fb1 100644
> --- a/target/i386/translate.c
> +++ b/target/i386/translate.c
> @@ -7148,6 +7148,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>              l1 = gen_new_label();
>              l2 = gen_new_label();
>              l3 = gen_new_label();
> +            gen_update_cc_op(s);
>              b &= 3;
>              switch(b) {
>              case 0: /* loopnz */
> 


