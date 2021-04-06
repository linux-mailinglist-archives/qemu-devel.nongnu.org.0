Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802C8355EE4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 00:36:15 +0200 (CEST)
Received: from localhost ([::1]:53030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTuIv-0006is-Se
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 18:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTuHx-0006CA-IX
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:35:13 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTuHv-0001e0-Un
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:35:13 -0400
Received: by mail-pf1-x433.google.com with SMTP id a12so11505984pfc.7
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 15:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WIXtGqNjWar7sJ8JCxNObk19McmgJWkaA/k1SfLbjmI=;
 b=wK4QiP6BoevADldZwNC9Qpz0H80bQ0DP8V22vOmre++fyvgJ0kk+R7iG5CbBIoAj83
 /28JL1IORxyEg+pJgXK9z6QLKTVo45nwDF2r35nfI3lSEjhNFt25cTZ+YlQDrCbjTp50
 VQNeyJnKKgDgqSzTjowlOvtyjtmVDg6ygVhosrS1TceDFzhyE6wT/s7xvya1NXRNocDq
 GLSpVGWnFNfriVM73b5g16wOMVGCSuMZWKHUSBsx8/gIktV7PPElYLvUAzr4b12cJhAN
 K9M4MTDA3iBwn6eGjxga13KbAoxmr5S6jtDDL/APc7yYljiuaLTVKsf27UWVHRtuq8Nd
 fjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WIXtGqNjWar7sJ8JCxNObk19McmgJWkaA/k1SfLbjmI=;
 b=dRARaMZD9zvKSAAaYZWT0PYUsNQmchqB/mZw85sdZUmnsyfsaf/IhP3jrhaqZNdP9e
 F5Wvz6M1yFJ0Y6PQSWuPeQavDSUQFZAU84L4elBhiqUiJW2K1tWYHRHIsuN+0QUVA3UN
 BCFBCLpOxHsjJ+i0OkA7Z8UVdoLU2+Y5oUKXOeWXh1M2dAOGXhN9QEFYozehjrWp0CcI
 jTrerqgE3jtzhxkiedIU+dCZAi4cAwFeCerhw8S0r4ezfHKjO9Uydzt6ilkB9oBOPmgD
 n6bVcFa8Ae7f8P7Ij/oPUTDoN4Wco7E2I1IZ9m/n36djjF1HtPMQdKz9SaTDvp5AozNL
 4AKg==
X-Gm-Message-State: AOAM531clbJkJiGsUfHF6YzbqTrucjgh7WaV2TvgaxZLc54xgVDGw/AP
 G6fL0R64h9qRaQJ28neuPEq6+A==
X-Google-Smtp-Source: ABdhPJwVheitpi4kD6DJSbpWfc+BIqFY3NTBLaQ0noDcYJrPG8nQxzu4AzYkie2AfZj61I2n2GxbDA==
X-Received: by 2002:a63:e913:: with SMTP id i19mr356673pgh.426.1617748510303; 
 Tue, 06 Apr 2021 15:35:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y15sm22528613pgi.31.2021.04.06.15.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 15:35:09 -0700 (PDT)
Subject: Re: [PATCH v2 18/21] Hexagon (target/hexagon) bit reverse (brev)
 addressing
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-19-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf18922d-cdf8-cd09-9a19-c48759fe43e0@linaro.org>
Date: Tue, 6 Apr 2021 15:35:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-19-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> The following instructions are added
>      L2_loadrub_pbr          Rd32 = memub(Rx32++Mu2:brev)
>      L2_loadrb_pbr           Rd32 = memb(Rx32++Mu2:brev)
>      L2_loadruh_pbr          Rd32 = memuh(Rx32++Mu2:brev)
>      L2_loadrh_pbr           Rd32 = memh(Rx32++Mu2:brev)
>      L2_loadri_pbr           Rd32 = memw(Rx32++Mu2:brev)
>      L2_loadrd_pbr           Rdd32 = memd(Rx32++Mu2:brev)
>      S2_storerb_pbr          memb(Rx32++Mu2:brev).=.Rt32
>      S2_storerh_pbr          memh(Rx32++Mu2:brev).=.Rt32
>      S2_storerf_pbr          memh(Rx32++Mu2:brev).=.Rt.H32
>      S2_storeri_pbr          memw(Rx32++Mu2:brev).=.Rt32
>      S2_storerd_pbr          memd(Rx32++Mu2:brev).=.Rt32
>      S2_storerinew_pbr       memw(Rx32++Mu2:brev).=.Nt8.new
>      S2_storerbnew_pbr       memw(Rx32++Mu2:brev).=.Nt8.new
>      S2_storerhnew_pbr       memw(Rx32++Mu2:brev).=.Nt8.new
> 
> Test cases in tests/tcg/hexagon/brev.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

