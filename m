Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EAA516048
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 22:13:59 +0200 (CEST)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nktTa-0000FD-PJ
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 16:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktRZ-0007z3-JC
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 16:11:53 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktRX-0000QU-T4
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 16:11:53 -0400
Received: by mail-pj1-x102a.google.com with SMTP id o69so8398927pjo.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 13:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=SKt2AbaWMWGSg35n0yzrMqGVJHruMSzRY1UH6CDA9U8=;
 b=FF/EThmvhmUM1hDQu33bvoMDhmeqHtSB/li5hFn9R009cHBnEXm6nGawz2IDCwfV5O
 q8+Myq48lrYR/Tl2NtRHhDbS2OPklmrWGkZ6VNJh2M0XFrC5ZHE7yO6ORfr0ZVqonM18
 bnE49cs8EaftDWI+D8o2IzfXXNo+tU6v44uoFGP+zA+Y4wFRRdIJuC9NXUvwq5/j1fuc
 LngAcQDkbOMz2/c2QbC7hPfxMZ0faKH1bSQpMFA/GzmprUZxtZvPwviRUA/RD7rp+uIM
 t/KCXHffZ5rZNipRmCAJ8yL3Y5LDXjORqOcYfJCtrpE+wYNJauWIDGoTD7xESH5lkci8
 FspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=SKt2AbaWMWGSg35n0yzrMqGVJHruMSzRY1UH6CDA9U8=;
 b=A0aNj8X9AkK59/rX6tbUXyS6i2YftAI0DQdVX7Lf7Ik3aiTQy4xHdiqhKoP9jQOD+v
 17yGImce75m0fgnhiIhxrSDjKmB3+RbxTpNcJYwLiXgDSNr2DPO3sDM/l+diP6KNNZSC
 QlKIv0hyQfY5QKZ664QbJ7CBkiZOvQoabzuXsMHDDwLPAhiWOTUcDLJWiKfRPd6fUZmF
 FabZP4C0i4Z3AOqkX56DTBYB9Gw+kzc/gkdW1Ko2xiPk7JLcTN43XDm+AOyhg+bWv6Vh
 00JQyiZx956L0EJBU3pnSZrdWHUlj1aZV4KTHpwxuLyNHMb/ulVLkHzXEQ3Hs5NS0jPd
 RJ2Q==
X-Gm-Message-State: AOAM532WRpkD2IIs3bTeiN8iBYKECEuNnWWHMb7pWDuwsDO/iP5y81Gi
 T1DS3a3oBQ+lSzLzc+CW9qN3yqfoQNR/KA==
X-Google-Smtp-Source: ABdhPJxb076XeqNyYQkZzj1v/blY/XyFbJUawnJ351QmO2L6twOhUkfmprpT2HO1z+a5NN6IQySmfg==
X-Received: by 2002:a17:90a:5407:b0:1bf:43ce:f11b with SMTP id
 z7-20020a17090a540700b001bf43cef11bmr5489949pjh.31.1651349510188; 
 Sat, 30 Apr 2022 13:11:50 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a1709026b0300b0015e8d4eb237sm1839418plk.129.2022.04.30.13.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 13:11:49 -0700 (PDT)
Message-ID: <f5b0258a-0702-910d-a393-6e5a40093553@linaro.org>
Date: Sat, 30 Apr 2022 13:11:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v3 00/25] Misc patches for 2022-04-29
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220430140517.460997-1-pbonzini@redhat.com>
 <dcc61df1-205b-860d-3928-a2b77ce67983@linaro.org>
In-Reply-To: <dcc61df1-205b-860d-3928-a2b77ce67983@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/22 09:41, Richard Henderson wrote:
> On 4/30/22 07:05, Paolo Bonzini wrote:
>> The following changes since commit 731340813fdb4cb8339edb8630e3f923b7d987ec:
>>
>>    Merge tag 'pull-riscv-to-apply-20220429' of github.com:alistair23/qemu into staging 
>> (2022-04-29 08:46:55 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to 189fad0006dd4f2f336e05a99d981cc1ecab1b33:
> 
> This is the same hash as v2.  I presume the new hash,
> 
> 62927ca5e1042eb422ff545bec3028213a94ed17
> 
> is correct for v3?  Putting it through its paces, anyway.

Still fails:

$ ../scripts/ci/org.centos/stream/8/x86_64/configure
ERROR: unknown option --enable-vhost-vsock

https://gitlab.com/qemu-project/qemu/-/jobs/2399326578


r~

