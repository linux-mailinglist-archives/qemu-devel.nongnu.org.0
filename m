Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102232DB30
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:27:27 +0100 (CET)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuZC-0001ob-90
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuS6-0003mL-1u
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:20:09 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuS1-0006mN-Qf
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:20:05 -0500
Received: by mail-pf1-x436.google.com with SMTP id r5so19749146pfh.13
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zOKHIlvMDN79VWQN1n9O8Pn5AFWbwZ3gbEuk3cdOSEE=;
 b=HAawGYkEiVzfDxXkHXQOGKkcYLv5UCqZq0fMQxyAJ91qTuKqtVD0/CMDMolaTtchd8
 IIcs5bogy6nLnpDKaBdelxkLld5AA3YZBflsQ6OojJNVrOYshJPMCUnANgyTDP1ivRiW
 /oEQ3ifcpYLm1CWKdegL1Kxn0MSRbR4mqObtH9MiE+Iobblzuc0HbB66+GHn5R6Kj+wN
 iG97M7kdDMxTcloL+37BywK4raOiLM9Y3HQcs5ZStK9Oe1csbwZ1IaLGpsj54RpgwMwZ
 EP+QTNkKENhw0GvP+RBxMdGHXr90plbm1X3DJNeSBd1tTL12rl+zoc0ICW4PWqh/M8eb
 Sc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zOKHIlvMDN79VWQN1n9O8Pn5AFWbwZ3gbEuk3cdOSEE=;
 b=Qezr2o/Bnoj7oL4tyAtfAD5BpSAV1OfP6TXZtpWGYu3HyWiRtVUW/+2dKNRpwh1w7v
 4tEbfGN9riqFf1jiPEYjn/iLqhAATq8++azWXVdAtlD0F5Ypsikz7FnpPvI1cTsQVUHc
 fcbtbhgzsKrkkMzB1tMdnykBsO/NM3Nj3qFFWxlT1m8GmdfkxRjssaE+elZWrI1yOYcU
 I27/eSC2+AcRkl/c+m1nxTif2f7lSM0+3mk69zek7ort9CiR6LSjD99VBe3DaJNsG7vG
 VTVWWAOUXOTbwncoRN0KdrJZd0yF3wOXD71zZv9WFDHW8PKnuJPizySQKzfllMyUSMqC
 /0/Q==
X-Gm-Message-State: AOAM530qWXEDBjNzT8Uw1iWq2p9g2Fh/N6k6h0w31VlDHSYeTk8qci4e
 V9A4txA9AytFocjgUw4Dmt2g/W7Nffx49Q==
X-Google-Smtp-Source: ABdhPJyxu7lCmIHe6/qKZ7mQHTf6BeArNVtye+icnsANuiIeCqHixxPoVLpZ9RpBeFha/7FOb9c7Cw==
X-Received: by 2002:aa7:947d:0:b029:1ed:a78c:59ea with SMTP id
 t29-20020aa7947d0000b02901eda78c59eamr5331699pfq.36.1614889198424; 
 Thu, 04 Mar 2021 12:19:58 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g141sm234517pfb.67.2021.03.04.12.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:19:57 -0800 (PST)
Subject: Re: [PATCH 27/44] hw/arm/armsse: Move sysinfo register block into
 data-driven framework
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c63b08e8-b955-3631-36fa-1e8480d36d9e@linaro.org>
Date: Thu, 4 Mar 2021 12:19:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Move the sysinfo register block into the data-driven framework.
> 
> While we are moving the code for configuring this device around,
> regularize on using &error_abortw when setting the integer
> properties: they are all simple DEFINE_PROP_UINT32 properties so the
> setting can never fail.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

