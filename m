Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8935E9202
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 12:14:28 +0200 (CEST)
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocOeZ-0006LS-To
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 06:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocObu-0002qJ-2s
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:11:43 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:46665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocObs-0003Gi-FJ
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:11:41 -0400
Received: by mail-qt1-x829.google.com with SMTP id b23so2546725qtr.13
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=MaG2etLN4GgasCsqD7UFfdGL2hvSpf2R2EX6hvjux04=;
 b=MJsI3yLp/y7ey94soTUmlkGYkVdAf5e4GQW7Nn+CFCHJN3IIdBxWELpJXbCIgt78CC
 9pxPCskcnRCCWayConqhxfyN16xwrv3+9pl9eovnIwArnLATP1JR4oimE82LC3sLVVS7
 4jlESXJ4BWZ91LKReyWhfi5dMxuqcBgUbj5Sha/UeVBlvPyhnpMrg0PVSddK4bRrmjYE
 ZpR/KirI06eCr7RbkgAkJrdldzMMQ3aH3bA38pdX84gGMZmqK1x3ly2yvjLPRo/0Vy8s
 4uOxhGZ/AfJl8wvySYirJUqi7AXmJ6nAgyiu9/dTijazT3o30q2ak8LLRDQHR4DVUR5o
 EdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=MaG2etLN4GgasCsqD7UFfdGL2hvSpf2R2EX6hvjux04=;
 b=SJezWFqLwDE3iFbpBrAMQnmzqbNXz4Yb/3z3XbqlStaMpHPGN9emkr8Sxju41aoZ7X
 T1LxWDr00rfFtrYdaKD34NWt6AYMVXxwKRavH0qK24eWYnPI1NIkus0/AHWxXM9PXLd9
 oBI835miKQVS2G9CtW78Q4ybFV1Mx0J+mTd/2UBbA398Fwiz/UHtwTejcrI22uN+xZsx
 P0pBgdYYTGDETZMu1738OCHx00OU0Wlg1IZ0xb5c5fFofbUwQplqObJA6MJRpg4qmD8n
 BmV6tGKzHIZ6rNPqtHT0cq8QTvU96br8TQ7Ff5/X8gzw8QlEXQ2onD/UMt6uoI72jxtz
 rqTA==
X-Gm-Message-State: ACrzQf3/gZdkIzVzUNIYQsRozCdBG1iQyL8OywzYpAYm8arsp04/or10
 2Otb1RqGsK/onlqfANtN1X0v+g==
X-Google-Smtp-Source: AMsMyM7BtBtmkzVhzMqbBjMRWWuoGLtvME2vPKpvGjYC0igInyF/XaLfa2aqQ+WsCiC4AkWxcu0ApQ==
X-Received: by 2002:ac8:5884:0:b0:35c:d949:30cc with SMTP id
 t4-20020ac85884000000b0035cd94930ccmr13698635qta.528.1664100699573; 
 Sun, 25 Sep 2022 03:11:39 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:413a:430d:cdd2:88af:d4b3?
 ([2605:ef80:80b2:413a:430d:cdd2:88af:d4b3])
 by smtp.gmail.com with ESMTPSA id
 dm10-20020a05620a1d4a00b006b615cd8c13sm9837173qkb.106.2022.09.25.03.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 03:11:38 -0700 (PDT)
Message-ID: <558abb7b-7c8b-f10a-1381-8495a47c5809@linaro.org>
Date: Sun, 25 Sep 2022 10:11:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 4/9] hw/timer: convert mptimer access to attrs to
 derive cpu index
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM cores" <qemu-arm@nongnu.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220922145832.1934429-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/22 14:58, Alex Bennée wrote:
> This removes the hacks to deal with empty current_cpu.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

