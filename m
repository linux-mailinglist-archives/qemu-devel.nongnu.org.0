Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EEB170953
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 21:21:29 +0100 (CET)
Received: from localhost ([::1]:49516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j73BQ-0003tl-K2
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 15:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jimw@sifive.com>) id 1j73AV-0003Iw-RX
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 15:20:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jimw@sifive.com>) id 1j73AU-0003AX-O1
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 15:20:31 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:44958)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jimw@sifive.com>) id 1j73AU-00038M-Is
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 15:20:30 -0500
Received: by mail-pl1-x644.google.com with SMTP id d9so131787plo.11
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 12:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oJWjAQwpDaloA1vYB6E/tU+1xm/T5uuZ3jou5Q1NBrY=;
 b=OIGAPcCLASLWxLJ6fxKKsaAVwnHxxeOEvokFjsc3z/p4Ldg30bcCry2A//dd0fGMKO
 8hqccB2NLQX2Dlrc5V4lcXFYGRk3lLR41Yp7bFwkh2OJsSwwtxvenm2MPLdLAIOm6afm
 SsqtRKYgAAzXuWRsszMzMIddc8ogWyzMLwjCh3lNwM5ezxR9pMAaYb5jKWvZOOpHKtzZ
 q7UR4z5Ced/G3ilaYmGC3+Zy0RcJ86nMkKQXSMUILtu81uZIKWbB+FF0nF3mG2C/WeAg
 gV2wDxdPKNLmkuQGfzur5YdH6pPgvX2FGBka+Oj5fCgEswNZJZULuoYalBB7xcoFCcC9
 Xylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oJWjAQwpDaloA1vYB6E/tU+1xm/T5uuZ3jou5Q1NBrY=;
 b=E/aujE5iZw3qNnsyA9VQCyZCc6tnFPZJfcUSA7UDvzHqCdz3qbSOw3rYC/1a+18MZe
 zcPHZKlNHiXImcNF2CjYEB4AeShTBNVEnJMVQo+cgET5vi39OJLzFKxaQrsRHjIjpV6a
 ayOQ8MRSQVP2UsJbkxRCHDGIwEf9o4JWNZyksQ+1NHRKPRDLdrDVw/EGDOtyuU+5IzYW
 SZc4L0Gf3DC2/6FCvX20UCEXVzOSoPSd3eBaMp9mpBicp5IovRPswRONkWXYfPjXYMcy
 cmCUShSGx0Y8WQ0MXyqa4NPP/mBuX0IV0c2fRsJ4m4ji1plQxZxruTe2jhh+znkPhEec
 LROA==
X-Gm-Message-State: APjAAAU7pjY9LpT9zNzNgCNTIed7qPIYkaLio7T9VHuiqRciQ3yQRKGd
 TkttOonLroiapjoYTDo+CeH/LQ==
X-Google-Smtp-Source: APXvYqwcqtXv4AvMq1tzOTs2GVcyBqes8O6+rt/MYjPddtxo38/Bjxm7rYynFhmGWSbm0mVTGTPTcQ==
X-Received: by 2002:a17:90a:a88d:: with SMTP id
 h13mr896990pjq.48.1582748429173; 
 Wed, 26 Feb 2020 12:20:29 -0800 (PST)
Received: from [10.17.0.226] ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a35sm3950894pgl.20.2020.02.26.12.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 12:20:28 -0800 (PST)
Subject: Re: [PATCH v5 4/4] target/riscv: add vector configure instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, richard.henderson@linaro.org,
 alistair23@gmail.com, chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200221094531.61894-1-zhiwei_liu@c-sky.com>
 <20200221094531.61894-5-zhiwei_liu@c-sky.com>
From: Jim Wilson <jimw@sifive.com>
Message-ID: <f2ce2ebc-0e79-d65a-86b3-5f705b541fc2@sifive.com>
Date: Wed, 26 Feb 2020 12:20:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221094531.61894-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/20 1:45 AM, LIU Zhiwei wrote:
> +    /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
> +    if (a->rs1 == 0) {
> +        /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
> +        s1 = tcg_const_tl(RV_VLEN_MAX);

This is wrong for the current draft of the vector spec.  x0 now means 
don't change VL.  So this needs to be version specific.

Jim

