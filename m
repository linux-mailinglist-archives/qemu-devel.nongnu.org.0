Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A956FE2B6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:45:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmwN-0000RM-PH; Wed, 10 May 2023 12:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwmwL-0000PA-UT
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:45:21 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwmwK-0007JB-7g
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:45:21 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9d1so48758175e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683737118; x=1686329118;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MnGnmcq63J5VtX/bjpsYtML6hW5FKtOBNrROVJfTRLQ=;
 b=zVYqMwI3AymioYykHFXCyxoUdaIs47QTiVfn4JdgzVKvITm/2EX+nogAh8Zgy4tqJZ
 Oj0VjhUmdIGFTkRtV1m3iouU9/PffXcK/rxeEc6Wrv9+oEsfNWntQEfIqn0vBKOa9ttO
 3KP+8xsbgKfPWH0miLjNjIZHo93rlwHFGGNRCkUYqxGZ2lFdOBL10Br5Cvl/PPv6h4De
 8mGTAw2L220UpAvR+VQVnU/MZszi0cCIIzB4MKnS06Wyegy1XmHMxAmI09Y9hwWrlGNu
 TuUkMBkmrWqSrdzibedgmC6EOHOost1UO4AQsB8O1GwvXN8mHpZ8Ir3NwiDc3lOdKDZA
 yWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683737118; x=1686329118;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MnGnmcq63J5VtX/bjpsYtML6hW5FKtOBNrROVJfTRLQ=;
 b=lVTOBdXK0fQGO8UzOZstDlXQzBAfxH9oagNPttGmSpZqxRUtWBQZsjEk+ych8QVpCD
 YruSWOTD4/anFg30qMHlCHl3r5hdlMfrCLBMCGrrHxhUT4KyhBKZugfyZrE3cYSVM3b+
 O7AMw0mp53/YR/yMpVTgmvG8I2QS3im7auG/ROPk9qzrB6xDbvQsGaGBtXvHbReJyNZK
 WetlWgbp+mlZM0ygNxK+rCkByatiQJfaHjCyoVoJfnNFjqdaeSd3hDNg7A2a4ImyL5hu
 THesw1S2Bo5VIk9Xf1Z7NE4hyFYb3w5JGHqN42L1ynDlZzF9gdnPWFuOtjMdzl1k1A7w
 pR4Q==
X-Gm-Message-State: AC+VfDzRy7QA2XjQR0a7zEqS9mRZHR19MNW1r0nrTPqCsY1pQF7G5P1P
 N9hk6FehfJDS4uBFdWaqcAjXpWWJlP1cVSL0n853xw==
X-Google-Smtp-Source: ACHHUZ4QT6ODBaF+EpHOetW4+x04sXDFqQTeS1gCcnv2SIZWfXdwkFba254N5o3lg+5D5rNN892GdQ==
X-Received: by 2002:a7b:c7da:0:b0:3f4:2df7:e332 with SMTP id
 z26-20020a7bc7da000000b003f42df7e332mr3535440wmk.13.1683737118464; 
 Wed, 10 May 2023 09:45:18 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t17-20020adfeb91000000b00307bbbecd29sm1835458wrn.62.2023.05.10.09.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 09:45:18 -0700 (PDT)
Message-ID: <c11103d4-93e2-d851-7846-e4ac0722c3ac@linaro.org>
Date: Wed, 10 May 2023 17:45:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] tcg: round-robin: do not use mb_read for rr_current_cpu
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230510160441.1249170-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230510160441.1249170-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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

On 5/10/23 17:04, Paolo Bonzini wrote:
> Note that qatomic_mb_set can remain, similar to how Linux has smp_store_mb
> (an optimized version of following a store with a full memory barrier).
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   accel/tcg/tcg-accel-ops-rr.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

