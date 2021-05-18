Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D43876DF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:47:27 +0200 (CEST)
Received: from localhost ([::1]:52732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixG2-00043D-8b
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixCy-0001BN-Jw
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:44:16 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lixCw-0003k2-A4
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:44:16 -0400
Received: by mail-ed1-x52f.google.com with SMTP id h16so10531401edr.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CwoqYTsE5sJ0vcf/gmzePZhOnMqbJmbTbU09GZFU6hw=;
 b=ExNPJaM9rvRNZTAjIOjHSSOtgPZcTwqM24zDEDFqVYcFemvXeytvtEDzZQeNZlHhyX
 xa5FhKnibRVk/JfuTOYcNx42dP2ByjbrXpOwdvyBNyB/Jqv2lp1OiM4Af4h3kZS1icSQ
 Fg3H2wfMMpwR5n4F+TlMaiX8FTJ3CMK8TEg3tjherPT84egUa24gZETjNSDxXzkcsXT6
 5u2GJYk0eWiKAbNGakM594mmpYjDWvrVLK6uTC6qa23WLAlZ/iEOiaaqAuKcBi3p30hV
 0DvbSVJ0BXM7Ic5IsCcTMzOMoItqBvDt0dCtdzsw9WbNtOIIVJ67HIuHAz1sKU5o3mkU
 MLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CwoqYTsE5sJ0vcf/gmzePZhOnMqbJmbTbU09GZFU6hw=;
 b=NB9S0q09SYoBHu5vpVNiyB3rrLVw2LYApcMY1aAK6VJG6GS6U5zCYMcFHZ1LGCoKGL
 xMVjxyPyXZqWsFEQ6apn5AIA5Z6h5gQCdM0eXyGr0Jo0bafe/7SfnjStFMpHAMUMvcrB
 YrdumtkZmJClKi8IpZifKdXHCWDr03NFzxwuRifg4LDV29UieU9951Z+52607j2moaEH
 mxw60X31kKLtI/H0dImtOE7+/dGGLqqOJFcEzCNnYrCxbeZjpWAtcN5EJNMIlSQpLSIZ
 hEXNqs68Fo/qjVvjcd+fRF06KxHNKrEOC+39LGM4Rrek5eG1ebxyUK/BtUHe2aBLHe9e
 osLA==
X-Gm-Message-State: AOAM531hGQ99dtmrJLFlRsKMgHmVOHD9++iMLrYiaEQHTY4RxftMFEfb
 saK2SpZQseQgbe7NfR5r5RvNogrNVkNBh8eWseJDqQ==
X-Google-Smtp-Source: ABdhPJzf5Xxxwbrd9uoLVCcfHsaXkD9qOGwT2kWKV4QkSibvPzMtgNPWj5QR88ETWBOplZVyVMoRYOovSpRDMbmFLfI=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr6286515edv.204.1621334652906; 
 Tue, 18 May 2021 03:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-3-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 11:43:56 +0100
Message-ID: <CAFEAcA90mh3P26ZKScTb_aHxu70LtSAX3kbtgpTbDQ9t-wd+Vg@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] target/arm: Unify unallocated path in
 disas_fp_1src
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Apr 2021 at 01:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

