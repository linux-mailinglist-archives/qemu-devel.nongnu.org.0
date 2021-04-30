Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DF36FDF0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 17:41:58 +0200 (CEST)
Received: from localhost ([::1]:53654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVHB-0003go-Ix
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 11:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcVFJ-0002o0-KC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:40:01 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcVFH-0005Qa-Oi
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:40:01 -0400
Received: by mail-wm1-x333.google.com with SMTP id k128so38074687wmk.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+9EqmyuSRBQvF7G7kErhpab2Lhfq+rnAKp5sMSvhmuM=;
 b=gAnlQHLKxaJWeZpHhzxK4vIkv0PR23WZQUT0WhJXYju1V3shNXQ/zMnRclQxSkKKhL
 CNdu+5K8l/XeH3EfrfIoAbEKY/y4lWE1gxj6GTfvXty9Efd1+y8/crVm+VKQninAKIHc
 pm21LFzxnFHsKdU8Pf+Jo3fx02nyIDXnbVR1JS7lcEu2VPMC+3pVOl8XOKjpzdUfSCw2
 uILwQWElOvUQQmkcJ5uXQTYZUuJv7Q562GmL4txsFvs7aVN6lZ2y4Sy6HK9foVvW3rWG
 Bj6mMiTjLa9cF7RkdPqyY7yd3f8asxzgKDMBdmO+NPLEP+SfMK7lJLoHE7HT2OP9xOvg
 JJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+9EqmyuSRBQvF7G7kErhpab2Lhfq+rnAKp5sMSvhmuM=;
 b=XOBofUfQ6EanolJTbi3xuuVxbutDzkFbV/WgYpNQBFdaXQ+F+wUEGgBHgdwqqGQcGQ
 UUujTMdF9oKvTLVOsCu1i4iFBJjyRBi9IB0YPFC2T8RsUjNcZRQvoKLsz7amgPRGkPBU
 AdscoMSRDxrrv/i/2JRY/jXWNjzLPlAIefzAAWachHAj1+7hdlBU9hQQFTLgylbLfgMt
 6x5HOMAIkP3ExRe59mSAva67Y2xTKKoAwscrRXHnqBPOu/BgHRMDXm7qp+Hf5aH1h59W
 7LuDtvpQrWV2y2zmPCxSK+HfLKt/Iw3siEIjRCEWxI6eacZfMyFGSzMGR8kvB3RBB9oj
 7q0w==
X-Gm-Message-State: AOAM531jLBEyhlh2ucU4OMSfHvfxu6BnjctRJfSTdWgRcQ2o1/ONHSqq
 Eq9imQvbKhbB5t90wYgA0kMuEMPCY5vrXOFS
X-Google-Smtp-Source: ABdhPJzu2XxJiQBTW4YhYpaJlyRFrJME/oAZXjmikW3SkCpsS9JFM7nG/CFN9spB9w8QEkrVJ4/qPA==
X-Received: by 2002:a1c:b68b:: with SMTP id g133mr6512595wmf.127.1619797197524; 
 Fri, 30 Apr 2021 08:39:57 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id u2sm4275135wmm.5.2021.04.30.08.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 08:39:57 -0700 (PDT)
Subject: Re: [PATCH v2 05/13] target/arm: Move gen_aa32 functions to
 translate-a32.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210430132740.10391-1-peter.maydell@linaro.org>
 <20210430132740.10391-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <93cb047a-096e-6091-fe90-41a87c38a486@amsat.org>
Date: Fri, 30 Apr 2021 17:39:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430132740.10391-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 4/30/21 3:27 PM, Peter Maydell wrote:
> Move the various gen_aa32* functions and macros out of translate.c
> and into translate-a32.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a32.h | 53 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate.c     | 51 ++++++++++++------------------------
>  2 files changed, 69 insertions(+), 35 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

