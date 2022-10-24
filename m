Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E81C609AC1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:52:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omrEm-0003E3-HY; Mon, 24 Oct 2022 02:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omrE1-0002fO-W3
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 02:46:32 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omrE0-0000Cd-09
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 02:46:17 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g12so1772619wrs.10
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 23:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Epqq8F0IEXyV5guURf9EVUBuC8wp/Vyr34qWgjLBpvY=;
 b=RXZRd48qAwMNvCj1cfJN9wdSvqG767liJqY8dXcMULV/dIClfmxNaZxAgvbypPGmmB
 cbqQuY1G4VG2bOvppoLFrr5ZLZR4jAvmJtmRSW+AGiQwwLNYkpYR4fzOv99Etws9pYxI
 hy5xE9GNmydc2uzeYKgNfwTLXPz9bWKVAzUoIIqWYT6bVVrQoJjVjmiNxOlpxTjIfwoH
 F17UQUoHNi8COmtr9ERargKfsjWFwJu5SIJUSWgx2xGD65zPBZXGr/5t59NNyekcY9ej
 E43meXGdKFHZPI+9EbQicxbW6PFqQ1jTWkeBqBoxUPqtEYEYFbmCFyqLLYzYqYYQXa8c
 XQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Epqq8F0IEXyV5guURf9EVUBuC8wp/Vyr34qWgjLBpvY=;
 b=vUZqjhTB3u5uyXI+YmqaOTjm/V3NROVIKSqmWwrSyIyo3iEwEv0EVRmmekrJ6YtnwV
 ud2xD6OmYc+bql0ilmhOwRQZiqrPNBxW4q24R83dJxXLzzgTh53BpppagSf4sEEqQHsm
 AiFJ3YCj3iz0Cfurn0eZNxIwpG1M71urezAlXl8w3qwBpE4epNKKg48uoSv1tT2SaiMf
 U5+epExXgemN2ue4Qt25JdRc+OuFxlPKVOID8uwUnhbfs1dypapZ7+QP3kc1KgUqp7JL
 SXEUd6KSQ6iQdZrSxNrl42uPI9DgX63qEgk1i/lzLCTwD/WLMUOXsidwtwQQuVGApZJU
 UoNA==
X-Gm-Message-State: ACrzQf1ttBle3wtkvlT7i5NGSLT6tzLE6W6Y4a8NSEGxXMGTr+gkf+b0
 12Y+8KCpq9oPNlsoNeNGcIcJdw==
X-Google-Smtp-Source: AMsMyM7KBAZIQN0kLXHsSd72SZeJPOnbCv9mhLlKTkQj6cfkrWYrCq8m/gCyK3rP71y99Owz80GMFQ==
X-Received: by 2002:adf:e305:0:b0:22e:6b55:3ed9 with SMTP id
 b5-20020adfe305000000b0022e6b553ed9mr19664878wrj.684.1666593974501; 
 Sun, 23 Oct 2022 23:46:14 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a5d6290000000b0022ae4f8395dsm24836852wru.96.2022.10.23.23.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 23:46:13 -0700 (PDT)
Message-ID: <87119fc5-bd0c-5046-7651-65e1ba833178@linaro.org>
Date: Mon, 24 Oct 2022 08:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH] accel/tcg/tcg-accel-ops-rr: fix trivial typo
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <5dc556dbe241ae03859b7890d1998de5c77b7c6c.1666373742.git.quic_mathbern@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <5dc556dbe241ae03859b7890d1998de5c77b7c6c.1666373742.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/10/22 19:36, Matheus Tavares Bernardino wrote:
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   accel/tcg/tcg-accel-ops-rr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


