Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB78C32DACB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:05:25 +0100 (CET)
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuDs-0005vC-Ob
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuCd-0004rf-Pu
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:04:08 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuCb-0008N8-4Q
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:04:07 -0500
Received: by mail-pj1-x102c.google.com with SMTP id s23so7883616pji.1
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CFyjadUX52xsaKeCj2l7sa79PHzsXYymmx+G8QE78J8=;
 b=KR9eTL2iXER/tMIrh42oc10/WHtQgAUDoPgfEv6Y4CgQe3g74JjtRGKp97sEF0SgAe
 L36L8ohVc14WXn3L2jna5KJmnSqnkGCKs3QViK+LmAfavpqXKQ9vFQnllGdyRhub8CeF
 1XWhF78cUqgchLGXBwhMVzr69xw9/gVN0GQqKgbGd9la/stOnnPBLrAbGAIrvAirs7lF
 l78J7pC7alcq3yTAb3E1w9B9op9HibMGQm+AuXLRVor0InC2hAYsg9b71t387ZXvzQdN
 kKSbQMbi+p3LI/lsYO/2OnnT/pehFFKsEa8BfHDOjvhpXOn6Twh3Fb+K5A/nqYqXsppa
 Yr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CFyjadUX52xsaKeCj2l7sa79PHzsXYymmx+G8QE78J8=;
 b=kYluzG/DFV+IBppzh/PrEvBF/iRjyA3eb0ja6tzUQVbILZ0uYmnclla8KTpYBOjVCR
 uJPNoW5eBvN/ugnyee0tMbVd8JhdPZTlezYiLtjJfMqk7u3Eurn0O+xxv/J0RQveIj9t
 NWZflI3T4SEpmPb6WbekyhiwvvTHheJ54CcoTHLVVo4nXFKM2X/gMHRBUwvjML9A8GRm
 oD998vE3i4Nx0IBOVA+drKmpyMomK1PFjYXR79PXb9RTAUtsUVPvwQHfN5Ta3B/g+FJw
 ju99IZm9Ve6OWCDZIjOLTgCxlQX2YEJ3h9um6LThkZtRfReUXdOdQdGM88nFEL3vMnsq
 lboA==
X-Gm-Message-State: AOAM531vagRkLfUUxlUV8Ul26T8CrmDvzPGagfDH4qoDQmR8JeSwIpVy
 z9NGVnZAPmbL6PbckYD6gmLw7WyS3X54Ew==
X-Google-Smtp-Source: ABdhPJyGb5OvX3hvb/piDGlkTSYNlqLyNOt0iI0SeCVzYBYZPUH4hcymKu9iTDWDJgKjpqGiLNw6NA==
X-Received: by 2002:a17:90a:e644:: with SMTP id
 ep4mr6134799pjb.218.1614888243660; 
 Thu, 04 Mar 2021 12:04:03 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z8sm105575pjd.0.2021.03.04.12.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:04:03 -0800 (PST)
Subject: Re: [PATCH 21/44] hw/arm/armsse: Use an array for apb_ppc fields in
 the state structure
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40d696b4-3c72-1db5-ba12-6be803fa8ffd@linaro.org>
Date: Thu, 4 Mar 2021 12:04:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 2/19/21 6:45 AM, Peter Maydell wrote:
> Convert the apb_ppc0 and apb_ppc1 fields in the ARMSSE state struct
> to use an array instead of two separate fields.  We already had one
> place in the code that wanted to be able to refer to the PPC by
> index, and we're about to add more code like that.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

