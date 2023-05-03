Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EB26F55F5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:21:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9c5-0001qP-UI; Wed, 03 May 2023 06:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9bn-0001nW-FH
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:21:18 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9bg-0007TB-L1
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:21:14 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so51170695e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109265; x=1685701265;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I8KgcaRKFxhVa6rhQtV/JtXUJG+2UCuDmSKum3eH8Pg=;
 b=T4IJRFVVm027bhlgjwyz//BOjyE1Dbfm1Z+rKdxpSNMokPm6pkzpVha/22RWtIqOR6
 5rSxw/KXCXQszE4sHQvkhobxM0uD8DImWvRTVYBjltG6AtWOecZ3TPS90+5H3i9edIfB
 ekVXVn9Q3p8oefjvXQfvBCA+OwaxHhuF9MHvU/cIie6Xos+LNrOo1hHpczdSVDNpVK9B
 2kSWziqc1o5X3I2ERZSxRjZARdRWNDON6LRX0wOgM0dn8r5+FhbUrEZZAFTio0sWkWoX
 IfGcudnRrxntw7bSXpoK3hsDj77DFGzwgJNE/K/2oODEANyf5T3f3SC4AR8tJxqO3NqI
 4ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109265; x=1685701265;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I8KgcaRKFxhVa6rhQtV/JtXUJG+2UCuDmSKum3eH8Pg=;
 b=MybbSEoMCE1tnUMXnlR86qhzqb1pBVoaUsGUN6mijVpsa4TrjMRmQoukYu7mKf/xg9
 V7iJTF73W3CgJ3XCpsV3rYUH/py8x5sf10yUX5SVrMhcsh5tGLNFKrLL4HOWGU11tZPT
 KAhHm49Tt8yt4xs8yWQz6+z6rPfJj8FPoXfKePGu5orkv1RN4HuDL2EbLJseBXAcvw/r
 qF0rCTdKXX+TwDFAZHJq+p4qG6sz/H8lqgaDPIZmjx/XHXYgDmYaA4PdzttJb4wlMlxL
 bweXrGXT2iN4b6g28OCqT7p4bxjw1JZ1OMK2aOzZjiKrv584pxwPvu+873p2g+xuqPPL
 ivuQ==
X-Gm-Message-State: AC+VfDzsalzaxng8DkaFPz1qZooGpXBFjiOHMZ4xN1BY0CR5pIhLRA6a
 fR8LgAUQYhkPS9hDyUGQgWlNMg==
X-Google-Smtp-Source: ACHHUZ5erX9ioD03wVuBBDAO/4+gsEt+Mn6m5PEq7s/DMj5P8J4zeq4RHYzSLcSIZstRgsqHPy8qcw==
X-Received: by 2002:a1c:4c0e:0:b0:3f0:7f4b:f3c0 with SMTP id
 z14-20020a1c4c0e000000b003f07f4bf3c0mr15127183wmf.19.1683109265651; 
 Wed, 03 May 2023 03:21:05 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a05600c219300b003f173419e7asm1406874wme.43.2023.05.03.03.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:21:05 -0700 (PDT)
Message-ID: <8b6861e0-2c33-1611-560e-400c50b8b248@linaro.org>
Date: Wed, 3 May 2023 11:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 10/22] hw/arm: Select VGA_PCI for sbsa-ref machine
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
> From: Fabiano Rosas<farosas@suse.de>
> 
> The sbsa-ref machine explicitly creates a VGA PCI device, so make sure
> vga-pci.c is included in the build.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20230208192654.8854-11-farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

