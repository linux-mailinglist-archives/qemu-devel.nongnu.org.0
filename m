Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3D96ECA8F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 12:47:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqtin-0007qM-2H; Mon, 24 Apr 2023 06:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqtik-0007pH-Qm
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 06:46:58 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqtij-0005PF-4q
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 06:46:58 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f19c473b9eso39796715e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 03:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682333215; x=1684925215;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nQu9hFCBC4aLgjAM1gbg/Ke+c0s8kTK06POwrfAFZBI=;
 b=u7K2Q5L/jLwbEfCzzQbojxvIJNsOHxPB8Vh06c/7wjD7Cko3yCrVYUhSQXChPNltTy
 QTM226SusNv8TJ6pTJCEXY4qVZbRMJHAVdJ5nwvZbxDcFstUShmJ2AOahprKKPsIQqs5
 ogBJyj6ARBfr9lDjwvHOja3uCuImYjqchkOhD/kRwno7FntFxr3qdKV1NqwC9w6hG/8Z
 8BzXU/RbcpfrMGVA09qmr29UMhcgfRITUqd/Dv5pPniK2HSB/E4kMS+St8crkQk1+de7
 n53XLivn3U/9Cb5SnkfNh8OocPF+YYn9vJrs738yrnDtaW/CgH6ITXiLMV7aw84M06xo
 Q45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682333215; x=1684925215;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nQu9hFCBC4aLgjAM1gbg/Ke+c0s8kTK06POwrfAFZBI=;
 b=TrJF/8MfFzZkbTvIQNpSL9elbqh0qIBlLaHqkrjLS3JGDfBjUT47ffAxg9sAYaRelk
 GhnmkPckIIVTh/Xk8wKg+7TKws3DPXNGxmIhjDH/G37lXDx5Aiw7tQuENIQxnvZOMH6M
 t2cEttk4l77l6BII+DKOhSrprnO2Wnv2i0a7ynBqBBTX2yTGWD2FsVUEBtr2emDF6n7X
 gTdpbkWc53QBEJOl15LssFGEQlMOebWNi/QqCdipL0hvasyRyS+2eZT9uTjkPLLg72Id
 3cePwYmd1G1qkSbGF9q3VXL6G7nIvEQuX6FZqcDUZ5mSm5VZ0k2cnvOPMfF3QrxcioCw
 c8Vg==
X-Gm-Message-State: AAQBX9dU73RKRTAH75f0QKF9Lnkj8PIyoY7i5pnGtohvuPLZyc4eVWkS
 tZncsAa/3vdzlnqO8f+qoRUyOw==
X-Google-Smtp-Source: AKy350YPyRInz+0QA1x8/tP4+FGNX75UCpG1buvNI+J93AUq5tQBAVqdbd3k271DA3KFX3etUHMrVA==
X-Received: by 2002:a05:600c:34cf:b0:3f1:7510:62e8 with SMTP id
 d15-20020a05600c34cf00b003f1751062e8mr7206698wmq.3.1682333215238; 
 Mon, 24 Apr 2023 03:46:55 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 u3-20020a7bcb03000000b003f16f3cc9fcsm11870096wmj.9.2023.04.24.03.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 03:46:54 -0700 (PDT)
Message-ID: <d559e5dd-45d3-1860-7e42-e098a836b7cd@linaro.org>
Date: Mon, 24 Apr 2023 11:46:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 07/18] .gitlab-ci.d/cirrus: Drop the CI job for compiling
 with FreeBSD 12
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230424092249.58552-1-alex.bennee@linaro.org>
 <20230424092249.58552-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230424092249.58552-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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

On 4/24/23 10:22, Alex Bennée wrote:
> From: Thomas Huth<thuth@redhat.com>
> 
> FreeBSD 13.0 has been released in April 2021:
> 
>   https://www.freebsd.org/releases/13.0R/announce/
> 
> According to QEMU's support policy, we stop supporting the previous
> major release two years after the the new major release has been
> published. So we can stop testing FreeBSD 12 in our CI now.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> Message-Id:<20230418160225.529172-1-thuth@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/cirrus.yml             | 13 -------------
>   .gitlab-ci.d/cirrus/freebsd-12.vars | 16 ----------------
>   tests/lcitool/refresh               |  1 -
>   3 files changed, 30 deletions(-)
>   delete mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

