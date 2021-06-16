Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446BB3AA1B4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:43:48 +0200 (CEST)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYdn-0005n1-8s
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYcB-00039D-Aj
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:42:07 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYc9-0006M2-UY
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:42:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o39-20020a05600c5127b02901d23584fd9bso1752982wms.0
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rK5t7gbhYmMGgj8bqApi1SCTZQ/hjT72UIkwveG6isM=;
 b=gJ9OgSkdD18vCiG52luxQ02H9ciIB4CZJmokPA/nHamRi9SSxNljEV1CwME1KeSXB2
 E27Hecu8hF3RxGgdN6mWjPNOPSazJxZeURHXlBn1j1QQo9X5Jm1HXLl3eTW0IFMQOo5x
 gv9mOuTGxDqV9TOyViJ94WJAJeVM4o5NRF+vyLdmWjw/Qx1Bk9m7RHB/J2R+f/s3/PoN
 RxSqYL3Q2FnRB1rEqFStQ5tbd6/QL9HByNGmebG5B3wl+6jZ+D+Rae6cxA9IhU0niVLC
 PSIMUGNOoXo72Qd2BUvdiI7lmM4gFEI/dC1Z0toeEryKReynL1Y7/yvmdU8bospzXa3U
 5zIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rK5t7gbhYmMGgj8bqApi1SCTZQ/hjT72UIkwveG6isM=;
 b=sz/TrJnJp1RfU6Au1TXTMpPmBc0xLiLVqzjGocSURxOvyWSAZ8x34DuJEIuSH/m3kk
 OcCAhKKshtNjPsSSJnoO0XcSTnPC942BR4RzMGMr4Nh/rIFju18301jdAFPm+V0Faarc
 DWjh14SfQqB0c4jY3X0D65JqGAWrSd2AsBH+yn4CwNlrHLnfpr9ykADUKRuyTvF7VWN3
 cfmi2kyeL0m0CFFU5QYpjpX10Dh4aFZnRkIbPoUPsxGkq06rMp78ILMOWQ2oA7JcIEHv
 ESR/uglih3nzqvMDXMNHz5qCH7l7fumBrhMRRKqu/OwDpsknPaZMlRDwvQLSldYTAbi1
 h0kQ==
X-Gm-Message-State: AOAM533eLPGNLhZyxjiHoeDu2ob30zmnw5AKmqXm6MEpsFFqh4P+GLBi
 fK9xIdDMPcmFV9Z0ZnMKeG4=
X-Google-Smtp-Source: ABdhPJyTZYCZSUxDbwOEjRNvxna6h77yZdNo//Igjcos1IOnmtsqbaowCXgI5+RZRTkTQ7cH183gjQ==
X-Received: by 2002:a1c:f717:: with SMTP id v23mr12040973wmh.32.1623861724489; 
 Wed, 16 Jun 2021 09:42:04 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c21sm2305429wme.38.2021.06.16.09.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:42:03 -0700 (PDT)
Subject: Re: [PATCH 10/21] linux-user/m68k: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f1e47ece-0683-5d6b-554e-80e255fd5e4a@amsat.org>
Date: Wed, 16 Jun 2021 18:42:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 3:11 AM, Richard Henderson wrote:
> Create and record the two signal trampolines.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/m68k/target_signal.h |  2 ++
>  linux-user/m68k/signal.c        | 47 +++++++++++++++------------------
>  2 files changed, 24 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

