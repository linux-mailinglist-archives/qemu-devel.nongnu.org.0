Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D38662672B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 06:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjC8-00082I-Hb; Sat, 12 Nov 2022 00:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjC6-000821-MM
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:36:42 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjC5-0003A7-6p
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:36:42 -0500
Received: by mail-pf1-x430.google.com with SMTP id b185so6553801pfb.9
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 21:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B5CmKZdv20Fh17i8B2oiw0Q96Yjk01rGk8R9YTBKu+8=;
 b=hIoRyTWiPTjHGEOvA267HQsZoRugtSpNhryTnIZ9PgBr+F2EPpAJEF0lGFDtz7FpVf
 oVxwGIcYN8ngbUnHMhf0eKXkII5Ic8mBRjnDLpKWKVf2of++K91lVj+4jw0Bx1R5PYEq
 odsFG8lG1pNYrQxl3SuOUhgndhw8MFs3U3qZzEC4tvF3U0otVQ+b2GGsmX8TSJVRjghy
 CZt6rZhuBQjwluSaO3Nu730cQu76/jxqpCOKpRiAu/zN8RE/MdMc5PMk9GE7LpayghG4
 jqqhQKvjDzw6SB/PL4yWNkcwJo9DF9/4K5cORIPbr2AX591yKUXexV+hXsNPEJ1SUaKq
 oa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B5CmKZdv20Fh17i8B2oiw0Q96Yjk01rGk8R9YTBKu+8=;
 b=NgDEAokNfQZNS9+dcR9FhGGKKlDXORzkfM0vj9CwLTjGaVSs6UJK2pZZOYaw/bbIVO
 4pfnw5NCd0Rstbd449KitPty3RDc3Xrr1alETxHahMcDJwEra5IiA1lZ65XINmk0vAyA
 Ruy1Lx2aCQ3tbjZBHkeAcy9d6CTp02vJMeC9ZhGKeUbZvYe+9nxX20DAVJljOTIaFIe3
 TgM4NHG/WmsnbxJnBPzCfMMWJb2A1FIzlkh+w3x2hoGJxluu2jDB+wKffgaGj3ywOt3n
 Kt6/EqZY9ukALp6bwN2XJZtKYB5ZZxz7eqvBqa0ee7RFgYGDML1As7uS7tTFL7alnLVu
 R+3w==
X-Gm-Message-State: ANoB5pmt5NxNLD57nNyBfKVs2xS44wwc0qbo+9QSxac1GM+uhZ1u3ux/
 kFzIcYsAXkS7VGudMICIZSzUdg==
X-Google-Smtp-Source: AA0mqf7RqjGHu1JQdt3NcBOnj8e1kikou3LK87gwrzMIqmrxVr5MvfI+HenHo6mJ1vwALCnmNotEIQ==
X-Received: by 2002:a63:f0e:0:b0:46e:b0e3:ee46 with SMTP id
 e14-20020a630f0e000000b0046eb0e3ee46mr4193883pgl.622.1668231399798; 
 Fri, 11 Nov 2022 21:36:39 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 q7-20020aa78427000000b0056baca45977sm2490742pfn.21.2022.11.11.21.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 21:36:39 -0800 (PST)
Message-ID: <a3d83f6c-a2b6-888c-19be-fe7d6b47017f@linaro.org>
Date: Sat, 12 Nov 2022 15:36:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 09/20] hw/arm: remove current_cpu hack from pxa2xx
 access
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:PXA2XX" <qemu-arm@nongnu.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 11/12/22 04:25, Alex Bennée wrote:
> We can derive the correct CPU from CPUARMState so lets not rely on
> current_cpu.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/arm/pxa2xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

