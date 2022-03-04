Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06C14CDDCC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:23:22 +0100 (CET)
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQESP-0007G8-Hb
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQEQ7-0005rT-5x
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:20:59 -0500
Received: from [2607:f8b0:4864:20::1030] (port=40658
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQEQ5-0004Da-AX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:20:58 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 mv5-20020a17090b198500b001bf2a039831so2177126pjb.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 12:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tTq8XZa3fK+bEGLJ4ktBQe+9mHptMmpaFx4m/6/pZgE=;
 b=bWQn+1HjpnxeYJJ1kKDtnnU8KzzTeihjYf5tSYTYIhL36vUYebZFItemTtKE7vzNN6
 NGX6V70uqfviiec8nsrFONA1bhojo9NLCxmUhnIVCP0ATAvMHwybFswOvdW2mmcyfvQw
 +Y6HC4gf1f59LU8vWF4tkrvbMXgYbaT1J668C21Lt0Ys4ZHcyoupcXMgKn7BZFlNnQgg
 bP9m3qYPxc5LGhs81NblgoGIvZY0hSpaefPJ+1HFiGRJyi0pHbrsmf9RdssaWP01fHoS
 wTj3ezwZ/qRoE/FUXUNH5ElFxv9hW5xtG78mIjnPKraSIi2UvHMeiGpHE4sWrAf+M/R5
 P2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tTq8XZa3fK+bEGLJ4ktBQe+9mHptMmpaFx4m/6/pZgE=;
 b=Cy9hgM1m15Sp3ipuUN6ydAosxGz4LgyFgV3Ix03dabMHCi31gjerT7dTZj2LNMwB4W
 aPMiy+aKpCv2LtjLBRTVT2/YFnTEKa2tHXc8idGBvESDr+uEHQoFpiracqGLL26qz1om
 2jUQyK2pxHiFC6NO4lvxUnj6K92tdI+cGYh2Pzv+tsSBPGzMY6tZA7pppYmSHsIIH4bL
 GVaJJriWo2hFf0L8EHeOjL0qOE/EDkhUBXYvD8GWt+H2aXkR6fxYxgfTb/Khqzy0UHIT
 XDYtXO9ET4NUgabMzfYS0Unix/lRQGKVlOZH2CWCEfil5AZBbHV8SOmCoc/Z7Xu6EFTh
 ZRqQ==
X-Gm-Message-State: AOAM5302lhqApNq0sJPWJ9mApuDVhm3koNIYSKTTz8sj9fHUGUksP0Q0
 i/4CDVGb+D0IQpRCtRcOlIv53A==
X-Google-Smtp-Source: ABdhPJzj1AtPWEK+XilOGLRUOGp7YPLCfsV9/z6miyAUlJq2kRI90XWJukwfy6i9B87RppKBZzuokg==
X-Received: by 2002:a17:902:ecd2:b0:151:9269:539c with SMTP id
 a18-20020a170902ecd200b001519269539cmr76578plh.37.1646425255882; 
 Fri, 04 Mar 2022 12:20:55 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a63214a000000b003652f4ee81fsm5130585pgm.69.2022.03.04.12.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 12:20:55 -0800 (PST)
Message-ID: <941f530e-c9dd-e6c3-4ecf-d884530f3b52@linaro.org>
Date: Fri, 4 Mar 2022 10:20:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/9] util: Share qemu_try_memalign() implementation
 between POSIX and Windows
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
 <20220304112126.2261039-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304112126.2261039-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 01:21, Peter Maydell wrote:
> +     * platform APIs (for instance _alligned_malloc() will

Typo there with the 'll'.


r~

