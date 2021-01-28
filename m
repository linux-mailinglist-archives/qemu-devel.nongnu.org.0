Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7586307D2E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:58:25 +0100 (CET)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BYm-0003sl-RG
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5BQG-0005gJ-5k
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:49:37 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5BQD-0002DB-4p
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:49:34 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a1so6317918wrq.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 09:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5swrnQoDBOztex/peG3z2NKPYX5BvuwJyjvwwmMtvgk=;
 b=t3gKb2cPxrLtydLlKnNKjlKrqZIQahB+TxOvwWldc1ImudRGBsw00xsZxmJYUaNuNY
 6H16SS3Os6BeN/H4q0mCLqizXUyH+V+ZDkyTA9PGYIE3k0BKv78cyaKTs3LzBrqEkgMB
 tAOwLQUJAbhuYzIpQESco1Oi8R07seK1LhvHV8bUQCiUmsJo+V5psUfMz0fUhX47jje7
 pfZYYWKrxllvuwBo9y6R6CenQCgChTrKMFaJN/tN8WMC4pkPs8GfH9JP8Xy/Dxgh87qn
 Ogryj6fuMZ64Eg/I4xFtUxJ5TWMW3ZtPZ7xCICYI31ZlvqdLnX4tlvY6MskYEcYT4e0w
 PxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5swrnQoDBOztex/peG3z2NKPYX5BvuwJyjvwwmMtvgk=;
 b=GW4Bitw3DEvqf9wfsOdIYCqe73lRd1VhD765awrEE1SKOZGz2ROdvfwyAwUu07zOy5
 snOm4iBXcoKu32K5CbaPH06eZuBcdGnJjxiMddmwL8ip3F2QRd/ApenqokSgE2eFurr5
 ARe/Kj7S6m39yNs8aE1WGC4T4r21LAbXhTO/P/1ZvcZslLRiSRsgReOKpVeSmc46couQ
 Ns1Z0CgN7gc8JKp0QOyHD0XcJmaKbE4DZMNrcd+XRCh2rVj2Kcha8RYzMFxRr4yoQV7s
 DqdO5qkzGeL3EWTRYPHw+KHSJFuVVyGut419gWyK6BwDacc7PFWA6B98VpSZsvb/pNO8
 0c+Q==
X-Gm-Message-State: AOAM531OLcYE1j3Z9eMVXj2MrZhf64iAtLTXloKr7PQ0LxGEU6ifrA9W
 4qlOJcloCpwzBgOifboDbLd1zHE5sng=
X-Google-Smtp-Source: ABdhPJwbSULn9Rlr4SlxooCSPE2i5RW+snnLu5HuDlclRz34YrufpQ8dbBMieY+qGhFenqq2FRpmkA==
X-Received: by 2002:adf:cd10:: with SMTP id w16mr288784wrm.90.1611856171213;
 Thu, 28 Jan 2021 09:49:31 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f13sm2732675wmf.1.2021.01.28.09.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 09:49:30 -0800 (PST)
Subject: Re: [PATCH] target/rx: Fix compiler errors for build with sanitizers
To: Stefan Weil <sw@weilnetz.de>, Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20210128172127.46041-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <532a31bc-f011-5c7e-e7e6-9b1e8b149e11@amsat.org>
Date: Thu, 28 Jan 2021 18:49:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128172127.46041-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 6:21 PM, Stefan Weil wrote:
> gcc (Debian 10.2.1-6) 10.2.1 20210110 aborts builds with enabled sanitizers:
> 
> ../../../target/rx/op_helper.c: In function ‘helper_scmpu’:
> ../../../target/rx/op_helper.c:213:24: error: ‘tmp1’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   213 |     env->psw_c = (tmp0 >= tmp1);
>       |                  ~~~~~~^~~~~~~~
> ../../../target/rx/op_helper.c:213:24: error: ‘tmp0’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
> ../../../target/rx/op_helper.c: In function ‘helper_suntil’:
> ../../../target/rx/op_helper.c:299:23: error: ‘tmp’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   299 |     env->psw_c = (tmp <= env->regs[2]);
>       |                  ~~~~~^~~~~~~~~~~~~~~~
> ../../../target/rx/op_helper.c: In function ‘helper_swhile’:
> ../../../target/rx/op_helper.c:318:23: error: ‘tmp’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   318 |     env->psw_c = (tmp <= env->regs[2]);
>       |                  ~~~~~^~~~~~~~~~~~~~~~
> 
> Rewriting the code fixes those errors.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Those error are false positives, but simple code changes help the
> compiler (and perhaps reviewers) to understand it better.
> 
> Stefan
> 
> 
>  target/rx/op_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

