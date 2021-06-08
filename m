Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7475B3A06A3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 00:13:20 +0200 (CEST)
Received: from localhost ([::1]:37884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqjyJ-0003ra-IP
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 18:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjxQ-0002xj-Vk
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:12:25 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjxO-0003F9-Sq
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:12:24 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso2506708pjx.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 15:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mXy3zQg48sc7EXxim3zi9xFmLMXrVuj9E4yRl4g9mhk=;
 b=PEu34TXcFC9eiMteNUpNhNbp4xVAtUtmPsE3s9DhhPAr/Q9JxGSHTs7hwvMMxSBrfd
 M5C7tgiio5oBpqudXJFQBky/GETRmSS9wW7zPmuIOSMHT0xxrkjdDB8Y3e3uqT3ighuq
 JN2g4sSVRkUy39foTJrx2jR/F6Rv4VW1NjKIZkCrp/wwH3Vjp3GiznfbILO3iPSvVURt
 xJJHOBp9xhhtC/wfXA6SEdCjuO0VurS4NsKfwlIkqfIthlLcxUyh9HDH8dsPdSDweCtY
 GIkXdTtQBpZYxEiCXWiJlUGQizAOnXOi3Fwf3otMGqVi0TgQGrDyIEjR9Y24JQKNx1rA
 kdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mXy3zQg48sc7EXxim3zi9xFmLMXrVuj9E4yRl4g9mhk=;
 b=hdCtOXOCJZ43DqDVV4ppg8EZMZwcdDbE+ZmRUZYyw/pW7rBxWerRPYvvhss/DdiUci
 q4c/0sXEFIiblFjxnPo3U4stg4VFDpJVnVkKZIt8Pf6xtpSfn3RnIS4Cf1F7v+WmB15j
 E0+28NLE9Irtt1fIIpM3jKoJ8FxB1svhy+4+k7s06Ln58yXiRmsKbJULDbpmwzGRjGen
 FcxdJOsEFhf1u7hoShioChspRgR9w7jWkA0R9D72X5xRH0q9AMirwWCWtnfqKNC8vX5H
 IQ2ioNq4kuGzd0SlkagJW5+yv2Oezog2GaV+Jn/MpYqhytvxUDfFK5Ocr5pegGGNOXU4
 zMew==
X-Gm-Message-State: AOAM532Wgl0CmeROp4496rAyr0I59Qyjd6AsGB3DGJVpmeYaf6zYVftJ
 1Kt4gZBtGaFZJfNGynWOwB4qj7WcJkIe9A==
X-Google-Smtp-Source: ABdhPJxiS+VhA4DxzEpLI8eb9pvGgtJjjR+GfyG+lxZfn/J6aGfIQp5KnsadqGEOyuOwCAFiMroVeg==
X-Received: by 2002:a17:90a:1150:: with SMTP id
 d16mr28465718pje.180.1623190341417; 
 Tue, 08 Jun 2021 15:12:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j5sm10024446pgl.70.2021.06.08.15.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:12:21 -0700 (PDT)
Subject: Re: [PATCH 14/55] target/arm: Implement MVE VCLS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5df50c98-2296-6dee-fb24-8809f943d928@linaro.org>
Date: Tue, 8 Jun 2021 15:12:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VCLS insn.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 4 ++++
>   target/arm/mve.decode      | 1 +
>   target/arm/mve_helper.c    | 7 +++++++
>   target/arm/translate-mve.c | 1 +
>   4 files changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

