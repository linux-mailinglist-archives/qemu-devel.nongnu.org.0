Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285E43CBA98
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:35:46 +0200 (CEST)
Received: from localhost ([::1]:46720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4QoS-0005b0-Ut
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qmz-0004M7-DU
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:34:13 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qmx-0007we-TH
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:34:13 -0400
Received: by mail-pg1-x52e.google.com with SMTP id y17so10436658pgf.12
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rP2/KXHrABUuOZ7Gry2VPqvnsBK5X6S+2R+W1T6Z0o0=;
 b=GQnXchg5a0C2+9YfIV5znMVPiUQPxmvsCN5a7glhY6UJBM7FzxctQg3msA5JVjHxya
 5LvQZ+9NJILgXE2juhrDWWAGiC3VBg947SjpR5qEfeJj7d/75asOMdFQ6oyHuHkQ9nNU
 F3XL3cfekmD6tI/Y8U0JprMDI5xe+1+M9idb2PaenPhM+93iLxfY+jFM9AlRcPlCq3d/
 AvxXAGgVJekrYBE+NnJaY66ZqVtRuqVs0hFCajNXGpRISFMzuvIWUQX06nvrizHPbEsx
 zvhjU4eg9SBvViA+I99VgpoJt4W876faZkL0Smn6Y3jZc9pfROThpM0oqN5QbDVFYdr8
 9r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rP2/KXHrABUuOZ7Gry2VPqvnsBK5X6S+2R+W1T6Z0o0=;
 b=ZOsgMM7i9eBGh5rqxyOZOUlxlI4FGA263WmvKnAbOjKcE5XdI8gWbj5+M0TCjp3Jrh
 BBjMKLuEELSM5P1oYY1HMWOs4Jh7JU+hLjxVepyKE8OtKJ68Y/mQ8bjqV7+6hmRiFDHq
 ZnWLd3hxWZ0xd3ODWfrYXX5jgIGslE66/T128gCMaP7628mO/DVicFO4c4KxQZNKRArG
 AGGvNTvIvrqQA5r32cIUA2TSBOwSYUGvA2nnABd5USA0woAMSVH/NJT2oD6xIRkpF8zG
 Y9NuyCr6PNzB9Eqb9RirLwGOtv9vQj1oqqfnM4rQNcShh89gdqa2ZfxTrtMVbDoe9mjO
 ONtg==
X-Gm-Message-State: AOAM532CpffpM2LdRQ1khu04MzSeAtva47F+gAzl/5+VPuVUOFa1oCu/
 40wbUuGcq85I7e7+J4eSUdrixbttmoiRpA==
X-Google-Smtp-Source: ABdhPJx6L9Qlgn4Qq9qIcEljBJizGgtplnHC9pqpNlVoE1Zgjy8/KjJb1xaD7ksjykCYbIW0qa3hPw==
X-Received: by 2002:a63:5442:: with SMTP id e2mr10951706pgm.365.1626453250325; 
 Fri, 16 Jul 2021 09:34:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v10sm12561668pjd.29.2021.07.16.09.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:34:10 -0700 (PDT)
Subject: Re: [PATCH for-6.2 06/34] target/arm: Fix 48-bit saturating shifts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0332b682-1bd0-ca64-65f6-e06e1ad9c0bb@linaro.org>
Date: Fri, 16 Jul 2021 09:34:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 6:36 AM, Peter Maydell wrote:
> -    return (1ULL << 47) - (src >= 0);
> +    return sextract64((1ULL << 47) - (src >= 0), 0, 48);

Clearer as

   return src >= 0 ? MAKE_64BIT_MASK(0, 47) : MAKE_64BIT_MASK(47, 17);

?  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

