Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8966F5630
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:30:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9k4-0008RG-9D; Wed, 03 May 2023 06:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9k2-0008Nu-AF
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:29:46 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9jz-0004O8-VM
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:29:46 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f182d745deso48412065e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109781; x=1685701781;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VlFwTOd5OI9+qcuyfNl5PEoO5MZU40m2kjf95ayW89I=;
 b=YD/A75mwXUrhUbdpfJFG9oSni6jF83ssEtj2N2rLA48AQfz9qO+sKDRMP2p5QswomP
 xRADWFNfX56p4ajJTKjYEPN5zP8SOkmtB4t+fSEcRK4hLZ0W6NZJzwf7kWDnP/v1KLVW
 u40CIXZhgDrJklnaO/jaKmRsbUualVWZEWlH0U4B4ztyVYBp7WegBDU/0A86KyZpALsM
 F5/mfwiA+uygXJ7V8WZ3H8satkGGAkb5cWddwTpkxgd57j8sT0wJIxQnAkUfPLmu9GjS
 VwW/cHMwZIfGNZYMEeXYaAVaeumlEsQmUyKcKDLkfdoi3UsUMQwcnivdidcSi2ySqhBH
 yZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109781; x=1685701781;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VlFwTOd5OI9+qcuyfNl5PEoO5MZU40m2kjf95ayW89I=;
 b=dXyL8ZSgfdwQdPDuS3abpEGQ006I+A9yMDJZpjNdEm4n7tgWRW3kYtvS0C+W0hS/pR
 DWaRT6eBckjvcs4tT/7WvmuTOwhM+5ZubGKHp0cNSS8SOvf1KA+Nm2hhi/30LL26msfJ
 1map9b2ATlaAT7tyTqyuw6Q2CFyxcbTVX15PXyUvQC4FcaG23fMytqe6GguRfWOAS5vN
 cx7BVhkrSipqTWRcfk0CZUw+Wg/qG3UsQhKFvXx/xh/CLBbrcn4dlbklpyesESPO0w5K
 y/pYE4Nnpi9qbMBzvsMg4TXYLIlckcR1ErUmOBungyDWfLruXkhUUte8UteAHUUXy34l
 9M8A==
X-Gm-Message-State: AC+VfDyXO8T2c5/AFRaYB+KexWXWruSXX+d4Tdzi+mEvijJnNoUUY69q
 000h138vbG2+6STQgNBXUTSKVw==
X-Google-Smtp-Source: ACHHUZ4SduyPdsuq4KrOt0pfo7uYiVMXjxoip261kQ1Bei5qdPr6xYaNK7vscQkYPvDdFoBCLy+XRQ==
X-Received: by 2002:a7b:c8c4:0:b0:3f1:78d0:fc4e with SMTP id
 f4-20020a7bc8c4000000b003f178d0fc4emr14965804wml.32.1683109781584; 
 Wed, 03 May 2023 03:29:41 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d4d8c000000b003063408dd62sm5376276wru.65.2023.05.03.03.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:29:41 -0700 (PDT)
Message-ID: <9b1629e3-07ac-8b1e-2b44-9fc18d27a895@linaro.org>
Date: Wed, 3 May 2023 11:29:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 19/22] gitlab: add ubuntu-22.04-aarch64-without-defaults
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-20-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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

On 5/3/23 10:12, Alex Bennée wrote:
> This does a very minimal build without default devices or features. I
> chose the aarch64 runner as it doesn't count towards CI minutes and is
> a fairly under-utilised builder.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   .../custom-runners/ubuntu-22.04-aarch64.yml   | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

