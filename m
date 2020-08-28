Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0DC25633E
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 00:56:33 +0200 (CEST)
Received: from localhost ([::1]:43804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBnIO-0008JZ-CS
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 18:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnHh-0007lq-28
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 18:55:49 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnHf-00035l-GM
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 18:55:48 -0400
Received: by mail-pl1-x641.google.com with SMTP id z15so334930plo.7
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 15:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5/dJCa7NOOjUArpr4SFdPAnbTiARGpOJMfas1h2n7iI=;
 b=htOMOnBS8W2h751uQ13ZSUkVKF77kBO92OHDE49V9r6YFwxnYvWldC4QscUqggtwQq
 ztda5WJHK8sSuV76PTKFIGj+SAMbLOqLEUKjwePkgp2zh37kEJOgeNjCNVTBzHeLDuGo
 byP5fR5Cjp2wnkDJ9tX3YZxWgy8XvM99jcPIafhdcBaxTGaRDgvUeX2XsduHE5iwMjAa
 hAFLkOhgqdsGpk7KBr9Dx+yDWD1OrfePmd1xlt3UAsSajWt0tFJCL1rPDkzOUFPTcrJe
 xbc6IkOf8vDKatcBleLCP1Gy2ni0F0Uc9hgeBqqU0SYhLbI+Pxu3JSDJoUb83WDvKINv
 xrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5/dJCa7NOOjUArpr4SFdPAnbTiARGpOJMfas1h2n7iI=;
 b=W7I0wRuNBPMrh2TodCPnrR1+xVRk2EldcGenpGbY56j/+zUSouY4pEKkms0zvbjADX
 XyJG4ajA3xYufPbvyaPTneH3NwLkUY84JlqpUTMUblUC54mgwE9D85x7JmUqJkRV1hFI
 vXxzB9kpEZIM6xOeUuGc1FCBF+22htCA64DVyEGZKQr7xqmau9pioGVdqLjUtzozHpWl
 lNkFfyaFxyFwENm6H8H9rqVC9koEub211MWsK0HFtTOC1wrWzWex490rmHIuhJXQRO+T
 wGapI/GTa0gJLA27SCBTeGoe5N4dV2yGk9DbuJesy32OiAlutTVNxUocT9mt0GSF/OZ9
 YW4w==
X-Gm-Message-State: AOAM530o9KkkEnMcd+uo3G+WG7quS3WLUjA6bSQmS3kTzYeeBuByvZJq
 Ht4JZydD1V1IHLDJmL31gVQvw8HBFRMH2Q==
X-Google-Smtp-Source: ABdhPJzv2VxrjVrGqBOHKZwg49L+qQcMkew4dnDGlk/tdgyyJhxdNI0s0IF3gstt1zGuB16Owqls/g==
X-Received: by 2002:a17:90b:3197:: with SMTP id
 hc23mr996633pjb.110.1598655345740; 
 Fri, 28 Aug 2020 15:55:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id il14sm319268pjb.10.2020.08.28.15.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 15:55:45 -0700 (PDT)
Subject: Re: [PATCH v2 31/45] target/arm: Implement fp16 for Neon VFMA, VMFS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bdaf3f21-11af-745d-ebef-cf2d72c58294@linaro.org>
Date: Fri, 28 Aug 2020 15:55:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the neon floating-point vector operations VFMA and VFMS
> to use a gvec helper, and use this to implement the fp16 case.
> 
> This is the last use of do_3same_fp() so we can now delete
> that function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  6 +++
>  target/arm/vec_helper.c         | 33 +++++++++++-
>  target/arm/translate-neon.c.inc | 92 +--------------------------------
>  3 files changed, 40 insertions(+), 91 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


