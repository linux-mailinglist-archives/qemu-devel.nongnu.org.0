Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD0A36C9A7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 18:43:41 +0200 (CEST)
Received: from localhost ([::1]:39492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbQoG-0002jb-Gs
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 12:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQlg-00026F-Qz
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:41:00 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQlV-00045B-7E
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:40:59 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c3so22988092pfo.3
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9qWkQEW+zRrgpJDzh76RLl6aQzYDiDDT2yAGtLCDL5Q=;
 b=dqwnILH0vQH9uAH17h3iq3kn/YFRF/bd70TE/XLuymYPtQDRC7kx1K0bgyuGlt+xYZ
 pobtbxdLz7XuxuY2DB+TFV5jhUcCQJ8wzvr6nsaqUmfZbuyEpWKR29ErazCsSlYVLxao
 DtFlAI5WLdW0eAXn3zPl+zd5JsQrLs3mADJwdpDPlwF1dOM7yL016aN/Bxr/n9jfJ1GD
 PSLCAlTKlk97zCGObhJ0Haf5FiGqoNxGpNlZM/3IoSSyc0D+D3QiCxonaggIYlt9Z+gc
 /hX63ARkoF5QJNEE81GoBUJMqN/CTbT3IfFNuqflySCohrm8ZgfY6eZRl8fWUbAaAdy1
 W83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9qWkQEW+zRrgpJDzh76RLl6aQzYDiDDT2yAGtLCDL5Q=;
 b=G/70oTF1WVPPEtt6JD90IdWv+IYbW8vbsB3ztWPPf6XHydqsUuJ0D8lw+0T04ap+V0
 ifh2ZmOpUo5VjkLDtw4ooVICyuXvwvEy+10wRplAo+0n2RgPcngY7SRg1yuqqGlK+vFR
 C+5tCZwICVT/22T9cTQ1r6V0pcT/Qv256J12CFYrrMtVODfs3MbnE0/BVA72ky+K/rAH
 bOWZgtxLJx4FIkMl2j47FRGK4B5Q49OXPRdZ3K8j/61PFTs3evC0Gtw+ofXImWt0++2B
 yQxRIj5rOyHJ4h5FXvP4/VZenQkKYLTmwuZupdLaKU7OGBqCBESDX96WNSfzkol5lopf
 pbRA==
X-Gm-Message-State: AOAM533INne7iu9lPPzHohu+cxqjS1ngd+6XXUMp0Mj8E3fjCSe2UiuY
 nIh4QhDymtlQqz6iXZ117f5B5b28YLfX2Q==
X-Google-Smtp-Source: ABdhPJz3PD79aTGTirn9E+iAhbhUvWag0Po/vv9f4Yj/t4ZLdYBodt2SQQk/39ka1YsnPlRfOSbqIQ==
X-Received: by 2002:a63:b94b:: with SMTP id v11mr2004719pgo.76.1619541644588; 
 Tue, 27 Apr 2021 09:40:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id f71sm3135310pfa.91.2021.04.27.09.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 09:40:44 -0700 (PDT)
Subject: Re: [PATCH 04/13] target/arm: Split m-nocp trans functions into their
 own file
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb35dc47-1ff2-32e6-dc57-3dd69e085505@linaro.org>
Date: Tue, 27 Apr 2021 09:40:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 9:07 AM, Peter Maydell wrote:
> Currently the trans functions for m-nocp.decode all live in
> translate-vfp.inc.c; move them out into their own translation unit,
> translate-m-nocp.c.
> 
> The trans_* functions here are pure code motion with no changes.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h     |   3 +
>   target/arm/translate-m-nocp.c  | 221 +++++++++++++++++++++++++++++++++
>   target/arm/translate.c         |   1 -
>   target/arm/translate-vfp.c.inc | 196 -----------------------------
>   target/arm/meson.build         |   3 +-
>   5 files changed, 226 insertions(+), 198 deletions(-)
>   create mode 100644 target/arm/translate-m-nocp.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

