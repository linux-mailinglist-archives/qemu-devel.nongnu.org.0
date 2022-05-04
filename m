Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D6751A6E9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:58:08 +0200 (CEST)
Received: from localhost ([::1]:39048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIKF-0001ZP-9B
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIGQ-0004Gb-Km
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:54:10 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:37979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIGO-0002ar-08
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:54:09 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e5e433d66dso1762338fac.5
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Nh1of1LIAPqMxHqe2UlOAuCnVN4wtr6SdV+7tc7og7M=;
 b=bckVmPVbmSH8lsXJ/JPy3EoQWKwQpDVl3fogzM/Fqbu53Giy6W9nscr58Ny/OpS9wO
 c4kRR3fRYNyhLPOEbTemsRpnViI3ggxGRcdyYAndn8xkuaS+dJ0lI2uX6dmwjlv/7K+4
 sjA7Xfvv+DvDsWgi9cAeOgCNkSfvBSi3luIRIc7tabYaYUI57UtXNfZ/mtqywpf0nYWU
 RGIA3GqDnYWwuJ2Dj/XjDWdhZUMl0VgvqwKHZH8gHYgUsPJOZOSj1WOwioTJWWzUOc9i
 m/wPZO8B7XZik4vutgTk4Nq3lKsj1LeVrYolbFy//GQTd8O8YHHnad8XD6fnmNPrxleE
 jjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nh1of1LIAPqMxHqe2UlOAuCnVN4wtr6SdV+7tc7og7M=;
 b=gtKyi6SWLnpC4zev2CC8hGXLAi0KKdSkaW3F3/fNZ9WLZlJ67Vtvh7EKbvWoW2iaPB
 gZjpaNyeJiY8TVej7kUmgJNJcgz4KVyuUptOoVTHZx0+hMCAYPUZiLGiMh9wMjqaI/uy
 x23e4gN7MlY2iaddOdUXddmczPEue3K99G56nRWmtBYBjX5mp9t6ZApTQcXSjRTrM6Az
 fghksUOvpX/s3mvGQHupc9EobqcrjUh5czVKDlDeJ6hZROfYf9OWKGXKsTHpm9S069Yc
 uCktR2l/pCkBLx7SbpJbaATtQrnGmik809X1FLSMHFMRQIp33zcBDJlIO3/VlVg/kFZn
 FdPw==
X-Gm-Message-State: AOAM532uUNKqR2hPYgGGPlng4TgZM5r2q1w/WIYI7GACQjBxv58Q8h6E
 bJVILaihdPQtHpmsLz7ZKjCaqQ==
X-Google-Smtp-Source: ABdhPJz3LN1imZuAybx6CTSwWUu47jqlqRwp5TwRfjrN9ezVwiMiJ/p6mdHQ1cOxsw9ek9GbmOsqYg==
X-Received: by 2002:a05:6870:c105:b0:e9:2cec:ae79 with SMTP id
 f5-20020a056870c10500b000e92cecae79mr186670oad.35.1651683246876; 
 Wed, 04 May 2022 09:54:06 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a9d5387000000b005b22a0d826csm5175317otg.1.2022.05.04.09.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:54:06 -0700 (PDT)
Message-ID: <01dfc5bf-b096-3b39-d50b-78787e8d3663@linaro.org>
Date: Wed, 4 May 2022 11:54:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 06/50] dino: move pci_setup_iommu() to
 dino_pcihost_init()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-7-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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

On 5/4/22 02:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

