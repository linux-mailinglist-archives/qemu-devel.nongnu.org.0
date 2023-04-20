Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B856E964F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:50:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUcd-00041K-Kp; Thu, 20 Apr 2023 09:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUbg-0003hz-6g
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:45:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUbK-0007sF-9g
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:45:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 e13-20020a05600c4e4d00b003f18e479d9aso354178wmq.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681998328; x=1684590328;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EafrFWI8Dvyov2ZouB1636vfnUzieBsU2B9legK09uc=;
 b=Mi9yimC6nBVGyQoyf+OhTY2C+cznrBofRyR+OsmwNjyYyTCsxoJe4G45BAqUyd3PAg
 bDR2GxZvQNP/CoaHyXiH4nDbxFuerEOK7wiJAyetVRZ75t1FDYt248WKxfA2E/p3kyT1
 w/qWIFgiBM1qS1j9zLvGzcTRPNF+GAwXvlEW+kmaxCSmdJSqpq5RoLGSCixZsRO5J1Hh
 hwUiS/DTnnVwEut5Tka8/qwNkr7tUf2IzlfcjmwVjnnebrzGzV56nGE2+mT+ozYj4ZX0
 hLQtPrSEPZXprMrcF09yFUVi3Ce2/OhG8+PcKML9mSja4JA0JpbkY9vTBx+i31neiNTd
 9rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681998328; x=1684590328;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EafrFWI8Dvyov2ZouB1636vfnUzieBsU2B9legK09uc=;
 b=dhb8zNsGuBfpf4P2WwQMaswXxYKlA0/KXBhwXulmvnxqzzTx/Noh/gYzLf14v8L7F1
 0ZTm/cDoDAe+2jeAwggjuPHkFFBdabVrp+HFoj86CapniH4ZUHG1Lfc2+XSTFMeSdxYp
 270Jks+2UGAKTMryQRbHqXaOhEe8/AabbGM2pF38kH13noZPtCgA+6a9zt1MWZ2+AzWo
 EJpK+T7Vf7ZAtOLF8hArn+9XOok1p/rIuFEYHJ+MiEoiUXMx/EISDYbAP+nj9xw49GF8
 91fz590umV9LphV2L8sDkOoXNkvzOgo68CNQErwC+/jTVOkDdx+Xh9tjywNETzx8HPFf
 IgOA==
X-Gm-Message-State: AAQBX9fI5OVt5algABAO0lqycsyHgth4U64B1JEwDW3SKZJs9thQZri6
 bi7LpwCcP19C/UN2qb3IVKpe40stHUvqfv60c7ZTkQ==
X-Google-Smtp-Source: AKy350YmpeFqsfZIlg1dl7hD4Omy01Puwx+wl+rwXe6NrF++Q/qrhmTqdSdm5UvQdx8WZLykzIpzQw==
X-Received: by 2002:a1c:f213:0:b0:3f1:8308:d39e with SMTP id
 s19-20020a1cf213000000b003f18308d39emr1393898wmc.9.1681998328626; 
 Thu, 20 Apr 2023 06:45:28 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q17-20020a1cf311000000b003eeb1d6a470sm2128493wmq.13.2023.04.20.06.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 06:45:28 -0700 (PDT)
Message-ID: <421d369f-40b5-60a2-f763-cb496943918d@linaro.org>
Date: Thu, 20 Apr 2023 15:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] docs/about/deprecated.rst: Add "since 7.1" tag to
 dtb-kaslr-seed deprecation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20230420122256.1023709-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420122256.1023709-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 20/4/23 14:22, Peter Maydell wrote:
> In commit 5242876f37ca we deprecated the dtb-kaslr-seed property of
> the virt board, but forgot the "since n.n" tag in the documentation
> of this in deprecated.rst.
> 
> This deprecation note first appeared in the 7.1 release, so
> retrospectively add the correct "since 7.1" annotation to it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> My mistake, since I added the deprecation.rst text to that commit.
> ---
>   docs/about/deprecated.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


