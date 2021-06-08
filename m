Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F443A07C9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 01:32:25 +0200 (CEST)
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqlCq-0008Uh-K1
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 19:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlAL-0006Jx-72
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:29:49 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlAG-0000CS-EM
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:29:48 -0400
Received: by mail-pg1-x52e.google.com with SMTP id e22so17820998pgv.10
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 16:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jaEOuUFHUlxQrPeAVYC/FA4jnObIh53SdcO0faDHEP4=;
 b=hdVChaMqMTKeT1kRAvu+478y03Pt/7PG7uRvxOCJXd+nK18AfHPbtDfs/f2g3umIYL
 Hc7fmPIaqaN0DN1qC+0rDS3YmjV6BJP26VeN1mN6danyUHOElu3obCgpkw41k9MVHaER
 WLs+xgBF7FZQd8/BlVuhE2fhy+eb6/RFFm1t8hqn8u2c6sjM0uRkQorsGZ74ejEJdaqW
 +B02tsLERvTb70fAZQYp6pbGeQXbxWqT63DmBVHRzqdsEhRC47NUAyu/kKuvQG0TAlse
 Neqq/2p7EbRV+GwhBfYfTDS6w4PMNKJer/ASf7+WjwEBW54ekgLoO8LF7Fe46Y3vkb/P
 7L1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jaEOuUFHUlxQrPeAVYC/FA4jnObIh53SdcO0faDHEP4=;
 b=EssfJ2En9R7BZLfSUFzVRDCEwCOS4gdRERWmKPAfiRdHlADjL9SyohScNy1UgwU5R1
 nmH1eAk/TtuG+3EAy1xed1ayNS2NymOWuY2MRFhoK0vhXck52nQ6tXEz4bIqNCcnBJ7H
 KQ1Lty3jz7PlwcgnqC1yVj6jzhBs/0qquyIvKVH5COQNNf0JTv7jPUjhfl3QcIAWzzC4
 zcdU9B+cC0roC/NzI1HFMe6nnWOoBJxjj5MtQtRI0r21UCFSslS8B2dKa1CYTVpYumN5
 +iFuz/H2US1f5cncIAge6ftyLxilVM9yP30MOIJJb6oLoQnYmPwI4wQvxTpHcVFjZOry
 Sq9w==
X-Gm-Message-State: AOAM532mgbJkH18+eZk5s03dvBtHXH0LUgnL7qHK8UP2rmaPeKvgXzx1
 NW/Ca+QUKrbJqJaR7Fz/zjVuGv5UhXP0RQ==
X-Google-Smtp-Source: ABdhPJzunzrmoaSP7xTi/Tt6N0RhdML3alfIYHJ0W9s6H6+x70f6E6vxKOdEJxEFNcIwe6tqnl6q6A==
X-Received: by 2002:a05:6a00:cd3:b029:27f:c296:4a5d with SMTP id
 b19-20020a056a000cd3b029027fc2964a5dmr2427942pfv.38.1623194983030; 
 Tue, 08 Jun 2021 16:29:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b195sm12585528pga.47.2021.06.08.16.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:29:42 -0700 (PDT)
Subject: Re: [PATCH 23/55] target/arm: Implement MVE VMULH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e258719-e982-c188-69ec-71e897d75e7d@linaro.org>
Date: Tue, 8 Jun 2021 16:29:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VMULH insn, which performs a vector
> multiply and returns the high half of the result.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  7 +++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 38 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

