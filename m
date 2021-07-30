Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95D3DBFCF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:29:17 +0200 (CEST)
Received: from localhost ([::1]:33208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z88-0004G0-G7
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z6H-0001TT-GO
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:27:21 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:43691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z6F-0006Fe-9p
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:27:21 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so5411216pjb.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6KLDDdWe/ml2St4y8FGkBO3LbATpiqRE3oTWri3VXsU=;
 b=rkKv/80KNAaiPBz49HTL2Y2GzfwlRlYr1nJEVlzDan9DCLCMzI1lzQ1jPRkM//skyf
 aM4ERg2feayCjpqJaiS366cYRpfZds0X44aHnFhFP1sESDuvFUIdqPp87JBxtMprpEQz
 byRNxgw7p/DcEXxerOYlxVq2WF9QfKz60neG5BhHLbZlMTXbZP1prqx5gyfeLtX1hChj
 Nbl6Q77cpXVe1q1s07w+cbdaWdpEZre0zmptEDMyo4KztMVR1ai0mtQ/DQ+fTi37aayf
 lfuUPVLFCD/zCmmUqxs/rRcTkeaM+CUnm79gElHqE2EJRb0sVyhDIrEAC+yArKhUkbMS
 Te8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6KLDDdWe/ml2St4y8FGkBO3LbATpiqRE3oTWri3VXsU=;
 b=s8W2WgBuI6KJmuSADyIRJcio2kpF42ptxsGVCnymBFYSnDieoCkYBtLRPBqKAeFTXE
 C0CzXRRmoFHmGwrHeQxDpD0X6rUaY8tMfQ1FbRyqsJ/xtCbSLzJwE9BS/LVhwCqsEWC6
 uorcoWmM8baI8cnoM3ItAKumB5IKnLLTXCh9mji2l1PklQTNdYvAJVM6LOiS8FzloW50
 yBmWFMAJYOIhzfNVCcN5WxtVGpbx3uqrGTIPQE0p/em+2DunKXl4204ugSgbGfhH3sNp
 NsUeqmvnjXMTDwzcTKS3qSkts8SDGPLOcT7gaGPF7h1fAfaPxd2w3Pv9XSwoSQPS/dq+
 /ZVA==
X-Gm-Message-State: AOAM530XjeKc6Lau66ov6J6D3Wsnb6DI7A7VzmwBo77EwquDzMcHxmR7
 VJIsxZq2GZPl++k+4pJ2++uKEBbyRlQmGg==
X-Google-Smtp-Source: ABdhPJxH91qGP7UGBj/MVxLMjVQQXw3SG1jCz8cSmktaUIHoMoXwPScw//ly4EVVQDB1yQncBoDyrw==
X-Received: by 2002:aa7:800e:0:b029:3a9:e527:c13 with SMTP id
 j14-20020aa7800e0000b02903a9e5270c13mr4609945pfi.42.1627676837511; 
 Fri, 30 Jul 2021 13:27:17 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id x11sm3728457pgp.70.2021.07.30.13.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:27:16 -0700 (PDT)
Subject: Re: [PATCH for-6.2 49/53] target/arm: Implement MVE VCVT between fp
 and integer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-50-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d543f394-15d4-3e36-b30d-be7c4fb9ffe3@linaro.org>
Date: Fri, 30 Jul 2021 10:27:14 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-50-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE "VCVT (between floating-point and integer)" insn.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve.decode      |  7 +++++++
>   target/arm/translate-mve.c | 32 ++++++++++++++++++++++++++++++++
>   2 files changed, 39 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

