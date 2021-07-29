Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDFE3D9D82
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:16:59 +0200 (CEST)
Received: from localhost ([::1]:34296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zLn-0002vK-1J
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zKs-0001yH-PQ
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:16:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zKp-0001Ry-39
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:16:02 -0400
Received: by mail-wr1-x429.google.com with SMTP id p5so5384901wro.7
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lQdXq0IF05D5seF7ABXkKMfvPMvDwiux5cE0AseR+8g=;
 b=te4puOf2hNdeNJClLL20svjpoBb4WJGDwDNTnNty+KepwIXQ/laPs+gELok+AWt/7b
 YIJxHkv65Qez4ue1HZ7fu7nlY+ctzotBR7o2JDOjpQwFXW4mwqUExYyR+PyXOiHx8vRo
 KwGc+edpMsaVoUiZLNn5V0RgxzxYx4E6paUuJeU/pM4lBGlWgDn+124HYXZtwVkw9EZZ
 Ftk4pG1KXfJwefyPIOWnCvNPIlHZLc+f0NBfnqcUHL0Epk85qCzQ20yQqBAzfgFYUsi6
 ZdoVd1wMQk0eX7yM2ej5TjWlGOtVW+2Nl6BrgbwydW1bvBlG0Luz6EXAeoeR5DE1rV9E
 DNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lQdXq0IF05D5seF7ABXkKMfvPMvDwiux5cE0AseR+8g=;
 b=Tgu1zOHYTso5ZQO3z+0JD/cCHSLI2K4lyZQ+qHHoAXLeOhbnoO3H+3IAPj43viQ8SG
 HGSnExsrg6fC9SIysUoSDGuy6rc/mnwpcGcYrWcHpEps3wPiqC4Wt9FCYpNRsvYK11zR
 plD3FSWKfo8T9jNkERrilh0FapmtV9fgja/V+bYWTWtEgcxIt/q+TgAXNC+VknvIhKU1
 edO7PqFDjaE177+nvr77EyT7Jwapf6zdzJU17TPJu4BLItxyNRfkSWjVcL0PpzZXDhIb
 d/wQv4UOTM11/mQGWeSdyvgNRljTcDlQuyJx5w8ThWuD2rvhjMfFgeO751ofj+uiJpW3
 /2Bw==
X-Gm-Message-State: AOAM531f5KVmc/2+l8Z3Y8OCXUtPmTQmO1HlWeH0bATlRXhIiXj+YbuI
 RcEeM5NYqVBXk28ccR0fit8=
X-Google-Smtp-Source: ABdhPJy6PVJAgAwj02SaprMWU5Vys22Wh0GqWaiyOvP7VZnFpcT7LcNvgE53+6HyY77Y+3kpXFPRog==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr2860860wrj.143.1627539357453; 
 Wed, 28 Jul 2021 23:15:57 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id o18sm2049325wrx.21.2021.07.28.23.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:15:56 -0700 (PDT)
Subject: Re: [PATCH for-6.2 11/43] target/sh4: Set fault address in
 superh_cpu_do_unaligned_access
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c7474971-35e4-d308-b22e-4c559093ff06@amsat.org>
Date: Thu, 29 Jul 2021 08:15:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> We ought to have been recording the virtual address for reporting
> to the guest trap handler.
> 
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sh4/op_helper.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

