Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B415D6EC6D4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 09:13:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqqMx-0006wI-78; Mon, 24 Apr 2023 03:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqqMT-0006vI-FA
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 03:11:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqqMQ-0007HX-Fg
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 03:11:45 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so22608185e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 00:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682320300; x=1684912300;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TjtHPfIb6DuBs2mf3FmsskD40J5YH7qCDWHn5J/nnsU=;
 b=fVWsKe5XArhHJwOjBlr5+KjZxYHZH6R/ys8DitNybwnLDw/mFhunsWkYmvOC3rlsiD
 +72H/9BizKQonD4GrM0MLLa/YodtpFktkLDIDdjwjArGWB7roZigH2Vg+Ur/+OT+wME2
 rX43/wFtjG+tnef8oClByxjcMyoj2JEbQ4cbn3Uv/dsThI4rrjFjR0LkrIL5VEA61K1R
 FgEMqXX3AoZL30RvEIavOfWAEdoBK8Aj1Qx+fvooY6JPx56cqVtx7oE3oZ91reGNuwJW
 6b8P52PXSI829Dulj62Wfi4fcuvMGNtJ21X3GEOJAxnSuBf9k6ZGz5gsaJHDIUSk+UuY
 gfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682320300; x=1684912300;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TjtHPfIb6DuBs2mf3FmsskD40J5YH7qCDWHn5J/nnsU=;
 b=Dqyq5qM0UqjXcWSnUquF4HWGxAM4AFy6c7deawyoFmbRd42k7iijt6z36iq0DNpr9s
 q2vEI+F9ZYFqyMFxFIABbH0ONleVxXf5xOUXgz4c/L+lXXcKaZmdcPxcU2G+etlkJTZL
 raJrGbZo33l4fHF+7kTgjC9oWbrCQ3xVA3/2h+Aos3zLx2ljOvFtnd00aYEwFdqVNpN+
 b9OYtiSpCw0oiGEEalh6XVR4TJN2wEeFClVdDLs/I45Ym9GFfVpQFvKdPpebJG9pWjKW
 P+lDz5RflXwQIRtce/SYvEmOvnSb86IIVGhAFv08qJ38rb4SD+T9BRWdd48XiHECqOnu
 ADjw==
X-Gm-Message-State: AAQBX9chTUVvsyhWSuqM2buFaJXj1Pauy6gsRI25cF5/PdCOW8WTti5B
 osIzRMbhUqJA+5S9tvuSp1+wOQ==
X-Google-Smtp-Source: AKy350Yv+nOTdOs6Kcybi2C3dJOCPdAsAe8NxdSHIHmzRjjSWhvnAAwSAL1UvkCpKuNj7uXSWYtkCg==
X-Received: by 2002:a05:6000:1201:b0:2f2:c46b:1eb5 with SMTP id
 e1-20020a056000120100b002f2c46b1eb5mr8790905wrx.59.1682320300425; 
 Mon, 24 Apr 2023 00:11:40 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 o4-20020a056000010400b002fa67f77c16sm10068866wrx.57.2023.04.24.00.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 00:11:40 -0700 (PDT)
Message-ID: <ef371ab9-b258-2ac0-db39-f980276e823d@linaro.org>
Date: Mon, 24 Apr 2023 08:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 13/44] target/loongarch: Implement vmax/vmin
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-14-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-14-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/20/23 09:06, Song Gao wrote:
> This patch includes:
> - VMAX[I].{B/H/W/D}[U];
> - VMIN[I].{B/H/W/D}[U].
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  33 ++++
>   target/loongarch/helper.h                   |  18 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 200 ++++++++++++++++++++
>   target/loongarch/insns.decode               |  35 ++++
>   target/loongarch/lsx_helper.c               |  33 ++++
>   5 files changed, 319 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

