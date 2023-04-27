Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3136F03F0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:09:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pryYr-0002kX-LV; Thu, 27 Apr 2023 06:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pryYk-0002hJ-Nc
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:09:09 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pryYY-0002jL-77
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:09:06 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94f4b911570so1292953366b.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 03:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682590128; x=1685182128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Im51LsAPXBimQ2VTe1VpUPEC0RKnaeGhqzEgmz0X4/o=;
 b=F1lNUz5q9wbbUkNhQyopObZd8fEBnKAaURwME7Xz8e57AYdiCgbucOmwJluhc6IxDp
 7BObyukRSRYha9+KxPRwPALxbCNarvp+JlabLLrym3GnVWd0MfpXfT0ksIjX1dSlsF6N
 sp7m22vIfhfl6AnQnihQ4Xy5+jYtlEf6x4tmyNSETdaATFWqwdfDPEIz5hgpvlqCaDfg
 8GbZV0Cmy+l1uO0PLDhRUdR8PRGJhcTVmL8w+VaWSI5w/doPYODt0ZygNNf7Im/TFTF4
 HLCYZk7efWvIKjBdK7wL/TyXW8uE1BJaCYohn8SHhHAnhgfsFcBCEz/L/jkIb/l0a1Aw
 g7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682590128; x=1685182128;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Im51LsAPXBimQ2VTe1VpUPEC0RKnaeGhqzEgmz0X4/o=;
 b=E1h0ufoH9nAh3D/5SO+zkF+dFqr4mtjouq/Y9y+8pClXCWn1SjseUXLt5ut/UCbMRG
 AFT8GqGdcmHMpmxooDAyKfNLB3OkMyYtQggruYuZYxbFU9tY7bny2Q+rgTL9eLXfH4xE
 Yx7PnM/atDApCRQTRRiQ3rgEPCytVpIme9UkTJxU5UZIDhwZK5n8atljgO9IYRF33l09
 zfwx9sy28iWILE/Fuk4VpCFUe8tmDpy6hi6Lk6V9qC7iSxzMJP/Q+LS1isS0KzkddnTR
 bcuhVkiHHLeba+pNPzR+MWtQwntFLPe/aSOD//+MZG8mVSHRuj12Kqg3ZSBSB2QXbLqi
 mGgQ==
X-Gm-Message-State: AC+VfDydjU5HOZqtlDaLxgGgy9KRKw5LRnySl21R2MZMvLG9uLOMxe93
 AoFbueVbW0xFkU80VjYKD5NYZnZAo0Za6u/ugFfqog==
X-Google-Smtp-Source: ACHHUZ7pG3QOjbTs0QaBgKcEPnogGSjgZ+cPRY68fxDUVmKQmoAeaiNJdYcBuGypf28/E/cHDAMLxA==
X-Received: by 2002:a17:906:9b86:b0:94f:17b7:5db3 with SMTP id
 dd6-20020a1709069b8600b0094f17b75db3mr1246082ejc.20.1682590128319; 
 Thu, 27 Apr 2023 03:08:48 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 og36-20020a1709071de400b009600ce4fb53sm585100ejc.37.2023.04.27.03.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 03:08:48 -0700 (PDT)
Message-ID: <f2767d6c-11c8-0261-1167-67cf8d70dbce@linaro.org>
Date: Thu, 27 Apr 2023 11:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 2/3] migration: Make dirty_pages_rate atomic
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230427095250.22350-1-quintela@redhat.com>
 <20230427095250.22350-3-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427095250.22350-3-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Signed-off-by: Juan Quintela<quintela@redhat.com>
> Reviewed-by: Peter Xu<peterx@redhat.com>
> 
> ---
> 
> Don't use __nocheck() variants
> Use stat64_get()
> ---
>   migration/migration.c | 6 ++++--
>   migration/ram.c       | 5 +++--
>   migration/ram.h       | 2 +-
>   3 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


