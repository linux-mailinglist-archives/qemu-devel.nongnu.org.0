Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D461265E4F6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 06:02:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDIOU-00042B-2E; Thu, 05 Jan 2023 00:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIOG-00041g-Rm
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:02:09 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIOD-0003U9-FH
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:02:08 -0500
Received: by mail-pg1-x534.google.com with SMTP id 78so23783716pgb.8
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 21:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FDqHkaS4SoyIvU8MSHBLI7CDBmsmoFUCtxNjTVdj2n8=;
 b=ppeQGvf5acZmlyE3796oGaWSnoAlpDJxSMxbzBvfDK2QDPK/wFD237EQNMw5emsppl
 IJ+IAOVGfp6/rXYVyB4Ig1HREZKN5Xzx/mjnZGfaFmk2NAey8uprq/5O8qzHM1eBSPGa
 xmGOezWJidaI/tQksSQ7zdmM7W8F9wKuD5gpXtb7Frhuyh6xgzDy3nOgh1JWr3IThc4y
 h/UxGlZNStWn5AHQLlcYSKEB8uROZPJTsk6vl/WJih+xMYiMTdPVr7n+jmgdl41kxOrD
 IvQ85hJveHTdlQuIBl7SCZhpfSwHJvKGH7XdcZVGGQevyY2vPVnCulj0fAGFBjelPAzl
 gi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FDqHkaS4SoyIvU8MSHBLI7CDBmsmoFUCtxNjTVdj2n8=;
 b=xIRBlz2Fq5bxdU30yZfZwgdDxQehn797ftVcG0Oww7SI9/T1MrgTgn8r38IGBqUr+7
 gjgNzLKeJqRHHb7PghWLSLmjd/k+6lXIcPn/+/3LUfrw2qLfDcWMcJf/+RI1q2ZL3HCl
 b2yEjW/SA1nEch28R3hrNC2Jz2uv1SHiP7ZVV2GR+7PoGph0S2NG+JIxbYwBqMTw8mEI
 LfPhHyGBZKakJruMT/nJtTzm4UpnqDXSL5B9Dt8kplGstEjy9g0T+eoANMgiB0T323F9
 fb1If4B4CyTXIpiSRycpgv9TlyhARAZ4mDHzc9V0WKCDjny6hLrO3RvPuIUmJlhbUlbx
 IyBg==
X-Gm-Message-State: AFqh2kr36tGXl0fWkT0H1ReywYmnpveEp4wpzhkAcTn9Sfp0UnX5mw43
 4dklQlod+McRHV11JcCPpvM/ww==
X-Google-Smtp-Source: AMrXdXvAwY7Kyt+hAExwenTfJwKKsMe+mYFgMRm+von3qrGq2PQ4I8ADpLvHfF1KtsDiyEiTSiNOdA==
X-Received: by 2002:aa7:9eca:0:b0:581:f654:a374 with SMTP id
 r10-20020aa79eca000000b00581f654a374mr22819570pfq.24.1672894923894; 
 Wed, 04 Jan 2023 21:02:03 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 128-20020a630086000000b004a099a12937sm8414366pga.84.2023.01.04.21.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 21:02:03 -0800 (PST)
Message-ID: <704cbb1d-f7be-e472-de02-dbced7d616f5@linaro.org>
Date: Wed, 4 Jan 2023 21:02:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 20/27] target/arm: Move cpregs definitions into
 tcg/cpregs.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-21-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-21-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 1/4/23 13:58, Fabiano Rosas wrote:
> Code moved verbatim, except for a couple of ifdef CONFIG_TCG that were
> dropped.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Extracted from:
> https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
> [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
> ---
>   target/arm/cpu.c               |    1 +
>   target/arm/helper.c            | 8081 -------------------------------
>   target/arm/machine.c           |    1 +
>   target/arm/tcg/cpregs.c        | 8088 ++++++++++++++++++++++++++++++++
>   target/arm/tcg/meson.build     |    1 +
>   target/arm/tcg/op_helper.c     |    1 +
>   target/arm/tcg/translate-a64.c |    1 +
>   target/arm/tcg/translate.c     |    1 +
>   8 files changed, 8094 insertions(+), 8081 deletions(-)
>   create mode 100644 target/arm/tcg/cpregs.c

No, these data structures are used by kvm too, via write_cpustate_to_list -> 
get_arm_cp_reginfo.  The code movement out of helper.c is desired, but the cpregs.c file 
should not be in tcg/.


r~

