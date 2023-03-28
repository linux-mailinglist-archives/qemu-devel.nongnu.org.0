Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDBB6CCB7C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:31:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFyG-0006xE-Jl; Tue, 28 Mar 2023 16:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFyE-0006wz-PR
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:31:06 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFyD-0006I8-0m
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:31:06 -0400
Received: by mail-pf1-x435.google.com with SMTP id z11so8871013pfh.4
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 13:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680035463;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VR3drSxXMToJtikVkIw4xz2tob/M2DuazRvVq4FHo4w=;
 b=klBtbHPb39O+j300LSjVH7ab2jIghO+yQ51JyXNdO7uEE+P8HVU/KA/V09hVOWwGV3
 81pUn53iswJ7D8bMIDHidA6FE6kpkCYqhHEV3Rmruaiyc2eHmOLi5z0/nSiWuSsnclao
 WFQvzFcR+FhcNvHxDf5ZHjuZxW/RpTyeWpx6j1j4vROiRnP/J9Wm3a69CX+c3qwSdNoW
 tv6bjKudypExdB2Di9ANb35H87m/ZSQ0/V3eXtGh71OYVh5h7QCtmk2zyKShp2e0rPM1
 TFrTRARDOHKmpQn6gS/eZPIG8T7ElPzRSL0gHTbQh5spPVJgcCeWBXeHodsQW7g/34kP
 DhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680035463;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VR3drSxXMToJtikVkIw4xz2tob/M2DuazRvVq4FHo4w=;
 b=QUzs6U7AgeNTkQQFs2Y24k0rqeVJcZLr67Z7MU1EGIEwWVJTrBEnW+O7eHozaJhFw7
 wU3EfGoxQ+JyVzBgmw7jtQ/7fagRFbxpmc4ERG4+J4LFhjwXQxktrJ5YGS5Yu/iz7L1J
 QeU4PACadiBtCsJaWU0pOFs8ZYSByV6Gr4TCrSLnKSZrPyhPmh3ppbn6Z6xTKYQ7nlnx
 jASNEi+Gi8uY+1W8Vf7rz+HCpLgaP/aDPX/HOcF3z8FNouq66/UNc/NwZ6G5iD2EKldh
 rBdqDUwdifcrMakmd09AkcpTMEvZhX/BlBDq4EAjJ/VspgvGbL9atZLBb0qTu202PFiP
 jkmw==
X-Gm-Message-State: AAQBX9e3k1DWfz16x/6nM7q6Q4tuLqCRp4afscH1a/9xz/+GS9X+XU0X
 o8ZJW8xRN3URHVBcJ8dmEQiJYw==
X-Google-Smtp-Source: AKy350Z+bdDB2UnRSutx7CgS6ShHxWjGZbkKmtW0P2RDFmIi1f8uYSc/xUVhVMMEUFEszArWh5mPog==
X-Received: by 2002:a62:3891:0:b0:622:3621:b2a8 with SMTP id
 f139-20020a623891000000b006223621b2a8mr15304948pfa.17.1680035463366; 
 Tue, 28 Mar 2023 13:31:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 c22-20020aa78c16000000b006280ae74893sm15629106pfd.48.2023.03.28.13.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 13:31:03 -0700 (PDT)
Message-ID: <e9241835-dee7-a404-6f7f-bfe3cc46e93f@linaro.org>
Date: Tue, 28 Mar 2023 13:31:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 11/44] target/loongarch: Implement vavg/vavgr
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-12-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-12-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 3/27/23 20:05, Song Gao wrote:
> This patch includes:
> - VAVG.{B/H/W/D}[U];
> - VAVGR.{B/H/W/D}[U].
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  17 ++
>   target/loongarch/helper.h                   |  18 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 197 ++++++++++++++++++++
>   target/loongarch/insns.decode               |  17 ++
>   target/loongarch/lsx_helper.c               |  45 +++++
>   5 files changed, 294 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

