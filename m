Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E864128E3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:31:53 +0200 (CEST)
Received: from localhost ([::1]:32848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRpI-0002rs-SA
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSRIk-0001fv-7V
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:58:14 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSRIh-0003tT-GD
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:58:13 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 pf3-20020a17090b1d8300b0019e081aa87bso1045569pjb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=239dqCpFA1kfHM1sRBHImaud8UMe929UJBy2l6Fcefk=;
 b=K2l6vHOPlGqWLceRiOl6lv6cSk4RZduuigrSxMMQwLwYiqWUS2o7veulXn7XGD2+ux
 fYbKfcH3MkJ/yjRfZhleAeORAOwNlCH1Aj6pIn1xnZVWIlM9cXxfkAKXTD2V3grt4D4f
 bco4ngUmgUUbBYnVzSwbZHnXyQpTcnaWJeoaLTqreewGkOxWbBQqaxQIbQcUVkwh6CO7
 yxX6OXDXE70QV2yxNdOBiQdSUXWJEr/2oBrIrayVpagU0gqTdMLpSHkJhQrtunXaDdNm
 bZPQ00KZEYIG4XxD7wf5RvIxZP5HIPR6WNoeUriQOw4KXvY/XEjrmvkLqKnSpiJ950CW
 Y8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=239dqCpFA1kfHM1sRBHImaud8UMe929UJBy2l6Fcefk=;
 b=ZnOTcJ7Xt4JUiiDQdx/QhGgWLjDCRgjtAOHfU9gIxs2QKT5e2zH4Vsl2R2KJc8ei3b
 dN+LP54JNCl9mhWMKKYNVcEphPDj4/SXVnYH8EXrJ/2R1doGTlVVHTQLeR31PVi12tt/
 atifmDH5r2FoDH2hdfRbq2oyGz7cBxNbd1uLkcpXdAnO9yRMbyeT2e3FFnkFYGK5zElI
 ON8NcGTRDshMMEXT34kLXNhvxcBwf07QufrEfWoZCxNPEVtZpwVpPv847Xu4o42fX7/7
 KjGLkTuYz3qOiwT56HepC8gidUpZfnBEoc+HioiQv9pw+MSHSGYgnd2LCCrZVJlM1Gpv
 Mayg==
X-Gm-Message-State: AOAM531ksqxSr1yq/HFaFzwmuggu39QxvX0daEqRUfFRDzrynpGdXxfZ
 Has5xJZfQRojoF17LZJ2dRVGyO22O3uJ/Q==
X-Google-Smtp-Source: ABdhPJwOblaNnq8703QrwciEETbjvpoJYak8bCK7nNKP+H4ft2EREFRx/BYRoEEsJtyzQpyYA8hUrA==
X-Received: by 2002:a17:90a:530f:: with SMTP id
 x15mr1295487pjh.131.1632175089733; 
 Mon, 20 Sep 2021 14:58:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w142sm15191072pfc.47.2021.09.20.14.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 14:58:09 -0700 (PDT)
Subject: Re: [PATCH v5 05/31] sysemu: Introduce AccelOpsClass::has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210920214447.2998623-1-f4bug@amsat.org>
 <20210920214447.2998623-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <919a17ed-9438-8fd8-f595-b5448db6198e@linaro.org>
Date: Mon, 20 Sep 2021 14:58:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920214447.2998623-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:44 PM, Philippe Mathieu-Daudé wrote:
> -    g_assert(cc->has_work);
> -    return cc->has_work(cpu);
> +    if (cc->has_work) {
> +        return cc->has_work(cpu);
> +    }
> +    if (cpus_accel->has_work) {
> +        return cpus_accel->has_work(cpu);
> +    }
> +    g_assert_not_reached();

This might be close to the end result, but it isn't what we begin with in cpu_thread_is_idle.

You'd want

     if (cc->has_work && cc->has_work(cpu)) {
         return true;
     }
     if (cpus_accel->has_work && cpus_accel->has_work(cpu)) {
         return true;
     }
     return false;

to start.  After the cpus_accel hook is filled in you can assert and return from 
cpus_accel->has_work.  And of course after cc->has_work is removed, that clause is gone.


r~

