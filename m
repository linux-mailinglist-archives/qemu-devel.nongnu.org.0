Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70192DC842
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 22:21:10 +0100 (CET)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpeEP-0003vH-T0
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 16:21:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpeCd-0002bq-6H
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:19:20 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:42602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpeCa-00081p-Lt
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:19:18 -0500
Received: by mail-oi1-x236.google.com with SMTP id l200so29370075oig.9
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 13:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HCTW24jQanWs99dcC1wqZgjBiTOOnMC1mP1XWaGYBeA=;
 b=nl2n5+Nju8vG2gk++GlfZDXKQf2ziOIlNoQDCZf+CqnT9c/IdiTqnUEK30+Vlg0BqY
 jAhw21u+xl98a8TT4kyqGlf8Sl8EUBqOlw2Q94avXQ+KEgelh8qFV0EhP3+GBy2dgRXk
 HzooLYuOgQfpx1on0GlPqNJojJDWtDQHFgSDMzhhOsEOmxwcwVp3oTx3B/1STHatx+l2
 1VRN9buyUJNBeKEX89pjWCFQh6YvUyE2xtZcX82qKgtDxplTQXOy2avS5gzT82hSoLm9
 aRH64z213iCu2TWV2Fgm7Dg1mVFie04kTvXQGfWTQT0LC6YYX2j6ZHCatNU713zNAmqm
 9Iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HCTW24jQanWs99dcC1wqZgjBiTOOnMC1mP1XWaGYBeA=;
 b=mXydi3pfn7bvRgNYwnkYUuQW3iIiD4oPFwYGeNiw4cBwIiZAYgd/jZIfANUU/evzhk
 yN6i65i847f3voNufKikjV2aPKP3iy2XzRpIrIgubAILPbK69YsIcmIcn3JEBOD7zDOR
 +gkeBAiQMllvtzkiwuq2e2tZNrOAHXN6zmO7eRZ93empUuyyxRGU1nRLkxj8IW7/vh6T
 EopBabKaPaVSix1Cx41zj4eNq32TCkEddn7G/fMUteyF3AaVlCdW/mCjFnYz/SqOPd2t
 jME5jaZfNj2019YiavEiK+ICYvUf1mH0FvBzxYUhl8Xwgg2TtS+lNMtX3+HPCVZhyQ4g
 gFXw==
X-Gm-Message-State: AOAM530TXq6jK8pFMKUpnLpiGYQdjwSx0jKdi2p9QSjq/Jj7yZ11RG7J
 ErMkBtrdEwB/p/qmn4y+Jrvdm5bpd1JEbom3
X-Google-Smtp-Source: ABdhPJyUYw63AhX1KIGLaTWjOAx9yYrArMKJ5S97AC1n2klcgYJw4ddj8UyH7Q4WIKmLobwqwmesYQ==
X-Received: by 2002:aca:bd0b:: with SMTP id n11mr2956722oif.11.1608153554787; 
 Wed, 16 Dec 2020 13:19:14 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u20sm755062oor.45.2020.12.16.13.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 13:19:14 -0800 (PST)
Subject: Re: [PATCH v3 2/4] target/arm: Correct store of FPSCR value via
 FPCXT_S
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201210201433.26262-1-peter.maydell@linaro.org>
 <20201210201433.26262-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <545761b2-a25d-cfc9-d009-09cf442790b9@linaro.org>
Date: Wed, 16 Dec 2020 15:19:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210201433.26262-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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

On 12/10/20 2:14 PM, Peter Maydell wrote:
> In commit 64f863baeedc8659 we implemented the v8.1M FPCXT_S register,
> but we got the write behaviour wrong. On read, this register reads
> bits [27:0] of FPSCR plus the CONTROL.SFPA bit. On write, it doesn't
> just write back those bits -- it writes a value to the whole FPSCR,
> whose upper 4 bits are zeroes.
> 
> We also incorrectly implemented the write-to-FPSCR as a simple store
> to vfp.xregs; this skips the "update the softfloat flags" part of
> the vfp_set_fpscr helper so the value would read back correctly but
> not actually take effect.
> 
> Fix both of these things by doing a complete write to the FPSCR
> using the helper function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

