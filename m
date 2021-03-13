Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB85933A02D
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:07:05 +0100 (CET)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL9bM-00028V-Qf
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL9Zu-0001RZ-S8
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:05:34 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:43564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL9Zp-0001s5-NX
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:05:34 -0500
Received: by mail-qt1-x82f.google.com with SMTP id s2so6441594qtx.10
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VUfcgdKlJBbU+E3hRAyOQSbGUpRVGF0tqqZgDIXXeVo=;
 b=gXPYNj8cH/eYSMKkICQmrLscKw5PHz3Li1TYmIgmnA9QAH41PaSwvt5e6fvfumHNyi
 oZ/HEbpSMfMN+1llLishboOtA6zu+wk6wB+RGMKur4qWmEBRqR0odPem86F5FkNk0H9E
 Qihd8ehfOANnG2G8r7whDhD98ph9NzL+lXkcrMYkHl9G4bwSHGApiMEpXv1uNAAdURqm
 TZgTc5DesDldKhXqA/zN3VTtgS+QXCz5s8tGDFRZkkX7ShQDjQh2B5oFMFcs/k4teCWK
 IokfZftefvzHWX/ZdDDCA5ntHWg6Em8iIjf9Dt34nHs+raX/a9HEWuBPtoX0P/De3H8Q
 zkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VUfcgdKlJBbU+E3hRAyOQSbGUpRVGF0tqqZgDIXXeVo=;
 b=kepJL6HH4lM04452AAemVWPSuMFwr0PTzDEx7+UfxAc1rdX4F32338iP2I9QA1VGBd
 FIPCp8ZVE8tRTvZnaUMcK3OhMX6bXfM2IxlpXzbCbpJEzB3MMcy7nyj5isXDK/IeUxp2
 o26zeOPW/RuszlqoGUSbVBZt2VbrQbKshlgJAq8GqXd62f7fEo5HZILbBJScyff867zl
 tSWjnrdO893yfRuhtX4mAxCUkYkbLM/u43cml7I0nHFxgUExGXqTc+I6xwKNVk7/85XI
 0DVkfNMdJQS6Lk8JStmibpjWNUFrs7ZupNPiERI85GVlDfw/ZPmPI4jxRoD30Esms4Pb
 Q/rg==
X-Gm-Message-State: AOAM533dLLlLJ/2CNX87MBubTEXkUTjOrxMGUWhjj3G9hHNOS7ryCNgS
 T2FNpp03c0dT5pwx2hW4i9ffqg==
X-Google-Smtp-Source: ABdhPJx7hcW7n3rDwUxp7NiW2cArmAAq7+Dd2m8PhyP2RNAwmHQQkN6ehVd1TmxOpzPJ5b1MBZhH3w==
X-Received: by 2002:ac8:47cc:: with SMTP id d12mr16749385qtr.147.1615662328465; 
 Sat, 13 Mar 2021 11:05:28 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y13sm6330784qto.39.2021.03.13.11.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:05:27 -0800 (PST)
Subject: Re: [PATCH for-6.0 0/2] arm: Make M-profile VTOR loads on reset
 handle memory aliasing
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210312172939.695-1-peter.maydell@linaro.org>
 <CAFEAcA8PN3EQN_E8zo0qUP=F7cAg=XvuUc2V6iop8YOOYxMGxQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <657618fc-9e62-6c24-c65d-ccc7375c7fcc@linaro.org>
Date: Sat, 13 Mar 2021 13:05:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8PN3EQN_E8zo0qUP=F7cAg=XvuUc2V6iop8YOOYxMGxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kumar Gala <kumar.gala@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 12:59 PM, Peter Maydell wrote:
> On Fri, 12 Mar 2021 at 17:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>> This series handles the possibility of aliasing by iterating through
>> the whole FlatView of the CPU's address space checking for other
>> mappings of the MemoryRegion corresponding to the location of the
>> vector table.  If we find any aliases we use rom_ptr() to see if the
>> ROM blob loader has any data there.
> 
> The other possible place we could put this code would be
> to put it into rom_ptr() itself. You'd have to change the
> callsites to pass an AddressSpace to rom_ptr(), but really
> we ought to do that anyway, because a Rom has an AddressSpace
> that we should be checking as well as the address.

I like this as the solution.


r~

