Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4755C666808
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:43:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlb4-000826-TT; Wed, 11 Jan 2023 19:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlb2-00080p-CH
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:32 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlb0-0001uo-Sg
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:32 -0500
Received: by mail-pj1-x102a.google.com with SMTP id bj3so14319925pjb.0
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NHe9dNY1K3nmf+eGBsXRPck1pnlk9Q/oUevBJyUKEic=;
 b=RjG68IZfTyPWTbOK/wtTwhVfd8EhlSUoxqbR9NQTfRNUkAfAxC/D/Ru4czxLy/1AhX
 PyT/Ln6QdcFd7N7bOB2+/clGNzYp6vLjtYKVQ3XKJ1xZOkZCjhzD9wzKK1KgYmi7FxJB
 OH2fDqskLCpTMBTjYwKBv0fcCw7TvKL8LNEd45lcJSW4xAUHzas6F4kuYe8wpgNd0yd7
 m4YkRzXHKQG/vCA9861oxPJBT5H5TDrooPLxrA9C1bvjMNDOU4R+oyWjU90wbrc7Zhtn
 4rHAyG/Ds9afTXivA3cSHOBCt+XIEnJ44GZyfZ+7iEGmtCu5pQ2rnBul7KMjMXUhCamx
 VPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHe9dNY1K3nmf+eGBsXRPck1pnlk9Q/oUevBJyUKEic=;
 b=r224omphvkGMJ1B/druFUz3ykb7Yu8mUBpCfUeO/qXVRRRmyCeNoXO/Bne2iIGe5/t
 x4iMKW/x8YB6NUzhKHQk2+sdtrmuweGJri7efIkUYcaWbSgly85XZ2nlYtH+0dXOIfo/
 AQIyHz4QfIoj/kKk5hQiisFPxPb0/EMWI5flLgPMj3CpfumEMUzx7Jr1qLQHUhp9iVYJ
 pwdIXa41S4phDwArGukNTxJ6zrQ04EN6Qb0xhXyB1JpZmr3YusfNCvUsFa/SOpWrSUeH
 SAoXfxdJAHZ33nKcNSZk+wOaEuTpGFWNCQcKVyzayLs3rhtdY4gRFLQ3kuRb3ndxSMgF
 puIQ==
X-Gm-Message-State: AFqh2krUExchq9RgXAPDgfL7+1CuQMewIwVaOSuEgdThQvexjMX2jJ4v
 9lsneYgDcYkOQkFw5SYbDqNCchb8g8f+2Q5p
X-Google-Smtp-Source: AMrXdXtDu06Ah38uPc1HPAtBxFq2YcxnLMVyEJFHcwIINvKH5asLHydbqKYEW8kNQ8wJgz0Jm9ak6Q==
X-Received: by 2002:a17:90a:6443:b0:226:f85c:2333 with SMTP id
 y3-20020a17090a644300b00226f85c2333mr16843963pjm.20.1673483849634; 
 Wed, 11 Jan 2023 16:37:29 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 em6-20020a17090b014600b00223ffe2ba61sm9631602pjb.15.2023.01.11.16.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:37:29 -0800 (PST)
Message-ID: <57ec8753-a08c-914f-d0ab-3e1e62682cb6@linaro.org>
Date: Wed, 11 Jan 2023 10:29:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 12/19] target/arm: Move hflags code into the tcg
 directory
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-13-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109224232.11661-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/9/23 14:42, Fabiano Rosas wrote:
> +inline void assert_hflags_rebuild_correctly(CPUARMState *env)
> +{
> +#ifdef CONFIG_DEBUG_TCG
> +    CPUARMTBFlags c = env->hflags;
> +    CPUARMTBFlags r = rebuild_hflags_internal(env);
> +
> +    if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
> +        fprintf(stderr, "TCG hflags mismatch "
> +                        "(current:(0x%08x,0x" TARGET_FMT_lx ")"
> +                        " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
> +                c.flags, c.flags2, r.flags, r.flags2);
> +        abort();
> +    }
> +#endif
> +}

Inline marker non-functional.

Anyway, this should not be separated from cpu_get_tb_cpu_state, where it folds to no-op 
when --disable-debug-tcg.  Indeed, I once had it textually inlined in 
cpu_get_tb_cpu_state, before Philippe thought it looked nicer as a separate helper function.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

