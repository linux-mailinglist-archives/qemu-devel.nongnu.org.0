Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6D39CAEA
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 22:31:16 +0200 (CEST)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpcwt-000156-B8
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 16:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpcvu-000076-5H
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 16:30:14 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpcvs-0005Nb-7B
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 16:30:13 -0400
Received: by mail-pf1-x42a.google.com with SMTP id k15so10050732pfp.6
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 13:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MjZDBfmlvEzke8ymEmImo3vV2Zv045gb0iAWw8myGww=;
 b=TdU272HmF4mVhWTpbbo2IkZOEFptPK4GhX8opCCbOEb9o7SYJ4PZ9EpeozCWcr+hVg
 bwmgwzx9yCzP/sBA1NSyBb0c3fHhw0uMmARZ0/1Wka5sbRvATTwIPTpG1bvfK5cYDnz4
 e2duIwbmrZD0d/NxDaMFMFK79csgKS/deNrrz909LjrIjqM5EH77FaCC0LaLxNjMZP36
 +bg8hzL0rGQtPJF+wHJTbCNQBiXi2a6/hJOED9WKmIrgzql8yw1wr7r+27zULBQBcvFE
 +FT/HJaeVg0gLAxPGSI+pns2GCDFXJN38VOHadZhG6kouAssGaACILb3T69iw7dvu5KH
 TaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MjZDBfmlvEzke8ymEmImo3vV2Zv045gb0iAWw8myGww=;
 b=ud5RORK1ZnMDsdBZdvYrCj06QVRJHzeTCnSP8NMTLCcgTmwFax2kh3z/ddBT83svuC
 mtYY+Vt0zUm6QBDZ8KokHGBTb5wiCfBsoNtR9dgs3FRzTMuHudNwPLtwPkWLjtFxg8ea
 zHqcFgT7YY3FbbkluwrauilwsDMMrLssg13LtwNq3xNTSIH5jb7pkcDg5Qtr1Urvu6Ey
 D0Al0bP9eckYm32lQaF1Xr/otgJsfEQrs0HkopaBdVpn56Y0NdeDLaFZsamzrKR5FOJk
 0rPHVet6MMaNHkdPDyn08LqNsVAAMPpG6E401ttAstW70e4h55t5gj5veFYZOHRJpbg3
 fCgQ==
X-Gm-Message-State: AOAM530W0XCWMmZ1EXXkOH1DUKdDv9QjqLk5ODc7qTnuxBIJHpCw+JM3
 k9lhY2kWrRsd01Fo3/s5RQtlNg==
X-Google-Smtp-Source: ABdhPJwTj+MY/UODcqDpUYDBnROie7eM+jzGIZGKQRXgSgfZKVP3qsvVFw82PgdHnupZrA7jxbm5jg==
X-Received: by 2002:a05:6a00:810:b029:2ec:3b54:6a89 with SMTP id
 m16-20020a056a000810b02902ec3b546a89mr10750861pfk.0.1622925010576; 
 Sat, 05 Jun 2021 13:30:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 r10sm5362425pga.48.2021.06.05.13.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 13:30:10 -0700 (PDT)
Subject: Re: [PATCH v16 77/99] target/arm: arch_dump: restrict ELFCLASS64 to
 AArch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-78-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d89b3fad-22fb-9745-e692-9b0616adc001@linaro.org>
Date: Sat, 5 Jun 2021 13:30:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-78-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> this will allow us to restrict more code to TARGET_AARCH64
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

I don't see this as an improvement, necessarily.  IIRC, arch_dump is sysemu only.

I think that for sysemu we should simply work to eliminate qemu-system-arm (or 
conversely, qemu-system-aarch64), running all Arm stuff with one binary.  At 
which point all this ifdeffery must be undone.


> --- a/roms/u-boot
> +++ b/roms/u-boot
> @@ -1 +1 @@
> -Subproject commit b46dd116ce03e235f2a7d4843c6278e1da44b5e1
> +Subproject commit d3689267f92c5956e09cc7d1baa4700141662bff

Mistake.


r~

