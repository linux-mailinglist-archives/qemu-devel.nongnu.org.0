Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05924730F0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:54:51 +0100 (CET)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnf8-0003s7-W0
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:54:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwnXR-00021F-Jk
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:46:53 -0500
Received: from [2607:f8b0:4864:20::1036] (port=42880
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwnXP-00030C-U6
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:46:53 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so13684153pjb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VukFyaD6WE0Y3T6gdafUTv70NyxjQV2g9QIYwEUmJiQ=;
 b=DXBeClX01l4kBjHs58RJ5Iid9j0xuY45VJLBzt61eIdEXVDghJez3ve9089bD73jWu
 VhSY4Y6xCsfwvNTB9E5TlX7pv/qbQHR94MQdU/ymiZsrvJTMyao79Q6xxf9IjkOjj736
 ZoNxvZRF0NIahsEalHg+g3z7zua1znkiNK2tE+Nax+OKLhW0SpQw9yn4l9bTaABcIlcV
 3Z19+jaSA60WWS6J++Qo029X2OaqKW6VvQOyJzrAIK+fY4rRthvb36RoXz0eyx5kkMhz
 ZFV9Y4TJV/M0Cxq/A8jGZaONZ4AVQSVYSJDZ3v/ARbCgpLxVza/yB/EGnWlM/CLGRnf8
 IMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VukFyaD6WE0Y3T6gdafUTv70NyxjQV2g9QIYwEUmJiQ=;
 b=rvRoRn54s93euzC58663Cq4w/N+ZDbCSOEO7nOwzWAuhsNu+9BQoI+V6Hdw9GXfgyu
 gRwN9RrOQqDMWCb0Ai1rkxG5mHLrtrbOGB2vamxYZokd/0BpiW4sXTyYFOAfA3k7ZIWL
 bvpiSy+481qw6hieG4RiolCroBaSBdNii0vYXJIL83G5qEsKluJfMVgRhSl5nMXCFBP/
 53nW5A2aP4aAm3xM52mm8JYrsi+aWW7iIYCi7wmkDr+8sFdaVqCzdt6AZScbjmGaWkb/
 aNxLDODbqSJEOYdDSvjLHZVPlujm7qZQaZmT/JkwmwgO3UlIoQ9NKVICfnFNX0zIblKP
 K03A==
X-Gm-Message-State: AOAM530J/lUak0SDj4zql/fAPluppd9v3GEG0Arl7O99PVMyfjHAtBGS
 wbkggX9Af9mxLKdVPhy0yehSWw==
X-Google-Smtp-Source: ABdhPJx/5zIaDA86Tj1sua01xow8pxKSmcVsjMrKhcBmAUIezuhOLTu1V98jC4Bz2t4P02vwJyJHNQ==
X-Received: by 2002:a17:90b:3a83:: with SMTP id
 om3mr45776136pjb.0.1639410407541; 
 Mon, 13 Dec 2021 07:46:47 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id u71sm4883586pgd.68.2021.12.13.07.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 07:46:47 -0800 (PST)
Subject: Re: [RFC PATCH] target/ppc: do not silence snan in xscvspdpn
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211213121320.947362-1-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ecdb8bb3-30b1-ef61-ada6-6389ce2c4318@linaro.org>
Date: Mon, 13 Dec 2021 07:46:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211213121320.947362-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
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
Cc: peter.maydell@linaro.org, danielhb413@gmail.com, groug@kaod.org,
 clg@kaod.org, alex.bennee@linaro.org, aurelien@aurel32.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 4:13 AM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> The non-signalling versions of VSX scalar convert to shorter/longer
> precision insns doesn't silence SNaNs in the hardware. We are currently
> honoring this behavior in xscvdpspn, since helper_xscvdpspn handles the
> conversion with extracts/deposits/etc. OTOH, xscvspdpn uses
> float32_to_float64 that calls parts_float_to_float, which uses
> parts_return_nan that finally calls parts_silence_nan if the input is an
> SNaN.
> 
> To address this problem, this patch adds a new float_status flag
> (return_snan) to avoid the call to parts_silence_nan in the
> float_class_snan case of parts_return_nan.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

I think you shouldn't be using softfloat at all for this, but use the existing 
helper_todouble function.


r~

