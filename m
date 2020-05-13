Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888E51D1B99
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 18:52:35 +0200 (CEST)
Received: from localhost ([::1]:52982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYucU-0006Bx-I2
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 12:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYuak-0003NX-Da
 for qemu-devel@nongnu.org; Wed, 13 May 2020 12:50:46 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYuaj-00077Z-7p
 for qemu-devel@nongnu.org; Wed, 13 May 2020 12:50:45 -0400
Received: by mail-pg1-x544.google.com with SMTP id f23so6309pgj.4
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HH5OnxezYB8m50PJhDtkb04VNz53jv88eIvTAxwovtw=;
 b=gK7t6ZJeAHFfzV1kZk2s9Kzvvhu36Wzn4UY0bkNqMR13xaBWsV+TtigHcUomI034w4
 o8aCL8dyx2uHKTO5n+a2obZxowttqNDbMQJjQGMEPpsNc5nCEGuLr4ryqxOCGR1zrVjl
 8RYvIZhogVObQYP+yoqHGBrH7sGGqAbOkB/U5VKXWBMfd8a42hYtdvac5odWg4G4kK2g
 OaerXOj0RjqdmWGPXZKC4UtbH/B+LMd9k1LFaEP+1wdMd6NBXdmWk8kMOf6jBsWGZM+v
 lbUxvmPNP9qUUAZX0LRklK44B9PgsCctsat8WNlAp9XUEx0DwJrPqovMdyLdc2dqtQDs
 XIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HH5OnxezYB8m50PJhDtkb04VNz53jv88eIvTAxwovtw=;
 b=Dd5mL74Q7YuoYzm9SziJJE1q1O1gGHITVrm2V1VE9zfaUIL6v9N40lPT+/Y2gkJ66A
 gsvwuJPBWAkfaebtFkB6HuFNRGw0L4aK0Jh1YeN6jSxSKMQfHh9hiHucOMjmBS0GvbS1
 0pg+Y3waNoxlu3nKXn1powMTM1kmR1RkujQnokOV5ghJ1fZMApBc/w8MfjqVhFJJXB8s
 JZzXF3FzXbGFl8rRqxbqTu2pCszdn/7I7Ebf/DMPvWr7WFlbXX7eabxJMqHUc4gvv8cX
 +1g2DUQ5Prwo9/pV1C/pf59GJePoPI7eAbs8iI2DOJ+tHq78fO3+L0+iYadfKqFDzwce
 cIJg==
X-Gm-Message-State: AOAM530lntJJy2dKFhqUjNuWdX1Gx2cnv8TAoXptCFfnIT82dFG7MzXT
 Tjxsf86YZMeeuEiEHeORD+riQ9nlCdw=
X-Google-Smtp-Source: ABdhPJzVmePgMtaULIZWA+nNDv8Xcxocfp3weQCMdoAKYA8d+BbbPJdNS6KIoyNfPebqHcNr6nOdrQ==
X-Received: by 2002:a63:77ca:: with SMTP id s193mr220111pgc.376.1589388643298; 
 Wed, 13 May 2020 09:50:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s44sm16500408pjc.28.2020.05.13.09.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 09:50:42 -0700 (PDT)
Subject: Re: [PATCH v2 06/17] target/arm: Convert Neon VRHADD, VHSUB
 3-reg-same insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200512163904.10918-1-peter.maydell@linaro.org>
 <20200512163904.10918-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <afdf6600-9dba-1fd7-2d4d-f393b051de0a@linaro.org>
Date: Wed, 13 May 2020 09:50:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512163904.10918-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On 5/12/20 9:38 AM, Peter Maydell wrote:
> Convert the Neon VRHADD and VHSUB 3-reg-same insns to decodetree.
> (These are all the other insns in 3-reg-same which were using
> GEN_NEON_INTEGER_OP() and which are not pairwise or
> reversed-operands.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       | 6 ++++++
>  target/arm/translate-neon.inc.c | 4 ++++
>  target/arm/translate.c          | 8 ++------
>  3 files changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

