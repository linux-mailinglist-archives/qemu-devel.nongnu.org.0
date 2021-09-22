Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48877413FFC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 05:23:58 +0200 (CEST)
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSsrT-0005SI-Qx
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 23:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSspn-0004Yc-6Q
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:22:11 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:39565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSspl-0000sH-72
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:22:10 -0400
Received: by mail-pf1-x42f.google.com with SMTP id e16so1487259pfc.6
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 20:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uFL8DGo4ba5MDEPYzEJDrobGVTS/6kQpYyCVlL8MUA0=;
 b=OqZ5HzMI1N+VvJliz5zn+AgO28gQiGQNDORDwWpM1mfz0LksZze5EApERncLD/p6er
 CR7LedNdU9xGrf3cP8DBRCD4mx608R6ztAYcSO4gy3GSeOa/LiIM9TJVx26dybCaN2PN
 HOHttobxYfWk2C+050BowXE7C88yhlNIhhkuw8FWYCvbHnQDyXKc3R3c77GqIkk+9Gro
 wTdLL9tgsQ4Zniw2/pwQA7epFZpm3zuuKKfo9+9n85rCHV+j29Jh+INzVrXrF5hBDQSi
 72wlFSkYaYCe8VCNzNZkY0fCSV2QgKvmWTH2xhhd0N5MpqQAB0QN5MPYcia1/0uu4smp
 H/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uFL8DGo4ba5MDEPYzEJDrobGVTS/6kQpYyCVlL8MUA0=;
 b=Imy8MipKrbm+4PmHytlfjkcYn07EZZk+GR6B2WLRf2zQA/E5B7ya9GI1Z9O7+j1gF3
 wP6aAiu64NEcJ70+oGssbYCTrBtrtisBlE1UJtbRRBsF5KjzVbHmuny+zNijl2QharOr
 +UeshzPkQN6vhREGAM5zDyUFlueTwKtxv6IZxgmz82BOmnr8rdVOS20cbQTYrX3Ig5hZ
 CzcCKWPV3Tftrhp1YC6iRvxb0B3CP7Fm5BDVhQ+tY/P3x/jmj1cOrfiTf1wf+rIRm91u
 xZdJujYHnLKN3HlLvTzOMCrPjl/H7HqqlcsGkvjgLjXvelNL2Tiy/0VUrSrQ40++CMgc
 CAQw==
X-Gm-Message-State: AOAM5332DjvnD69xn7d7bmI8H4dHARPdPtdCEB0wCCnfPtaFt+3brwDF
 9oYnU2SMpzneCYsdCwNvNswFQQ==
X-Google-Smtp-Source: ABdhPJwXcpbVzhZ27KdaTMmhCC/ZO7q6CJ5bSVswYI4CTuep5xUuQtsVvsZ6ZOvtecBtb3RnSpSdOw==
X-Received: by 2002:a65:48ca:: with SMTP id o10mr31704791pgs.129.1632280927203; 
 Tue, 21 Sep 2021 20:22:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id lj7sm419682pjb.18.2021.09.21.20.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 20:22:06 -0700 (PDT)
Subject: Re: [PATCH 3/5] target/arm: Move gdbstub related code out of helper.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210921162901.17508-1-peter.maydell@linaro.org>
 <20210921162901.17508-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4e54849-5d6b-fd10-901e-9403c4dc0770@linaro.org>
Date: Tue, 21 Sep 2021 20:22:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921162901.17508-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:28 AM, Peter Maydell wrote:
> Currently helper.c includes some code which is part of the arm
> target's gdbstub support.  This code has a better home: in gdbstub.c
> and gdbstub64.c.  Move it there.
> 
> Because aarch64_fpu_gdb_get_reg() and aarch64_fpu_gdb_set_reg() move
> into gdbstub64.c, this means that they're now compiled only for
> TARGET_AARCH64 rather than always.  That is the only case when they
> would ever be used, but it does mean that the ifdef in
> arm_cpu_register_gdb_regs_for_features() needs to be adjusted to
> match.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h |   7 ++
>   target/arm/gdbstub.c   | 130 ++++++++++++++++++++
>   target/arm/gdbstub64.c | 140 +++++++++++++++++++++
>   target/arm/helper.c    | 271 -----------------------------------------
>   4 files changed, 277 insertions(+), 271 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

