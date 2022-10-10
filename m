Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210525FA01C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:21:00 +0200 (CEST)
Received: from localhost ([::1]:32852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohteM-0004Nh-JS
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohtZs-0001EI-BL
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:16:20 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohtZq-0003po-SA
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:16:20 -0400
Received: by mail-pf1-x42f.google.com with SMTP id h13so9450189pfr.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=czxmvoMLlSY8gbSD1RHgaJaijEbZXHqSoOssM4epKCY=;
 b=reM7XgIQ+wQgg7ZlrYllb9/TQnSJeC0MJTNj4X2Eb82ThAycFa6GXzb6+mZTGB6LtT
 39sFZu5t9MeWQApooUAC06TINXRawuDXbB/1m96KcNvm6S6vyIjEtD3MC4BsJKy/o6Lu
 vy06nioFZRPj1mEvb/0wVeG1PYJQJCImbdR2mmJNb8oCLwH0dqQG2X+ecYXwVmDaFZug
 0I47t/81n86JrW2yvIxANHos10Bdd2xUzgk7zAVDq5YHXSESjLZut6PjBFo2uQp07pOT
 Z9DElZGO8UhjmNmWXNNBwx8iwIY/nPGMmXOIZWyzwVUsBuP+HA9SXo7rS8vcvddpZGyZ
 IVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=czxmvoMLlSY8gbSD1RHgaJaijEbZXHqSoOssM4epKCY=;
 b=a3kh1ar3h4dTIzsXvrcyUXa9TvRJuCgf1mQNrD2TxrbKZSpcGYS7PVYfaUQmI/5NLG
 5V1KUMJ/EBUK4YlukEWHQ11N12stVKD5jDKKjFxrO4AGcHBFRx1CsJXBJT7zV6yAO+PX
 o8aVtTq7OgBVAssM19HE+FqJKdElGhfRtJQoi3VnNdHiBaetoIh1TIGLe5oT1/5g1Hxd
 EQnpDYwJ2bfQaHh8MrS49eZxM5HaCCmalimEcJmTRo9aq1YkfAmRV/A84li4MHh9IWSh
 Nb+pcTW/lPqT4rg/9OY1qc9huOliNaVdCEUhYJLE/IRpPPolR8N/mqTaUxsFYzz2vinp
 VI7w==
X-Gm-Message-State: ACrzQf1JqtksbihDRuSFls5AxBPHSo/07+YBR/D8Sya4WYxesiRBHXTb
 ShmoEHe8M2rwspNM01ySAGuvkg==
X-Google-Smtp-Source: AMsMyM4myD9L1EuGPbB7g/OLEkOZjN+Vq+RsB2xreipbqfqkZoWcMkZ3dI75smW82UB6qUKIODZfWQ==
X-Received: by 2002:a63:e909:0:b0:438:c9c9:61e3 with SMTP id
 i9-20020a63e909000000b00438c9c961e3mr17027204pgh.194.1665411376856; 
 Mon, 10 Oct 2022 07:16:16 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a170902684800b0017534ffd491sm303204pln.163.2022.10.10.07.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 07:16:16 -0700 (PDT)
Message-ID: <eb00a974-424d-6468-ee91-7cb650cfe0fd@linaro.org>
Date: Mon, 10 Oct 2022 07:16:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] hw/arm/boot: set CPTR_EL3.ESM and SCR_EL3.EnTP2 when
 booting Linux with EL3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Jerome Forissier <jerome.forissier@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20221003145641.1921467-1-jerome.forissier@linaro.org>
 <CAFEAcA9bWzD5gKyHGOsz+8KCH1ykgU6sx2soDTVKiTHEa0D7KA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9bWzD5gKyHGOsz+8KCH1ykgU6sx2soDTVKiTHEa0D7KA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/10/22 06:16, Peter Maydell wrote:
> The doc also says that we (as fake EL3) should be setting
> SMCR_EL3.LEN to the same value for all CPUs. Currently we do
> do that, but it's always the reset value of 0. Richard: does
> that have any odd effects (I have a feeling it clamps the
> VL to the minimum supported value)?

Yes, it clamps to minimum.

> Should we be setting SMCR_EL3.LEN to the max supported value here?

We can set it to 15 universally without consequence.
It will be clamped to the max supported value elsewhere
when interpreting the combined EL[123] fields.


r~

