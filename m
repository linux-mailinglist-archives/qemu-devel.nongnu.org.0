Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2240061339E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:29:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opS2N-0003XQ-7C; Mon, 31 Oct 2022 06:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opS2C-0003Wb-BD
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:28:48 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opS23-0000js-IR
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:28:47 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so10488672wme.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 03:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+YPqsh7W+w3IWTbxpwUmcnS6nSp0pDVxKX5JLS1m1yk=;
 b=QtT/biMXHLIbA+6o+v49kjXqYJswvV8F/Kcodziu822VrWGRVnLO9fKTNe9UkrjgHd
 VUCUiL7uoSHUqbyIvmZ6/bYqo0CN8JMBVPo+B75Z3PywIjwIgn1alDKAC8OlWK7rRtaE
 Xw8EHhAK9L+SJ6NHYMAbVyPfR/GVtd4DzlqIObJL5K9oKqZ+nfFXrXvraA0A4ZYf30ku
 2kvYuomfb/kSqL4cWJpw9rWzhbgDO9kxxmzwQZgypbsagrqkHB5v++McWgsCOYvZtOFZ
 JY+1SsUhqpHECvV5KDKU2JwtxtVzjE4tB7aqxcbQLqBCiXwhXmEzzr7tBrEdnlDj/yQl
 zzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+YPqsh7W+w3IWTbxpwUmcnS6nSp0pDVxKX5JLS1m1yk=;
 b=1QUPpYnurNkRYRNvwG+Y7NBpQ20wm3lSxtmD0e4lorpeFoyYrYJwtUP4/H9NJAbfR4
 NqnRwit8wbHdPUJk+FA3zqZI0MJ5QxJjvQVuYbN7WVq3Og7lqj5SIM5Sn5WulCqBUabN
 iMzgVxpRRDS1amyaX8pabejWp3i3dgPWVGnSUZDEC4hPS0KP6nr7oUy+vPVt+4aNNDtw
 MtxLO8JiiDvb3os57YweMkLM35RRwCkeZSP2XImaJYz3jZNUMFyESvl3F/ixQztzrM9a
 Eo30e7sFXDMWIqopJTloYjUkRv4cvn+Or2YVgBMXWJTiaXooPUEEHYMdMDVS4OmXcsEZ
 Ra+Q==
X-Gm-Message-State: ACrzQf3heuBWR2/63F1agyyTXSOPcqzl+dsQxRCMXga1v6dG+/sgjWXm
 cyat8TQciyKJH0WmBUeCKiwBCg==
X-Google-Smtp-Source: AMsMyM7TW4U6rqHcu9endAlPp2SsPBKk/xmM5wKUgwSqal0v+G6f/rPinVrFJyNlS6SAuU8aylqsDA==
X-Received: by 2002:a05:600c:4486:b0:3cf:6e1d:f4a5 with SMTP id
 e6-20020a05600c448600b003cf6e1df4a5mr4084893wmo.85.1667212115806; 
 Mon, 31 Oct 2022 03:28:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a5d5274000000b0022cbf4cda62sm8364510wrc.27.2022.10.31.03.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 03:28:35 -0700 (PDT)
Message-ID: <f02209f3-4355-8bf1-e514-07da375837e1@linaro.org>
Date: Mon, 31 Oct 2022 11:28:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] Add nsis.py to W32/W64 section in MAINTAINERS
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Thomas Huth <thuth@redhat.com>
References: <20221031095701.383874-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221031095701.383874-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/22 10:57, Stefan Weil via wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


