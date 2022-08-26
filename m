Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A528A5A2BBB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:51:55 +0200 (CEST)
Received: from localhost ([::1]:41582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbcg-000545-L6
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRbYA-0007pc-Aq
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:47:14 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRbY8-0002r2-Hm
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:47:13 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso2156933pjj.4
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=A30gJvV3vMTYi1dARlMQj8dgjUIyEhl3y78tvywnTuM=;
 b=ihHWA29dAcn7tgoETVuTUbQI5Rbd9RLpmiqEgQb37BjWcZMrN+5LJN0mU/XdApsOT6
 4rXig1t+Y0j+D6ghsB4aygTJF5pXoIWztdYcqkHUMqeF1IMJFNfn5k1mS7WvpWKXMWjW
 zPIy/cMzOQHqAP6W5hwlFUcn1LtgDOTPIHjj0rQGsO4JmKv64miu9F86S+8i6tQSjLMn
 INXp3C5ZCV7evbBsVUSUBRHRxGLSWg7j8yU01tHuPex7/9GsQRLeVUi5pESgJ5t6w0lO
 MK04+ftypfh+pdLXr0wqySEYz3bANdiKChlvRNE68QXOtqhy9klGAk4WpL4Qa3+4+bzr
 NXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=A30gJvV3vMTYi1dARlMQj8dgjUIyEhl3y78tvywnTuM=;
 b=15jbvtsxGezf4ENV/hN7+0p0M6hdAxVvn5LHS4Nk873la3v9I4lcYaAS41UHKbAdI8
 Md/Ohk/HZsiPJpbcji9aGZKTyiD/tAp5VkFXaqd7OfcEIOCFpa8dEQW5P6kDk5HYO5vL
 Y3OSw9b/dpaGzkrzKe19y/rFHTNQnHdpoaTyfVfEEYNky0W9dx684254XMQDziLXGyOZ
 mbt5dNn6bjOAYPJAZ7WYGH1DiMMBHh40e+LrJ1ykZlUKkk+YKH56zC2g53pkdlfv1ej+
 dJlhbH/vvbPOO5ZCoPaLZ7rULXMN3dfUWPVXG/YBsw2Hwfucg3y1maSCAdNUZhJxdfoj
 G73Q==
X-Gm-Message-State: ACgBeo3jgnSAkT5cYSn4Td/4SXn+0uxDWEBGmwyC10Lwq4H3iI7VEhIf
 clr1BcvRTCwrIZmr4FuD4MQCCQ==
X-Google-Smtp-Source: AA6agR5sZiIMUXdkoIpVG5l4dSuPUp+cgM/ojiMZMqxYWCfN8etn8neKh0u8YqSoqKyRK8eSJliU2w==
X-Received: by 2002:a17:902:8486:b0:171:48cd:1356 with SMTP id
 c6-20020a170902848600b0017148cd1356mr4105874plo.153.1661528830905; 
 Fri, 26 Aug 2022 08:47:10 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 198-20020a6216cf000000b0052b84ca900csm1929005pfw.62.2022.08.26.08.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 08:47:10 -0700 (PDT)
Message-ID: <ce4434fd-792c-8c4a-362a-6ba9504d5d53@linaro.org>
Date: Fri, 26 Aug 2022 08:47:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 15/18] i386: Misc AVX helper prep
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-16-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-16-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/25/22 15:14, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> Fixup various vector helpers that either trivially exten to 256 bit,
> or don't have 256 bit variants.
> 
> No functional changes to existing helpers
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-19-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 143 +++++++++++++++++++++++++++---------------
>   1 file changed, 94 insertions(+), 49 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

