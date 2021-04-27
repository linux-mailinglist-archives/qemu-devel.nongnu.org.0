Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FF336C9C8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 18:52:44 +0200 (CEST)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbQx1-0001Mg-U8
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 12:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQs0-0005m3-DS
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:47:32 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQry-0006PN-Fx
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:47:32 -0400
Received: by mail-pg1-x529.google.com with SMTP id t22so7514537pgu.0
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 09:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lafdq/kMb9hvJYgMyLwybUwaXNI4LSB1BV7ts29NFm0=;
 b=loOwqL2zPe/EQ+fZdTK7H+4yzLr8V5tPfSmpfNMGkYUroE7kpZG8cddjTeit6bRFar
 g7XNGT850miiT01gigj+O1us+qEl7OLnv+MNRA0v4ghAkLKSANN17UBD1bll384QlM1Y
 Wgjcuj1EafHB9wrA+TItqtYX3xH0Lc2RKDQFTG/FVTQIppL3935MImHHh2SCPu53T7e8
 6ZIPkMyTsvrnEJkSvGEPqthXuF1/XkT8V1f0aUW+QcBgK5X9335uS/9K0E2CVjxP4mbE
 ZjN67tvsMPWEr1VItq3QyKNWDnrSz6xjMeAyQ2R6qg1hmyam9KC6R+dL1fBs0Q7C+RHr
 pdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lafdq/kMb9hvJYgMyLwybUwaXNI4LSB1BV7ts29NFm0=;
 b=d0BP+gOAZq7Xqi3LRaGucAAy3Wstp06qS5sAkzBlk0SOQhYwgEAMeXO6INEFCVO6C3
 QXanGt5Mz4sxGM2Kud4G8haLDUntEqkwLClM5jFwC2Msg6wqIfA+4V8j+AU8FgpzP8yc
 i2ViTgH02E0G0Pg1T5BUIcZOU134SzY9vWlX5nyLVE2ViNOGRSG4ctGN1e4YqKzzHaR1
 Q1Zo7OFCdXwicf9YOVI4ldqTRE460g+eN2Kweh/G+HgS+eZISat186kt6KuPDMIx1NjR
 Tf9jYmJ27Rl/MTlHLjsXZHsyb6jyUl8+bvlVdk5H+AjR4S9G0Q5dTSC+euJELHjLzxV4
 1AjA==
X-Gm-Message-State: AOAM531aX7YcaEjttDTQNJK1e548CCInEjneFgYFJGOwyByZ05Gc9cVQ
 5pMI7BxPAx39S9rxd77tb5ULEQqM730zvg==
X-Google-Smtp-Source: ABdhPJypxcQB1mAlYwrc7aQvcuE+Zw4f6DQpR4Lto3I1BSPlIhcC5it7tuTQVSMp7TM+JhZfji+ZNw==
X-Received: by 2002:a63:da10:: with SMTP id c16mr22551024pgh.221.1619542048767; 
 Tue, 27 Apr 2021 09:47:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id v64sm2426872pfc.117.2021.04.27.09.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 09:47:28 -0700 (PDT)
Subject: Re: [PATCH 06/13] target/arm: Move vfp_{load, store}_reg{32, 64} to
 translate-vfp.c.inc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3dfd6cc6-58b9-a1f4-f53a-6e5bfabc9d02@linaro.org>
Date: Tue, 27 Apr 2021 09:47:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 9:07 AM, Peter Maydell wrote:
> The functions vfp_load_reg32(), vfp_load_reg64(), vfp_store_reg32()
> and vfp_store_reg64() are used only in translate-vfp.c.inc. Move
> them to that file.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.c         | 20 --------------------
>   target/arm/translate-vfp.c.inc | 20 ++++++++++++++++++++
>   2 files changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

