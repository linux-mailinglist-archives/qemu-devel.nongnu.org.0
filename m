Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4180B3A1B9A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 19:18:03 +0200 (CEST)
Received: from localhost ([::1]:38544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr1q6-0005Kp-B7
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 13:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr1og-0003sT-NW
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:16:34 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr1oe-00053i-Bw
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:16:34 -0400
Received: by mail-pf1-x435.google.com with SMTP id u18so18880992pfk.11
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hUdmkGn/19sRX69mgpNxzpzN0o3WuqwokrD2UVT7lsQ=;
 b=I8S8/6PrhkpTVez1527vLgRkTHOLotbejopt61WJTBOuSCzkK1t0O59RvidOXYF5eX
 CR4+RmOsY8dv0Pfo7DJQ9k5nx11UMQm7Rr3Nx2f8eC1Z9bQGD+H9R+4vj2vtoqVZzH+O
 heNPFCPvlLwDMgTBZvSNA87cUbV0xGJZyqZWEYKcTZfop1FJ9XiJCAHKWRdA6ON3xXPQ
 b7ElVroqStlWcQZOESU1bDJ9pC5hkgl27igFhUGFlVN4A0ig74MrpRHjs4sQd3+0Jefq
 n/VC0nkoxZd1/YVhjWTLZAnENnqNS8OCrIRm8aulW5Oinp+Yvx19RQV8u8sqMd1NI7bZ
 xhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hUdmkGn/19sRX69mgpNxzpzN0o3WuqwokrD2UVT7lsQ=;
 b=AnzJcqX/QRYWnE9vlxO9Jhe4TTIF+f80XQ3wf8DVhQnwt2q9/x0R4lxbVvC2SWEASK
 H1KmlUXQGHsjCUpXCk++kEV5REkNOIBjFcXfup/jopDQwVyBDTXebDapCGiQLp88ff7m
 UvvA8ockihWIsGfRXhOSKurWxP6F8k+ekpId/NH5BBbcWfL773oLXgBOMkOKkzUJC2lG
 4OlOSDCgQZBq018F3MXPhBDxefdQuiQyIHh/g4qPz9bEYuxyRgU8nwk1n/D82F1Q8fS+
 ihf4qaYECQJ3wPaciy87lnUuqx6RUOpG5whj/rG8DJDLy9rUIOdGg8RNVExghydj80Ih
 jnvA==
X-Gm-Message-State: AOAM530HbzDKk5+t2sjvOKPyDBnIrz/OtW9AmApvIwaYmpFcL80nKIXv
 /iYY6mhWw3rujbgVz4KgtRhYFF6ZI3bq5g==
X-Google-Smtp-Source: ABdhPJyacG5xAFEFnPGAZxJRXvF46cN/DQdj40FfOMg9inXagT2TUTjlft1wyjSb51OJ2I+crDfiXg==
X-Received: by 2002:aa7:85d3:0:b029:2ef:109a:7f08 with SMTP id
 z19-20020aa785d30000b02902ef109a7f08mr791392pfn.23.1623258990629; 
 Wed, 09 Jun 2021 10:16:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y205sm184346pfb.53.2021.06.09.10.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 10:16:30 -0700 (PDT)
Subject: Re: [PATCH 20/55] target/arm: Implement MVE VDUP
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-21-peter.maydell@linaro.org>
 <31d446dd-d17e-e036-7e66-fd7291827d9e@linaro.org>
 <CAFEAcA_bVkpO2pqqN8vKdt+U22gmkaSmmaWTP9KHwXQ-kOwz=Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e49d28d7-5edd-78bf-41f0-e8597b678908@linaro.org>
Date: Wed, 9 Jun 2021 10:16:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_bVkpO2pqqN8vKdt+U22gmkaSmmaWTP9KHwXQ-kOwz=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 3:06 AM, Peter Maydell wrote:
> Mmm. I think some of this structure is holdover from an initial
> misinterpretation
> of the spec that all these ops looked at the predicate bit for the LS byte
> of the element to see if the entire element was acted upon, in which case
> you do need to work element-by-element with the right size. (This is actually
> true for some operations, but mostly the predicate bits do bytewise masking
> and can give you a partial chunk of a result element, as here.)

Even if the operation did look at specific predicate bits, that simply puts it 
in line with SVE, which is quite happy with expand_pred_[bhsd].


r~

