Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004D12ECAB6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 07:59:46 +0100 (CET)
Received: from localhost ([::1]:34812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxPGs-0001ut-2H
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 01:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxPFR-0001TB-4s
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 01:58:17 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxPFP-0002lf-PF
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 01:58:16 -0500
Received: by mail-wm1-x32e.google.com with SMTP id e25so4594662wme.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 22:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AHKXC/syRaZrA40cTJiHpqL8S2/bdiC7Yq8eMpHMuI4=;
 b=h3KeSgVY/F5ukBy0p23XWTLGJNyKRP5gsukbcMrTePW3dzFkmfrQ0lRlxlEotSWmMc
 XGnCvEXQHVDOtsMPWZ6IeFXVSEwH6NB6+l3h9IIFRYfyn0kMdIhGBCyT3ugpUaTSar8h
 W/tda8ir14sfA7fYrFYuS7hZ5EzgGKFR4bx4HP/EOCERBMPn7h4tWsottxRWLTRa3CrZ
 IeqZZajuiifsFmGyj4+6MnAAPbT5J7RJ6n+9kQf0vrCSy85fyokDilU3K3WnDJ1c3ZIH
 y+La9nZCspZJM6/2NfQjE0R4iZF/VHbFIOSKWRNL3hluNMXtxRwwjJudPZfIFVrxlN14
 Anbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AHKXC/syRaZrA40cTJiHpqL8S2/bdiC7Yq8eMpHMuI4=;
 b=JRFSkDUt96CWzUPJkVERR8iBRhwtTX3+t4E35tXJo2QBevd+djJnANvzPSbQjigx/N
 bqXoo6Gv47kj981suY6Mj3/cA80osMmu9PZXVnYmKhFFPKQ9Vyj88jKlRkJBIjv3mAHy
 M+Od4ziH/67RKljdb3pI1L20kfHkuhMr21ZDQNzXsA8jbujJtf9QDvz3po6sCCYChssa
 uKW6AnwUoq0k32GZxQe8cgBykieFREdp6CHVrkv7jwBh1GGT8wA0fiqSsKZgqSlf7N9C
 5vYm9PKq7RfDXSC/0EEC9/JOng9iPTH4pfA4qntZ7V1bSSvTjZbkl0Xq8lUgoFTdtd9+
 TfUg==
X-Gm-Message-State: AOAM532aVt8GPv5eYeO43WYwMFOh9Z/uYI2Uh0Jr1PoFfoA5FfRZhvug
 6oNyJkRGx7UU/sMmc1hwxOo=
X-Google-Smtp-Source: ABdhPJykRapuGjP/3J8LBAHZ5gQBQ5n2Ith2abEfSNwNxOGdrZPhVV9l5HZnIaxqh5jU1ox3bL+paw==
X-Received: by 2002:a1c:2605:: with SMTP id m5mr6667296wmm.111.1610002694321; 
 Wed, 06 Jan 2021 22:58:14 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id y2sm5908408wma.6.2021.01.06.22.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 22:58:13 -0800 (PST)
Subject: Re: [PATCH 1/4] cirrus/msys2: Exit powershell with $LastExitCode
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20210107053825.2010-1-luoyonggang@gmail.com>
 <20210107053825.2010-2-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <da1a12a5-e0c8-b21c-c405-e7f440785ba0@amsat.org>
Date: Thu, 7 Jan 2021 07:58:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107053825.2010-2-luoyonggang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 6:38 AM, Yonggang Luo wrote:
> Currently if we don't exit with $LastExitCode manually,
> the cirrus would not report the build/testing failure.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  .cirrus.yml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

