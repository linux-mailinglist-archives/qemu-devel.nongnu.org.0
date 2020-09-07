Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8882603BC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 19:54:02 +0200 (CEST)
Received: from localhost ([::1]:49538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLL7-0001V2-LI
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 13:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFLJa-0007UV-AN
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:52:26 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFLJX-0000qf-Gb
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:52:25 -0400
Received: by mail-pg1-x542.google.com with SMTP id 7so8308362pgm.11
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 10:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zx2XjH/yidDi5xMLNDfik+brcRFi+UyvHBopYQ/o2Os=;
 b=X/SOHZTyVRbNz0vdV6EGyy1w340XsL/gCXSf+QGdbDHen8/5j3GADG7S07qU/AWYAW
 iONDMpA+13/QX7hjIGMPvScdm++KdE+lBhSksgHJgkevjtSmUBVB8MqwfXPz1QB9tQ2N
 FAQec3iQgILwubdus0bIyJVlUvgESolMppik9RBzPZ3ldkH3DZksi+ulBi/3TngLHdrD
 tDZ4qf1XyGNZ6pDrnleuWsKPbz0to2Zxx6R1JjImGvMNtnPoSha6FJscPUvHvM/V/QOF
 TES2PeEVtZ1UJxgl66xPWtD8vX/s+5W/FkWfc6tRPjhQAFZw9QSCIFUxqQZuaWnAYtrx
 6ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zx2XjH/yidDi5xMLNDfik+brcRFi+UyvHBopYQ/o2Os=;
 b=BvPfHOquyVm20AVh7y+TnC4Yayby1c8t2xr5TbuqAgDPkYnOjMMKSQUoLLIp+Ciy2w
 mpIwqVSXuopE/LFR3HlvPuBCUoFcNI9SpJ51vdNLHcB3WCIC8T3jwtk7yKgnbC2Obd5K
 aHKXNKPpPcpZQ6ouQ+txL3GXTlPwbcgtEEMctDoK642EJYZzabtxuGyCNQ5YKDgEZIm5
 h2s0YTkWYlnM7Voy/7QRMJr48FtTFsApU97rHTg/nhPbgAz28/2wJLE7N8YxLqnKjhTN
 1lmLOaJVURIluYzQ6SN4Gz0rzPiYN64m3leYgFLESqmukhQnvh9KvgCpGVClOBDY2qit
 ekog==
X-Gm-Message-State: AOAM531pbYKnDYxgDYxBMtaGrIlF+weADFhrCd3vXLdrJcrJ3/MGjllC
 0nvEPVi5wJjgmkI5aXlM53xhLg==
X-Google-Smtp-Source: ABdhPJxZb7nW/SSKEW88tTo7saJ7flkxE5AZ0UHB5v6enEHBPUqyDVgLlizYQBj65wGgSjML3UPyQA==
X-Received: by 2002:a63:d003:: with SMTP id z3mr17796304pgf.424.1599501142024; 
 Mon, 07 Sep 2020 10:52:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i9sm1318753pfq.53.2020.09.07.10.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 10:52:21 -0700 (PDT)
Subject: Re: [PATCH] hw/hyperv: Fix 32-bit build error for vmbus.
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20200907175102.28027-1-richard.henderson@linaro.org>
 <20200907175102.28027-2-richard.henderson@linaro.org>
Message-ID: <5002d30f-3663-cf01-8a92-eb46a9f299e5@linaro.org>
Date: Mon, 7 Sep 2020 10:52:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200907175102.28027-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.825,
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
Cc: peter.maydell@linaro.org, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/20 10:50 AM, Richard Henderson wrote:
> ../qemu/hw/hyperv/vmbus.c: In function ‘gpadl_iter_io’:
> ../qemu/hw/hyperv/vmbus.c:383:13: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>   383 |         p = (void *)(((uintptr_t)iter->map & TARGET_PAGE_MASK) | off_in_page);
>       |             ^
> cc1: all warnings being treated as errors
> 
> Fixes: 0d71f7082d7 ("vmbus: vmbus implementation")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Jon Doron <arilou@gmail.com>
> ---

Dangit.  Forgot to remove old patches from the directory; this isn't part of
the pull request.


r~

