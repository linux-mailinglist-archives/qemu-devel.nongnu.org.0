Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C57F6FDD56
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:00:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwiT9-0000Je-IP; Wed, 10 May 2023 07:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwiT7-0000IU-GA
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:58:53 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwiT5-0002Px-Nm
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:58:53 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30771c68a9eso6393920f8f.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 04:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683719930; x=1686311930;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ls0r9PZNY9DzEnxAxJEO6iWuNs7Kt5IdOduV4eSDs9k=;
 b=ZdM59DhfjloC+cKdgyfiWTIzHQV33G1DDMkDXJSK8UHgnSNRsGDfeqoFlCsHqqfJLb
 8DmzaRR1bVLP/gDh3FtSlbvgn27G4VpEZXHtb8IGYVFDZZS5S14rEzmF/ZRQ/Lw1XvQH
 iyTtEOJLaRuLKXM/5JpvPf3rR0gN/IWnTss8U7Qgm+SbIsFVArZxBne7s4QBkaIQP/6/
 JZppU/waTC6vzhQfVdLEMGhBlJtJgC5Il4Ht3nyNcaSeZh8s28W6ifcaHPYHBz59ILhw
 rkSm0C+AAuZKIyGIeLRsjpxOIPyu0YtRiysVu/mJNQagEx6szG1HLrphAidskju+SJam
 CyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683719930; x=1686311930;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ls0r9PZNY9DzEnxAxJEO6iWuNs7Kt5IdOduV4eSDs9k=;
 b=VwlzZkD4jstk5NaP2VBAHXBOrymANlVlr5ySdFVG2t2bfwacu8bvPapYKlXgZnIygC
 0nnBRblU/liw/liuXNwm2YVK4Paz5AFN3Fyqo5pzKNBvZVFa8i+nf71naT/ICap2Hwdy
 RnqNAVJLDWx8LXLIBLtP9dSCyiRvskIMsiagiVTDeSwgQHB0RhhNfAbk9QN5vcrryrjS
 h7ysavPt0T25Cu58wRTq9+Yn3/rB4u5NOUyi2g6MfH6QL8xgq9K1Ey7FuDBXHNRGzOjU
 CrPtx+opvvACTogUjvCDVhIloWDteSp8T9rZgQnaYHzn8+gFzAxYfL0Bv02BFXO2xmvT
 rdWw==
X-Gm-Message-State: AC+VfDwCj1w6IAlWFEjx5MWlufOAEyQy/gjwd6L2+s/PmAkGvfMGgakf
 +dukWCmI/6H+Mx3lBF1mzEWIvA==
X-Google-Smtp-Source: ACHHUZ6lSsPNpx3DRYyxEOABB4Oki/CP8f/pTsQvqI4mq9BcxIEYjS4y4DF+6J1lO645CDUKJYGghg==
X-Received: by 2002:a5d:6401:0:b0:304:7237:729a with SMTP id
 z1-20020a5d6401000000b003047237729amr10044377wru.67.1683719929962; 
 Wed, 10 May 2023 04:58:49 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d6212000000b0030796e103a1sm8966804wru.5.2023.05.10.04.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 04:58:49 -0700 (PDT)
Message-ID: <c05a89ac-0bbd-2edc-5883-d3bfa58b7ea8@linaro.org>
Date: Wed, 10 May 2023 12:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] target/ppc: Fix fallback to MFSS for MFFS*
 instructions on pre 3.0 ISAs
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230510111913.1718734-1-richard.purdie@linuxfoundation.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230510111913.1718734-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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

On 5/10/23 12:19, Richard Purdie wrote:
> The following commits changed the code such that the fallback to MFSS for MFFSCRN,
> MFFSCRNI, MFFSCE and MFFSL on pre 3.0 ISAs was removed and became an illegal instruction:
> 
>    bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree
>    394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce to decodetree
>    3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree
> 
> The hardware will handle them as a MFFS instruction as the code did previously.
> This means applications that were segfaulting under qemu when encountering these
> instructions which is used in glibc libm functions for example.
> 
> The fallback for MFFSCDRN and MFFSCDRNI added in a later patch was also missing.
> 
> This patch restores the fallback to MFSS for these instructions on pre 3.0s ISAs
> as the hardware decoder would, fixing the segfaulting libm code. It doesn't have
> the fallback for 3.0 onwards to match hardware behaviour.
> 
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
>   target/ppc/insn32.decode           | 20 +++++++++++++-------
>   target/ppc/translate/fp-impl.c.inc | 22 ++++++++++++++++------
>   2 files changed, 29 insertions(+), 13 deletions(-)
> 
> v3 - drop fallback to MFFS for 3.0 ISA to match hardware
> v2 - switch to use decodetree pattern groups per feedback

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

