Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1C03DBEEE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:20:15 +0200 (CEST)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Y3K-0005rn-Fc
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Y1Y-000546-Qk
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:18:24 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Y1X-00026Z-8P
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:18:24 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so22186309pjm.4
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bbIiwbOXc8SLBZVVLakLxO4eG4BDBhOKNRf7VnOgeHU=;
 b=ox0FSHy6KfyVxFNMwNdCE5wurJ1Z35bZUBFIe1cfKO1Xa8xl4g6L1Z4o1ZGHVCU46k
 KGpFdnqBkwgtV3ZJyy/81r2joZAOCqAYWULr+FLb9uUROldRdofZx154tVZRA1WrDzZf
 LCkZ+ApJfj5AEACryULmRH7H9TrksiH8XAKAlXR8n40B+zcrd/g0qCH5XvPPaNPRCGk5
 WjBQMqHMtsAMk3qJae7q9ShaoP5tqjXfJGgjkBuG4bnf/1rQe7EEtBKSqs7Olch3JMjD
 /2KG+NIx5/YFV2/EFRT3VSz5w271wL0VKhKy1YPMRsCNC6K/fLI2sDjQYaATShlMD9AH
 vCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bbIiwbOXc8SLBZVVLakLxO4eG4BDBhOKNRf7VnOgeHU=;
 b=ecal56/YVkaeZar2qOlN5e3kkK5djHL+VwPhKCyEAiwbYuopqZbG4w+bTgnB9r9dvE
 JHe6mZmq8t93PYSHencbhSPuUnAsE2Uw+U5r85842WiqRpDfEAZ5lllVTaJxZP5tbemW
 CvUrXlpLuzufmC+8acYCzFjAf+dHgAZioeLpLNFIMkrzbnlqOuVLgWZszcudz/6Cj6PX
 OIZZZ1rQPHMA19rJx0mE1OKwcTRaB+m2ekeCGbwAYCfLQx94aJlY7ywTkHgohO5dfU47
 FPX59P345RDhLuXRbntrXFR8Cp1seMFJEE2Glk0T55qlTyn7c+xoPy5H+zwouhnFiOY0
 bnDg==
X-Gm-Message-State: AOAM531YBEuX9MOfMSh+RnxaBuMtyzjU3jh4QyrVKVK5ED1hvb1aA2Nc
 2dyQZknJ1WiX/lf/j0/2J9BfMA3jKzWXyg==
X-Google-Smtp-Source: ABdhPJzIxBIftsAe4z+LJsjraMNfO4JrOJkrrqkwyE02PbXWrDwMifBrHf+J72ydqShazFJmoHHEmA==
X-Received: by 2002:a62:1892:0:b029:349:1b8f:af2b with SMTP id
 140-20020a6218920000b02903491b8faf2bmr4487350pfy.20.1627672701931; 
 Fri, 30 Jul 2021 12:18:21 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id u188sm3580968pfc.115.2021.07.30.12.18.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:18:21 -0700 (PDT)
Subject: Re: [PATCH for-6.2 26/53] target/arm: Implement MVE VMLA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7df87389-3d80-30d0-ebde-3262555a4725@linaro.org>
Date: Fri, 30 Jul 2021 09:18:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
> Implement the MVE VMLA insn, which multiplies a vector by a scalar
> and accumulates into another vector.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Changes v1->v2: don't decode U bit
> ---
>   target/arm/helper-mve.h    | 4 ++++
>   target/arm/mve.decode      | 1 +
>   target/arm/mve_helper.c    | 5 +++++
>   target/arm/translate-mve.c | 1 +
>   4 files changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

