Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ECA1F054D
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jun 2020 08:05:34 +0200 (CEST)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhRxV-0007uP-Ms
	for lists+qemu-devel@lfdr.de; Sat, 06 Jun 2020 02:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhRwI-0007NR-Em
 for qemu-devel@nongnu.org; Sat, 06 Jun 2020 02:04:18 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhRwH-0005Wa-AO
 for qemu-devel@nongnu.org; Sat, 06 Jun 2020 02:04:17 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y18so4547269plr.4
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 23:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FoAstWXV4BqbscVcL6YQoeSC7wJ+dmUeiKFtB+jndLY=;
 b=CErzuSLOSzOMOpdPwaKMTKLo7PH0pG7iJ8UdUeGnJlW1h+m9aIsHPP9Lhd4883ltzq
 BDfv+Gvrro10VdJSuyFQCKixPDgMiEDbQ/SNpFTOsEuxn0IS+4Jjuk2qcoffm/vp2viy
 gQ2J2sb6w5I3wOTGepiRlF5pAj2SnxPAraq1xPu4M5TACwqhIpR5HmFvb82OgXn9kk8X
 hyLxQ4j6Vb9TWX3ON9NCm126+Fj59XTiH1jXNxLJKOR+bubh/BgTYLcSW4saOqvcTbZd
 IzGG6otsAupPPbqaayR/I85pXcnZUaK2KE3M4mQlPEMFMnb/QgqbWI4Gxx/xWEXRlYIB
 p/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FoAstWXV4BqbscVcL6YQoeSC7wJ+dmUeiKFtB+jndLY=;
 b=YU7nvmpJ7UgZq7a5N65AINLjwkGNRR0MDWG9/tNEROMOe61IL8yvu79xDrL1jac0ou
 AjXEaHrQost6AMuC+iWavpwvF1M0LSwNoL4GizKZYxqGtOa3iAp+j32tjCBO+mfFFevG
 AjQ73bHw2dTD5Qnsen7vhOL7/5Sk+p1N6OUgI04KHr3Fz0hjtEEurBwFASsEdvuFXDGs
 zNsKqiLnJB2lgP3AWoPTk/oTQsJDHY2JAeKW+Z2bq0GNxoGkPWt22ncH3ZOhjPCrmLD0
 Tc0Dfo7FiwpaOCkCD8DfHg8FMZjxVjPhj78ZjheUkQxKjPxCHo9NbnVAErffL3GZ1xTm
 fZow==
X-Gm-Message-State: AOAM533YRC/2xbEUYJGPXxQmsQojzzvcZkmMsSoGJKpEIRpRxpgegfa3
 0JtvJtv94uTitNwbnazZLQO0DQ==
X-Google-Smtp-Source: ABdhPJxNZ1YH4hf4ey5EBLGJr3XCiForEGogVlc1LgL8i8EAdzvDDNMfHBlT75+Xxvb3cntDrpmdVQ==
X-Received: by 2002:a17:902:7682:: with SMTP id
 m2mr13291453pll.281.1591423455641; 
 Fri, 05 Jun 2020 23:04:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x11sm1247610pfm.196.2020.06.05.23.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2020 23:04:14 -0700 (PDT)
Subject: Re: [PATCH 1/1] target/ppc: add vmsumudm vmsumcud instructions
To: Lijun Pan <ljp@linux.ibm.com>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20200605051415.53557-1-ljp@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25fb337e-3a34-26c1-8f49-f32ca4762c54@linaro.org>
Date: Fri, 5 Jun 2020 23:04:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200605051415.53557-1-ljp@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/20 10:14 PM, Lijun Pan wrote:
> +static void vmsumcudm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b,
> +			ppc_avr_t *c, bool ca)
> +{
> +#ifdef CONFIG_INT128
> +	__uint128_t prod[2];
> +	int i;
> +
> +	for (i = 0; i < 2; i++) {
> +		prod[i] = (__uint128_t)(a->VsrD(i)) * (__uint128_t)(b->VsrD(i));
> +	}
> +	if (ca)
> +		r->u128 = (~prod[0] < prod[1]) + (~c->u128 < (prod[0] + prod[1]));
> +	else
> +		r->u128 = prod[0] + prod[1] + c->u128;
> +#else
> +	uint64_t ah64, al64, bh64, bl64, ch64, cl64, rh64, rl64, th64, tl64, ca1, ca2;
> +
> +	ch64 = c->VsrD(0);
> +	cl64 = c->VsrD(1);
> +	mulu64(&al64, &ah64, a->VsrD(0), b->VsrD(0));
> +	mulu64(&bl64, &bh64, a->VsrD(1), b->VsrD(1));
> +	addu128(ah64, al64, bh64, bl64, &rh64, &rl64, &ca1);
> +	addu128(rh64, rl64, ch64, cl64, &th64, &tl64, &ca2);
> +	if (ca) {
> +		r->VsrD(0) = 0;
> +		r->VsrD(1) = ca1 + ca2;
> +	} else {
> +		r->VsrD(0) = th64;
> +		r->VsrD(1) = tl64;
> +	}
> +#endif
> +}

I encourage you to enhance qemu/int128.h as needed, and not ifdef this.


r~

