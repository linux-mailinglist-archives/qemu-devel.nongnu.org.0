Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1AA4C51E8
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:05:31 +0100 (CET)
Received: from localhost ([::1]:44514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjeU-0004ib-63
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:05:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNije-0004jP-T0
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 17:06:47 -0500
Received: from [2607:f8b0:4864:20::1032] (port=44697
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNijc-0001p4-AL
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 17:06:45 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so6030917pjb.3
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 14:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=buBatmqkrbjC/58oXnJPX68i0y4ccQgKvsZDkfkhbpY=;
 b=MIYJAGrVSGYvmNLOY/G6EYJIgKkkjfOOVYfAG8wiMl9wFycfZW0TuS5oNVYglAiE/s
 GldDsU0onJwOSdo/FejvxmwcSIjAC/bD/iKVMwRnj4G4JUTSbO9rju4OJ/eUvXSCsLqt
 tBCs3GqBVYrvoRysRKmhvwdLtR8qJCWPSzl11GmSieJPAP+FcEqzS+Gw1VRhDJA1DLyy
 hdXUJJEdc9Tr1X9KJEos8mRgVMeBSCN6i1b+4r+E+5/TU/+IBaeLQkTpRYiYM+g+9t1s
 5JeC5gzfNhjUn5qiNcT2G9UScJ4usudnqzqs8TgtxTGFAS5JvFSvPvRZ97nFdZWlbbhi
 OHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=buBatmqkrbjC/58oXnJPX68i0y4ccQgKvsZDkfkhbpY=;
 b=mg5Q8aKnKPU0WxX7NWpWUPPy++HZayhcJ+OdqNu/h1CeiRZdYyny+UPO7mL3x/VTTR
 szM76bD5CKe+pkLrKWoGyo4HztXGz7rKm57JrVTGeIj+8lnd0mMnq6/OzWZDiUqUBGkr
 h14ce/NIK7EyyIpIvgw0c9Wv2C1rIMlhOtDfkCMeiASMHdS/YYfBWMUEFkg4BDYFZFKS
 ygK4oJX6cB89j1yRXmjZ+H55yxZjL9i3GQqWPK8ywtek0BXgOzdLVrpaKOppVMApf/Ow
 vfvEjxKUhE7JFmxgX0Xb5G2Vo4xySqMDTB9OBNWsEjPfh8pl7d3kutcWZY59vbq0aBnd
 swEg==
X-Gm-Message-State: AOAM530gkETtufUQrm7wol4AY60u7Ju4kM/GmUYZZiyZuuW0gJHvC/yw
 a0wESU1G1OLsdvEc9m4milJWUg==
X-Google-Smtp-Source: ABdhPJwlHMYOfoeQl/jgm5FByJFeA9+JrmmNtiG+0ORF+vERB2LHBUmDUbHmmqRX0RM1HtnviwvgHg==
X-Received: by 2002:a17:902:7285:b0:14d:7f5b:94d0 with SMTP id
 d5-20020a170902728500b0014d7f5b94d0mr9109999pll.25.1645826802978; 
 Fri, 25 Feb 2022 14:06:42 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 z13-20020a63e10d000000b003733d6c90e4sm3368935pgh.82.2022.02.25.14.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 14:06:42 -0800 (PST)
Message-ID: <69cb98af-b4ac-b1f4-1d6e-b0a474aa227d@linaro.org>
Date: Fri, 25 Feb 2022 12:04:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 40/49] target/ppc: Refactor VSX_SCALAR_CMP_DP
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <20220225210936.1749575-41-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225210936.1749575-41-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 11:09, matheus.ferst@eldorado.org.br wrote:
> From: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> Refactor VSX_SCALAR_CMP_DP, changing its name to VSX_SCALAR_CMP and
> prepare the helper to be used for quadword comparisons.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> changes for v5:
> - Improve refactor as suggested by Richard Henderson
> ---
>   target/ppc/fpu_helper.c | 66 +++++++++++++++++++----------------------
>   1 file changed, 30 insertions(+), 36 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

