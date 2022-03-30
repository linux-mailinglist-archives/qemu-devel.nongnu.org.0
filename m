Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D357D4ECBC2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:20:50 +0200 (CEST)
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcw5-0001UB-T3
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:20:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcsI-0006nl-Rs
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:16:55 -0400
Received: from [2607:f8b0:4864:20::22a] (port=35498
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcsH-00006N-EZ
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:16:54 -0400
Received: by mail-oi1-x22a.google.com with SMTP id e4so22868889oif.2
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 11:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qVWBWg45Uu25qPapejQ7kQPLYhAJRDd9ATolVyOaUj0=;
 b=dXOutF8GX58+Uhhtsk8wVgbnnNmqIjZ4uZSGxMPP9yc3aC7Bh+Q0Y3g60HkZsRahJO
 bf85pLLF14Z+rKC9bvZ/6wmG24rZk63iFcE76s8SfA+3SYbhGH9xVVTEZPD6IFCHG960
 DUUHwmM1Xa8Z+NxUJRnX649GI9doIDRPCPlCSNx4NtkSKGVb+f2FvpC2LkQ5EGmQ6iIz
 vVmaN8W5KCz14CcMqF+l99ZshbUzZreoocSN1B6te+wxh1YWhXB4RameuZNgUvHuVRWK
 cacNHGyunGi8O/0FqURF5nTvW/wIiB6BN/u918z1N1SCApVJpvQcMGzBC04mVn8V5F9u
 wuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qVWBWg45Uu25qPapejQ7kQPLYhAJRDd9ATolVyOaUj0=;
 b=gwPeTsMFxEG9ixySJ/HaARIYFA9gidk6vOOv4V4SFeTbw9YkgL0ILbpofrTcrxMKXl
 PdHXyi8sS4yj4GR+sLDvEBOKp3kFruLtLpacmo7sboYKGDNCGAksJxzunIXKbcCSzUEd
 xqFD7qblWPOnXlZ4HPrl3rzTemvNjDIX8fwtehrSPBG5Vx3rnC+nCXlcPgaqVj+S++Vn
 8jW3sPQI6pzBgcdui+9sZTnBA5fvbbAtWY93RKdAz03xSOpZYw7qk7HWxJ/VVaFb+U+C
 auB2Rl5Hkv0wE6/uR8Mn9nhj3+/UWnRbxWvy6QBOfg9EF3bW7r4CxQhj7ZDhGE2O5WiK
 409g==
X-Gm-Message-State: AOAM530IgKcrQrj6Dh+PY9aYJ9JwAtgWLZijzqOYRD+XLcnBF02Zh0Kh
 hfaiCDu96MURezBSoMlSSJ1JIA==
X-Google-Smtp-Source: ABdhPJxXhIG+5DvQYbMn/Pdf9q4CYSYjvyiKvMdPwl9FSERMeD9fAxCNNiiqeflqlTcZmnb14EnMnQ==
X-Received: by 2002:a05:6808:30a0:b0:2da:3e03:5620 with SMTP id
 bl32-20020a05680830a000b002da3e035620mr555507oib.264.1648664211856; 
 Wed, 30 Mar 2022 11:16:51 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 w39-20020a056830412700b005cda87bbdcesm11339148ott.6.2022.03.30.11.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 11:16:51 -0700 (PDT)
Message-ID: <34efb7e3-912c-b516-a8b6-543c0ba1bc2b@linaro.org>
Date: Wed, 30 Mar 2022 12:16:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 8/8] target/ppc: implement xscvqp[su]qz
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
 <20220330175932.6995-9-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330175932.6995-9-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 11:59, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> xscvqpsqz: VSX Scalar Convert with round to zero Quad-Precision to
>             Signed Quadword
> xscvqpuqz: VSX Scalar Convert with round to zero Quad-Precision to
>             Unsigned Quadword
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             | 21 +++++++++++++++++++++
>   target/ppc/helper.h                 |  2 ++
>   target/ppc/insn32.decode            |  2 ++
>   target/ppc/translate/vsx-impl.c.inc |  2 ++
>   4 files changed, 27 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

