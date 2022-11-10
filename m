Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEC9623B56
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:36:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0Dm-0004qj-Le; Thu, 10 Nov 2022 00:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Di-0004qL-MY
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:35:22 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Dg-0005oT-HU
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:35:21 -0500
Received: by mail-pg1-x536.google.com with SMTP id 6so762971pgm.6
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hS80PFJNkQO/b4awyP7kAlZxb51VMB6sjaXZbXuXW0w=;
 b=vL+fZG4FuYBJuZvKOLKsKwDwm5/oeSTyQkC7xbeKYUZwNBLmVUm9G/ri979rPtIu6k
 Xr2j5jEY9n5rqXxHXlrMT3D4rQjms3QoctWyGLHMqSLaSQgoqYSoAjPLThjHArWIdVNJ
 P+jwVtDhkmqM0nKNdPSLac1Qonc8LyUFDfoZ1YfBnuKvSj0MKV5epMHRK6fLcuje+Aaj
 G39EPT7eGvj2j3oA/bd4nxhGyBcNVhxCkq8uGgsCEzBrp9MDUCnOca77fGLaL9M6G3Ch
 c6OrwAPHH4iZ3klZyALkOp+y1t30GhgskAamsY5vu5qkDq/5+TYhKt4FyAc1xZgah4Rc
 beeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hS80PFJNkQO/b4awyP7kAlZxb51VMB6sjaXZbXuXW0w=;
 b=RSMrUqdNv5ischw8KuJxGn8V6HtrRMFNKrSFDKrgB4VwQDsHkTAtQ38H3zvJctXsyz
 BhFAbui2We4/0zBKkl7kdGXcprKCUgVoZlopqp/e9sBlEkl7Pq/vn3z49Emtk1/8kyQ/
 0qecLfGIOtkATtwmGyUFBq1FVh2Zu/XqjNBVG0hn5BaALKbeaD9KRlXBHED8vKCPbkn0
 HLd8yLubq51vBTl4LMF5XJMLiBTfn4j0zGeewguoh9LAWN4CsZOFz2C4xfqCbDK8W05h
 pPr2VGuPCdpvgLT6/a6ClEGg8/wJPBh/mOEVclMtXa7JdWULLfeR8KbKtlBOxfaewXVL
 PVfw==
X-Gm-Message-State: ACrzQf15jCSQoG7sME5YhiCRlkhox0oXIvZjjRT00jRZQ+1m5rzQDHsJ
 fuTdeK7lL5EF0TmgQhi/J848nQ==
X-Google-Smtp-Source: AMsMyM5yU+MnYp5Rj5qjvLsjauHACbevH/xkJRFH24riUTCc8n2V4z3VrNbtp8Jsxvjhc4WsJ6hJPw==
X-Received: by 2002:a62:cdcc:0:b0:56b:a319:7b52 with SMTP id
 o195-20020a62cdcc000000b0056ba3197b52mr1843655pfg.21.1668058516948; 
 Wed, 09 Nov 2022 21:35:16 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 e3-20020aa798c3000000b0056b9d9e2521sm9558058pfm.177.2022.11.09.21.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:35:16 -0800 (PST)
Message-ID: <f9600317-b40a-50fc-3f85-8ccae0c6790e@linaro.org>
Date: Thu, 10 Nov 2022 16:35:07 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 4/4] target/riscv: Add itrigger_enabled field to
 CPURISCVState
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 palmer@dabbelt.com, bin.meng@windriver.com,
 sergey.matyukevich@syntacore.com, vladimir.isaev@syntacore.com,
 anatoly.parshintsev@syntacore.com, philipp.tomsich@vrull.eu,
 zhiwei_liu@c-sky.com
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
 <20221013062946.7530-5-zhiwei_liu@linux.alibaba.com>
 <CAKmqyKO0EUKg7k95RGnk3_=4BXynECBPfV5-_2VPW4A7p45daw@mail.gmail.com>
 <4fb639df-889f-a76d-6c62-126ec4d9e5e1@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4fb639df-889f-a76d-6c62-126ec4d9e5e1@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 11/10/22 13:15, LIU Zhiwei wrote:
>>> +static int debug_post_load(void *opaque, int version_id)
>>> +{
>>> +    RISCVCPU *cpu = opaque;
>>> +    CPURISCVState *env = &cpu->env;
>>> +
>>> +    if (icount_enabled()) {
>>> +        env->itrigger_enabled = riscv_itrigger_enabled(env);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static const VMStateDescription vmstate_debug = {
>>>       .name = "cpu/debug",
>>>       .version_id = 2,
>>>       .minimum_version_id = 2,
>> The versions here should be bumped
> 
> Hi Alistair and Richard,
> 
> I am not sure if we should bump versions when just add post_load callback without adding 
> new fields.  I once upstreamed a patch
> with a similar change but not bumping version.

Simply adding a post_load does not require a version bump.


r~

