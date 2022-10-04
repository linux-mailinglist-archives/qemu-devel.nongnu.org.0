Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5768C5F4697
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:24:35 +0200 (CEST)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjmc-0001Ba-AJ
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofjDq-00066X-QH
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:48:38 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofjDm-00085F-UX
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:48:37 -0400
Received: by mail-pl1-x631.google.com with SMTP id 10so9259625pli.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=52RAFqhvsYrhr56dbwJuvMJ/gc+ez7UiKafkoa+arf8=;
 b=clNr/IxjLJBk9aUePz1D+riDrsI5YSQzNVSgXxNF+Gyv9XXqJmYB/Rkuo1DlqaPXnp
 1bYTUh9ogwGNGnRjsXd40bR6saIjepktcqLcc5Rzmwlxda06hP/WM9EEIH6be8O7XUfb
 BaS/luc7d15t2h7hnk+6KgBFzUZ86LgB+QNTLstflogm9jpDq2CX/rpt6rZ82HpXs19I
 Ab0rrP7wDUMcwvfO4rUNgSHQFjEscCPv1KAiFxjY6vA/oMQW4zMOVWQSp4cF0SYnUD26
 iMu/RpjaupOW1lCyt2RuTGy1Wq3xp4Gv8QKEO4E/5JIPAQIvHZ8prRS+QTl+Kt7FBKKN
 zXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=52RAFqhvsYrhr56dbwJuvMJ/gc+ez7UiKafkoa+arf8=;
 b=KWSu0ZwW2rxMy81/4UdMbfuVaWWNXxLImzAEKneEdqPicdSCkgoinSfN77O4vRYukx
 0+SkT7eEstSo9ElqmCiRaupA4t6Gew0+JtymcCLa4OpC7QUfOFTUi8Niytv6Qyx6moJv
 4oNlDlZIyDoCdIoinpEMYnDsTwtCI26GF5fuwRKyYhr/rTrMV7IZLUKCxn3bUH+qehFq
 KN+vZgAcbMuczYO01EZ3KCI7GHZmCktTONhptMRZy0EUKQ5A0/4I0TpUkP6KjUvc38CY
 IxTMATpMquRpOeTHKkPtLTgqk+KVeAc9edEQDlbthObJ+2nHa/qBKCLUSfye5UJ9io3j
 2Hew==
X-Gm-Message-State: ACrzQf2dlwjOIDMi5xqLoOxtpYXQ/5bQnQD8JM00LBuBdGxnvxgmmaDf
 7q9wFVAFntGrRm8jiyR4HNS1sw==
X-Google-Smtp-Source: AMsMyM6/Xi6fUrH1OtSWzclTEXl12EVCVlBtj+gqBhc9+xMSmDPXvqxWGfc3p5wbuFJSpz3qgUfcag==
X-Received: by 2002:a17:90b:3141:b0:20a:9553:cd90 with SMTP id
 ip1-20020a17090b314100b0020a9553cd90mr112357pjb.11.1664894913390; 
 Tue, 04 Oct 2022 07:48:33 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8015:12b0:403e:a15b:ff5e:d439?
 ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 k11-20020aa7998b000000b00560a25fae1fsm5562534pfh.206.2022.10.04.07.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 07:48:32 -0700 (PDT)
Message-ID: <8534c37c-7a90-f60a-ab5a-b9b5be672fa9@linaro.org>
Date: Tue, 4 Oct 2022 07:48:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm: Implement FEAT_E0PD
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221004110554.3133454-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221004110554.3133454-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 10/4/22 04:05, Peter Maydell wrote:
> FEAT_E0PD adds new bits E0PD0 and E0PD1 to TCR_EL1, which allow the
> OS to forbid EL0 access to half of the address space.  Since this is
> an EL0-specific variation on the existing TCR_ELx.{EPD0,EPD1}, we can
> implement it entirely in aa64_va_parameters().
> 
> This requires moving the existing regime_is_user() to internals.h
> so that the code in helper.c can get at it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Based-on:20221003162315.2833797-1-peter.maydell@linaro.org
> ("[PATCH v2 0/3] target/arm: Enforce implemented granule size limits")
> but only to avoid textual conflicts.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

