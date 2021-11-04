Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D064458EE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 18:49:26 +0100 (CET)
Received: from localhost ([::1]:59902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1migrd-0002I6-9K
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 13:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1migk2-0004XW-M8
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:41:34 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:35718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1migk0-0005B4-Mz
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:41:34 -0400
Received: by mail-qk1-x72f.google.com with SMTP id az8so6438820qkb.2
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 10:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bVtRGvwQkOZglPUm1/lhPGnveVz665/c/gNUKw1oKuA=;
 b=Mwd0DzoNW07QIikrULrVz4v6iLS6VRTbJjLzkelebhA8oySx4a2zUY9ev8u71+iqJP
 ZVFTiQnGwQPEInlozY1G52G9fFgcpy/JRj/t6Ui9PqLqE0e8V4FzgNGnNdHaJ69B/yvm
 NfNItOuhehofNsx1fXPcr4dLdZP+KkKwogBkRodVTOtWDgLMLrNEs4+FHtczCsFHUEsU
 o8TK3gifXL7Hqcjq36mKP76hhzLVDM1MaspO+oG2VPBBA4Uf8bf9ibp0vqZUcx5oEKqv
 d3T1jHabjbkJA11oSxF7sRRDENG9YnIEYH0SwfAnrcJ1S1sL4ToXHQR0BWXx5ZJZAZ2L
 Peeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bVtRGvwQkOZglPUm1/lhPGnveVz665/c/gNUKw1oKuA=;
 b=EQF4V4YD/RpOAanK2vlfosULSolOeSI7yvxJkdnvPliEtl6CGCtOlEkVnqv9O6xCxc
 Z3k92arToue5TvKS1utJmoP0wB9F7z3w+utSRymrKLZGgcsC8aUlcXHJOUsxJkZQFTpq
 p5uc/wLz771mWmPVV6PAo1N/GOmPWpSJyZLlpEovu7SjzobtHPiTGT0E88HJqNN+rEXZ
 BdFLQ8THmvPGwGMzPLmhDkYc1PADtNzFJbL7PrnvT8emwx2IUyHeS9xPd00J16rBefRf
 R32P5qdnhO7Bavy10RisXsHmJPDK8IXKRR1sdy3A6J652WAA+NLI6rOsxuPKzf8PEprx
 KnZQ==
X-Gm-Message-State: AOAM531uGXlXRmxVQhtQdoMAhLVGhi57UGc7z+RZU0EO8Pc6TBx+v44S
 5b9NaOv3ZCfbBbGeDeOZVUgcTQ==
X-Google-Smtp-Source: ABdhPJz2Ye35im9T7aU/otZ5flIRP4dkK5zENznGlhCL6sa9ym4IIedQXtdUrdsiBir1qOMVfLR+JA==
X-Received: by 2002:ae9:ed50:: with SMTP id c77mr6952493qkg.187.1636047690599; 
 Thu, 04 Nov 2021 10:41:30 -0700 (PDT)
Received: from ?IPv6:2607:fb90:f802:6e0c:4407:203:e794:8e1f?
 ([2607:fb90:f802:6e0c:4407:203:e794:8e1f])
 by smtp.gmail.com with ESMTPSA id k2sm3973937qtg.35.2021.11.04.10.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 10:41:30 -0700 (PDT)
Subject: Re: [PATCH v3 25/25] target/ppc: cntlzdm/cnttzdm implementation
 without brcond
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
 <20211104123719.323713-26-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a975c894-c49b-3f04-70d4-5bf461ac4e07@linaro.org>
Date: Thu, 4 Nov 2021 13:41:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104123719.323713-26-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 8:37 AM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate/fixedpoint-impl.c.inc | 31 +++++++++++-----------
>   1 file changed, 16 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

