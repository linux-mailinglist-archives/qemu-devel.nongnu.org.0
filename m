Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4436F5620
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:27:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9hP-00070T-OC; Wed, 03 May 2023 06:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9hL-00070H-KY
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:26:59 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9hK-0002Nh-4z
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:26:59 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so3102313f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109616; x=1685701616;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g21LddQS9E4WIbQL77+rkGZ6QuHgIxpb8xNag9PmXTQ=;
 b=FfKeuUalfNw41c8Yj1jPj+IhwfvAiB3AfuweDPqe8qd9bKpoabrvkRMxU7NSlApAyG
 KH3SmaRnzAFf4rx+O0NAauTK2iUs8x/of7Af+w/otHrEzitAc3+PvLGKJ2JsN/8/spva
 07upz552aXXevXYwg0oRm44A2+JxO0vfaqKi7oUcqpEWUwS90c5ffDHqOBdQCVpCFgNB
 PhgJtPE3eST6PN1wVQcYDk6T6Lyexwu6Ltu7JYb9jfIE/nIuP3x3OBZ4mw6JHZDwaGw7
 +YB4rWAcGHfZTkQie2BgyhXTja3aqZKi3uyEIQmE8klWcwEstJsozpr6RS6PuMuEmcG3
 SEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109616; x=1685701616;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g21LddQS9E4WIbQL77+rkGZ6QuHgIxpb8xNag9PmXTQ=;
 b=d8cZdZPtj1C/Jr06Ccxf77d/GskbpFRHAtaFrlfowpzE5gdAhggwE2Os4q8MxNb3HI
 kjVgoox4cy0SJO1+Uxc59qniWfv0ut+9TLq4D5oDZbDFkAEy1Aix4qog1r/W5/5i569r
 acfZJUvDawXNA2pHt+oD99GQFXWJHxfhoQDGpwilGAEHKoZ+N78dzfA2nY4iTAkGE61U
 xO/m/qBSkKLrCKx5q1+QcCp2chGNrp/5Ku4jTK00fgs8+A7RbL0GarKVLt/dsMX+4lEr
 yLfssImylwk5c17zwHuIx4yh/fGazhREp/py96p31MlpLKHfT7ovj/4bgrNUigYLgw6g
 6xDA==
X-Gm-Message-State: AC+VfDziXCal3Cd5FoqVaPiH+GcNyZ/EOekAm9pLRmJIzJFje9UzoMPi
 dNtihTi2heIyyCtwWDV4i0DQobJ1u7A3j4snMPJafQ==
X-Google-Smtp-Source: ACHHUZ5IsVxE27SHL6grStm/hl1Nz9bGJxyw0mtH6f6RI/sMagfzKwFSt0uuUCASlUjQwQRV+To1qQ==
X-Received: by 2002:a5d:4c48:0:b0:306:37ec:656c with SMTP id
 n8-20020a5d4c48000000b0030637ec656cmr3855968wrt.66.1683109616674; 
 Wed, 03 May 2023 03:26:56 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a056000101200b002e61e002943sm33412526wrx.116.2023.05.03.03.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:26:56 -0700 (PDT)
Message-ID: <216d7d1d-f577-43a9-5209-bc84feee4da6@linaro.org>
Date: Wed, 3 May 2023 11:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 12/22] hw/hppa: add TULIP as a dependency for HPPA_B160L
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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
> These are needed for board creation so fail under "make check" with a
> --without-default-devices build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/hppa/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
> index 5dd8b5b21e..f405663839 100644
> --- a/hw/hppa/Kconfig
> +++ b/hw/hppa/Kconfig
> @@ -15,3 +15,4 @@ config HPPA_B160L
>       select LASIPS2
>       select PARALLEL
>       select ARTIST
> +    select TULIP

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

