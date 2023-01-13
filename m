Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF44966A2B7
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 20:14:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGPU0-0004Nj-FS; Fri, 13 Jan 2023 14:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGPTw-0004NX-53
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 14:12:52 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGPTu-0005K3-BM
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 14:12:51 -0500
Received: by mail-pf1-x42e.google.com with SMTP id i65so13417752pfc.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 11:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MVhVB3hDjOKSxLzANuB4rSBzHKcKfBAlxfAB0W5+Gzk=;
 b=f+W2s7Vg0DRT0tIirLNC/5QnvFaxH7QiqUvoYL/IDLFdTtqDvnlaTKMzFFo7sZ1puH
 bR/QE1QLN1nJ/c2uaLdEG1pYx7SuYzhiUKpZ+mUhLCVIavkfGw9AF1fFL57P/1jPo+EP
 qqcQyeV8wvMLk2lxW6Px2ygcD7KSZZhZP3lgzbXUCKl3+fywEK3UwZwt+kBgBh0Ye4Na
 ND72tWyxP66yZWqkHdAbjD2ZLDAMEnivruJLD4wMG50nJSw3pzP+rlVJZUdKVKxpyHIo
 YyWcZOOAPQciB7v3S9WkOeHqHOCNSxjYNElQqxeARxMGm8K/NtnwWa7sKHXnkllw9IHO
 vcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MVhVB3hDjOKSxLzANuB4rSBzHKcKfBAlxfAB0W5+Gzk=;
 b=KUXVgdU95aoZ3jKAc3JvaENOPRny8Fg6gBtzsZPf+yis4ucuXOcIQSkqIKcSkwGiq2
 EL26k97vCatxx5okOD9xzeBdVQwZ3r82SDJ6vWx/F8V8aiFuKvfsHBWV95TFLobOMXUX
 7wdCByvT0Xi4Kv5UiEaWXRQ//t+xJoxnEYDrsTmZDIYwqJ6pJIwaV5qQUuKy+l7bgFgd
 njwB7i+Uh9B3NUJ/VFs3W4xRdOX6sZLx6bODsEImldsP6yvPGMkqdId9Mne/lZEt/idm
 hq3nQzc3kNCDfg8VX4RUUYqYf7eLfA26Io6O9nVxogM09+Q3+WJlZ+lvswFdwLVKTRd5
 tUYg==
X-Gm-Message-State: AFqh2krA2+BxHfImSR+HrDK85rvp4SPaogTqIvjuBAbW1DWmKIvl+LFl
 HE5MRzR1mEqKN91Lt8Z7s/jpFQ==
X-Google-Smtp-Source: AMrXdXtIJ7Pya2Ru9WAonHwEm7JvLwVFQJroaPJ/Tkn4qdaFczb7Uqba3UsXhM0n+mXmgXRk+CeJEw==
X-Received: by 2002:a62:e90e:0:b0:577:1c59:a96c with SMTP id
 j14-20020a62e90e000000b005771c59a96cmr78649528pfh.2.1673637168604; 
 Fri, 13 Jan 2023 11:12:48 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79905000000b00574ee8cfdabsm14455990pff.148.2023.01.13.11.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 11:12:48 -0800 (PST)
Message-ID: <1f202cab-77f6-3686-dc9d-6332348ca471@linaro.org>
Date: Fri, 13 Jan 2023 09:12:44 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0] softmmu: Extract watchpoint API from physmem.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20221209141254.68662-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221209141254.68662-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 12/9/22 06:12, Philippe Mathieu-Daudé wrote:
> The watchpoint API is specific to TCG system emulation.
> 
> Move it to a new compile unit. The inlined stubs are used
> for user-mode and non-TCG accelerators.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   MAINTAINERS           |   1 +
>   include/hw/core/cpu.h |   2 +-
>   softmmu/meson.build   |   3 +-
>   softmmu/physmem.c     | 191 ------------------------------------
>   softmmu/watchpoint.c  | 220 ++++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 224 insertions(+), 193 deletions(-)
>   create mode 100644 softmmu/watchpoint.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

