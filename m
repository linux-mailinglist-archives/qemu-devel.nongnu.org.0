Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A73D6AB1B4
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 19:22:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYsy9-0006sK-M0; Sun, 05 Mar 2023 13:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYsy7-0006rW-MY
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 13:20:23 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYsy5-0000QF-Uh
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 13:20:23 -0500
Received: by mail-pj1-x1034.google.com with SMTP id x34so7655777pjj.0
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 10:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678040420;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lyXSLQqti9nE4kw5qxiCnq2I8gdlNlF3gU6pRJMziuY=;
 b=fBkeIiDIIfinFaNSJjhhi4VvfY3WAjDiUjiZ58LPgcUUliOqmOBXT+0hhX3hWfHXCP
 vN/J7grBXa7VU6azXoRHPOMSGUDg+4RkYjK9SK7lejqqjKydPD2OGWvfkL6194jMoDB5
 x8LXCdrWDbJqqbqYIcqLsWOZX16OdoaTt5Ed3ZUoIV5epcT7H0ioGWBvye2ephXpJqaA
 +kn03LPSQDI8tiFT/0SHmMVCZHsLzdjd1ZxLF4cjeOnOyZ8qlwDfv2Z2iFkObvTATtN9
 JLQFz7rvsR96HYkPAO/DYc/5rGbNWMcnNHh3mgxE3Vml6R04poiRuG3mJToYw/NlHjaY
 ifUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678040420;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lyXSLQqti9nE4kw5qxiCnq2I8gdlNlF3gU6pRJMziuY=;
 b=VsM+ZJw9rRjsVP+9LezJqy/lUD9RVzDvq+yCEPcM0AB1JdUEJiOaNKLASTVq8OcdQS
 SGxnhiWTQaiOZyuLOFyJ/UlMvDlck6U3RMg0r09CVPxvSf9g/CyEIJHpbOOTk4sZY3JI
 CE1Ykvxyojx4RI/05USrwizGWMjOBT1YxUVOD6SID6zOv9JVWj7csPLKSGl0HLcziRWA
 JeUxX8DTqZ4pro9Zv1lk2JRyIj4tnTLGB+32LDEsK+RTRhbuji/SazUXUxWRS2H7gW7Z
 RUqAtpP4rKy/qaQu0ZnIACgG1DqHmCkpJmX68snh+P5EYK4NjgaX8YHBjeLUgburXrEr
 26yQ==
X-Gm-Message-State: AO0yUKWZGxJlHZgom3dmXxL5rutC+paiu2L/PPRutbB9IZbhii/iQ1PF
 V6XnABEVw/rPrG/SWWg1OjAjbQ==
X-Google-Smtp-Source: AK7set8BDeJMLyQAsLJw6Ags15lZafbYJdUjGtumq70AgZXGgjeARm4zFKQl/+AMSvi1AnN7CMGGeg==
X-Received: by 2002:a17:902:e812:b0:19c:da7f:a237 with SMTP id
 u18-20020a170902e81200b0019cda7fa237mr10975773plg.5.1678040419910; 
 Sun, 05 Mar 2023 10:20:19 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:2a33:4111:eaee:9caf?
 ([2602:ae:154a:9f01:2a33:4111:eaee:9caf])
 by smtp.gmail.com with ESMTPSA id
 iw3-20020a170903044300b0019ca68ef7c3sm5048918plb.74.2023.03.05.10.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 10:20:19 -0800 (PST)
Message-ID: <fc6aae1a-8425-be5e-40b4-f3abc6536b9d@linaro.org>
Date: Sun, 5 Mar 2023 10:20:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 03/13] accel/tcg: Store some tlb flags in CPUTLBEntryFull
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-4-richard.henderson@linaro.org>
 <CAFEAcA9jhHX7r9FcB8ZyGimN3XGLX=rEONC3jYK=n2JTmj+SSg@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9jhHX7r9FcB8ZyGimN3XGLX=rEONC3jYK=n2JTmj+SSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 3/3/23 08:45, Peter Maydell wrote:
>> +
>> +    if (wp_flags & BP_MEM_WRITE) {
>> +        write_flags |= TLB_WATCHPOINT;
>> +    }
>> +    tlb_set_compare(full, &tn, vaddr_page, write_flags, MMU_DATA_STORE,
>> +                    (prot & PAGE_WRITE) && !(prot & PAGE_WRITE_INV));
> 
> So in the old code, if PAGE_WRITE_INV then we set up the
> addr_write field as normal, it just also has the TLB_INVALID_MASK bit
> set. In the new code we won't do that, we'll set addr_write to -1.

Gah.  I must have had some sort of rebase fumble, because I know I fixed this, and the 
WRITE_INV test should be above, not in the predicate.


r~

