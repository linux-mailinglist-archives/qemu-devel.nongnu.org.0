Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509E72D7BD0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:02:01 +0100 (CET)
Received: from localhost ([::1]:43190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knlns-0005QC-7b
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knlk0-00043B-OW
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:58:01 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knljv-00066s-FJ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:58:00 -0500
Received: by mail-ot1-x343.google.com with SMTP id y24so8807393otk.3
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CUrBcAU/b01LYFGNECwIkCghrjDYLijKV5ZnKdF+N68=;
 b=l7xA1BXnCSVwM0sqKzXdReJv8LB4LSeV96xvffZq9XvNXyoo2kXcWvKI1gN7bTkgWO
 SmKQBUOYKLAQmfzYcJvpGPSye3LwN4GKOc32y2DAklHzipT+b/M5T3sHzX24aCCtoNR4
 ESq7fzZX02x8FHv7yZkMch4DoZTIFDqoM/19fus83YxtWu/5IMkoMCUfQCSnr+ljlfD8
 WuCPZ6Ysefma8l25YnaaBfQS6IYN6lIWP+MCOxBYm3dR1er5l1e0F859qdZlehfWxFyN
 regKAgTtcErnx0pGWCOvnVvD1PAFVENtoll1NjrrEP5RJ+BxE3BdzUAT9EsnTj4+z2MU
 BY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CUrBcAU/b01LYFGNECwIkCghrjDYLijKV5ZnKdF+N68=;
 b=iv48HF5L0c3gX9fakhIs5GQ/UDcTjyO0mdgknKiOim3VRAr8TJq+S5wpUKQLgqHqUk
 KwdMMQv5yN0KehPVEdJD5xxTQMDA5od4o6dQPG9Uvwi9a5cgq6ynjbJTTea8H76kDuyX
 EQol5QgSUSbc0jDMzEX4wQFM6LIXypZqt4vcdV0Ldw9eQ38FHaYeIfchkfbB9R1Qx+Qx
 xDctq/3GPwHFHf+IDyQ5KG+NBW7Bb7iy1wgKjKh99m+QLQvrPj8iJJBWNwvoE37WtvvX
 FsL+TvjtTvRw3sVV2qXOOagvavv7BE7prrkGuHH1qE2ahD9aCLSf4Gbpp3RlLxu+yd/c
 rxtQ==
X-Gm-Message-State: AOAM532nCLxTy9Dmcw+tZDUHl/TcWPpPlhBSPwtQ+chq17LlpaRSVdOK
 Iy+I/oHNakXRVsiw5RKisl8dUA==
X-Google-Smtp-Source: ABdhPJxKjYMTIVprfz6SIVFUKZgOH36xvE/5+F+gm44hrVhaXXWJbM271AEHYCO9r0nJSjeVRgmq/A==
X-Received: by 2002:a05:6830:1349:: with SMTP id
 r9mr10623634otq.256.1607705873566; 
 Fri, 11 Dec 2020 08:57:53 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l1sm1882661ooi.48.2020.12.11.08.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 08:57:52 -0800 (PST)
Subject: Re: [PATCH v11 15/25] cpu: Introduce TCGCpuOperations struct
From: Richard Henderson <richard.henderson@linaro.org>
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-16-cfontana@suse.de>
 <40394142-58e8-a1b3-0e6f-921518ea83b0@linaro.org>
Message-ID: <2f667761-aa12-0a82-3d72-f31f43a184f0@linaro.org>
Date: Fri, 11 Dec 2020 10:57:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <40394142-58e8-a1b3-0e6f-921518ea83b0@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 10:55 AM, Richard Henderson wrote:
> On 12/11/20 2:31 AM, Claudio Fontana wrote:
>> --- a/cpu.c
>> +++ b/cpu.c
>> @@ -174,14 +174,18 @@ void cpu_exec_initfn(CPUState *cpu)
>>  void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>>  {
>>      CPUClass *cc = CPU_GET_CLASS(cpu);
>> +#ifdef CONFIG_TCG
>>      static bool tcg_target_initialized;
>> +#endif /* CONFIG_TCG */
>>  
>>      cpu_list_add(cpu);
>>  
>> +#ifdef CONFIG_TCG
>>      if (tcg_enabled() && !tcg_target_initialized) {
>>          tcg_target_initialized = true;
>> -        cc->tcg_initialize();
>> +        cc->tcg_ops.initialize();
>>      }
>> +#endif /* CONFIG_TCG */
> 
> Not a big fan of the extra ifdefs.  Are we expecting that there won't be any
> more of these, that other references to cc->tcg_ops will be completely within
> accel/tcg/?
> 
> We can at least combine these two,
> 
> #ifdef CONFIG_TCG
>     if (tcg_enabled()) {
>         static bool tcg_target_initialized;
>         if (!tcg_target_initialized) {
>             tcg_target_initialized = true;
>             cc->tcg_ops.initialize();
>         }
>     }
> #endif

Nevermind, I now see this is cleaned up further in patch 17.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

