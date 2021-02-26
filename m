Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B4E326529
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:02:39 +0100 (CET)
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFfZe-00058q-CW
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfWh-0003jI-UC
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:59:36 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfWg-0003c7-2P
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:59:35 -0500
Received: by mail-pf1-x434.google.com with SMTP id r5so6501278pfh.13
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 07:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XFsmtRFs/867TBn/f/KoGJVCoOki/1C/ZlFfO+Uy9sQ=;
 b=Nqhvzv9Lo2tnbErzH/JYIXkFcVhktnNL/JguATgq+xDQyjaqXJej3V9wRdW1j7q6dd
 hcg9mcI+qGYNCCr2trMDhuw5FZ181mJhkR9ERi5aE7rJCpDcxkjB5C7aKBqAQgMdSJbV
 LKuffbEu8nY8oVL8Km2saxKsORYyjTlbcXQx7FePK3ME5281lvu30CxKQkPF40k4dVkF
 9biY8c1qVNtO05u8e5O7yoF2v7FMg/Mb9GqS/qu4Mh2nk8SVSUzHuMXvrs05NfvHXITG
 NznrPfDko453NRGuDuaN8VjHdzNHdoeKJFuF8rY8uLX9UDt8e/Ll2iYZ3T72gyyW6xI5
 kpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XFsmtRFs/867TBn/f/KoGJVCoOki/1C/ZlFfO+Uy9sQ=;
 b=aHDaq4JqER7WRY7voAtbckUSEFzcWnEmf0pC7515+simGK7YqkbMSTKsnhPCLCgcjH
 JcHwRLg+C3wlM7SQaWWaiJW3UnE/Nh0qsWKez1XS9pJ7V6966i0wsS+u7ro5dkSY7nfA
 iUeCyPN0wN5Cez0ab7hJw22yEDcCZholuhb/IV2x5I4cSbXACPNIksBrLPFAYXGn7+Wq
 6nLJq93VWQb2T3pni36kcP/NF09rTwyUxiwEwjXwxHPvhtQ2UBJPk5nMMf8inlNpIoWB
 nezvU7m3IeBC95XDjnHiK4gQm0D1ztKPTnrSUZbKRgQBT5Wg4YcaGWX+V3n8VwDlL5tt
 AKIg==
X-Gm-Message-State: AOAM533Q2O78TFkZTFMkAGLqbeYV/K7KwVOsouifSYkTZdsTcr0zhkDp
 PuWTYsP5A2g7jvsSGG1dQvC+fNtdLzU3Bg==
X-Google-Smtp-Source: ABdhPJw+MmZz2hjy5bOoUBj+2SNV5CRlRtSw49UBGXgJ4QphVBz+jFDk0yWsDrXCSODdsqB4PlFgXQ==
X-Received: by 2002:a65:62cd:: with SMTP id m13mr3482865pgv.108.1614355172510; 
 Fri, 26 Feb 2021 07:59:32 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r202sm10806124pfc.10.2021.02.26.07.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 07:59:32 -0800 (PST)
Subject: Re: [PATCH v24 16/18] target/i386: gdbstub: introduce aux functions
 to read/write CS64 regs
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210226094939.11087-1-cfontana@suse.de>
 <20210226094939.11087-17-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1112ad55-6d5c-2c8d-229b-11a09498a466@linaro.org>
Date: Fri, 26 Feb 2021 07:59:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226094939.11087-17-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.349,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 1:49 AM, Claudio Fontana wrote:
> a number of registers are read as 64bit under the condition that
> (hflags & HF_CS64_MASK) || TARGET_X86_64)
> 
> and a number of registers are written as 64bit under the condition that
> (hflags & HF_CS64_MASK).
> 
> Provide some auxiliary functions that do that.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/gdbstub.c | 155 ++++++++++++++----------------------------
>  1 file changed, 51 insertions(+), 104 deletions(-)

Much better, thanks.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

