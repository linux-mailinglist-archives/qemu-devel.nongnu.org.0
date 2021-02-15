Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A593731C348
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 21:55:56 +0100 (CET)
Received: from localhost ([::1]:37640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBkuR-0001bb-NM
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 15:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkqS-0007DD-FV
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:51:48 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkqR-00010D-5A
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:51:48 -0500
Received: by mail-pf1-x436.google.com with SMTP id z6so4871289pfq.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ndqFfE6DVjh9VSws7KQvOS9ehqMqfvWIzAGaAj4qXEg=;
 b=DjsHrWIYWHsQfrmPasHB1ebCKsAW9UxPI+dor9U1bfaL2HFP/GepiUPAPMECeYBYTe
 GNoyayXCNwBs15D4hwCb8CsZmDd+FYNXIs2nYlGLoIGZSDWJfJHHJzZvemtXAHAAyb8x
 vz42pNkMZ3JI5Hou4OH2Yy3ZI8Efqd9DdspbK2Y8X7koluEAQ2lHrkyAbloA3qcWJQez
 c232yFI4M4Gtj1y2r2gZYpGga6c0hJL5XjTej+kSgSNh2MUpIROt8q8mxfRtaq+IHsbW
 V8rtP/KHGtcrYjLF25FaMqT1AOQL4/IxC2vuHSsmeMF9RKAMYy4rfil9ujKN8sICKTYI
 NKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ndqFfE6DVjh9VSws7KQvOS9ehqMqfvWIzAGaAj4qXEg=;
 b=AI86awiHR9Urx4bLcfrkscM4EjUc6e3tm8BmeCJ2VErtYNYK5G4p43xnEUWS9ejFuR
 7eEQaUHmHPOPafCWCswif7uFeRp/g4ScDi2biQj3/0OOrU78g9CPH6pF6NrZGAleAUVR
 uYuJfkT5z3oNCBv2JEgQztr5ojDgRGJ4xOCa+evMkGOEknW2+33aLrxVIJAto2ze/Kk9
 UItwc12e3co2bN8JBN9k4Rl28NQ108SFbopFK8TXkvzVKvwiadgRirrojxdVYJG6Uv0Z
 FSAexmku5eyIGGSGcnyo0Sctsb5jA8tZoKhkMmLKEE8iGpSOFJPkntnopBQa6g3Lz9hl
 J30w==
X-Gm-Message-State: AOAM533B8rERG+SZ5HakFAVlVS8U6pqgEka0jgh/fZJvHnPHMVR5s+cG
 p2Xc0cKAxxn6bK522JwBU4bXOg==
X-Google-Smtp-Source: ABdhPJyiZjLk5y/4Dyvn3RG+Sg1eE+9knOE1WgF62rNwLcTCcXWFz4jaBJt+XAvca0ATEDmHELXXPA==
X-Received: by 2002:a63:1865:: with SMTP id 37mr16116162pgy.206.1613422305834; 
 Mon, 15 Feb 2021 12:51:45 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id x9sm18952974pfc.114.2021.02.15.12.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 12:51:45 -0800 (PST)
Subject: Re: [RFC PATCH 27/42] target/mips/translate: Make gen_rdhwr() public
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-28-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49ade44d-efa0-0965-d1b6-ac4d6a89cd94@linaro.org>
Date: Mon, 15 Feb 2021 12:51:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-28-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> We will use gen_rdhwr() outside of translate.c, make it public.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h | 2 ++
>  target/mips/translate.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

