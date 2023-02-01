Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556BA686921
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:56:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEWp-0004gV-Eb; Wed, 01 Feb 2023 09:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNEWm-0004Oh-5T
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:56:00 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNEWk-0008Ix-83
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:55:59 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso1662152wms.3
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 06:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rdLFpw4/QIYmDqCqtAn5l6il3o3W58c4HfPZfb++GtM=;
 b=o8+ciJMba6/Q5INGnFCaUsv0LaOBnqQCS/1TkHEgyaGHTzMu3vQFxmZheFdaHT5Lww
 7QgHTGjWx/gxUrM1/y6pzj7HZZHmLS07id6gJh3WIMGGqwaCeM/vmhj2DlDGVW9+oT0l
 ZWSEd0Nb9eeIw4f7m8HT4nI6JWzxIMiEvlrhFO6xJA7n6PMHo0vkz43qXNZa2MNqMMfU
 yzFAqa9mPjy0eAmfJ0n4KWYUB+xDLbFf42BdmHEzB7GKwdI72jYdFTuFdLXbFgdfTMpq
 PrXAHse0uSgRgWj24f8yagdXWKuC3XJ5LJUdEUnkKNWt5mT21mkT/xzwqE5efTAeg85O
 MW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rdLFpw4/QIYmDqCqtAn5l6il3o3W58c4HfPZfb++GtM=;
 b=nZHTDiVmhwPO62u+bOIs4E0ei65PVJhjl+sXc80XtCT0I5/HgIyq+vV4Nh/tjoTTiZ
 77Gb6FHJRxOzf5YeSJd2Mz7eK5Ff2yxOiG3YUsOqTc/ufReBzLCfSZxxdL4kT9ET/pBt
 vCIIeOljyUeCCsozNrNbfHviP1/GXKTEc/xtlC3Acmx8FSypLi/BKc8EbNNZu7fX69Xf
 EwVJyMKm7KH3JvIAoyMn4Q+cJb2478JjZ76BoaxzICCjSAH4w+ZtTekihhDPylDRaq0A
 Wm2oBhC+Vs4CV7pU0LwmwSP9ADKhVlMIQudSYG+KvTkH3kH6uTINx0VoM/W+dXSBvxiR
 aMVQ==
X-Gm-Message-State: AO0yUKWePrHS4Pf8eSvFicuYdOyCcISsmbF/+vrXrsucoiKzrY8ntVL9
 8abm791kc69LA5k8o9uPPikMMQ==
X-Google-Smtp-Source: AK7set+OS5OdCL6GqmGfGIUWE8L9UEe/Xm4d796MZkuFL9uDQzFRbK/zNStcTrgk+q035I7X3zWwfQ==
X-Received: by 2002:a05:600c:4f4e:b0:3dc:5baf:df01 with SMTP id
 m14-20020a05600c4f4e00b003dc5bafdf01mr2391909wmq.5.1675263355968; 
 Wed, 01 Feb 2023 06:55:55 -0800 (PST)
Received: from [192.168.43.175] (107.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.107]) by smtp.gmail.com with ESMTPSA id
 r28-20020adfa15c000000b002bfd137ecddsm15676168wrr.11.2023.02.01.06.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 06:55:55 -0800 (PST)
Message-ID: <e0808953-f328-9fa8-fad1-39a98a80fe32@linaro.org>
Date: Wed, 1 Feb 2023 15:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 29/36] target/s390x: Copy wout_x1 to wout_x1_P
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130214844.1158612-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 30/1/23 22:48, Richard Henderson wrote:
> Make a copy of wout_x1 before modifying it, as wout_x1_P
> emphasizing that it operates on the out/out2 pair.  The insns
> that use x1_P are data movement that will not change to Int128.
> 
> Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/insn-data.h.inc | 12 ++++++------
>   target/s390x/tcg/translate.c     |  8 ++++++++
>   2 files changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


