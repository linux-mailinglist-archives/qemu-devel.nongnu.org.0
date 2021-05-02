Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7954370DD9
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:16:58 +0200 (CEST)
Received: from localhost ([::1]:44030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEm9-0004LU-4D
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEiJ-0001fn-NZ; Sun, 02 May 2021 12:12:59 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEiI-0006B4-2u; Sun, 02 May 2021 12:12:59 -0400
Received: by mail-wm1-x335.google.com with SMTP id n84so1934467wma.0;
 Sun, 02 May 2021 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=By6kwOBy3aDVg9MTadgbHjGfskoTMf12IXNWh0KYYtc=;
 b=vSePsM9dd5HezFhkVBhSjm+91CRrcQjuUGfTNbcWwPeYmftXf6ycqVxpFL3pBfBeO+
 wJDbsqEd7RWs9yQe35pVlga5EtJgEQdJVfYKXkCYXMoh9IxGwQVEsgSrMQx1ARgXgAt/
 8L4queDFmU1Na0d5QN883RzVL1969aepCfNVWQtHvDlqm9hp0LRQTLoWw/QiNKgiOtSa
 9+LlETSu502qKsXylKIuDiHRH5QJqdzrOoRCyQr2m7s+qTFNPZjpF9pNQssgu4RLfGbg
 NCrGm4I2xoU+PnNqc99TYpjMGN4muGfIFO8hgkkf/YN0uvFQcOWUyTNFKp5hIf1xu5CH
 0gUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=By6kwOBy3aDVg9MTadgbHjGfskoTMf12IXNWh0KYYtc=;
 b=PYIkha2x6Nl++c3IQ18t6N2zkf56zCDV6C4L+PuHa64Zm7ZNSLEhXUKzBAt1EL31E2
 SYpWzuodVuL+3Oh2oSnF/rK/28S9bxqQ3ZOb9237SE0/AVIjjjsfJ8u4BoLhnwM9bB8Q
 /w0A3f0zZwiDvNw/m8TQ0Wp3Cjd9++TZuQJkMHwIFXfVNAmn+bezz6iZg1B7kw3mhKuV
 31P0p0f0qWguaWW/f7oCpaOxVpxUiyAwaJuovpLC4y8KREVBuIRCYxuV6keioUlIP4XB
 FdEYYfAMCqFQJ7L9MWLsiZupr2Vd+38UdHIX/JArNS1o4TA4mLhxjVch6LLckssMn8TQ
 Y+sQ==
X-Gm-Message-State: AOAM5324jiFr02sr1mx+9n7iHnipy/2mOH4snUMNDJBy2Lurq7mtgcCB
 PRpXRAC9sV0tOQ1pDsdqvJE=
X-Google-Smtp-Source: ABdhPJziEo3g7+698aUdO6B1pZELNI/vwj8lSBS8yKXX04I8ESkxPNvfQrFwwpIf9zG/qQ8OTGuoNw==
X-Received: by 2002:a1c:1bca:: with SMTP id b193mr17656465wmb.28.1619971975695; 
 Sun, 02 May 2021 09:12:55 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id z8sm8884683wrw.74.2021.05.02.09.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 09:12:55 -0700 (PDT)
Subject: Re: [PATCH] hw/net/imx_fec: return 0xffff when accessing non-existing
 PHY
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210502160326.1196252-1-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <889183f9-1f17-dbdd-787d-76f9b5956bca@amsat.org>
Date: Sun, 2 May 2021 18:12:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502160326.1196252-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/21 6:03 PM, Guenter Roeck wrote:
> If a PHY does not exist, attempts to read from it should return 0xffff.
> Otherwise the Linux kernel will believe that a PHY is there and select
> the non-existing PHY. This in turn will result in network errors later
> on since the real PHY is not selected or configured.
> 
> Since reading from or writing to a non-existing PHY is not an emulation
> error, replace guest error messages with traces.
> 
> Fixes: 461c51ad4275 ("Add a phy-num property to the i.MX FEC emulator")
> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/net/imx_fec.c    | 8 +++-----
>  hw/net/trace-events | 2 ++
>  2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

