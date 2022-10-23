Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433DA60985E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 04:57:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omnKI-000650-JZ; Sun, 23 Oct 2022 22:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omi30-0005kd-2L
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 16:58:18 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omi2y-0001i1-LR
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 16:58:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id t4so5470699wmj.5
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0L7zacN4Afy2/tZp2HcbK7kM9pbnERKmmXjvJEYE9gA=;
 b=JiT2dzW83QXJqUSIeRdKVjnRoswoW7+LdVagah7xvlGrt+v2mpdkrphK5RLbHdQi4F
 L88ffbWDdQSXxdAQnEq6rDAmjOiJ15aPYTQL+u5qwHKOyI5USd3K9PJPM0KxJl9bzWKQ
 0gK6f0JgMVuLhtGpGKjaj4M6bBMC9TcbESqWGHpHOsiDpRyQQinTkRx/xLZu6j4oP3D0
 MykJU9Tut6GQK2o+Un67419LYkVh7aJL9EH+c08t++74GCqGCe2cbJsn1etH3K02RX3K
 TDNEwu4fVdfTOVPkQBFjcbRuSXsKr8D4yWBOT+KxO3MOBxkS38k/PtVGgkP536SJIdJw
 h42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0L7zacN4Afy2/tZp2HcbK7kM9pbnERKmmXjvJEYE9gA=;
 b=BNLMK/LfZFhwvVamwHNO6gKhVdJtWfaGE/Mi0ORKYwYNj1EmU6pVsZUVYaI8O8VSu8
 hUTjXVqoeJEnxbg+nwE2wEPZRXHhfG0+U943TEnQPmpU8XK43Odic5LnQtChec3Y8P2H
 e9WcJ/49NroFml+HyMKlYtJYc2tcYMqKBISENXX6fdWJ26ARV6uV2FsOyIVB0S5WyRqr
 TJK9Qem47qDc3A3+cFe4TDd1kaYk36yMlru2if7hy1+fowHoNBLuOqAuyM8KpumFlsIV
 4mjLKPxgFV9OXsFTAHOtY1UAvaDb/5hxxny+QDCBAx7lc3xNEYIVcH2A4hhZgOCgEfuJ
 Q9Dg==
X-Gm-Message-State: ACrzQf1NDncYP2kusZELT5ARM1HPUPUxG5B8Y2ese5gLlrhkB4TT2CdM
 4QF0u+PLOulWrnNNwgSFUILuqg==
X-Google-Smtp-Source: AMsMyM4CY8zl9AUXgW07OfPQWXqt8C7tN46WrvOVg6Lnjs51eUcx9BcsBohdfnb6CeeZBDinlEd3Tg==
X-Received: by 2002:a05:600c:6028:b0:3c6:f0bb:316a with SMTP id
 az40-20020a05600c602800b003c6f0bb316amr29087476wmb.1.1666558694292; 
 Sun, 23 Oct 2022 13:58:14 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c410c00b003c83465ccbfsm6106395wmi.35.2022.10.23.13.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 13:58:13 -0700 (PDT)
Message-ID: <1c95b47d-6113-b4cf-7854-63795a9e0bc6@linaro.org>
Date: Sun, 23 Oct 2022 22:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH] Revert "accel/tcg: Init TCG cflags in vCPU thread handler"
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org, 
 Aaron Lindsay <aaron@os.amperecomputing.com>
References: <20221021163409.3674911-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021163409.3674911-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/10/22 18:34, Peter Maydell wrote:
> Commit a82fd5a4ec24d was intended to be a code cleanup, but
> unfortunately it has a bug. It moves the initialization of the
> TCG cflags from the "start a new vcpu" function to the
> thread handler; this is fine when each vcpu has its own thread,
> but when we are doing round-robin of vcpus on a single thread
> we end up only initializing the cflags for CPU 0, not for any
> of the others.
> 
> The most obvious effect of this bug is that running in icount
> mode with more than one CPU is broken; typically the guest
> hangs shortly after it brings up the secondary CPUs.

Ouch, sorry for the annoyance...

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> This reverts commit a82fd5a4ec24d923ff1e6da128c0fd4a74079d99.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   accel/tcg/tcg-accel-ops-mttcg.c | 5 +++--
>   accel/tcg/tcg-accel-ops-rr.c    | 7 ++++---
>   2 files changed, 7 insertions(+), 5 deletions(-)


