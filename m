Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75496DB6D6
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 01:07:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkvAv-0006rz-PQ; Fri, 07 Apr 2023 19:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvAt-0006ro-Ob
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:07:19 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkvAr-0000AP-V7
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 19:07:19 -0400
Received: by mail-pj1-x1029.google.com with SMTP id g3so713511pja.2
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 16:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680908836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JAx0qx3C6KbkeA3/DQYQ7BheR/mOc8zbOwn50MI/ySU=;
 b=mbYbKfx8mUmFoekiQdkNphSpXLmmbqH8glL3AwV4W3HVWtDJAciucY0lPbRfBpEDFq
 gLlOvNgZ1aLfgvbPXG+Qx/8/igjS3HTbQe0TOOhogHHLu6CsdelnF0yAQM3P4NvkeUlZ
 /xxR7Zdqi7rV2zCgA4fHc1MzHVBEyEVNb2vgXSmk+/mwYBQWFUuxDl3NGR/k474i1eEt
 GapH/ZtfQMmDXQlxBXlVSl3mvt6+PQYPigGuP+NMhSb2Yk4I8i4WH+/5bJi5N0/JyBg7
 qvyMaJ5KjlSKrhsg0GppELpMFE4U4M6ddit4DbdCD0iuZxi2OYxIn/vTltNF+s2Tq4mQ
 uM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680908836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JAx0qx3C6KbkeA3/DQYQ7BheR/mOc8zbOwn50MI/ySU=;
 b=Obh0XX6mcoyEfyvLlFcCZY0oorqhV8FC4pYYkefhthxQ0+mn6Zzl9935zqeCbwRxTA
 NoKgL8ei+6XqSS5c1sGmZIMMfMINVfsGH+KF2QytXECXFd5Db7tQU9+0GROh36UfihkG
 DMgKCtOENl77SsRBYIhRX6RFpkejk+x/rTqrxg2E1tqYhjrhz+cQkVDpr5fyrC08A3g3
 Cz6EsYd42vd8ccf5NAQZuywSJrsm0G5AfllVsVBGmz8FymjrZOZJ/rS/IXNe2Gndyd4l
 jl+IQESKm+bYw0ZiUrKDmyQrnTF8/EWt+GPSBj11h3noM+h+thIDXkAXvYrvWgQZdgvu
 4xxA==
X-Gm-Message-State: AAQBX9eDhDKjp4humuVB0somwsZDE3xcY6iiHPDbgoXloDsllZ0sjM2f
 FfVrp3MOyVJngdOdTrf1Jg7bhA==
X-Google-Smtp-Source: AKy350ZaLWvNZM1+jRdEw1wsK7EItizE9LE7fAUvdw6zSKnESjRPfP7KFdel4FWtCgR78LROUj0RRA==
X-Received: by 2002:a05:6a20:ca4e:b0:d7:34a1:85b9 with SMTP id
 hg14-20020a056a20ca4e00b000d734a185b9mr108846pzb.7.1680908836058; 
 Fri, 07 Apr 2023 16:07:16 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a63c108000000b005141e2c733dsm3117978pgf.11.2023.04.07.16.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:07:15 -0700 (PDT)
Message-ID: <7f1385f0-b0bc-090a-4437-434cb72a7cc6@linaro.org>
Date: Fri, 7 Apr 2023 16:07:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/14] accel: Rename struct hax_vcpu_state -> struct
 AccelvCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
> We want all accelerators to share the same opaque pointer in
> CPUState. Start with the HAX context, renaming its forward
> declarated structure 'hax_vcpu_state' as 'AccelvCPUState'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h       | 7 +++----
>   target/i386/hax/hax-i386.h  | 3 ++-
>   target/i386/nvmm/nvmm-all.c | 2 +-
>   target/i386/whpx/whpx-all.c | 2 +-
>   4 files changed, 7 insertions(+), 7 deletions(-)

Can this be squashed with previous?  It seems odd to change the name twice in a row.
Is the "v" in AccelvCPUState helpful?

> +    struct AccelvCPUState *accel;
>      /* shared by kvm, hax and hvf */
>      bool vcpu_dirty;

Move below the comment?  Or is that later?


r~

