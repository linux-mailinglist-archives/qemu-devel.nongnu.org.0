Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F95766A587
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 22:59:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGS4k-0002yu-Ft; Fri, 13 Jan 2023 16:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGS4i-0002y9-1g
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:59:00 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGS4g-00022g-Gx
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:58:59 -0500
Received: by mail-pg1-x530.google.com with SMTP id s67so15880128pgs.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 13:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tq6AiRtKVmwDGbnjlqMbHs3w5jVGhXsRwmRDnXTB03A=;
 b=OmYUP0TZz79RLi/jD0ECX+6l2hbHcVWH2rOMeTQiQu4Uvfo9ThIOeiB8J2R3F33AOr
 G2JprTnlmm0Fn8bzJYFIkoHO9Jc9HkOFFc/UHqGevIj+wJl5m6MkUOEdQU1ThZWFRdJ7
 tJ/r7yNJ2mnerbfrPVdzUbF+rN5wnCBHXcvPPej5Xr8jaOyTSEhcEP2mgcOWMuSZt09d
 EY+9L7QDM8R4qPYp51ZiOlwWZE35flcLyTojuG3Xv066eMTKoz0cEB6extvEKEUeuCIg
 ZVmYNVo6VPOo4iFOBl7yoEZRykSIo181dK54GcVnc/6zNfhoIos+KMo8OsGNPk+kBbC1
 4bDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tq6AiRtKVmwDGbnjlqMbHs3w5jVGhXsRwmRDnXTB03A=;
 b=hJcyZhPZU4QQYDWuyIX3ZscG+ptZfNx5wgQ0VW+7zRiyOPe2FFRcr6AJIYa7rKxMpc
 9AJRHMxrHBHeMgHXI6V3bSTgqjshMAumo3FgMmn+XAvbubxrQI/jEPqcsAQWpXi1EVnY
 h0oJ+DW/0Rc2mpFaY2Pw/WQQrtzzmwnnYpW0ZLN1uDwW66PfdqDtfi5PIqEEslZwKC7d
 Cf4PtRzXppU2HMukH0TgV2TjzXedXtCP2EJ538EDONCgHElU1i32twLxGOFyc8lcHdwm
 CAXuNyWk+r7PYj7Ik87EatOM3WijO6dwmv/YZxMi26AYriaIeoCHSYheGEvtybBY9fSf
 4n4A==
X-Gm-Message-State: AFqh2kqT0sfaKy24JUuN3AHiirNjXvL5Ggbe/5lWwf/PELLK58WGBHfd
 uLXdVeXDm0h5l6gvkgU4ote52Q==
X-Google-Smtp-Source: AMrXdXvIKAT2F9KrTUHIAsOI5guTYQZ0ybe8ekH0Qf6Q8koJ9RDxT2yumVirtghse89cpI1BKbf0KQ==
X-Received: by 2002:a62:84c9:0:b0:581:1f4b:d1e5 with SMTP id
 k192-20020a6284c9000000b005811f4bd1e5mr66306169pfd.12.1673647136884; 
 Fri, 13 Jan 2023 13:58:56 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 124-20020a621882000000b0057709fce782sm9485591pfy.54.2023.01.13.13.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 13:58:56 -0800 (PST)
Message-ID: <6e727a48-1418-23f7-1e67-8662f3564efd@linaro.org>
Date: Fri, 13 Jan 2023 11:58:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 17/28] target/arm: Move cortex sysregs into cpregs.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-18-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-18-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 1/13/23 06:04, Fabiano Rosas wrote:
> The file cpu_tcg.c is about to be moved into the tcg/ directory, so
> move the register definitions into cpregs.c along with all the others.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpregs.c    | 59 ++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpregs.h    |  6 +++++
>   target/arm/cpu64.c     |  1 +
>   target/arm/cpu_tcg.c   | 59 ------------------------------------------
>   target/arm/internals.h |  6 -----
>   5 files changed, 66 insertions(+), 65 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

