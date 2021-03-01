Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91D43278C4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 08:58:27 +0100 (CET)
Received: from localhost ([::1]:54054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdRi-0006I3-RE
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 02:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdQb-0005U1-MN
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:57:17 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdQa-0006ri-5X
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:57:17 -0500
Received: by mail-wr1-x435.google.com with SMTP id f12so11219997wrx.8
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 23:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CUmEm5jJNCrGV2oavJ0K+Y0F79BhRh6bUwJXyUpHd7w=;
 b=JLgGrkJe59rJm+d76/aPK3nVtQkcpEHOVThjl1pQUmgM+XF9ofIxAwdU0FeGWCP6Qn
 D4PM2sbHI5ovDeJWyzUvKcnPdK1ZHWzXhRAFpDH0/SQex2kf5zZPWoqUr2pRIUayfJF5
 tY6sODPaAqb8+M+WSgimCR4jAS0y3zieRpCI0g1Vy1otYWI9WbKWgvgVTDRdfcthTaX6
 fqeY+oqBSd4bLtRLWLSB7Qphvv9YJLyk1IAjFnQXu8IJ6guvP0uQ9eclPgnAPKOrnJhD
 ynmnjD/zWofPMXDezu6EQCVIxAcCTwoH/CpgqETv+706AI/6wilfKLDPBLYewcKMSc/1
 ClNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CUmEm5jJNCrGV2oavJ0K+Y0F79BhRh6bUwJXyUpHd7w=;
 b=AGjaW17A6jAzN4kgeK+uhwEVpTqM1H81Gcexhbexz9c83uT5u33HnZ/GMsfFNdvDXm
 QWi/RdyTv2jArXmYym6e/u491FpOnm3Hqva88duOeFER0K4RwNnDk7Cy9mo5flkfHu5X
 a69KskX+DdELLD3DpK156G7+86v7K/oZcFNfnUPXUvbGiHpVNroY7Z/iajBIpFa45MzI
 lJSIJ5nGm9qeQiWiJr9pureGZra4NQbd/TtGaUHbE4DUxYluzQVOJ1xi49tfyj+pb+L6
 kDDv//0AL25qAn8oAfhl1R3Q+1LiUQ1RK/iiVUdRVJeRU9cbUNo7tjfZgCoAKeu4e2zH
 P93A==
X-Gm-Message-State: AOAM532Ygo8CAviw1DdsqECHiQA2IV5BGKU2AsFKzGuu16vO8Ecw01rm
 kRkHNyMkSH8IgdXS1OxBkoY=
X-Google-Smtp-Source: ABdhPJwVrCyVsUi+uvn9grLQ/o6C7XOpd4Tmi4Vtl6aJO5rDdG/hr6x+9NIGuSIdznDFRPjpF7hosw==
X-Received: by 2002:adf:e391:: with SMTP id e17mr14071464wrm.285.1614585434739; 
 Sun, 28 Feb 2021 23:57:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z25sm6269915wmi.23.2021.02.28.23.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 23:57:14 -0800 (PST)
Subject: Re: [PATCH 48/50] target/i386: Create helper_check_io
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210228232321.322053-1-richard.henderson@linaro.org>
 <20210228232321.322053-49-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c6d66aff-af94-0045-eb7b-a8609ef59226@amsat.org>
Date: Mon, 1 Mar 2021 08:57:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210228232321.322053-49-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 12:23 AM, Richard Henderson wrote:
> Drop helper_check_io[bwl] and expose their common
> subroutine to tcg directly.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/helper.h         |  4 +---
>  target/i386/tcg/seg_helper.c | 21 +++------------------
>  target/i386/tcg/translate.c  | 14 +-------------
>  3 files changed, 5 insertions(+), 34 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

