Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FBD51C6DB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:15:01 +0200 (CEST)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmg0C-0002u3-AM
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfe7-0000pQ-7F
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:52:11 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:33355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfe5-00016W-Oa
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:52:10 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 c5-20020a9d75c5000000b00605ff3b9997so3431504otl.0
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=g2TN3hNGOT0dQBlsX+idDu1a42zonkg+tMp+khi6qTc=;
 b=ybxsNEaw9AtdgKiNRMqcbdS9qopXLnpTZxLhuGyPhC6c/so7n8RAKnMfAcUyy9gCwY
 aitrY6Nyx55A1Z41SFbA/RpxeqS85fTU1YXvd9psf/CDYrnn9O6sR2bI7Xm2daiwHPOS
 rhXthZGJVTJMz2rrIRb0VZe/dZgAbqBmptggtTDRKTY47Ug5p2aw48Owct1BALkVXwbt
 Vgehikv4ZUgAhibvOF6L7MfSmRSok/bh6Nf6ZGLNO2zGFYH1Uyu0Qxl6rZgNVn1phzxB
 UI6rMDK0F1joPU8y7BJsatuOHOAwJqdbuuJ18IOaNufFKH/QfrDIjup4+rqyzao83t/J
 OgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g2TN3hNGOT0dQBlsX+idDu1a42zonkg+tMp+khi6qTc=;
 b=g8ry6IxULt5/uicofHvC9hb/j0Xn6g+NELQPSpQYN1dOY/k6rwv4b24WApm1XJ+blq
 dEof133uZb5fjeQDBHQlxxz+ugIhGMjb/82Z131fwdaCJkUMqqQEwAoCY1mCUJvghGwM
 RsZRPfkgw1kUS7CfKl/f0vB07zR44dCjQlthc/zGDuJIY7eLfzNLv7N8TmGhpcGA98Fc
 vEsEDJHQj+UdkxXIXH7fCwFxGm00VYuGPr0VqK1qO9WkPk/lgADPS8hu/8J2zYePLhU3
 ssSoF2bC0Tm8iw1/u89/Q9AbLSncXqA6+KKWQyasp+iwyjIlwP8xXKr6jcEcOce0Q8MY
 VPzQ==
X-Gm-Message-State: AOAM531Z2Wl5I9F0BaAhhuGFvFapWcg1KniMtz/5djsP3uayAsGPfIbt
 aYgIKNn5G9VJZSFGHTKF4Os+fA==
X-Google-Smtp-Source: ABdhPJx44XUSreJ7jDN+WOJAKkXeLly31/JhIT0BEJS+zmph6DVnx5voALJzdnt+PSdmGOA3dHGDiA==
X-Received: by 2002:a05:6830:b85:b0:605:4e76:f077 with SMTP id
 a5-20020a0568300b8500b006054e76f077mr9749020otv.211.1651773128548; 
 Thu, 05 May 2022 10:52:08 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a4aae05000000b0035eb4e5a6d8sm980486oom.46.2022.05.05.10.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:52:08 -0700 (PDT)
Message-ID: <f1e48fb1-7eb9-4cfd-ec68-5e5e2382f4d8@linaro.org>
Date: Thu, 5 May 2022 12:52:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 20/50] dino: use numerical constant for iar0 and iar1
 reset values
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-21-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-21-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> This is to allow us to decouple the DINO device from the board logic. The choice
> of using a hard-coded constant (along with a comment) is to match how this is
> already done for toc_addr. If it is decided later that these values need to be
> configurable then they can easily be converted to qdev properties.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

