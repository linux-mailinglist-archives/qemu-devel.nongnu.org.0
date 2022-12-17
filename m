Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BF464F600
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6KxM-0005Jn-D2; Fri, 16 Dec 2022 19:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KxH-0005BN-UT
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:21:33 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KxC-0001ia-Nn
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:21:28 -0500
Received: by mail-pl1-x62a.google.com with SMTP id d3so3825680plr.10
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nulFq5TjzLQ8xs+49vqCOIkA3787H4Gf5JKw32N2yFQ=;
 b=NXH+7DNudxaoN1EQdTcElo0zGPv2PSDJyNp6aICRZhTUFyliGOL8soHLafuno2vFxc
 mebgw5iyBiHWJv1t9gUkt1SmpsIB8JEVITWf4MuBXstIwvyQOcTqxSkHa8s9/D+Jwbdb
 QZBcy5tiubct8cPVf5bdjDEDOrmhG2sWQmh3pMujMqcueWtLHe+i1C6vSU52iIL9hapd
 k7OUVKTZjSsEVm6qh7jVkDs6kGgPbhcBmBng/CtnH2XiDJvI8P0gr/GBdfArhemJy4Hq
 GK3YpG60PNF0ZUb/qOgBfwa/jGSNP2gnWL/sGyn7tlKBbpFGzI7jio2ImFObNQZUD79d
 6M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nulFq5TjzLQ8xs+49vqCOIkA3787H4Gf5JKw32N2yFQ=;
 b=dSLnI1Nqv17mwEjbY7B5ep9rRRDCfLGSmdsWnFy7st7/u/TU4uSEcjFluObPpVDFDD
 nGBpKS6M/rihKlygBSAlXEXiEeV0aDjuskD3CPWCO7ITyv5d7kUC4qWrOdrIsPzvz/MD
 pU5rqKgTvqL0czD79BgqwAj1LCxNzQ+0y4S8sQ9M45gMwQzyrNSGgGM/8WA4Zi+QIPNM
 m2KNF5tOzyEz9+1CaF6ilt3hgnYqo8547iSXRHSNPKKpXTdJYmCufu69EUrF7wXLpj9+
 t5bFEku8KR5RIJhGqjCNcYKwaZ8B2+G7izwL2iaHhO5JL3zc231COhUj6gAUbjEdU0S9
 2eEg==
X-Gm-Message-State: ANoB5pkitoGcvK7C68MIEhOiS14ABMEWerQ+zcT+3vDVhhZG6LI+Dj9h
 F5kaDkiuFj6Jo5WNx+KeWYZPUw==
X-Google-Smtp-Source: AA0mqf4Ofy1k+FYeb+lnkFcw55EBfaXzcupXUe4TmuYb0yQ5yLAFm8DUgg5C7q172UCheAG88msy2w==
X-Received: by 2002:a17:902:7104:b0:189:bf5d:c951 with SMTP id
 a4-20020a170902710400b00189bf5dc951mr32725654pll.26.1671236485100; 
 Fri, 16 Dec 2022 16:21:25 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a1709026f0f00b00172b87d9770sm2199944plk.81.2022.12.16.16.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:21:24 -0800 (PST)
Message-ID: <05e8c9ab-3add-f84b-1441-e4576962302c@linaro.org>
Date: Fri, 16 Dec 2022 16:21:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/5] target/i386/cpu: Remove dead helper_lock() declaration
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>
References: <20221216220158.6317-1-philmd@linaro.org>
 <20221216220158.6317-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220158.6317-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/16/22 14:01, Philippe Mathieu-Daudé wrote:
> Missed in commit 37b995f6e7 ("target-i386: remove helper_lock()").
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/cpu.h | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

