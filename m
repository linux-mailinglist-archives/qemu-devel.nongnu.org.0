Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C126DBC88
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:04:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plDrM-0000le-EX; Sat, 08 Apr 2023 15:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDrK-0000kK-P5
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:04:22 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDrJ-0001Mt-1o
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:04:22 -0400
Received: by mail-pl1-x633.google.com with SMTP id ji2so2924258plb.0
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680980659;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XofnwkernuJNxPCDP/zjsq/cMVAtAY+ggarAnKsqR5U=;
 b=WWk/xq/9bPhdCVdKdUesuWqxo8oJkmIwlpdxIpLD1tmyq5aX5Vzp2I6LBBiFqb6D0u
 8WO8BI6ZfyIlRtOZ2bmo3UoujItLx7BAlr9fbdo3V7HfzugjPDqzatRtPsNFNn9Cl6rh
 OEFPWiAS+RU3YMFO3jnXQbyt+qkALPZocwV37EG8RjbbDmDyENMRAolnQQ2rzz7dw1sI
 yEKkXPxT4xAAmE5GCGRiBuc4sCMjl5qe3YiEbQHuooebmfSqD2nmGoQ/pT5ikhjq5oaK
 2Vjkt2fyuz4B7BwvR+dkToMV/IdCQLe1BCJxCyEcyNWdm2woGqCknwEYG/VuDgtqso+N
 X70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680980659;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XofnwkernuJNxPCDP/zjsq/cMVAtAY+ggarAnKsqR5U=;
 b=rW+MBiarjbRvoz7LKupqNWzDiOOuH8WNatydbTPzBS8kT9QAnlUY56GoaCIgETGCF2
 6SAICd+SNzcAKqN5b7w+01fCJQyHWr/8iZCP2qg7oun/SUOycQdL+M99Fql1ZW4KNZAC
 3FGMHHtWuLnogmA11BuawxllElWzMzm9+xjG/M6sEB/Nu7V649jQNDK+Mqg57B4ETnPS
 fPuTz7/C737QTJgv2AgmfQJTn3Xo8CbvGTCBUSoH6EmnPZiOSlbykQtR0/gAa21fGRjw
 IzwkfYeBXYiD1n0JdkHSa+6qAo6DSd6itcFt/Y804jtr5lKUfxzVkRXpEQSaEGonofR3
 8UmQ==
X-Gm-Message-State: AAQBX9cg/v2DHPEQAhVc8/LB5oEs6jRhZ86c1yta1h3O2JAnxSG39N/8
 NMIWbnoYBT4Wcs8OAw8dwFQE1w==
X-Google-Smtp-Source: AKy350YZx64k2c/3SR3ZvLiu6P/mxOtVtog+yjSBQgNv38TxHeUViGy1+qjVeVLfyxbV4F34xSEWjA==
X-Received: by 2002:a17:903:1389:b0:1a4:f79d:67bc with SMTP id
 jx9-20020a170903138900b001a4f79d67bcmr7439005plb.43.1680980659320; 
 Sat, 08 Apr 2023 12:04:19 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170902b69300b001a27e5ee634sm4860984pls.33.2023.04.08.12.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:04:18 -0700 (PDT)
Message-ID: <739c54a2-4d75-40a9-4533-fa951085c8fd@linaro.org>
Date: Sat, 8 Apr 2023 12:04:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/16] bsd-user: Move system FreeBSD call table to
 freebsd/os-syscall.c
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-5-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
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

On 4/5/23 14:36, Warner Losh wrote:
> Move the system call table, and FreeBSD helper routines out of strace.c.
> We do not support multiple BSD-types in one binary, so simplify things
> by moving it.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-syscall.c | 19 +++++++++++++++++++
>   bsd-user/qemu.h               |  5 -----
>   bsd-user/strace.c             | 17 -----------------
>   3 files changed, 19 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

