Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0514C0176
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 19:36:15 +0100 (CET)
Received: from localhost ([::1]:59704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMa1F-0002S1-TP
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 13:36:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMZzi-0001jb-Au
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 13:34:38 -0500
Received: from [2607:f8b0:4864:20::102d] (port=35814
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMZzg-0005ju-Cv
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 13:34:37 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 t4-20020a17090a3b4400b001bc40b548f9so435528pjf.0
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 10:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+0X3kQHH1Gpjr+qz5NrfXzeI6SOEB0K+fvKHcRoMWX8=;
 b=XS35G/SOQMSGUsfFzXvGXDTRu6Ltjy/kB7QarZh9HM3d5eXQrziX6ei+nLpkgs0qSS
 3jPEtPXD+UziFunrv0Ht0YfTJO+x/x84JkhRHrhtO/eOySHrK6wtC7GnAWJGpkF0lqzy
 B1UmilHt/m8G1Xc6WorohW6UL9L6ztuOPyS4f/WSf0GLKrohsc3bFliiw4ykdtH4jH2M
 omgf9hpv50V/Y+yv3cS3RBxWN7JBzdd+S7arwxwFP0BR9fAspNJOE+l4ebcU+3su0KwF
 YEDHpeKxeNg6Bgdqy/VNo6rYAiGcvceVs3XkrZyZ4I17vgL8kdCICHuXk4pER/Y6Otw/
 cpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+0X3kQHH1Gpjr+qz5NrfXzeI6SOEB0K+fvKHcRoMWX8=;
 b=vBvYUlxHPfAidnFJi61gRxNlKoGS2QtBrU4nVgG1eiUVjrFbooEVHLVCDICHdR8DJg
 LdW477EdDt47jFRLnA2sbdQzf9XWJxItXqDPAdNEITIZAp+Zk3sCR/Xc5Y1jXpZOe2WC
 hTe/M6+XOOg+dR5whM0GLyna8peOFGPQzG2ny6GjUsOdPplZaYcLs9hFR3YIkP2aRTf2
 k6zuTB/rI7nixFxAeoqd7JEqyZMieVrZtLdcdx5lqyijuRztQf8VoVtgdia+slcVZ3jl
 5QR8ohvaOPktIlrBAgXqgzqwQEHZT4Bp4TRcREtud8J1njPJXsOdr94mBTd6fT857tKH
 4e5w==
X-Gm-Message-State: AOAM53128ZU9bVXoNX2xIjAcmcMPohQaOcS1xvkPEEyNNenrpUHCtfWy
 qgR7HZR8fCN8fY0DZnflVIAGZQ==
X-Google-Smtp-Source: ABdhPJwR6McbmWeQmWeH79zH18CQ5v2dk2y5Gql7HuxfOz8bCOn0EkWwMFSfEAneDH9JljfJ9BdXgg==
X-Received: by 2002:a17:903:41c8:b0:14f:e456:581a with SMTP id
 u8-20020a17090341c800b0014fe456581amr3028771ple.114.1645554874710; 
 Tue, 22 Feb 2022 10:34:34 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 ep5-20020a17090ae64500b001bc56af507dsm205904pjb.47.2022.02.22.10.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 10:34:34 -0800 (PST)
Message-ID: <47c04172-63eb-4712-021e-142932935782@linaro.org>
Date: Tue, 22 Feb 2022 08:34:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 07/47] target/ppc: Move vexts[bhw]2[wd] to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-8-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-8-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Lucas Coutinho <lucas.coutinho@eldorado.org.br>, groug@kaod.org,
 danielhb413@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> +static void gen_vexts_i64(TCGv_i64 t, TCGv_i64 b, int64_t s)
> +{
> +    tcg_gen_shli_i64(t, b, s);
> +    tcg_gen_sari_i64(t, t, s);
> +}
> +
> +static void gen_vexts_i32(TCGv_i32 t, TCGv_i32 b, int32_t s)
> +{
> +    tcg_gen_shli_i32(t, b, s);
> +    tcg_gen_sari_i32(t, t, s);
> +}

tcg_gen_sextract_*.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

