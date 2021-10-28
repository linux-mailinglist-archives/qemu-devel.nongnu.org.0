Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AF243D84A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 02:58:53 +0200 (CEST)
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftkq-0002gH-9z
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 20:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfthX-0000aa-Qm
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:55:33 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfthV-0000ql-P7
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:55:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id n18so3251943plc.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 17:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oq61yYoAsHqRv4kMCqCBMgtDmQe11dP6AbN3IELbFIo=;
 b=jDghlyTJVB/cZWldllH/sm0+FtXEtpIZn85FX69xrieybo1eDhBGdC70SJrUQXeN8z
 dv1d6bKkw8L0/gEbLbjoiBK70Z70s4We22H3a2T5l/sXZLbD5dGRSDsklXutCQx1/b/t
 FW//ZR5pM+4VFTJdJxpmxUtuUUnCeyfgk4EkDqhw3jAqfu7owoEzaqFpm2c5jMaS0P/O
 1qQUOo+hGzXclAUrm+hhjmcAAJyaNrnN5OjNWUnH4cHErPwhrQaQySLA6XnlMT+isCpR
 wyAacIYzGhfEp4uGMViTWATJ0V+k8QYMNz0iu+oj7YHR1uyXfTAVcnFuuzAL08ZS7taU
 tZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oq61yYoAsHqRv4kMCqCBMgtDmQe11dP6AbN3IELbFIo=;
 b=VMu9lGTPJuPfmzZ8LUXfHmep5W+ReW6vUHACejPD2XBTtzgEjPuUbA9vsoupA6e61n
 ghZtiFFn7JrO3JF4zAGYVXDxnGOFEKw6rukSEdEVBcRGYmwY5cPWDk5sH2pKssUADjZU
 7lb7o+3SquiYmMDdPLnB6qF+e+waeD8t2Sk6ooAqPYJtD6YS4vHkE+92zpuo/h1X/you
 WMWmLgg1oD6AgeOmYyqOK1jtXfzXsoek1qsXZpgZ2+A/KZ2jn/xTp5rBkr2pNSeAg/rG
 lextshouKinVakzEOT2EdYayFrfpBzSrYMP1eDBARpY+1ZUtujYWvCksm1t1Wjs4CDor
 hJYw==
X-Gm-Message-State: AOAM533ExCM0suWFCWl8LTV1vpOgPVEUs5ag7+w2stYAmf9ManDwSwbp
 7j5NVqL2du9hhrMfi0v3gU0D/Q==
X-Google-Smtp-Source: ABdhPJytIPMjqkDJNvEhlMCHXC4DjPaCd8k78rDLG+ffiWEPearimt2LbRmiy3DaAHdIzgLChdYWow==
X-Received: by 2002:a17:902:ecca:b0:141:569b:6fda with SMTP id
 a10-20020a170902ecca00b00141569b6fdamr870333plh.48.1635382520958; 
 Wed, 27 Oct 2021 17:55:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id mi3sm839277pjb.41.2021.10.27.17.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 17:55:20 -0700 (PDT)
Subject: Re: [PATCH v3 14/18] hw/intc/sh_intc: Use array index instead of
 pointer arithmetics
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635371671.git.balaton@eik.bme.hu>
 <fde64967d4cdb4a3ff28a77ad2ea0554366376f8.1635371671.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6b60624-9e22-30db-a3e8-aab9f9375a63@linaro.org>
Date: Wed, 27 Oct 2021 17:55:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fde64967d4cdb4a3ff28a77ad2ea0554366376f8.1635371671.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 2:54 PM, BALATON Zoltan wrote:
> Address of element i is one word thus clearer than array + i.
> 
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/intc/sh_intc.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

