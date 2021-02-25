Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25183248A3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 02:42:26 +0100 (CET)
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF5fd-0002ci-Sz
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 20:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5e9-00025A-8j
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:40:53 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5e2-0006Wx-Tr
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:40:52 -0500
Received: by mail-pf1-x42d.google.com with SMTP id q204so1494131pfq.10
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 17:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aoFOrv8yJ1n5VezJyL6y8YD5f1RWIugTg2qWbEW9XLI=;
 b=fFpm8N9YWK6FKZOdSKEJ5A4lTn1lJck/tIpOc9bgGGkuDoVHNsoGRQdP3MyxsQR1mB
 T1yp9KPU2BaRaDnrZNrbbP1O9/3JLApoa/tGT7TN4j+zEnfDIv2hdoUtPOFh0eij4Ohv
 T3e4vjY77CTQZOb8eNSDvSmzd3l88QvNkwGbR3W2r+vecm65nKNxtyF9VDFPuN61I/s1
 ewzM7Tyt1K2phHwC3OksTCGtCmLweRtK67LMfopewXP9ESapsAsdU+Ws8b78h4opdWor
 0HMsVUF4jxc3UqQTSq/2pMkcUB5ylrwSQF1PDD24DeMhOha/kZWsododnSrdzW4SeWKR
 Akrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aoFOrv8yJ1n5VezJyL6y8YD5f1RWIugTg2qWbEW9XLI=;
 b=JjHayEPcDP4CimyMeUb6MaFJekkNFYX7jh6RF7TzWwGxcVvWHhzLCjCwd3L9dmzvhb
 GGg2VPcduCLozajjxu0PLELJGzKHb140WFg1twIY5JZieY72y4+qz7vSpfHFTwdUeA9u
 Kyz+2Nldh97tJm21pVC6Xs5PtcS0/BJhpSTVGQFLJ8ILhzREffzqHdXN4A/utdXC0rIT
 BAJC8KNpJ9C0LbCWGTIZEQ48+JEV+JXpYw7U9OVY+XKQa/DfgpphvQCoom4fnrd+eUYr
 WJ19bnu1VNf/GBCJtscQYoGLgVPaQm4Zfi+4qne5EA4qOnM/Is8t8Mz8QjZNs9pkh4Xx
 o34w==
X-Gm-Message-State: AOAM532szhujuhnMa4p7QAKNSoketNZmb40gmF7rpI8C4pOeIkoY4WER
 6qHXtqZWGw2bHNj6NzGhQv6QIEGPHXcN0Q==
X-Google-Smtp-Source: ABdhPJxgF4/lo+LRoQG/gkGTPeGLFsMwpmL9Q5eQXjlbWdj82ctuP3c0Fa+f2QSz996rXK8Ku7k9EA==
X-Received: by 2002:a63:524d:: with SMTP id s13mr725930pgl.366.1614217245361; 
 Wed, 24 Feb 2021 17:40:45 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id q128sm4081091pfb.51.2021.02.24.17.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 17:40:44 -0800 (PST)
Subject: Re: [PATCH v22 10/17] i386: move TCG btp_helper into sysemu/
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-11-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d3bacc6-c68f-87c7-9298-3896c2c1842b@linaro.org>
Date: Wed, 24 Feb 2021 17:40:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-11-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:34 AM, Claudio Fontana wrote:
> @@ -8074,7 +8078,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_DR0 + reg);
>                  gen_op_mov_v_reg(s, ot, s->T0, rm);
>                  tcg_gen_movi_i32(s->tmp2_i32, reg);
> +#ifndef CONFIG_USER_ONLY
>                  gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
> +#endif /* CONFIG_USER_ONLY */
>                  gen_jmp_im(s, s->pc - s->cs_base);
>                  gen_eob(s);

Given that you need the ifdef, you might as well extend it to the entire else
of s->cpl != 0.  User-only will always have cpl == 3.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

