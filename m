Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A3E3CC268
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:12:11 +0200 (CEST)
Received: from localhost ([::1]:60830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hIo-0001wD-NR
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m4hGo-0007eT-5z
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m4hGm-0007MJ-GM
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so7333292wmc.2
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HLj932liRtgCLDEiHTfLbLmDo7xtHv9ImgjuVs+uIwM=;
 b=S9/MmVMvJ8nozHsRBYpTwu6acglIl151C46tUuHtdIcSbyFJPN0gxlKkqyxXTXGnEG
 zIdbTM7De4gAjg2JieA29uc4esxnDhP+kdr7tdM4FxK1o3dVXZOUK+0fkLpcxYUS02Jz
 bwqAMcQHGHVIVzrJap3/r5PZRvsqP8bWqLNilUEYDwI16wE0yX39hMVrITqwm5cRwnQ8
 Ly9NzBd2cQTFsebS/M9X6hCdxid57iE/nsEcDxTQqO7H9QArcTGMRPUtdM1AnfsEBZJg
 m76UdVEtOmfjE4m9gGr+q75j6PBGI3aohVXeLBto95ldZvXQJV30wbeudMBwbAyCN16c
 6oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HLj932liRtgCLDEiHTfLbLmDo7xtHv9ImgjuVs+uIwM=;
 b=NmxKmtFvAXc9vDOkMX/1t7NlxV3fJpuRBwdsZnPMZM33p+Qgi8mcG/LLMio446y4Wi
 jyueqxg2xcF9nDIMH6Rx2f2/AH3PXnsGapTrxvQzF6GoYgcDwTQTWceZFAJxQ/H4rxbh
 btWYtziX7GOfb7Pmnrxst72tPqkUBmJO2ndxtm8E3FwhanEPZ78BD+ZuF0WeqaXVAbeI
 H6Jbdc5GlbDd1Ntb7AE8FDSEC0LaUHGCtMe/RRMMzkEJYujCJKWjeCMTEjQ7TWWwsE6A
 dfUqX+Rx/KXulk7c3lvSvPx2TfSTCoHPlAmMDDD3hEueSfMiBabceGw0/Omv6TOeZ2zq
 Ps2w==
X-Gm-Message-State: AOAM533yRST8xlK49Y0m1T0a4pq8PrhTK/VAyZqDEbzJ7hrnE4S+eD9Q
 Z9aiNTb7YpUtZoXucL1nT2c=
X-Google-Smtp-Source: ABdhPJzmUa9pP2l3UxhQEv5NvMc5yQ6m09b1irlDRyUgkK6hKLssn1elyv52BXpZYipekINlKhPMsw==
X-Received: by 2002:a1c:4c15:: with SMTP id z21mr15706484wmf.114.1626516602677; 
 Sat, 17 Jul 2021 03:10:02 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id c10sm10505043wmb.40.2021.07.17.03.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 03:10:02 -0700 (PDT)
Subject: Re: [PATCH v2 07/11] accel/tcg: Fold EXTRA_ARGS into atomic_template.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210717014121.1784956-1-richard.henderson@linaro.org>
 <20210717014121.1784956-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2477ea23-b966-3b7c-a166-a452b1db6fe7@amsat.org>
Date: Sat, 17 Jul 2021 12:10:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717014121.1784956-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, crobinso@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 3:41 AM, Richard Henderson wrote:
> All instances of EXTRA_ARGS are now identical.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/atomic_template.h | 36 ++++++++++++++++++++----------------
>  accel/tcg/cputlb.c          |  1 -
>  accel/tcg/user-exec.c       |  1 -
>  3 files changed, 20 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

