Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4364241296E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:32:12 +0200 (CEST)
Received: from localhost ([::1]:42978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSlf-0001rn-BN
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSShB-0004wc-NO
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:27:33 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSShA-0004NU-9d
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:27:33 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 h3-20020a17090a580300b0019ce70f8243so605260pji.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=emmqASzEW7CrQBcbm0lsS7kDdwu3sLtcnj3WzTUIyxc=;
 b=Jl4KZN4dKlL/VBeAOmTLdquFkM6FZ08MsG/sn/YPz+1101Bjg1cyHRoWWshT47z2Jd
 Cs3e8qcapViVhConAtArKVwuVGhWuowEp15GtRz48QBwf+eX3VliDqnB5L7xuINXn1lL
 RQCSyUw6RqGWZNYMBqbBBLb+e0QOfTHSbF0xrB9uygjzX2hqcun/WmRHzNVrCd6ambDY
 8USyna/vIXvYgyhvrmt5GP4dxr0alAu1RLeusChGT1S4eFSQ8kxH2lakchfIYy9fV3dv
 O47EzYQNQOlhmMuqho1wEJrpNLGD8Zp4KLOX03tznahtjPW5kZQwOZbn2k8teRsiLgEI
 b4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=emmqASzEW7CrQBcbm0lsS7kDdwu3sLtcnj3WzTUIyxc=;
 b=LCMh8VeGssn68XzB7wKJbcagOklPBaoGNVx1iEdm/Vg+3vhfqqlHbl5ck0ocI9J/YO
 eDHcjLJtxPG9W0OXf4nJZ83N3sC8KGeQRCeO92HBnfF8Y6uXI571DGIgS7tClk7WjWAd
 hFd7s9LvoDtMYWKim12tsavYdv2duwe++xuS2hPWC94QG+Y5vVvgXMbhbfXbHKc+WN/+
 XqvIrx/Sm4+Z6XPXjWNA/5Kb1GMBVKNaMq3KFdCzcp1+DozK0nysQF3D10zucC8oBryC
 FhNqJ5sI/vKeSXBuP4h/FtuL2icPd51wzHA9XLdTcPO+orUu7Gk27IPZagJTdVUa9tWc
 GNtw==
X-Gm-Message-State: AOAM531a8i9bAQUVbg5lXj4ote8Upj7/VRs5pYUhFgLqLzDaCXExKvq7
 22JUOzDw9fOwQzdkJWNy5MAKhQ==
X-Google-Smtp-Source: ABdhPJznVLW+OcGexhG7JfIFZpMAMaezOntoE8MFb6sJw4QEW9cg0lNggx7xg/nGdaX8b0u6EvPm8Q==
X-Received: by 2002:a17:90a:1d0:: with SMTP id 16mr1727697pjd.53.1632180450884; 
 Mon, 20 Sep 2021 16:27:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m28sm16326455pgl.9.2021.09.20.16.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:27:30 -0700 (PDT)
Subject: Re: [PATCH v3 23/30] Hexagon HVX (target/hexagon) helper overrides -
 vector stores
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-24-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <54676cef-321b-961b-15f3-4efae32245a2@linaro.org>
Date: Mon, 20 Sep 2021 16:27:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-24-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg_hvx.h | 218 +++++++++++++++++++++++++++++++++++++++++++
>   target/hexagon/helper.h      |   1 +
>   target/hexagon/op_helper.c   |   5 +
>   3 files changed, 224 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

