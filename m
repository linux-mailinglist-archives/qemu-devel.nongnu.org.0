Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D672431AD23
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 17:32:28 +0100 (CET)
Received: from localhost ([::1]:37158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAxqN-0002Hc-Vh
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 11:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAxnL-0001W4-BX
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:29:19 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAxnG-0005VJ-10
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:29:19 -0500
Received: by mail-pl1-x630.google.com with SMTP id s15so1417960plr.9
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 08:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y/G9MCgcdBgRA+LB+A56BujX0S2yqF5zsvC+frupAJU=;
 b=QiGWmV1UPUV6a8nqO/RrwsE7rqQx4XKGk7mLgU8QhuSfgeZAV/lXePFWawNuZtbtz8
 3oKN60rZ3YfiQLu9A+FfEL/SVBUKWmRPtZph5r0wOoRZ/ZFjpZLWG0W/uMII82f6pqFC
 bSJoFvJ/v74H0VdPxSjY01HCn8/469ZHySxo6KOAWFeBw63n7VY6cn2+aBug5G4N4XUr
 i/ExrgNkljG3DrKDdaKgezPSermN6xKzfqbnbEOzZZZL2FI6UHH6U8dV9mOZFGnf7OGm
 3eUxrwhF5DX+8O3dAyWH2yCYA8NnhRdmYDJRGclLDCgW0Ylp1SEvFWTVf8S5KPQF/aus
 +yuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y/G9MCgcdBgRA+LB+A56BujX0S2yqF5zsvC+frupAJU=;
 b=MC9Y7CUIZOEsiuJ/hZZxgoLI6n2Jswy6V1CGqdlw0yT5YqqOSs/5ix/ATqq6dWAj8M
 eF+kNQOq062w0cctrghLNZR2OmOjT4iWAQ9/eXZCjepJREKDd2UaHQDpgzXsi/QpbT4f
 60qolXpWeWcthfk7mGip/LICcOcurKGVpdnZp0GVWoINNuZjYKkzQb+LwOqjHJG1pgJY
 PeLPlwXoLZ/PVfEMzY0FlGW4//3OqlpO+j5C9UWhZJz1bNyPjCbxsPxBgKli4V59NH6d
 CKNQ9a1jLdundmyD59CCGo+ez3plrZF6vDsY3mHMOBw9dmhPWRLmxDbCLawku+Ycb8mG
 bkcw==
X-Gm-Message-State: AOAM531zrJM3CGidLuvD9/qajTo0bYXJF0zf6Azz1JTyYrhnKQnUeDZ+
 yMuwWc6IsnKkHN0OhJLfV+v2AQ==
X-Google-Smtp-Source: ABdhPJxURp0DF4ituLJMMN1oaw4NccQ3MCBsgSZFoRx4LhOof9qWhuPk8FutOB39OC3cPx4TT41W+w==
X-Received: by 2002:a17:903:22cc:b029:de:191c:1bdb with SMTP id
 y12-20020a17090322ccb02900de191c1bdbmr7725080plg.14.1613233752413; 
 Sat, 13 Feb 2021 08:29:12 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 e76sm11528679pfh.102.2021.02.13.08.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Feb 2021 08:29:11 -0800 (PST)
Subject: Re: [PATCH v3 17/23] accel/tcg: cache single instruction TB on
 pending replay exception
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210213130325.14781-1-alex.bennee@linaro.org>
 <20210213130325.14781-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <188a70c8-7db5-6b57-a82a-2eaf5840989e@linaro.org>
Date: Sat, 13 Feb 2021 08:29:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210213130325.14781-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/13/21 5:03 AM, Alex Bennée wrote:
> Again there is no reason to jump through the nocache hoops to execute
> a single instruction block. We do have to add an additional wrinkle to
> the cpu_handle_interrupt case to ensure we let through a TB where we
> have specifically disabled icount for the block.
> 
> As the last user of cpu_exec_nocache we can now remove the function.
> Further clean-up will follow in subsequent patches.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210209182749.31323-9-alex.bennee@linaro.org>
> Message-Id: <20210210221053.18050-18-alex.bennee@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 44 ++++----------------------------------------
>  1 file changed, 4 insertions(+), 40 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

