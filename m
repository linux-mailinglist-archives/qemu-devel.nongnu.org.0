Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E830C6DB6DC
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 01:08:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkvBM-000737-FI; Fri, 07 Apr 2023 19:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvBL-00072w-3N
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:07:47 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvBJ-0000M7-K8
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:07:46 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 b5-20020a17090a6e0500b0023f32869993so2584522pjk.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 16:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680908864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wgiL/ifYNfwo++KDFPg/Dio8zORaAFAk5bB5YtGhmQk=;
 b=MEGGWwlxDpwujW+GajFwMICW/+ZkQuiv23sCYl3JUT/QGW1SCye8aT/VwuveZyUz00
 danOwxCDQO8rPdclT/eLT0VCKJMmNVgE8cYX5i7MRWsQ4coyPuqnScvQZwZTRvGxdYvC
 FhJkRJCGIWp5W6kFxgNUJaKiGOLx9njvZfXCvRgcLvuhm7FACslFqNbhm4hJWCgiDvo2
 7hWTApcGKjnMgABAvptKlm34znz02qQ8vUOi0oekStr3YQbTAa5sGe+i21fWdcw/Aq1j
 c4DzqVmZej5HD6YvnXJJwa+uihhiloPCbj7INDw5KTL3mAU/KBhEKOkI7ZdD4FMRBbcu
 Juyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680908864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wgiL/ifYNfwo++KDFPg/Dio8zORaAFAk5bB5YtGhmQk=;
 b=XvXgR7kYZpnh7+Db+NXRvxI6N87VNF2LfzBcxsHH1xycqZxYdrPiE5/sYFYGaKEDxt
 YSMD0DMLtAdvLxhZiC7x6G7eSCvcJoAUB670AIdFt6KGuEKRZ+7qZEAtwiXT3/wEqfQM
 k+pKjO0sq66bd//HfYS/sqQ4KbsIgEH/sQpBeqcLGTufMmKfZ1MokCwiOgNioAfAY0Ck
 qJrBb3vZEGqBy6/Sn6ALmQrtd2k4VqE3NR5yxPJZkBSCfc1DdVelnVPmLykiF8Zdqw95
 Yy0Bg/o6syPzav9u0+W/ALRa5ow/1rzVLL7iTRBx4g/VVek9bkDzjUrPPeWlLV0aZHvJ
 ujDg==
X-Gm-Message-State: AAQBX9f38fQhW50Hu5mrRkOBWUZN3v+u1AJtnwDcHEvYIKeBumUwbvCN
 kkJjvjRN53IEsJYj93VOeLcxVA==
X-Google-Smtp-Source: AKy350bXcZjgyQUuRpp6nyP3eJ+x1rlN/eQIhLU/UutS8vew5xsari6fdOQWku6HCBWiasGwTXkzQw==
X-Received: by 2002:a17:902:e5cb:b0:1a1:e112:461c with SMTP id
 u11-20020a170902e5cb00b001a1e112461cmr12302648plf.30.1680908864146; 
 Fri, 07 Apr 2023 16:07:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a17090adf8200b002465e66256asm1238484pjv.11.2023.04.07.16.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:07:43 -0700 (PDT)
Message-ID: <a3c36603-6fd0-b093-0e8f-97e15b8e6bc9@linaro.org>
Date: Fri, 7 Apr 2023 16:07:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 08/14] accel: Move HAX hThread to accelerator context
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> hThread variable is only used by the HAX accelerator,
> so move it to the accelerator specific context.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h           | 1 -
>   target/i386/hax/hax-i386.h      | 3 +++
>   target/i386/hax/hax-accel-ops.c | 2 +-
>   target/i386/hax/hax-all.c       | 2 +-
>   target/i386/hax/hax-windows.c   | 2 +-
>   5 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

