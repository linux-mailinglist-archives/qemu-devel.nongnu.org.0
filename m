Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ABB681AAA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 20:38:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMZxe-0005hn-OG; Mon, 30 Jan 2023 14:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZxd-0005hN-10
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:37:01 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZxb-0008IT-CF
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:37:00 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso16618598pjj.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AA9esvsZFxH8kQfJpIhj4oVVAVHb2K+VrIFitU0VKL8=;
 b=xyXlLSmz/vpOxIvWq/x8+h1E7PwwNq8I76tv6/HcIU6tj8+qMd4x4I4PtO2UJ7oKUp
 Hdm0uFUY8ixyfkZJo+pkfWCXf5Cyb2+LQB1yQIe8UgCamjl/l8lnDxmplXMR5h7ct8mq
 DNPs3Xk9Mij+4podPZ566VqqwJel5eqkMZ3Y7Nvqwq5Am8piURmqRZStFeeJHxugrIxO
 w4PC658fFsxduqATds1eGOe8be2kcIft1Djr4kif7nugb/de7QD/A7RFg7eoQHmhf+IK
 DZbcX6+zyeN0jHJUL74Yn2Ggu+BDzCBvQkGotXJgVfB71o2zSQg+QeFEFFfuMLbxjXx/
 4qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AA9esvsZFxH8kQfJpIhj4oVVAVHb2K+VrIFitU0VKL8=;
 b=zpFMSpLD+Iq5syHbLSvrgsinP4IHSWmqyhywcA/bSxcoHOi2OEwWwZMJT36NqdX85p
 xgRnmgi+srfB3qybFlkp+Ar05Gqxs4H42bqNONg6jahg12FxtpsDfm8tjw5QeLwk7/bC
 9cva8FXLdKO127nhmFpVMpcomkIrogtFdIGHXlM6gBzrhqucsm0mk44YfWSx72FU4gvH
 jRt6sYG4wCfZ36dNH423H8DlFeXNc/Pf/ElqVbVy8Uze6tS2oJOhLiSDNLOlEfvu7GLi
 ULsR7T17t0YpxfEwBZHxK4uKNEbpu3SIyB4qgGM3Skdy6CuXravp6dmuglxMisYozBmz
 EUWg==
X-Gm-Message-State: AFqh2kpCLpcMj4HuqJmCTL93Fvqtm9WC/501P81wwyYzYb4khwwN2SMR
 xCW+RepDmsW5P0tD2FZGjGXa6Q==
X-Google-Smtp-Source: AMrXdXtJMjuBPu3myeSfbYugZVGGMjOYXNye4lKSF/IzKwYzWkRVcfsZft0OUeg6Xk93YjTaHPI9tA==
X-Received: by 2002:a17:90a:d585:b0:227:c69:3ca7 with SMTP id
 v5-20020a17090ad58500b002270c693ca7mr53225440pju.10.1675107417515; 
 Mon, 30 Jan 2023 11:36:57 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 ep22-20020a17090ae65600b0022c08445e97sm7272593pjb.38.2023.01.30.11.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 11:36:57 -0800 (PST)
Message-ID: <7afb4a86-0c01-4b5c-13bb-ea19a555c680@linaro.org>
Date: Mon, 30 Jan 2023 09:36:54 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 06/23] target/arm: Make HSTR_EL2 traps take priority
 over UNDEF-at-EL1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
 <20230130182459.3309057-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230130182459.3309057-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/30/23 08:24, Peter Maydell wrote:
> The semantics of HSTR_EL2 require that it traps cpreg accesses
> to EL2 for:
>   * EL1 accesses
>   * EL0 accesses, if the access is not UNDEFINED when the
>     trap bit is 0
> 
> (You can see this in the I_ZFGJP priority ordering, where HSTR_EL2
> traps from EL1 to EL2 are priority 12, UNDEFs are priority 13, and
> HSTR_EL2 traps from EL0 are priority 15.)
> 
> However, we don't get this right for EL1 accesses which UNDEF because
> the register doesn't exist at all or because its ri->access bits
> non-configurably forbid the access.  At EL1, check for the HSTR_EL2
> trap early, before either of these UNDEF reasons.
> 
> We have to retain the HSTR_EL2 check in access_check_cp_reg(),
> because at EL0 any kind of UNDEF-to-EL1 (including "no such
> register", "bad ri->access" and "ri->accessfn returns 'trap to EL1'")
> takes precedence over the trap to EL2.  But we only need to do that
> check for EL0 now.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Message-id:20230127175507.2895013-7-peter.maydell@linaro.org
> ---
>   target/arm/op_helper.c |  6 +++++-
>   target/arm/translate.c | 28 +++++++++++++++++++++++++++-
>   2 files changed, 32 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

