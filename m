Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC5E6D4494
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 14:38:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJR1-0002c3-1C; Mon, 03 Apr 2023 08:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjJQy-0002ba-I0
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:37:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjJQw-0006ei-Qf
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:37:16 -0400
Received: by mail-wr1-x430.google.com with SMTP id e18so29175756wra.9
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680525433;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JVl8SBpwvIYSe0+og3ENUiBd8Td9p6r1Ol535hbLPjE=;
 b=UDVura/ovbPICrA7Ii8RypXsV+wt8naHoKtc7XUTD1GK8zjVsxlwnEdtFCVRTSWxv/
 QQPQDDveNqyQftcufNR7+A/hKrqVHT2j8yfSUZILlUI+X2s+WpH7uWj11eAKDgWAp62b
 n4rvGZ8aAu/fxnMAoVJ+9RwtYwNZzL6fR2KKjy9QeyUMbM7ldoRDMn4k09yPhbMJRuPa
 krF43IxolUYr3eDjxTiwmxf1wxbsBdZv2CqZwu6cZKaSRlba1IuqAubRMnoZePXmiVUi
 fZuWp+Vu3E5KdyIcEEfJFq5FY/DGhZRUV1KTw4narJQbIyvbCwg2BHZReP3lnwzGdlV5
 mIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680525433;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JVl8SBpwvIYSe0+og3ENUiBd8Td9p6r1Ol535hbLPjE=;
 b=SQ+8nyfDGlrQ4XnyxMdo8n52V1l6Ux7a2OXl0ubyRxn0UHtsrkERQzZttbKdAnJ8D3
 sJjQCL/Kto+p6em7RDfvupyGQEjI+WS9ykPetdfNVaC3a/kfoRyGIk/2gXJM5CiYHrIt
 3mCtFuyQ956FfrvG0nzaggU89fFJZm1dfsvCipaC6vhcSKst6UdIj/yNUQmCFY0CsJZS
 Ezpc9zJDpYIj7NT19NW8R5ewYfMRMboobTzRtcMeQgUBo3xZosBGd6qXjNwmHD08fpSo
 tVD+LX0w3TRI78jeem5bBVxWfGI/be49eLfEfqlHCN1K3Z2yrjbLquo2+ThIhPP2189O
 7+RA==
X-Gm-Message-State: AAQBX9dukf77Nw26XpoMzkfofbJYNug6ryYwoiF2cxQSmQxLaLQ7zHSQ
 gVhs+us1JBaXYY6ZPUtJ2K1MBQ==
X-Google-Smtp-Source: AKy350ZK5EPWA2zzItvRpGvO0riUtf725V30fSaHuSiqhEqBl909mnz9nIht7EGQ8eadO6eMQqfugA==
X-Received: by 2002:a05:6000:1109:b0:2e4:c0b5:fdcb with SMTP id
 z9-20020a056000110900b002e4c0b5fdcbmr10206774wrw.28.1680525433228; 
 Mon, 03 Apr 2023 05:37:13 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m17-20020adfe0d1000000b002d1e49cff35sm9649496wri.40.2023.04.03.05.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 05:37:12 -0700 (PDT)
Message-ID: <64964f55-345a-843a-aca1-ba28e10bf75e@linaro.org>
Date: Mon, 3 Apr 2023 14:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [RFC PATCH] gdbstub: don't report auxv feature unless on Linux
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Lirong Yuan <yuanzi@google.com>
References: <20230403120250.2071560-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230403120250.2071560-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 3/4/23 14:02, Alex Bennée wrote:
> The later handler if conditionally compiled only for Linux but we
> forgot to ensure we don't advertise it lest we confuse our BSD
> brethren.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 2a66371aa5..0760d78685 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -1468,7 +1468,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
>               ";ReverseStep+;ReverseContinue+");
>       }
>   
> -#ifdef CONFIG_USER_ONLY
> +#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
>       if (gdbserver_state.c_cpu->opaque) {
>           g_string_append(gdbserver_state.str_buf, ";qXfer:auxv:read+");
>       }

Fixes: 51c623b0de ("gdbstub: add support to Xfer:auxv:read: packet")
Reported-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


