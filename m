Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A066C4DD4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:34:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezWF-0007ba-Gc; Wed, 22 Mar 2023 10:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezWA-0007ai-B4
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:32:46 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezW6-0003rV-7E
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:32:45 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso11652648wmo.0
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679495559;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ERdb2t14SOiP1f9GdEs1QAlU1vmu0yOt5IRdI7LPFw=;
 b=FvTBPHYhJikg2ysfGiH6RBEVy1bYvc/Jh/T7Clqm7GfztgJNhCju81rNQEecOPoBG9
 C5Dz/8jyT1+TmYNiFUzXG1w/TDRs23RyuM4Ld9r4gDRu/6N2Xj7vp3w9RTbJF1jwuo9G
 Yqh7uaNI0AN6lKQP/1w8EgM8ijBYTmI8w0SCJairxuPb7VrY+sInEWaYPZ5PQZBowlbE
 kxcqZs5THNw5m93rXz14qU7UOpnP+5ER2GPMkILabk/5fOcnXsMXmkwv9frLVI+hJmsu
 svKRHvEO01nH3lBL6hP2dTkb/R6V1IEVSY71bwUBa+4/y8/ju4qWcjqNp19MH/XDfYlr
 H5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679495559;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ERdb2t14SOiP1f9GdEs1QAlU1vmu0yOt5IRdI7LPFw=;
 b=hsb798XQYEPVjssVr0COPtHLJeeAD4JxYuKB/fy/ezJR1ro+8w/M8DZVm0fT0ia0Ub
 t0Y2fnOqnh8MbdspXvwywmWZUganuJzpZr0NBYGB7EFx3dvWTmguYW0DnHZ382fnNXax
 EFwv6xT6t1HrjiGmuY8DwEE1mAdnPerUqDGctfniru+oNDUQxv15Keqo4Z76Uvn7YJUo
 pj/w8shRRS1AewU9aGun7S1V8n3TCCgeK91d6N40N+SGtfwc2r/vCr9NZoRSEGjqx0ng
 i0kjzB6HNSNc1gLXZnLkxl+DdEcihd6mcI+kos0RCcKP3Pf2J/zYl0WBp9p4Fr/Ci/i9
 NEuQ==
X-Gm-Message-State: AO0yUKXMNPhPijzJtnoMsj6Gf9jKlPRg69RJ0V+idfPig9DUil6hkc0X
 Y8P6Gfn5hdY9QyvsbWlmwvsMr70sjkf9jT5fgUuIDQ==
X-Google-Smtp-Source: AK7set/DwzINfQA9KnInzYVdZLS0XFxIy6fn/ywgxrnZXGdqoOrvwkPPyv9q1znBZg6hPihTffaqWA==
X-Received: by 2002:a7b:c44b:0:b0:3ed:29d9:56ae with SMTP id
 l11-20020a7bc44b000000b003ed29d956aemr5469997wmi.6.1679495559582; 
 Wed, 22 Mar 2023 07:32:39 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003eda357cfc5sm14789048wmq.43.2023.03.22.07.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 07:32:39 -0700 (PDT)
Message-ID: <3d67c765-20fc-9ae9-1dfe-753f4ef16263@linaro.org>
Date: Wed, 22 Mar 2023 15:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0 0/2] target/arm/gdbstub: Fix builds when TCG is
 disabled
Content-Language: en-US
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org
References: <20230322142902.69511-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322142902.69511-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/3/23 15:29, Philippe Mathieu-Daudé wrote:
> Fix when building QEMU configured with --disable-tcg:
> 
>    Undefined symbols for architecture arm64:
>      "_arm_v7m_get_sp_ptr", referenced from:
>          _m_sysreg_get in target_arm_gdbstub.c.o
>      "_arm_v7m_mrs_control", referenced from:
>          _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
>      "_pauth_ptr_mask", referenced from:
>          _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>    ld: symbol(s) not found for architecture arm64
>    clang: error: linker command failed with exit code 1 (use -v to see invocation)

Beside having the non-TCG configs tested in CI, (I think) we can avoid
such breakage by moving the TCG-specific declarations from
target/arm/internals.h to some target/arm/tcg/tcg-internals.h header.
(target/arm/internals.h is 1400+ LoC anyway). Worth it?

