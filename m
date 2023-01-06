Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10035660A47
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:29:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDw91-0006GR-QL; Fri, 06 Jan 2023 18:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDw8z-0006G3-Rx
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:29:01 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDw8y-0005vS-2q
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:29:01 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso3420992pjf.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 15:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pnQiTXPykjNeZ9cOM+9jdbOc71KgJQcFk2pu9l5EfBU=;
 b=wPchZaUHXH3MC7l6aQf5D4Wcor4+zooctgX12xwzavQ7uOYnfo40HAASIRqZBUHCcv
 ooa7JMdU/92wkZJTR2Wur7qbPWCIUvR1wi3yAno1E+PYK7mDi9q/xHCmzoc6x+Bz4h7y
 lxz/mQFXJjWAbEmvCb4YH2Ty52oHd30U1WeQ6WT6fb8bLzKAeKmx9JProEoMSs9sQG8p
 hmW0dziSWHWnv9v8StQXAq/e1k1StRnQBvnz+IaJLmN4SCIDlh1bHSpRW7Y/tC7EeHkw
 28oBmLzJez7icc+1RqcWYyi6n+vK4E1nPZSUqZghl7JGBAxQSQsZ9AWcgm2X/2nixl0i
 58KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pnQiTXPykjNeZ9cOM+9jdbOc71KgJQcFk2pu9l5EfBU=;
 b=ViV8HP+i1UXn2Fdhnj9as1o6QSzQXUVfUvSF48mT3s0UMKYeyAvniFCQGFog2xY7qW
 nCO94OHPNHYnT9DAGq7l9HpJ40FgG+WpA7l6qP8xdsbwkc3s9bBeQrIPH4zQdpyMDWuv
 cEpqbyL7WyczSjA+CksARju37cuVeE3fXE8GwX6xXGnv+RzLX3rULPo38rJTsKzpsZxj
 WIJ0K+VugCnox7qIhfz5f6iqLo0aCI3Xk7xCQnHXgUwKctgj1dlJ0WhTtCDqJ7/WYeJq
 7+0pr6poR3msipst6eOFhaPnWZ8hdRxb8WyVS36XfFlOoCgZfQPinY9yt2vG1lCx2o9X
 VEnw==
X-Gm-Message-State: AFqh2kpfB5xIIfQZGo9Mtjj204QI3HjmH1mjZOIzxHs8a+5vbRBpPxXB
 R2bJE/H+obSfyt5w7mI4jFD5ng==
X-Google-Smtp-Source: AMrXdXuEkQFEdziyfMeziMSTVwRbfvpEyvnkTLNwT7fv20rDyA/atHYg/r9lQhDV8OTE/YJOrPlmmA==
X-Received: by 2002:a17:902:ab8f:b0:192:ce7c:dc43 with SMTP id
 f15-20020a170902ab8f00b00192ce7cdc43mr17293623plr.40.1673047738565; 
 Fri, 06 Jan 2023 15:28:58 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a170903120900b00189618fc2d8sm1393851plh.242.2023.01.06.15.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 15:28:58 -0800 (PST)
Message-ID: <9c048e79-8612-d081-4f6d-a3d9d139a76b@linaro.org>
Date: Fri, 6 Jan 2023 15:28:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 19/21] gdbstub: move register helpers into standalone
 include
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-20-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/5/23 08:43, Alex Bennée wrote:
> These inline helpers are all used by target specific code so move them
> out of the general header so we don't needlessly pollute the rest of
> the API with target specific stuff.
> 
> Note we have to include cpu.h in semihosting as it was relying on a
> side effect before.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---

With Max's xtensa note fixed,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

