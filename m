Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DB06EE88D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:49:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOd9-00036v-Vr; Tue, 25 Apr 2023 15:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOd4-00032a-9F
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:47:10 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOcz-0000Qj-MK
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:47:07 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso41873565e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682452017; x=1685044017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=atGh+rgwfi3iASVIBedqBgwyvqcP9fe7NaOf0ff5Psc=;
 b=voxfVpmcP9YwWoBqiBMDSvX3rWvsJ5z2YzVUGzrJRctihc1EEH/l+9eFzpi/P1pUt6
 WFqEXZ9JG65I7nDWFOeEQo2PQVyX36WaKg4UdGRZgSK9vGECAYS7ykpngqQNR8KPjnF7
 NOdjKZ92KrFUC60yjsv78w+CBTmSbdKnHTWr6Dje9OOoEr0/CCEKQGhDKCjRWDKWCBpy
 V4LSQaTEcc224g+iYqFZcE5/S0AfO+huNeZWksAgZ52VSYM/5EF5qgrxsOWbdYWbDI4k
 Huo2pJWENiRcRoQ1RrcTf74XTAs5FVKthsYW8j9FxxFm+a3zbrUhx90uYYobyNDG3avW
 Fx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682452017; x=1685044017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=atGh+rgwfi3iASVIBedqBgwyvqcP9fe7NaOf0ff5Psc=;
 b=YRvx6fjWAncgje3AUmDyoP292/ZA7kRz3mCQCFapy6i0NIioQ2DZpmmpA5rwuioSF0
 PynxAetDRyn5aa+eeXttvgMvfI5+w10AZ8qxfXo+UD9aiCKhnvJr1cPNVQYHz+fVNN4c
 cl8r7sIj7tS5u5rCe2pU8VfT3LzDb2lQaHIrYCmyNu/UzU3TtX81L7xvljX0GeQRW98D
 CI1DHBcyrnuqq5qv8KwRPTrIzEUBPOkCvIX9smmJx05AqnVwPrM0fUE3epX+klFnGBUH
 uo7i2r6z9SVc0SPxpI3Y/B9dHdVcEKqiVcLVwOlSvAppgWleb3eRgWXl5T+4TW4/ft8+
 6FOg==
X-Gm-Message-State: AAQBX9dVKU1cT4VONwqNNBB38ol7iET+Fj7vb93c6xamcH+GA+fb6SEQ
 lBHga8Aul8kofXkrB+J4EUlpKQ==
X-Google-Smtp-Source: AKy350bVhM1x/vyUZ0wRnA83BhcDce0Owioh5s6mU1e7sC2E7trO/APrWUVv7LQ3gNjcSnwN5DhBqA==
X-Received: by 2002:a7b:ce92:0:b0:3f1:bb10:c865 with SMTP id
 q18-20020a7bce92000000b003f1bb10c865mr6366301wmj.38.1682452017598; 
 Tue, 25 Apr 2023 12:46:57 -0700 (PDT)
Received: from [192.168.180.175] (153.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.153]) by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm15854425wml.11.2023.04.25.12.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 12:46:57 -0700 (PDT)
Message-ID: <7dfc54d8-ac8d-9041-b25d-6409b9d5c0d8@linaro.org>
Date: Tue, 25 Apr 2023 20:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 04/57] tcg: Introduce tcg_out_movext2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24/4/23 07:40, Richard Henderson wrote:
> This is common code in most qemu_{ld,st} slow paths, moving two
> registers when there may be overlap between sources and destinations.
> At present, this is only used by 32-bit hosts for 64-bit data,
> but will shortly be used for more than that.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                 | 69 ++++++++++++++++++++++++++++++++++++---
>   tcg/arm/tcg-target.c.inc  | 44 ++++++++++---------------
>   tcg/i386/tcg-target.c.inc | 19 +++++------
>   3 files changed, 90 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


