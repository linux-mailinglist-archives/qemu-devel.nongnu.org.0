Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CAF5B6987
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 10:26:04 +0200 (CEST)
Received: from localhost ([::1]:46420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY1F5-0007wf-B6
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 04:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0zZ-0004iX-RW
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:10:02 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0zY-0000gb-6f
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:10:01 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so8939205wmb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 01:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=G9TKg/p1fxhisDa8NHxvstc0KkKMKnFm7ltjlZWqpFc=;
 b=D64tbcLsnNodDA7pK8Iq/5Ma2Wc2VkFsvN5gkkyDGExuKi4Ev4lWhvmu0Bb0ztBo3d
 r2z8aZ5jDftJwkeX4ywgUt/rfxpTpLyorMGgrjXcG3fGX6KiLbtPePW25gNhLDHOCWOv
 R3+vml4S/guCQXq6BI0E9jsuso9IYXDTl5oQ3S+QHBGZjUZrkYAKgZld38gIoUK/4OwK
 6rvNlBPfQKp3ZEgeDZ1Nnjhoq7YL6vWhsIasbGAh+O29g02yZZd7Sg5DXwrlXqTGzqdo
 IOMFBq1c2b53tiUrnPSTPutg7mgIiAJrN6gFAjnFv+exXPzwVmG9/0fJ7QqOjWwPf7ab
 1l1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=G9TKg/p1fxhisDa8NHxvstc0KkKMKnFm7ltjlZWqpFc=;
 b=SVutkpT2vrFxz50TaYsXS4w/yGLZ3u5auqAc2+PDteYYvzw3wtq8vOuOCQ+epQY1/q
 bbCJ3GRV8ffQpnLE2Ddk8b+I0EZToKPr0QbAdvFxcvFrRh9O8uRAwGVtzca/jBbvJ9Eo
 7DYdCWFCP26W6lZ3+tWdAt1jRRxDSBqisf18v1eD0+V3OrpKIAp8Dz52i5O2FtYYTaLr
 ih/j1OvedFvSjV5QCJIu95ivv9OXG+RD+TFPAw4GLNgPWjqcNpWK5Z4dNwRBFO6Z9pwh
 kx5abeosT+Gncz2b16ENdm/0frlfu2h6LpxSS0GfFNwzKouvDrj2nt5qgvCTAomuntst
 h/ZQ==
X-Gm-Message-State: ACgBeo1xja6By+3o7SVtLQYnWHbbtA+lSUFk3fneR0f5OUqBjXy7+r1h
 vnzjlgvChC+mP3WUKDJObHf0cw==
X-Google-Smtp-Source: AA6agR7Jc6LZtDOuesCbwn1E2ftMiUuPYqYBef0NCKA8C2/0rpL1LGN7gHbG2rBkWXMpMxp79EMQfA==
X-Received: by 2002:a7b:c34b:0:b0:3a6:8516:a729 with SMTP id
 l11-20020a7bc34b000000b003a68516a729mr1473140wmj.83.1663056598528; 
 Tue, 13 Sep 2022 01:09:58 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a1c540c000000b003b47ff3807fsm7790276wmb.5.2022.09.13.01.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 01:09:58 -0700 (PDT)
Message-ID: <cc1639bf-086b-8791-ecee-1a355d746d13@linaro.org>
Date: Tue, 13 Sep 2022 09:09:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 20/24] disas/nanomips: Expand Dis_info struct
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-21-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220912122635.74032-21-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 13:26, Milica Lazarevic wrote:
> This patch expands the Dis_info struct, which should hold the
> necessary data for handling runtime errors. Fields fprintf_func and
> stream are in charge of error printing. Field buf enables the use of
> sigsetjmp() and siglongjmp() functions. Support for runtime error
> handling will be added later.
> 
> We're filling Dis_info at the entrance of the nanoMIPS disassembler,
> i.e. print_insn_nanomips. Next, we're adding that information as an
> argument wherever we need to.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 2708 ++++++++++++++++++++++----------------------
>   1 file changed, 1357 insertions(+), 1351 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

