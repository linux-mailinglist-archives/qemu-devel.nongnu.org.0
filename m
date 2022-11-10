Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0766A624D53
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 22:53:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otFUA-0001u9-7E; Thu, 10 Nov 2022 16:53:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otFU5-0001ou-28
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:53:17 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otFU3-00076S-IR
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:53:16 -0500
Received: by mail-pl1-x632.google.com with SMTP id u6so2647801plq.12
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 13:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ypLncOxtDkpHcqWArYxmJgZ/pvMqCED/1Cp3lP41Sg=;
 b=BnIohzgX+OQISabeNT3dMmnLjTBhVlLUE0fkKcuv70iy6VokuYXtZK/Mhs66xVGmqo
 pv0+IHU7gUgslJRHR71Y9+1rEU3nk+TxET24TVL1/0L4WIT+kmy5FXMQ8G3jnpDDwZUZ
 J2ClIZfcToUf3+LdkYpycFkvLfGdWFf8bKMs0a9n5N1aVGXw8uUUTo1c3F4/h1ku9gMc
 dudIeKsVJnibMcuzpge4bKWbk/1oYYFOXyab7xMOA7F5P/VPELgDokJn2QmEBz6zqyAU
 1C7LIqs2hr88xxZ35jyfkAcpsoG7WsXFNR88HAo/Hh58w999D14OdJND72/VTYxb/J+C
 K1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ypLncOxtDkpHcqWArYxmJgZ/pvMqCED/1Cp3lP41Sg=;
 b=Cgifqec8g8A7/kON5befUhSx5Aie47Ldy1o4T0L40uFkAyolor9sU3Asf9RlkmObBD
 S4TwfAZn3+iVGdJcCYn4xisCd2Qa18HVahneVlXllSFw+zJsyloHUR56TwZsJt9/ss9D
 wzw25cfcP81fuLU7zMhgwzA5fxQYANJosgED/skRn4Ncaav41syyKR/ibAqy59Ivhoba
 9VUm9uinPBhUXkGHNv7OBpcn9sIOeX4mUNc+AtthZhWH9U6gF/qiE56Xwth10hWs7HPg
 Pch0Ag0n5GIRKS0f2IzXb1hV7jClnFGgfdZNZkeXZNBspOCqFjTb+M3Nyv9W8ub1PFRk
 bYPA==
X-Gm-Message-State: ANoB5plV8+NmJqb2kJQYBFGBbZz0XMrVxrJU/uxtf+HICn/Uv5U6Z0xA
 ByvRkHMX3dQ5FJM/LiFpTn36Fw==
X-Google-Smtp-Source: AA0mqf7OaJYCqts78+ScLeVFVQDkhXD5Ts622G05tFGIrmQAfiBgVBnAngRB/sMp7TQNFYEbtFVFbw==
X-Received: by 2002:a17:903:230f:b0:188:649b:a0c9 with SMTP id
 d15-20020a170903230f00b00188649ba0c9mr1958920plh.150.1668117194080; 
 Thu, 10 Nov 2022 13:53:14 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:aef:59aa:1faf:7e61?
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 a188-20020a624dc5000000b0056299fd2ba2sm119566pfb.162.2022.11.10.13.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 13:53:13 -0800 (PST)
Message-ID: <90599cd8-fc50-b0a4-8a88-0e083b020798@linaro.org>
Date: Fri, 11 Nov 2022 07:53:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 2/2] hw/misc: Convert TYPE_MOS6522 subclasses to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221110143459.3833425-1-peter.maydell@linaro.org>
 <20221110143459.3833425-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221110143459.3833425-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/11/22 00:34, Peter Maydell wrote:
> Convert the various subclasses of TYPE_MOS6522 to 3-phase reset.
> This removes some uses of device_class_set_parent_reset(), which we
> would eventually like to be able to get rid of.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/misc/mos6522.h |  2 +-
>   hw/misc/mac_via.c         | 26 ++++++++++++++++----------
>   hw/misc/macio/cuda.c      | 14 ++++++++------
>   hw/misc/macio/pmu.c       | 14 ++++++++------
>   4 files changed, 33 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

