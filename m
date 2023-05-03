Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1086F559F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:09:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9QD-000499-L2; Wed, 03 May 2023 06:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9QB-0003yS-E0
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:09:15 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Q8-00011P-Sx
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:09:15 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2fde2879eabso4630855f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683108550; x=1685700550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wcIMNIQJw3Rat5r6oTc/kAyNujfgbHJFac6eiAE2onA=;
 b=F0UNbLV63kN/tUZb/x5PbcihRHMre2CWN6xPoX3eWneGOfWgYQmF/OJE4u5VdA82w8
 0nRtTyEKqhk2jP21RIPwqHekWmqQAzLQjsPYzDb3lK5s6UC44St3AgFKOtysCI7kwAw0
 CqlnPZESFxC4nZGFBHdKHWYprGpg4Jr/mxpjJtFCtZhsS2kTY/VwE8mk5lJVQ6ohgGmb
 pCmolN4kslbR3L1lsiV3b0ICJH5kWcQwn8KkklGs8nU1Y7WFT/S+rEj+1kyQdwxAWtQU
 SC0Utfc9W8rc9bezw6WCR2kPdHh7teBwxLlI5hEvA3n+CGhieNCApDEH1zhwuWM4NZHH
 Yw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683108550; x=1685700550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wcIMNIQJw3Rat5r6oTc/kAyNujfgbHJFac6eiAE2onA=;
 b=iljeFhotskBVwCoARLAQ7sOOFx1rcvTj/RgDI76aSgxKFw6EnoTncsptV0UOQFY+f2
 T7JRvCfR406Ss828Eq03oxCqjN11/3YJEtLiAP6PRCt6SKzhWfkoFfHJrcYPBDvXPzvq
 zvylmNGIalQZnElHA/hXXy22Q5qQpiuYn3SxV9P9amknDXb3/lXKrsGk4FjC/mXia6NM
 rLl2dYS/QfVxytfQTpCeyoJeulC41dUAJJXbaBNFMdi7jWeuArt9UGeHGKiCHoOeJXEB
 Akby0VGuCfh4w5zhXcPu5lQhMJEKV642ZfTy/0QfL2xmizJfcBrYQb+7QY744s0s8qKH
 U6KQ==
X-Gm-Message-State: AC+VfDwRa6pCOR1OawUrVuh/JzvmZ/CzPmygenGk1Up06BFvoSgvhY5V
 hUao33QRSkYiET159F0qMaZn3g==
X-Google-Smtp-Source: ACHHUZ42vGBIFp4YrgVcFuiFxsrmY0PIxPE3p7YJW5P0w/wRFz26H2KDvY1dFFjGyykbREKDIaupRA==
X-Received: by 2002:a5d:6882:0:b0:304:6b64:4f30 with SMTP id
 h2-20020a5d6882000000b003046b644f30mr13822782wru.18.1683108550283; 
 Wed, 03 May 2023 03:09:10 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4410000000b002f79ea6746asm33256086wrq.94.2023.05.03.03.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:09:09 -0700 (PDT)
Message-ID: <2e2db53a-2dd6-46d9-7c0b-f4e3ff4dd1ce@linaro.org>
Date: Wed, 3 May 2023 11:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/2] ppc: spapr: cleanup cr get/set with helpers.
Content-Language: en-US
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, npiggin@gmail.com,
 danielhb413@gmail.com
References: <20230503093619.2530487-1-harshpb@linux.ibm.com>
 <20230503093619.2530487-2-harshpb@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503093619.2530487-2-harshpb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/3/23 10:36, Harsh Prateek Bora wrote:
> The bits in cr reg are grouped into eight 4-bit fields represented
> by env->crf[8] and the related calculations should be abstracted to
> keep the calling routines simpler to read. This is a step towards
> cleaning up the related/calling code for better readability.
> 
> Signed-off-by: Harsh Prateek Bora<harshpb@linux.ibm.com>
> Reviewed-by: Fabiano Rosas<farosas@suse.de>
> ---
>   hw/ppc/spapr_hcall.c      | 18 ++----------------
>   linux-user/elfload.c      |  4 +---
>   linux-user/ppc/signal.c   |  9 ++-------
>   target/ppc/cpu.c          | 17 +++++++++++++++++
>   target/ppc/cpu.h          |  2 ++
>   target/ppc/gdbstub.c      | 22 ++++------------------
>   target/ppc/kvm.c          | 13 ++-----------
>   target/ppc/ppc-qmp-cmds.c |  6 +-----
>   8 files changed, 31 insertions(+), 60 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

