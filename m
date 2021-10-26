Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6067A43B7BD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 19:00:40 +0200 (CEST)
Received: from localhost ([::1]:53518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPoV-0006zD-Hb
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 13:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfPmI-00058d-5f
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:58:22 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfPmF-0002Vg-Vj
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:58:21 -0400
Received: by mail-pj1-x102e.google.com with SMTP id u12so7363863pjy.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WaH07MJ25A7r029NAgrH/NcJfJSYrUNm00mSptB2dCI=;
 b=DO7GdTLu+DgVPcbTEdhU9TjQNQ2W7tLpSzOEIappX0hHHrabZkLG3heUfNnSo+2ShB
 kGRM148q2nVDs5hgVFN/yMSQdXlTvkzHs8gmpMuQzsvnMZmJc7b5zNOpUTq1pZeh3luI
 +xkYUaJYPvcYNd1wJNximCrk6clcmHH/I3+FIIEDzEwQmaA2gI+iBXRXcjiM558L5rKI
 4MRL5i2UcNQdaLOCWrE+L8nrE3mO8XR1fhznbqJnt41rRYetDz6tKsFH/8YvcdTDx0K9
 WcJOm++H4yUsCb+1dpBYVsxI1LBEzvr57HSayFlOXP4i/RF33D6Ek+xS2fyp8MnfVznS
 YkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WaH07MJ25A7r029NAgrH/NcJfJSYrUNm00mSptB2dCI=;
 b=QK4/z7BmbVaZyWPWXtFvKd90BGlSE+rzNfSvXDCNW1pgPN23nrXOtkiUdt2wKpiISI
 yESYYNIm++qXjvbXWL+JniA2GVK+IFG8y+dZ380dhGRAWcfJACqRbKL6nx0FwmoPySch
 Lxt/GfcHFBffdNrylv7ECnaYiP/NVWVykDO70sgzLkiN6cg72+6bV27IyJoRkHX+5/6I
 l2tErLoeySsnVTgS+y6eNtsEJe4Pck65wZ9wQZ0wK/7uMC6OSEarhRFtxGpifCEvOKKY
 T48kGT8vfH4TcozyMp4Lcaexvz52Dqt5ppZpREXmrGp408IlXXsO3DdumCB9vhNcJzNF
 t6dw==
X-Gm-Message-State: AOAM533v0z10bKpvotapA2af65z3GLA5zo3bHgydZ/twO3LlI4hydcfx
 ejJQ7CwaviSSNGVAPwOq8m6pGg==
X-Google-Smtp-Source: ABdhPJx0QP7EHK74cODCuwIdaPFDvDpnYAk6rToncZwkjX7iBPpolVV2m3OSuaM6ObvLbzGXvT/myQ==
X-Received: by 2002:a17:903:2312:b0:140:26b7:fc01 with SMTP id
 d18-20020a170903231200b0014026b7fc01mr23132264plh.84.1635267498225; 
 Tue, 26 Oct 2021 09:58:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z3sm19964937pfh.79.2021.10.26.09.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 09:58:17 -0700 (PDT)
Subject: Re: [PATCH 16/33] target/ppc: Implement Vector Insert Word from GPR
 using Immediate insns
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-17-matheus.ferst@eldorado.org.br>
 <4a9f95b2-3f9e-f835-0315-7632a5e6996a@linaro.org>
 <2f6cca6e-6a3e-7341-7d92-4b1b4708ee1e@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f41b24cd-9ce5-4836-9c77-ea4edaacb021@linaro.org>
Date: Tue, 26 Oct 2021 09:58:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2f6cca6e-6a3e-7341-7d92-4b1b4708ee1e@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 7:33 AM, Matheus K. Ferst wrote:
> It says that "if UIM is greater than N, the result is undefined." My first read was also 
> that the outcome is "boundedly undefined," but I guess it can be understood as "the 
> resulting value in VRT will be undefined" (like when the pseudo-code uses "VRT <- 
> 0xUUUU_..._UUUU"), in which case this patch and Mambo are correct.

If the reference simulator is fine with it, I am too.

I'm just a bit disappointed with the laxness of the pseudocode -- they've got that 0xuuuu 
syntax elsewhere, but not here.


r~

