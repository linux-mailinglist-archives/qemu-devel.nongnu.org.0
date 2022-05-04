Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B7E51A6CB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:57:04 +0200 (CEST)
Received: from localhost ([::1]:36136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIJD-0007ti-Hu
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmII0-0006MI-OE
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:55:48 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:36968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIHz-00034e-B2
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:55:48 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-ed8a3962f8so1770800fac.4
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=LMgN5+RazvRKCfKXsESz0V18VBj7zUyhD2y/qCkOPzw=;
 b=cPuRu6PIGm+s6T0FdayO+1itaObdI1hF6BWAmU7U2IVpEUIBPL9G0jzLxvIUjR9DJa
 8Ul3OE0YNNI+PUPZlupY6tj/Ru+kzeqtZurwUBd654XHFmCHgKUiM+HxlYAFMHGK0Kyh
 lv+V+YM/hxNLFPgJNMaWBZzrj9xF0ktZcLxherEGpA2LZ5g3ls5leL4Yp1a94r/Odsm4
 H4si+85qvV+mQUmlTN/fOJGp3WpsiL/TRHZ+i/vsY3RNy14K14DZwZVbpauoRMZUhpri
 Ec3cNTyiKd+s/vRjUp0BOxGXZ3c94kQMygCahVOW2cLj4gCir9DNftgqFLVjuBLhxrk5
 eV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LMgN5+RazvRKCfKXsESz0V18VBj7zUyhD2y/qCkOPzw=;
 b=XX/i2IT6MbImKBMFTUk982eHDaaatb4wF+qAgSCIpm8ipxFDC9tNQMTZdLovs1YhEI
 5LaeGdQsjQC6/31jjcTyrfHenyQotfhxDLUIT0b1VxI8Biv3MikU4GZFfCC/ciTT1NYQ
 +5BCHbb4nsPhRU08OUtqC96tf8ttp4BWq6pNGgnAXHJRQ91sygAaFzTDJGjg7ahxkYkb
 VwjX42omGCqevwqAFBSo5pcuxZTu6JmV7kIsD6KEoIPldbOI5RHOkR/1sc1YB9gnYabm
 fbBmuJlqcK7G4LBVFBivh+POtEhstnRcxzVWEWMCpifWc2B0BkpmAJz1aCIvYWD4qLrm
 JotQ==
X-Gm-Message-State: AOAM532mgdzcoUHxvCjPPYOcMkPCoMccL4GKDcRXOnazMnld6LWFtuYh
 wFGYWAjhWprpngFZkj3wFrq2TBghMmSYpg==
X-Google-Smtp-Source: ABdhPJyiCNPbsiyBVE2vtUjcrurLdiqCWf6VinQql5aUxp21Fg+ypGNEaWfbd5WTgVzdsXu7AINw+g==
X-Received: by 2002:a05:6870:51cc:b0:e1:e6ee:448f with SMTP id
 b12-20020a05687051cc00b000e1e6ee448fmr195776oaj.136.1651683346194; 
 Wed, 04 May 2022 09:55:46 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 r188-20020acaa8c5000000b00325cda1ff9asm4520751oie.25.2022.05.04.09.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:55:45 -0700 (PDT)
Message-ID: <9fe00e65-0616-b000-7321-76395f996f23@linaro.org>
Date: Wed, 4 May 2022 11:55:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 08/50] dino: move initial register configuration to new
 dino_pcihost_reset() function
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-9-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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
>   hw/hppa/dino.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

