Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5B1488796
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 05:03:50 +0100 (CET)
Received: from localhost ([::1]:35116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6PQr-00085f-Fd
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 23:03:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n6PPq-0007H5-Vk
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 23:02:47 -0500
Received: from [2607:f8b0:4864:20::1032] (port=37555
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n6PPo-0008SV-I3
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 23:02:45 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so18280468pjj.2
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 20:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eIdbjj3P6vQqY2NYmT0vtSK26qxsMO8X5S4ksWcSKaU=;
 b=vEre0+TJn/s0LzVSYTSuPrW1Btm/E6rtqLCDDxKSZUvam5qKUDJsb6KIZd4Dn55rSq
 0Cek0oNmvXyWrOIMk/gIfsHbCMLxegmdRA9r0+setXPgK5f0/zkR6nUE3BGaRkYh5ZE7
 ZWA9n+Crxq820oEH9eDOU4n6Skc+fPNih+bCeH1Amyx8pc/BlghepUJDPTWCYKentJIH
 v3+DW7Yt7b77hN2+6ydvAGbCYOeve4gLaOZlHUBVFzn/vP9xSEsgLdKijjyJG+DKvRgG
 8ia3ZhyjZXcNHzGtVUdAz5MqHcJhBis2dDsH0ffFVolOsWWoMNb4npjIy8mxIS5N+e6l
 6+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eIdbjj3P6vQqY2NYmT0vtSK26qxsMO8X5S4ksWcSKaU=;
 b=IuvfAaMF2WjcPLk3CE3UERCWYtzFK/m4faAC2kIK6fkIpI0qsG4hNEmGTRv1r8YQMD
 xycTidKna5V3+VAVgwQzFGu71VDb5lRWxvd/07rM9Sk0BZX59pKNvpSgsLAjJwM7N55v
 K14ts4cW18fp/mASxlX/oIilFSf5PBsYuu99ayMPR2YUorDIk7I12BrvmX04I/cueba5
 EHUo9eUNFJdnBpv4liI1UnSJXUFtSk1jtjz2n3jDrScTwLCSqs8ZAg0aTIVNk4RYZvKU
 JeTkbukoh49MejKRqlawYU9vnyjUpEk1HLeWAfGT7R+BCWJPghmKruNW254UuIInBlft
 qPUA==
X-Gm-Message-State: AOAM532/oJwl5cD4cH+OEJ70fDOLpdxG7Qw80ijDy8ga6JNGwg2TbkhK
 2JDvWjigFupVUwOhmFfaxVU3/A==
X-Google-Smtp-Source: ABdhPJxIbxYb8D0OxFuXw+5FMZy5r71bsYrQuvkLEjsfX7a30u3IWcBSwo7FHNRXltlb4qyrkIYmsQ==
X-Received: by 2002:a17:902:7c05:b0:149:a3b4:934c with SMTP id
 x5-20020a1709027c0500b00149a3b4934cmr43082304pll.42.1641700962575; 
 Sat, 08 Jan 2022 20:02:42 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id ng18sm1866404pjb.36.2022.01.08.20.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 20:02:42 -0800 (PST)
Subject: Re: [PATCH 01/37] target/ppc: Introduce TRANS*FLAGS macros
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
 <20220107185653.1609775-2-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bdf5a548-304d-b345-75e9-f8df124446bb@linaro.org>
Date: Sat, 8 Jan 2022 20:02:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107185653.1609775-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 Luis Pires <luis.pires@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 10:56 AM, matheus.ferst@eldorado.org.br wrote:
> From: Luis Pires<luis.pires@eldorado.org.br>
> 
> New macros that add FLAGS and FLAGS2 checking were added for
> both TRANS and TRANS64.
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> [ferst: - TRANS_FLAGS2 instead of TRANS_FLAGS_E
>          - Use the new macros in load/store vector insns ]
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate.c              | 19 +++++++++++++++
>   target/ppc/translate/vsx-impl.c.inc | 37 ++++++++++-------------------
>   2 files changed, 31 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

