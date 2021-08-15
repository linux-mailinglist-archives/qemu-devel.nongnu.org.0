Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C33ECAC2
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 21:54:47 +0200 (CEST)
Received: from localhost ([::1]:43606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFMDW-0007V8-Kt
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 15:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMCM-0006Ei-SC
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 15:53:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMCK-00064q-IN
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 15:53:34 -0400
Received: by mail-pj1-x1032.google.com with SMTP id n5so2771408pjt.4
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 12:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0qkhmpW5VfmWP/SFxE7w1XwtkrhERBX8GLkvHhHhbWg=;
 b=Ze6yGpah1L/tLQlMhVyVzF/SGSZJtTiMltZmzQnl2wl6qzo6QXYB1o5Skx4LV+i/yP
 qxfS/jfb89lTaQlDm1Xp5UMF41ssSj3VTk2U3eTIZiAAYnQ+Gd6F+KDHBFXiJJdEKNJm
 c4HjxGfTHCP7IITRV/1JGpG/VY/2Z/kDlgw2i8K6ttFXj95iBoHkDuJljhmmuHf9sQ0s
 HjFEcYdLSYowDxOGiYufG+7RW0BbF0EwhVvqeiDwpihHHscRYfkkbUIBMKsczUpeOPnP
 EfpopvPDlH8chtW5Ul4RipNR7Ve+IQmfh7SMuoVPUtnY9Ay/KcYFOBa0hXXCZfO98tr2
 de6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0qkhmpW5VfmWP/SFxE7w1XwtkrhERBX8GLkvHhHhbWg=;
 b=jwGkmLKkCQK65krtCsEut8QIWC4FFgKkgfnjS8X/lXetEVj+MDU/yUZ3U4+M3Yr7B6
 12U7kKegphRyyGnfQizSPKlh66+sJqXvNqd2vmKhyHRlFmM2tzAk8UGXU+0DGfyG25Sc
 2ol/jyURXYAejuOMpfgbTUaB/BomJ5uCZBWNod9V3zSf1Q1rO38URfhOHsdC11YdAst4
 abWIzcN3gkVemf7B6g9YvCjVhWwIENzjEdDr2uKw5pXgmueHf2bSX9CiKc4gbEoB6I1B
 cVYJZXBo5MjTiNgbDBZ3f8N7G05nbJffuJy19csDAzhHh33nXfI3V3k7BsfgEE6IBT9k
 3+/A==
X-Gm-Message-State: AOAM531V4O7d402kZnBzUlm7Je5cHvTxEKjXwesiq96w6fE42HARNi8S
 GcRlk0fOSiG6bO1EjTpWIaIaeA==
X-Google-Smtp-Source: ABdhPJy/+/iuVTVniktkUZaZz3KN4xjojPYIeZhgfXrqvbyNKYhGzQbp7uayryeo/0t9daqOL0kPOA==
X-Received: by 2002:a05:6a00:1808:b0:3e1:f8c5:3436 with SMTP id
 y8-20020a056a00180800b003e1f8c53436mr830513pfa.3.1629057210884; 
 Sun, 15 Aug 2021 12:53:30 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id d198sm8778649pfd.101.2021.08.15.12.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 12:53:30 -0700 (PDT)
Subject: Re: [PATCH for-6.2 2/7] linux-user/arm: Set siginfo_t addr field for
 SIGTRAP signals
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8623d078-57e5-57e2-fdf9-f26bdcf29079@linaro.org>
Date: Sun, 15 Aug 2021 09:53:27 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/21 3:18 AM, Peter Maydell wrote:
> When generating a TRAP_BRKPT SIGTRAP, set the siginfo_t addr field
> to the PC where the breakpoint/singlestep trap occurred; this is
> what the kernel does for this signal for this architecture.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/arm/cpu_loop.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

