Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0EA43E4B0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:12:02 +0200 (CEST)
Received: from localhost ([::1]:36360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg74T-0004iw-Hq
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg70n-0001jj-B6
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:08:13 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg70l-0007XJ-7T
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:08:13 -0400
Received: by mail-pl1-x62e.google.com with SMTP id w16so4640934plg.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1thUTMcF6whSdk77mjt7WNNm/hCY1MophcoLArXtkcs=;
 b=D0SEORQD/1GdJNWSD+il+Hp90HvymDDJT1XGSygkt7nps35kAN0h7z/YeTXf42/Rsi
 6wz2Cyq1c7lY2h6U5RAqqbwpgSZad67prT1PGl1qajMXCSR1LZIOfAjpLO2+ntR9UnJS
 rTDwxcJ0dzatKH+u6zzUxQhdarXkcFw0Dg0AmxcD/k3/lZNosEejITwG8x952oSKbg5m
 LIf3EiUWenXEd7QWPIwhZQzbZIS1YVuhFbZTkEcYGZuwBqlMHIEnQvO65MuVzeQYpd7G
 mWOX7SOIPdB1lpTxcF9yku/xq5W+03Zupb+57uJKr0v04ydsezREif1feM3CQtt/DvZA
 R4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1thUTMcF6whSdk77mjt7WNNm/hCY1MophcoLArXtkcs=;
 b=eB/8D5DsbA1zHKsGaQzeXCNwyC3F0IciV76fmWDhOx6IOiCSAJEkoV3UzwmsjcGtIv
 0wmPPsnyFjKM8eb21JUk0tLQVdM8+tfZ6W2FpKllI5nPQ3+UyGAKfk1G3MkpXV0lbHiK
 kY28aJ857Vlc6cdAfLiQAY2/FTbemukM7CM/HVSEfo1giGHYlC5s4/uL2NojwX/fcvSw
 np1fIPA+lJZIZoY1OV7Jn9Gw25P2aKtKgyX50lw9SGxqmoDdaMyT2f0VRNi6xi9tQF/o
 rHgrlxTI1PH7fzsnZJacfPMI3zxMZBM2dkl6eElsZn+QsPhZ/Qbic6MoRo2Xp3jnONFb
 BK8Q==
X-Gm-Message-State: AOAM533QDVCwypYPBXx6pnkIRcIGO9ldnWt6fhHvNsi0HiUs5BIDf5yl
 eiRdk3beCwN5yPo2oMn7G4oLEw==
X-Google-Smtp-Source: ABdhPJzvofiUgIGgYPeAErYng9cmqUNd34jSggutaxyCQoStYMBWieE50ZnXBM5qCgeaH+L+KN2jZA==
X-Received: by 2002:a17:903:1111:b0:13f:d1d7:fb67 with SMTP id
 n17-20020a170903111100b0013fd1d7fb67mr4210247plh.85.1635433689376; 
 Thu, 28 Oct 2021 08:08:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z6sm8363387pjr.35.2021.10.28.08.08.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:08:08 -0700 (PDT)
Subject: Re: [PATCH 03/24] bsd-user/arm/target_arch_cpu.c: Target specific TLS
 routines
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4cf3ca17-79b9-0742-e47b-f50d2bf5802e@linaro.org>
Date: Thu, 28 Oct 2021 08:08:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-4-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Klye Evans <kevans@FreeBSD.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> Target specific TLS routines to get and set the TLS values.
> 
> Signed-off-by: Klye Evans<kevans@FreeBSD.org>
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch.h     | 28 ++++++++++++++++++++++++
>   bsd-user/arm/target_arch_cpu.c | 39 ++++++++++++++++++++++++++++++++++
>   2 files changed, 67 insertions(+)
>   create mode 100644 bsd-user/arm/target_arch.h
>   create mode 100644 bsd-user/arm/target_arch_cpu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

