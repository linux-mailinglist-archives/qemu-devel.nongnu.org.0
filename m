Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530456F26FB
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 00:06:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pssgs-0003rz-7m; Sat, 29 Apr 2023 18:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pssgr-0003rp-6J
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 18:05:13 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pssgo-00083U-T8
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 18:05:12 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso10383785e9.3
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 15:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682805908; x=1685397908;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=70taPguI8gpLHi91j0gyDkCiRK9SzxfIQ998xtknhZ4=;
 b=PnM7EoI1B0NfOkdBhQKI+jDB6rXfvoxSIwmCQWDhYBKuYMFqkwjTWMaElqGoUXwIs8
 YLfpXZKOBCSoCYbioZBvlLwYpK4KDo9Af2mIqON8ULbsEGwyOWUErDHSy9CMOvafS+h6
 9KUgKeTtckq6LyV5q/wxOQX3FdPM662YfhvAfcub/ZOagGeC/Eqk2HdM3+uLB/EQNOAL
 1P/Y+MiIXGvsrCkTFLrpTbWo6J1djGJcuBrsz6fGIKsFM6f1lvh29VXWHnMdqktm/mM/
 2uUiVRDQKAcTxtwzCltchBEKnYf3kF6QK4/edWxJxClePYyvy20Ey4mYDlQR74F82l/y
 Pj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682805908; x=1685397908;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=70taPguI8gpLHi91j0gyDkCiRK9SzxfIQ998xtknhZ4=;
 b=LP1PG0rl0P0VISb7/euRI+gq0c09mziX4Cy1R1ba3OPM+9lFiCCAB2k04l7l7JFSE2
 +K0sIy+qwUI7XGfbJTpNYNCU3rqcQlxteuSgqGeIDuezgzEIMJLMKOYa4n7Cyk1hH45B
 7+D3xhs8Ppe4iB3S0Tx7JbBX8zAfIgej4gxdPZZI4excL49h7xyE7+kqhOymmY2mgOyT
 8wPNB4aOZ2s/Je4AOmGNNqvRTTIQ3OlaG/e3IvF/fNqrsW0HZFnEfhtT6eGhRNgsASs4
 hC9z0GQdJRA5Jp+6hipD8cTVtmU0z5zRgc+uqgFWD7GzDrKnIaE+qi06xatkqu2ojThR
 eVdw==
X-Gm-Message-State: AC+VfDy4wl2iV3l49a+JFSR4FfoCr6sjNIqSyGtUv/1oRqf0hbs0xHWF
 vDnL3A+o0RnEJpcYNzqDjFrBaA==
X-Google-Smtp-Source: ACHHUZ5PF28mrCdqCYnDBhcpxzzKfCRo39ZazDvcKpsqSkmZfNkh5oYLrEaGuUTX/MyBRPve3a57Aw==
X-Received: by 2002:a1c:f719:0:b0:3f1:71ca:e6d5 with SMTP id
 v25-20020a1cf719000000b003f171cae6d5mr6829508wmh.9.1682805907869; 
 Sat, 29 Apr 2023 15:05:07 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a1c7718000000b003f3195be0a0sm8558909wmi.31.2023.04.29.15.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 15:05:07 -0700 (PDT)
Message-ID: <607d67c6-4df6-f573-f7d4-a489e27496b1@linaro.org>
Date: Sat, 29 Apr 2023 23:05:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/17] Block patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20230428123954.179035-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230428123954.179035-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/28/23 13:39, Stefan Hajnoczi wrote:
> The following changes since commit 05d50ba2d4668d43a835c5a502efdec9b92646e6:
> 
>    Merge tag 'migration-20230427-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-04-28 08:35:06 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to d3c760be786571d83d5cea01953e543df4d76f51:
> 
>    docs/zoned-storage:add zoned emulation use case (2023-04-28 08:34:07 -0400)
> 
> ----------------------------------------------------------------
> Pull request
> 
> This pull request contains Sam Li's virtio-blk zoned storage work. These
> patches were dropped from my previous block pull request due to CI failures.


More CI build failures, e.g.

https://gitlab.com/qemu-project/qemu/-/jobs/4202086013#L1720
https://gitlab.com/qemu-project/qemu/-/jobs/4202085995#L4088


r~

