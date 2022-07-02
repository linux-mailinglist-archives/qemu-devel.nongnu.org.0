Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014FE56406F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 15:49:14 +0200 (CEST)
Received: from localhost ([::1]:49722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dUn-000477-4A
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 09:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dTk-0003M7-PZ
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:48:08 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7dTi-0007N4-Dw
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:48:07 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 c6-20020a17090abf0600b001eee794a478so9132851pjs.1
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=CgtQxaAtmlz0QkUhDyN89ZKUe1cS4IJlhrnD7X28Q/E=;
 b=MjlIxvWRjZQjXqQJrHBGzAgLJ/IGHcwbaR7RkT4eSHEEcqXrReV2Kp/Ioix1Otm+xL
 B0Z/a3c3cHBAANGq2/dZMjNflVBNA2lIxESuMjs3K0ciS21vg/2rzn2iV1GKieug7AVS
 X/cPE/sAVC/1f0xZp46DOPflOqJ3fjd7qZicZyuRKqE/fxpffrYPNL5Ceu8krxo7sIkC
 jKWT0PcrQulr8BlQBzakMMS27I2o+DPUg2tKhSSdO9cWDT2wCbHZJN38jyW5+t+2EfIC
 D3N4upJUIX5F27u04J9vLqf1KEtR8wtqELd52iCwpMMdJo83T5Cxo5btI1OBBG8imoUz
 mWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CgtQxaAtmlz0QkUhDyN89ZKUe1cS4IJlhrnD7X28Q/E=;
 b=PHX+L5GbBIiVPKYANBKyCmTKNAKH/sgY/csm2BiU60zVsZn6JarcKM+yCd0JofIbyY
 Ruz7eUYx2o57+qLyasJWogk6bhmBmqFIHefqFg/8WhK1fbPiGJMkyXWacP/OTUOD1g4o
 Ivmd7WgRGgyRWB1Hi767V1CpefEYQMiXJqdrszFeVV/rFwiNtEX9JmrvQW9OG+KQzUbf
 gc3HXWVb5n2H9m7KMtkijwcO1pKrrSYujA3Ugppkq1vT08na+z3xTgAd1pn8ZA/pMYAu
 R1bP7cCvHGMerjudbfNdbw2fK5rKmS3KKux6rlyL+9ZKvzdGx/mgreVOoNAeXZMNZjTc
 ogrw==
X-Gm-Message-State: AJIora+RPDqg10AZDpyFO89mIWDGfVwOGN8E1ZD14iq/QAKhpWX/3iM6
 vNDkWO0glDBUJiY35fXL3VF8NQ==
X-Google-Smtp-Source: AGRyM1vZdkGp9EHAWx+8BwYr0Qskh1gT5GlHZdlZpiLrtfpFxau/hgchlW6Nkd7v2TZ8wpLzq/L7Zw==
X-Received: by 2002:a17:90b:1b41:b0:1ec:747c:5d1 with SMTP id
 nv1-20020a17090b1b4100b001ec747c05d1mr25011857pjb.213.1656769684739; 
 Sat, 02 Jul 2022 06:48:04 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 y67-20020a626446000000b0051bd9981cacsm17724284pfb.123.2022.07.02.06.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 06:48:03 -0700 (PDT)
Message-ID: <6af2c2e1-904d-5379-e051-e9a5f8fd1350@linaro.org>
Date: Sat, 2 Jul 2022 19:17:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/5] target/arm: Fix code style issues in debug helper
 functions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220630194116.3438513-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 7/1/22 01:11, Peter Maydell wrote:
> Before moving debug system register helper functions to a
> different file, fix the code style issues (mostly block
> comment syntax) so checkpatch doesn't complain about the
> code-motion patch.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 58 +++++++++++++++++++++++++++++----------------
>   1 file changed, 38 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

