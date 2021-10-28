Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED3743D853
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 03:01:41 +0200 (CEST)
Received: from localhost ([::1]:59200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftnY-0005w7-UW
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 21:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftkz-000495-IZ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:59:01 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftkx-0001Eb-OW
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:59:01 -0400
Received: by mail-pg1-x531.google.com with SMTP id 83so4686449pgc.8
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 17:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vgpgH36sKbFU5ObfmM7VU9wnvblL5HtjPT9nPRO0Pa8=;
 b=AhsM7XLR4qSLP1c5x24tZFikm1vn5tH0s6P/VaHg3PbRRoT8aQmhJCIsrhYYD5lVNx
 dccwtB+m7pSgh+d8yFCD8PUlT8GpnYct3GYDqqp209ekH1cSpEbbVy175cDkdMHba21V
 RIaSGXGskM/XAbfLNQ4g/iU6FuFAKa7FMCZctPzVEf04JbyfKksK327ZzR/99Hjfl4TI
 sSrotDQtk/46rr8cN3C8IeO6r3PZM367UXO9p3sAuZLT3wxM2IwIFvveIj2EkpsYoo8A
 HE/488c0U0CEnGIeEiry4V5zaKU+YlK6ZhMm9xjfbotxe0uTUmuEZGmox23j9sPsFv1R
 KVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vgpgH36sKbFU5ObfmM7VU9wnvblL5HtjPT9nPRO0Pa8=;
 b=6qEzXW3/yKeFcNifsLZcui8MCg2kexUChpMofpbhIl7lZEVEpB5rL+9ck1ISyW72nP
 pXu9SIOQw3OkGz2vsw8RD9qx8fUFscoEn8zNpo47lbd3zTxf/QJ9kINsHVq+/Hrc2mw7
 97XbDtwdRhYzDE4ChHKnUBoz+CXqTsGPKlKVpY+m7TEVgu6cBs/sF6HkjFXxavIuHODg
 sW0hrBu/R9/cYxtlYBxFsBYK0bpeMPKUQSRasZQJ0YeyjqmlNrJh96V4D+16GH5B/teW
 SsBBrM+WxKgwoDUKtHna7O07kToPnRd7bt//wupCpYs1fMIHjccEHC3Dh+8D+WwNvDLh
 EuXw==
X-Gm-Message-State: AOAM5328iT/2DA8/N++ulxaUMGp0K54YoJxCWHPQdCPl2z+Ac5rJyO4Q
 oNl3SDDFaSAQvk28LTlWm9tWbg==
X-Google-Smtp-Source: ABdhPJxUi3Gon9A1bgBn8THOYHT5XOn+vnjC5hEiK1CFeHrD9Yf3G4d8/TchgjVl1bhjydFdcNfPRg==
X-Received: by 2002:a62:e30f:0:b0:47b:d137:bb7b with SMTP id
 g15-20020a62e30f000000b0047bd137bb7bmr1090105pfh.1.1635382738496; 
 Wed, 27 Oct 2021 17:58:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id om13sm5814006pjb.12.2021.10.27.17.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 17:58:58 -0700 (PDT)
Subject: Re: [PATCH v3 17/18] hw/intc/sh_intc: Avoid using continue in loops
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635371671.git.balaton@eik.bme.hu>
 <33958026ad6cf470c43bd3d38d4ecdde76c82670.1635371671.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bbb894c0-11d2-9632-f7ef-bebb0ffc827b@linaro.org>
Date: Wed, 27 Oct 2021 17:58:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <33958026ad6cf470c43bd3d38d4ecdde76c82670.1635371671.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 2:54 PM, BALATON Zoltan wrote:
> Instead of if !expr continue else do something it is more straight
> forward to say if expr then do something, especially if the action is
> just a few lines. Remove such uses of continue to make the code easier
> to follow.
> 
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/intc/sh_intc.c | 44 ++++++++++++++++++++------------------------
>   1 file changed, 20 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

