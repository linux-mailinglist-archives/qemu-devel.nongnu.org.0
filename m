Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B56256340
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 00:58:27 +0200 (CEST)
Received: from localhost ([::1]:48176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBnKE-0001kn-CZ
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 18:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnJW-0001D2-Sy
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 18:57:42 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:52617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnJV-0003Ng-EF
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 18:57:42 -0400
Received: by mail-pj1-x1043.google.com with SMTP id z18so247025pjr.2
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 15:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vr7/94X/ISbH0MIWH8Q3N/llWaToJDvUTex71/t/ZS0=;
 b=inpC/3Ot8TVObT5ygG3Vr8tsZ/LYmC3B0o8Hn/Eqm7KlHxNf3pxvwT3maICGiGbwaD
 wg3axbbXrcya0F51L6mIl22sex93sfxY6+wz5jsiuks7qDfHAVMfW94KTrxXf8E1+GPm
 c8BDKuRjneve7TeKlRKJDFrfFC+kdMBVtIOMErMRYPkOtS6pLi7lpt0Y77HZU4pmkvWv
 Kv4tKyD7dfOcDgLPXuxSdsJ+rzQx1ILGhRkHZaFQHWnrkM08vVpTgf2O+DDNeDwxA8yd
 WP0AFAEnXW3Hnt0Z9HBzE4sl53w98aF9DJ4O2MfbRw+YBnJ2QD2iyBdmCR+2HFAg5Gbk
 BUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vr7/94X/ISbH0MIWH8Q3N/llWaToJDvUTex71/t/ZS0=;
 b=ARRLH7aWb87IvMIRbgj1t7Z2bhrQSGdntxSBqLStsT6Ewr+X+iirMWU4GeH9pqgCz2
 72ewn0VhOVw63RH11NUhauvg3a3DsJ+SgO6yE4mc6WgTnG2F36h9sbMW7a9A1zxQFn6M
 5qXS2gYtq1GakFQTf3GMbfISkbjVBg73pqVva9+USNqxdu5+zh1Bdl9JQjgL2f9aMzOB
 2vHKnvTBr3t2QB3ZFwzKUVSyV/Dy8FA67XZiuNfXqcTGiQ5QQDC3fLixtFSsuE2QM/9H
 zvvqAD8+A80d7cCf/ZoxdyogVihZnATHzxDJpgUjaFwxSEMJGjvGVWmhIuEaVRPoar9x
 6IUg==
X-Gm-Message-State: AOAM5315b2VQilZ7SOO/dM7erPzOwUIDQYEvOP3Ze0KnuSw0YX98hY2O
 9RrPULE9mYdiK1MUUUQ7lGH4x3RE9jw6JQ==
X-Google-Smtp-Source: ABdhPJx73xVpsEiJ4hRQMGghTW8Rt9JKHqdtT7HmW4vjY/j4BiJkrQQD9vAmavR5eOpiYCIlIBwLMA==
X-Received: by 2002:a17:902:9692:: with SMTP id
 n18mr857297plp.110.1598655459835; 
 Fri, 28 Aug 2020 15:57:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 29sm327672pje.10.2020.08.28.15.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 15:57:39 -0700 (PDT)
Subject: Re: [PATCH v2 32/45] target/arm: Implement fp16 for Neon fp
 compare-vs-0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-33-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc820128-9148-db55-22a7-717ed94887f2@linaro.org>
Date: Fri, 28 Aug 2020 15:57:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-33-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the neon floating-point vector compare-vs-0 insns VCEQ0,
> VCGT0, VCLE0, VCGE0 and VCLT0 to use a gvec helper, and use this to
> implement the fp16 case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             | 15 +++++++++++++++
>  target/arm/vec_helper.c         | 25 +++++++++++++++++++++++++
>  target/arm/translate-neon.c.inc | 33 +++++----------------------------
>  3 files changed, 45 insertions(+), 28 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


