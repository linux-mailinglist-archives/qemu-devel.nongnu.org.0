Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50BB1EB0E4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 23:22:33 +0200 (CEST)
Received: from localhost ([::1]:55986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfrtA-0001BT-RP
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 17:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfroD-0004GE-NB
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 17:17:25 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jfroB-00073y-H6
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 17:17:24 -0400
Received: by mail-pg1-x543.google.com with SMTP id 185so4052291pgb.10
 for <qemu-devel@nongnu.org>; Mon, 01 Jun 2020 14:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2Hx7yi3K7A6K/V4V2tSXSqAMGTLaOeKielJjDmHRNjA=;
 b=oU7b/LQ06ZL6Oy8ccra+d+92vblbl0pwxuHYVyWmXtfNTLXmXnHpKsbRooWg/dKyzr
 J1KLuFMaKvgU7vA6G8sRTVfzOTF2faSLCnRbjqR98quabf/plAKGLRzNISaGmKlYfjD8
 GvBqwHDECzgCtof3qZch64Pirs2GhbM4wH6JLlqTr5OVE4Wh5Yh7ctqlkoWQzcl39eGm
 LaNMyVboJeLG7SeV0dKTfkLGpddMjR6xW6ueGHqwnRRhcBjtBAOQPU3pHfinlaDx+p+F
 Q93WPBaTrS/zhFc4YpQs5TfYmHd4QX1Dpzc6YRh6BX6a0uC2e0tx8wTnGhPrc/tCfFRA
 CECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Hx7yi3K7A6K/V4V2tSXSqAMGTLaOeKielJjDmHRNjA=;
 b=qrlzYX/kXWP/q8kiGj08VSPdRE7qZ2kwo3TpD2sw+9fWny+mAQ3DsAfwicxL7cPcNK
 DPKYEAq6b5jekhecJH/a/7cdALsSfXNJQ00HSeQ8aleYfKGuDRuC3fW0JTF17TCKxkET
 41Mg7Z/pR8JfjwsTKG14s9rEuufz2UI594cqGV2GspvBl1IJFuUIF2VRg+nql/ZDSFew
 jBzTwUEDt0ditU3tdjgW47pf4NOQVdKOQJbJz9S7c9m0ZVjYUhy32UEEh6Ijs3hxSKHO
 VBFRduqQJyg0kQOMvKWrtbszt5G0I+jPEyKP/R5DMt/KZV5999mMiMi11mnn3PAVSRtw
 UREA==
X-Gm-Message-State: AOAM5317SFXTtLWx+iyObu6ZHJIsvwxL/cZTBbtcioAsXuaDgfWuZTNr
 SPKjh1H7ZjgyX3+eH9Z+/kuxEnk5ocA=
X-Google-Smtp-Source: ABdhPJyizSRtYQUy9j/yeKeZHU+M7nxLhDIOaIaIaA/OYpwj23FAvQorPx6h2U59F/d/S8uDYGta3Q==
X-Received: by 2002:a65:5645:: with SMTP id m5mr20277194pgs.434.1591046241700; 
 Mon, 01 Jun 2020 14:17:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h3sm331135pgk.67.2020.06.01.14.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 14:17:21 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] target/tricore: Implement
 tricore_cpu_get_phys_page_debug
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
References: <20200529072148.284037-1-kbastian@mail.uni-paderborn.de>
 <20200529072148.284037-5-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08bd83ab-1d92-b0af-04e5-b2b755ee1528@linaro.org>
Date: Mon, 1 Jun 2020 14:17:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529072148.284037-5-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On 5/29/20 12:21 AM, Bastian Koppelmann wrote:
> this also removes tricore_cpu_get_phys_page_attrs_debug() as it was a
> temporary fix from b190f477e29c7cd03a8fee49c96d27f160e3f5b0.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/tricore/cpu.c    | 10 +---------
>  target/tricore/helper.c | 13 +++++++++++++
>  2 files changed, 14 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

