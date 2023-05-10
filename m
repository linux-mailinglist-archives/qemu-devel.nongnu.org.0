Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B86FDAFF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:46:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgOo-0002ry-H4; Wed, 10 May 2023 05:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgOl-0002qx-NR
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:46:15 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgOj-0007sS-Qw
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:46:15 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f435658d23so10609915e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683711972; x=1686303972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XQZhs5r694bR2oGcsupkpu848had+5Xn7fnlUEl9gNs=;
 b=zo0xd1PjABSYmnba2YsiUszz2BRcqdf0JjN0lxZZdZbAcp//KKDlQpM2aTTMmfxvWS
 pOIfLxo/f1/dwTb9PJHRcZBipTH4/nwPtW7neGUhiFlMr3s8fdGBk92KR/jdX51QgKGH
 871uWm4SR0PWICy9Ni5EcoXoq5OBKuEKDLZxUEu2pZUWXbxCbR9pEwTseLvoFncUEIvl
 0Ro67GI2que291BENMsALSWYbK091xziwC1LDto5sIxhvRx7CKhFfv2EYl3W+3Qm6O3L
 F3GOSmmocZG1Wn+42YmIl4U0Ebu9MGqpUwVZH7K76vpRGaJzchVJe+Sd6TvJZyzUExaQ
 ZGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683711972; x=1686303972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XQZhs5r694bR2oGcsupkpu848had+5Xn7fnlUEl9gNs=;
 b=Ntx6m4zZNsM5GhaxUfsKaiWTlH0MTQB3s+odKssGkQjgf/xIGF7R+bCl+QfOit2H2h
 QpZLMlm4pA+p61Y1LU0xKnRXFyJysYF7WAxu3Gzrb8vS0CBtJdkKmu7LldL14NBAuCUv
 lKTbyHDVHVt3hOYHfS8FjaZ2fzaURiLDQKBZzT+qKfWG1c7F7UBnKEpfyEZsxJLi9Z8b
 +JLldD9AF4blC9h6TQRZB+FA25Fe9ucYKgRKT7h8Ial+wQ0YjJc9O4Jl1asKkdJMZekS
 U/pjzza1qqdHEWwGBI/bjH42MwyChVzEcuOuqN81p4hKl5hswWhLBVXKJzf9yVN8+5td
 PXGA==
X-Gm-Message-State: AC+VfDyQhSOFyTYjg0MFbWLIZilXrUZsjd3+fDwVdmDzNnQMQ07GcpD9
 MZis819me0TNIjUdM1BORWGZNA==
X-Google-Smtp-Source: ACHHUZ6yf3b2XRh7e2/ZoFURh82tpXEU+M0OaRoP+kS8/0tikuZctk51fKaQR4vTWMg9FNL+I9oEag==
X-Received: by 2002:a1c:f401:0:b0:3f0:3ab2:a7e5 with SMTP id
 z1-20020a1cf401000000b003f03ab2a7e5mr12486618wma.34.1683711972167; 
 Wed, 10 May 2023 02:46:12 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056000050600b003079c402762sm7389185wrf.19.2023.05.10.02.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 02:46:11 -0700 (PDT)
Message-ID: <2ca17f5e-78d0-701d-d6a5-1f47405cedb2@linaro.org>
Date: Wed, 10 May 2023 10:46:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/12] accel/tcg/translate-all.c: Widen pc and cs_base
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230505141403.25735-1-anjo@rev.ng>
 <20230505141403.25735-3-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505141403.25735-3-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

On 5/5/23 15:13, Anton Johansson wrote:
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   accel/tcg/internal.h      |  6 +++---
>   accel/tcg/translate-all.c | 10 +++++-----
>   2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

