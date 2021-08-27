Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E263F93C5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:48:32 +0200 (CEST)
Received: from localhost ([::1]:50242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTn5-0005aZ-83
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTlt-0004QM-Ke
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:47:17 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJTls-0006Ci-2o
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:47:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d26so8508790wrc.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 21:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wKWYGV5kiLhcMEZm1hyeSAqy8OL7L6nzsSvtCwhUk6w=;
 b=sEgyuSEbzj/CRk3xa2anoxSQ7QBnlrNIjdYhB4r9pD/ErlSh47Xmxep7E90AxK51Z0
 Ivi6o/P8Wd5iUz0KnBkRffepVCKI6Gtxoe7lF4n+JovARFqatUaSQtQNwA+vS8kCOlK5
 TaIvWaEdZpB6+T7vMJl+jKY7/wSItmH+NxN7faNo5eEvP7TsR2CUdLjP/49dQd4SHa4D
 ft8WXW4NaicotD4+gMyuQCG91P8jXAqCv68f5K5bzJzQ8E/zp9ebEUzyOli6ZDJ+AMCR
 453M4ylHtz9xfopd7Ms3qlvY0QOD2bj+g+X06YA66Df3PWYHYG3scDzPQASv+JdgmV56
 P3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wKWYGV5kiLhcMEZm1hyeSAqy8OL7L6nzsSvtCwhUk6w=;
 b=Jvn+AtwncfpgzVjNJ++t5TsAAxz8bkhbaLEkxMDM9fcIVDhTUgQPzEExIr/eTKhyWt
 272ArltJ9I2SeQfLE1s6AtBdHGqdgHfE34eZUDEQEByZrErOL302Euylhkd3RU59b/4j
 Y8Xfc4xiIcwnkfLzDEbArHB21PJOSqsAHgQhMEEP2Ccib8eRK5LBp4pH7r+ZIc4GXEIG
 nSXMLikcScgQW4ZILQS3Fc9TR4kjThUwVqdR96uJYRyJCR5HtYl0PtrKqIqrUcgmSMH+
 +xQhz9aREhWwTCcoU3ViCrNRIdDYccO4M6mLcD7Xt8Lk/Acc4p47GW1a5Lrs/9GkRy8a
 IiIw==
X-Gm-Message-State: AOAM531aFjohDu/5jy4c/pQes7WPtL6RvedxfNAN3OBBtHwJeykVVucv
 FcfHdSWCuYCfZ5L26EEoVORIKcNP5As=
X-Google-Smtp-Source: ABdhPJxILvvgc8TufVT5AMvD2ZvH89JxyVtAUpbwYhtQAwTv7JqlBtgbM7frAlPXTLJGK68UXAToUg==
X-Received: by 2002:a5d:58e7:: with SMTP id f7mr8026064wrd.51.1630039634514;
 Thu, 26 Aug 2021 21:47:14 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id q10sm4253576wmq.12.2021.08.26.21.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 21:47:13 -0700 (PDT)
Subject: Re: [PATCH v2 41/43] bsd-user: Implement cpu_copy() helper routine
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-42-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f76e5319-6f95-4765-cac7-ad945b52f662@amsat.org>
Date: Fri, 27 Aug 2021 06:47:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826211201.98877-42-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Stacey Son <sson@FreeBSD.org>,
 Justin Hibbits <chmeeedalf@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
> From: Warner Losh <imp@FreeBSD.org>
> 
> cpu_copy shouldbe called when processes are creating new threads. It

Typo "should be"

> copies the current state of the CPU to a new cpu state needed for the
> new thread.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Justin Hibbits <chmeeedalf@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/main.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index e2ed9e32ba..b35bcf4d1e 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -180,6 +180,36 @@ void init_task_state(TaskState *ts)
>      ts->sigqueue_table[i].next = NULL;
>  }
>  
> +CPUArchState *cpu_copy(CPUArchState *env)
> +{
> +    CPUState *cpu = env_cpu(env);
> +    CPUState *new_cpu = cpu_create(cpu_type);
> +    CPUArchState *new_env = new_cpu->env_ptr;
> +    CPUBreakpoint *bp;
> +    CPUWatchpoint *wp;
> +
> +    /* Reset non arch specific state */
> +    cpu_reset(new_cpu);
> +
> +    memcpy(new_env, env, sizeof(CPUArchState));
> +
> +    /*
> +     * Clone all break/watchpoints.
> +     * Note: Once we support ptrace with hw-debug register access, make sure
> +     * BP_CPU break/watchpoints are handled correctly on clone.
> +     */
> +    QTAILQ_INIT(&cpu->breakpoints);
> +    QTAILQ_INIT(&cpu->watchpoints);
> +    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
> +        cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
> +    }
> +    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> +        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
> +    }
> +
> +    return new_env;
> +}

But where is it called?

