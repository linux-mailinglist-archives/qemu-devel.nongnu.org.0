Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB5E3D9F9D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:31:03 +0200 (CEST)
Received: from localhost ([::1]:54232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m91RW-0006EL-Jr
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m91N4-0005yt-OY
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:26:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m91N3-0001H5-6P
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:26:26 -0400
Received: by mail-wr1-x436.google.com with SMTP id b7so5827581wri.8
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 01:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=57aWhC49gAJv7PuUcrEikA22GJWaBNK7OQgAWBmWlyA=;
 b=sWf0K4ZR+pK+kxpHiwymrHoojxVP3jgBSnH2pPY0iORqPxtMyk4iGmzjby38i4cVvD
 n35c7rBU4nPWHb/tcmuDKuSrvySGfBDy2QYAQ2eWaVC/Ii20nEwMY6D+c6p99gAiVvt+
 1ZUNvrTGZt8z06rdYzvY+wSsNN8cyAIzs+ZC0xcK3e8OSWF0yhpXPK5u2PM++a4MzW4s
 mGSPirvxE/XLeLCn5EwFPVFrw86Lso+wGFRU/0E5uF6FtVe7oXE5SIMuv0oMkifNIsJv
 WyEKYz4Xe42+b12Zq2L/EUKdHB1KCXl6SvXcj9zBUw19P9jE9yAChp9Wzug4yewAY727
 vG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=57aWhC49gAJv7PuUcrEikA22GJWaBNK7OQgAWBmWlyA=;
 b=Py5q861hXv8zspZeZ0+d5PmvJ7rmjLMXJ2wgbVjF5vgwTAFkExl8SnD6FZePTrU5JZ
 mOOwGFGh9b5AA4jDIceteWy0vcjL+QdU3ok/e2LxuYj2ZMOmAm917ZPmg14JqEbUGAjF
 vnJtc6189BCSDT/VkMdToAz668nAsg9dYclE3+fXE1rEDMWBa3aNWzgmuiU25M+PG48N
 Y20pEnkw3mfUTVE8Tq/OXJ17J/1tPVHAfOD1/d/0MXr1Y8pQ/6RME/YApCru0K5To/uQ
 wREeX5OW5kaXzDcTWE/W5jX4PuerqvNTpdlfHvEwKKbKWe6WgdrwWeWZbHTBQ/uYG+6U
 H7MQ==
X-Gm-Message-State: AOAM533mg1s+bVI2l8FOBYrN3WxvGP/1L1huzV+9t1qM5bwZVyzpuWhm
 mZpu8PimYKdBqslHz7NOg+w=
X-Google-Smtp-Source: ABdhPJxXNiM/45+ZapxcDns1kNAkaQqqRtpD23Lblk5LVHYxK+k5O4bGzSFy3mz3NCbUwwPuOrvMRw==
X-Received: by 2002:a05:6000:124b:: with SMTP id
 j11mr3523378wrx.348.1627547183653; 
 Thu, 29 Jul 2021 01:26:23 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id k9sm2513474wrc.6.2021.07.29.01.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 01:26:23 -0700 (PDT)
Subject: Re: [PATCH for-6.2 05/43] target/microblaze: Implement
 do_unaligned_access for user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <99753764-1d87-5c62-ce99-36a61f6aefd3@amsat.org>
Date: Thu, 29 Jul 2021 10:26:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/microblaze/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

