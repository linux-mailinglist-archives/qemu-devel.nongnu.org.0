Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24983B9F63
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:57:54 +0200 (CEST)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGrq-0000XW-0g
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGqz-00087J-E9; Fri, 02 Jul 2021 06:57:01 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGqx-0002Ol-VO; Fri, 02 Jul 2021 06:57:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g7so11917826wri.7;
 Fri, 02 Jul 2021 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tby/6DJUaj2Nt0wEA3K+vtavMY5dIXRRq94T8n3bkq0=;
 b=r493vbrYiOaYv/csvJa/JsSOYOi8rWNzSJYVvK1FkAJ2zH6IXroqggXgPfYJ1YFcK/
 cR6QUVs1uFVXl5aQNmaxSSphm1v21xAFrdajKYDYxjfxsyDka9qV8z6fbVMvLUiOgTGN
 xwpFeMlQz00TOQ1IwEG2TWQWjUmJL0wjKR0qZUVUvYr6adLNTSFLEHFDF94pmZ1bhmGI
 A9QNE91DGIkqiNUfgvdYBR2mWbynmgaFU39CY2Z6yXTb3MKGVgDDTH6fArP8oL/wkcrS
 pc4B6+5GVcsjfw/4Ccli3sMTvbHBZ4hFBM/WJtivbT0sKkCMoYOjozHYU1RHU3ChLUTt
 iYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tby/6DJUaj2Nt0wEA3K+vtavMY5dIXRRq94T8n3bkq0=;
 b=b4VLnbnvl5bAQXATT9XdrDzTMznU2DTQvqffB22Ga8AmYnB2VgnRGm7rJtdjEhzv6O
 HDlAkdOD0akDC6OCDD+452mOOVZoovj0218fhS8eLa2EtHiDtMzEI3EQ4TJGOnXChLrr
 aSG6mk047Hj10sa97AczgKOGatg0oU6cPFZ8FL5tX8vO3TfvnKuIKqMrYftSIETLuK/Q
 GxZbSaDTNwc76QOh6YkOXBN9V8O7CyYl0EpMtfYf4g4tp8DSRbSAriVodmbQdpgEtukz
 4tiJavEXPKeDiwMan7JEvT9y/9iysOHz+nBfwsv4ssH1gJ+uwzLhKOHJhq7Ykmg90k+k
 2ydw==
X-Gm-Message-State: AOAM532o5rLddn4Q6GPpEP7FqDCdBnphG9JKyakTq8u+yku3v9Bdpkf/
 a2amM+RiadqP8TWdFfxkeJw=
X-Google-Smtp-Source: ABdhPJwi2LfVBJ3zPW9tS7DqAABgwUxxuycnNW/x4PQANwg7KSrInQcZt8CtYl2M9jRn5kJKy0pZXg==
X-Received: by 2002:adf:a446:: with SMTP id e6mr5094978wra.187.1625223418029; 
 Fri, 02 Jul 2021 03:56:58 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id k13sm2833091wro.2.2021.07.02.03.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 03:56:57 -0700 (PDT)
Subject: Re: [PATCH 09/11] hw/gpio/pl061: Convert to 3-phase reset and assert
 GPIO lines correctly on reset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f4959c10-8f82-75a6-7828-1ede004239b1@amsat.org>
Date: Fri, 2 Jul 2021 12:56:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 12:40 PM, Peter Maydell wrote:
> The PL061 comes out of reset with all its lines configured as input,
> which means they might need to be pulled to 0 or 1 depending on the
> 'pullups' and 'pulldowns' properties.  Currently we do not assert
> these lines on reset; they will only be set whenever the guest first
> touches a register that triggers a call to pl061_update().
> 
> Convert the device to three-phase reset so we have a place where we
> can safely call qemu_set_irq() to set the floating lines to their
> correct values.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/gpio/pl061.c      | 29 +++++++++++++++++++++++++----
>  hw/gpio/trace-events |  1 +
>  2 files changed, 26 insertions(+), 4 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

