Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5103DBEF7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:28:06 +0200 (CEST)
Received: from localhost ([::1]:35152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9YAv-0003ph-1v
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Y9z-0002LM-KT
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:27:07 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Y9y-0007ys-0R
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:27:07 -0400
Received: by mail-pl1-x62d.google.com with SMTP id a20so12332731plm.0
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=B/vW1icP2rNmdwz1oAyDEc4lJCEKzrOSLJP6TOOknbI=;
 b=P2QC+OjhBwW+jzjgtJZN7ZefG4Cu3fqgk/kJmgY5nVva2T2q0q+Biut+wJ1AzrCZ4v
 0S3FQs5NnWOYRtvil7fDxF8DxyAp+TFo+MFXfQZ+18+e7Ufm2REbrpCUd/1kzaYQ8p4d
 Npc8B0TpzTS9w7w44QlpKrKgznvh9wlq2kqiZYL5Kwfx5yJskhlt7TsIYYSrzIP/1EtV
 Rs9h5E3+FBuU6Pi9ApsgBkDqFAlk06SKrE+/tJVxXll6BxiGj9w8PxNmqsz6AL1jFvHM
 HA2vU4xY67zQasXpWFH5jHGgSQdOQDoRGbF6XLvqUZ/6qd54VAb7GC2eLZcJjRD/52fH
 88Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B/vW1icP2rNmdwz1oAyDEc4lJCEKzrOSLJP6TOOknbI=;
 b=nptrmrxWiQJ8Ia3lhuvJq+6C3gpba1NE/IwpP74QbZXPY/aEWfAISQs0Tpv9NA2PhB
 J6215ouRvcQ6DdVVZDxPqUuhLkYlcjzsfdaStDZw0nJKsSkzJlrZLb5o1C6qfvzuyp3z
 5MGQLuRgGfYFuQ9PNqK8BcMPWrOiZtwkLjslC3tyQXlQUFld8cPepNUUNUUy8oMCFQqt
 wpEWPGFKVw5daK1ryg68r1CmpYLVgyyuzZSF1N4DYK9Uf0xmgH1tFuHZ4mtL28nEx9EC
 KhtAxHpSnrcGgK3AqBwIH61MwCX/TO/At4zNY7w7ZJSFAICTw+End2k7TgSbumCpLS3Z
 dmvQ==
X-Gm-Message-State: AOAM533pG0nygMrMWxddsnoOPMQfRz746CJIda1gZHNRmslMphbOr0eS
 qWrLHnW3UkUpIGEVhymGHlBUPC8+T80tAw==
X-Google-Smtp-Source: ABdhPJyCANc+OypjEE41wcl3dwwxF1LnbjloffIJHyOgTD8aJkBXWpxxTpSH5nO9/lUJ8M3RcCddQA==
X-Received: by 2002:a17:90a:c8b:: with SMTP id
 v11mr4557108pja.114.1627673224581; 
 Fri, 30 Jul 2021 12:27:04 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id ce15sm3208762pjb.48.2021.07.30.12.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:27:04 -0700 (PDT)
Subject: Re: [PATCH for-6.2 36/53] target/arm: Implement MVE VADD
 (floating-point)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-37-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75053aca-478f-4d3c-bebd-67ba2353859d@linaro.org>
Date: Fri, 30 Jul 2021 09:27:01 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-37-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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

On 7/29/21 1:14 AM, Peter Maydell wrote:
> Implement the MVE VADD (floating-point) insn.  Handling of this is
> similar to the 2-operand integer insns, except that we must take care
> to only update the floating point exception status if the least
> significant bit of the predicate mask for each element is active.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h     |  3 +++
>   target/arm/translate.h      |  6 ++++++
>   target/arm/mve.decode       | 10 ++++++++++
>   target/arm/mve_helper.c     | 37 +++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c  | 17 +++++++++++++++++
>   target/arm/translate-neon.c |  6 ------
>   6 files changed, 73 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

