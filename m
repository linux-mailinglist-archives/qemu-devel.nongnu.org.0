Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DAA397B7C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 22:58:55 +0200 (CEST)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loBTS-0006os-HI
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 16:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loBS8-00068B-Bs
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:57:32 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loBS5-0005KC-F6
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:57:32 -0400
Received: by mail-pl1-x62c.google.com with SMTP id h12so7536657plf.11
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 13:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wIuuXLJlrhiOCjtOWVSMWKLO0G6LMG+U9NKurWmId9U=;
 b=SM3mNGYY9cSgcg/w9j8Gl/7qKgfMgQKnMl8yX37YRiVuUbZikWQnSoIIr4g4CdTNKo
 nfJ77tXnNikUmFgsfg2/22Up6sx8NFY3FCa/wn+Cs4/tHLFkYOltMDtpF1ywY5Ww8g+d
 Ejf2kN1tHFr/v/2XeB2HIKAM40N7EI7hu1calCgm9MHqUqJHi9h4SIk/rPZRwOYg4Hwj
 5VBs98FWympbM97UZV/k6smix787nDK6C3a1m+eHHQ8AmvlXGn5tmSqs7PDFMucpyG48
 2cXnBctTNkeHz13qopGjm8irojZqZhVgNZPZwxqA+IdcsTHJs/rkLRu4QZ7LNEvk0C0A
 tpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wIuuXLJlrhiOCjtOWVSMWKLO0G6LMG+U9NKurWmId9U=;
 b=GMfbNYQHmWIG//355Kk6Z+PzEwLJ1Jvy5TrXgpYfFuJgEErBfQevWbyNKXB90PM2wb
 WzbDBC89QFY4w1i8KHnuPEE4YLpZDBTlEau4nZG1XZUvRuS+Jot3RaQUCVStlMrJvLKH
 BlN9jl20LDFMpTSLncVp2C+gDVWN9/d/fl54mkknXplrmPI0yYt63AOGb22OM4CYElqz
 EjnMt9ahMdMbjevb7388iF+HU6aOPdu7h7t82BdxV9DBrzCzuhMiLqxRCDew777s+kNN
 ONyTlojBMDYHnqJuqESaz14+m6rLABhpjJ6j0kCUvtndj894TF4ODIfCyruoshEY1SQ7
 qt1A==
X-Gm-Message-State: AOAM533G3UjysDXKBnNuHEsxc2TYcMH1BbVcrSSlCYnalyr4T/GgeVlA
 XXuPt2exeFvSAUjIVCOjiLicsw==
X-Google-Smtp-Source: ABdhPJwXrYlahpZBikvCdFrpp8u4He9RMhS8WboXGDbThBJFPKGeoJ+kjsE5nBqj1oWGTZMY7lrAhQ==
X-Received: by 2002:a17:902:6a86:b029:104:3ea2:1ac4 with SMTP id
 n6-20020a1709026a86b02901043ea21ac4mr13899201plk.21.1622581047882; 
 Tue, 01 Jun 2021 13:57:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y205sm2737061pfb.53.2021.06.01.13.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 13:57:27 -0700 (PDT)
Subject: Re: [PATCH v6 14/14] target/ppc: Move cmp/cmpi/cmpl/cmpli to
 decodetree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
 <20210601193528.2533031-15-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb59c1df-cee4-3f40-aa77-fd966d49bb6e@linaro.org>
Date: Tue, 1 Jun 2021 13:57:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601193528.2533031-15-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: groug@kaod.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 12:35 PM, matheus.ferst@eldorado.org.br wrote:
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -1,4 +1,4 @@
> -/*
> +    /*
>    * Power ISA decode for Fixed-Point Facility instructions

Watch the whitespace errors.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

