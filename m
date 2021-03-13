Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA53339F92
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:39:41 +0100 (CET)
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL8Em-0006Oz-6Z
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8BN-0004mc-Ng
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:36:17 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL8BK-0006ti-KL
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:36:09 -0500
Received: by mail-wr1-x42c.google.com with SMTP id b18so6492693wrn.6
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i09xTiUgWUM5FCXzKWGBkAwYA4pkCrBSFsKw856MlYw=;
 b=crnYwyF/TxXl+4CoV3oqUg5hmQGiXIv+Edv4J27Sh30AoMsXvIqGNGmN8vakYQhCn1
 0dSwfEjE06Im+WRsXmenLgcGSaYFlDHm85+FmuKvl/+VW6retXF6TGbV1aeY546iABfg
 e9iCLfCkD1a3+rMK3Ipx25OAGHG50c4wn25oSrO6oyfuklrUHsnf55R7sa/iybti3zxS
 8dypIXWhu2RQGsAF59F0Z5u9rz/kSCDHhlbXSbi99AQcFweFcdooKBlXyuKplKLC67sE
 k5pR1i8zXgLD7J6DQN/qzhshfAqM/WNd8OdoKqGjm6Nhqcztq3HUmbb5L9Q+Gkcw8t5X
 lOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i09xTiUgWUM5FCXzKWGBkAwYA4pkCrBSFsKw856MlYw=;
 b=tx1bAFH9Yza98O4TxURwawz48NqDDKRyG9PXi4MpIjKyse7nZmp+OoRgFCbWRAILBe
 p6f90U+CdPZa7t8lBpYNQTywjDkW91jYt+ggyB2nEozx/xZj9QNJueQkcksJkEX6S/Lp
 xZ6rZuv4tKIG7eV/TTZY1yrxz1Rxg29HoukqJZjeiEWIDfxb0/IuKLqpWuLDV8DL/D6r
 ylg/2IF9ui78thXd3w3Xk8zu0jtgRN6yBvIGMwv7+AbjMHNYuEl4LrS4XVGJuOZhYd2w
 MZ5hyZi1MmaOL2SDXVPgYYrIHAas+8vNDLxy/PyDAOJg6kCXPS3TmDlS7tI/8qAnq23s
 Z3mg==
X-Gm-Message-State: AOAM530C46LjBzseOPlKezST/ZRc/gHrHRKRAVBAiTpOFtqpFs/9jGkn
 ek3nGQZPPapHOGqhYCSiqNM=
X-Google-Smtp-Source: ABdhPJw1+zGKGy3CGwWBs8g1GUxnWkL6n6QYgLbEWEFgiHKkZCQrROeSA39q5Ys/fpcIrst/mmlA+w==
X-Received: by 2002:a5d:6290:: with SMTP id k16mr18970429wru.177.1615656964400; 
 Sat, 13 Mar 2021 09:36:04 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f16sm12899269wrt.21.2021.03.13.09.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 09:36:03 -0800 (PST)
Subject: Re: [PATCH 01/26] meson: Split out tcg/meson.build
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b25899fd-3169-8959-c64f-9895b5246c0a@amsat.org>
Date: Sat, 13 Mar 2021 18:36:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311002156.253711-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 1:21 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build     |  9 ++-------
>  tcg/meson.build | 13 +++++++++++++
>  2 files changed, 15 insertions(+), 7 deletions(-)
>  create mode 100644 tcg/meson.build

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

