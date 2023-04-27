Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6446F03EF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:08:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pryXu-0001yy-WE; Thu, 27 Apr 2023 06:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pryXt-0001yq-Ex
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:08:13 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pryXr-0002hQ-Sw
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:08:13 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94f4b911570so1292830166b.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682590090; x=1685182090;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XbiEgToDWP7OKg02Z3cAgEALqjK+w0UvwNbhzU9sN98=;
 b=naN4p0v4WrkE3bO8EneJT02VQYkPrPPu+Y4rUazwH2lHzLXmfFwtEB+nb+9krFYzm8
 VbD0Y2PVINPNU2ogDSIO+G6e7JOzrXm+vsXSNoAUkG1sq3tGysd/445xuaJZ6H3QeFya
 W9wNi1AeaEoFb6FVFF3UC9PbUBkGkkc9i/I2BeBP8MYczGy+5HhWQsXHRUmWJmEa04gx
 KkXqgfnrlcJmjqqK4xMrOO0wVDY6hDgh4Nr1s1AzFHELq8GTZS5ldWXHe6MWIXCwpYRp
 vw5tvX2RUXrN5oYa5FVgIB7tyg1qEGPgj9gEsMCzAns6CIvrSSFOkxo60/kNBesbhrI/
 XbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682590090; x=1685182090;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XbiEgToDWP7OKg02Z3cAgEALqjK+w0UvwNbhzU9sN98=;
 b=PraBDHbvi0W9cqA8piLB34zPDce1UwphMXB/+MS/wuH42vqOShEdYSdYDt/MwsIzQv
 Kb2mCmQ2ImbnmeWlKLAqZsoSg7EuMOYf1MSPM7TfXRUqxOO8j3PzV51CuCePkUFoOKuj
 HIsknLabpnKpkv7GHhqAXEH87T/UIj9V2fsA3xFBb79gt6dCqufCptqPbOvUjbbMyNQg
 JTyJ6/X0cnJEubYq/5j0W9TkVvTgzdyipEFzByKzqhxKwCWSdUitdotHlpWQOO0R4jSm
 aRLcvy6kPI0KKqTu2DC47WH892G5K9V58HxEtbG6+jtlWlqHx34Z5Y2+NGc6IvgESZ/x
 5ePA==
X-Gm-Message-State: AC+VfDxpwba5R4CWH83b8xAdZWFgwjaKNOsZu2iTWsNHUVksA95cP4Xt
 1IyVNwxIXiSP/T4n4WrnFrDeYA==
X-Google-Smtp-Source: ACHHUZ6XbKHsJqXv0CuYkL88CEoCPGEyP2j/IWAdgLLF8BMCZKAzf/H1yDr7PwsAhHnILelQOP4pHQ==
X-Received: by 2002:a17:907:a40d:b0:878:545b:e540 with SMTP id
 sg13-20020a170907a40d00b00878545be540mr968513ejc.51.1682590089849; 
 Thu, 27 Apr 2023 03:08:09 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a1709065e0200b00951755d0c79sm9468800eju.104.2023.04.27.03.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 03:08:09 -0700 (PDT)
Message-ID: <99d6754c-147a-5494-2992-180749a1cc60@linaro.org>
Date: Thu, 27 Apr 2023 11:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 1/3] stat64: Add stat64_set() operation
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230427095250.22350-1-quintela@redhat.com>
 <20230427095250.22350-2-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427095250.22350-2-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/27/23 10:52, Juan Quintela wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Reviewed-by: Juan Quintela<quintela@redhat.com>
> Signed-off-by: Juan Quintela<quintela@redhat.com>
> ---
>   include/qemu/stats64.h |  6 ++++++
>   util/stats64.c         | 11 +++++++++++
>   2 files changed, 17 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

