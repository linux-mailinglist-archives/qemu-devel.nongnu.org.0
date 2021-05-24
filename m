Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722E938F18A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:28:30 +0200 (CEST)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDRN-0006Ya-8A
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDNc-00039G-7l
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:24:37 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDNa-0007AL-Ig
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:24:35 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r1so5610809pgk.8
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Ktzs5cumnsK9N5nDGlFql+ypBat+qBxvmGxMJ4SUhBg=;
 b=fRkFL9Bz+K5RgYfNnSG+v5h5r08GUdGHMU+SD1nBeexJITDpJkRxdszj5orXY8oBtd
 I1/eKGDdM+9NQLummAXEITTJ09kM3KQMtkuVM6Nax9LXBUz7RZVZoasyrXuVzFBFHBBk
 ci2wRcmXpDwBPKfBKxM+RHcHmDb/wF2i3WYLNDy1aLMjsC1wdndmXy1EBd0Gs7io03m4
 1ZzYe4GlJQfs8145B1EQ4GhnQ340Q8VcQ35y+7QI/xMvfgZ7mk6ksO+p6PbjqAEsC0Eb
 h8AfyY6QMeeihaP1Qc8yY4FoEMzzBdBwpoz/16QTepaXcKoAyDD7Us+pRUgxTaEpze9g
 eqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ktzs5cumnsK9N5nDGlFql+ypBat+qBxvmGxMJ4SUhBg=;
 b=Q5lsPwOhSQqzf8DSJS7aRMF5WCAsHbYC1+j8hYDHzKr4IH5nn1iv3fccXuxKwcoFgz
 4GvzbGkktX48BDMAERw26+krR1joUiXBEThuSjHoDANFwMwL9LjL5Yy4Nv55IaYBuIXj
 tA6BTKkxMQNn0VQoZPv4TIAcVRXCNqMxEijQBrL5ZlsQjSokyvH1oBk5iJ6E0OWDUglE
 UGFSPgNKCmuGROnCO0PzIgVwkEnTxECMOIe8mYyBlqrPkIM5g1lkFjUfngv//3L9cpkV
 hW5urk6IQ/XZtsp32YI96ETuixL5mHK/ZlIeZHBD9W4KHUMr1diYc5z6LZcDwevRUsuJ
 LOSw==
X-Gm-Message-State: AOAM530SiHGnD6OmOoMrAbfyN9u1ZXBDaqN2VJVAJ9Ixogh4G9xxGovO
 m34pbAV5uJymwbFSJa5Jdter7Wnu9oKxzg==
X-Google-Smtp-Source: ABdhPJyXUpPCp/ofgn8ps3zwv2/nWWIbHQiDt96sKKJQY2s9+NwZTTyvWvYoTDUZMvB84aBd/SDFNw==
X-Received: by 2002:aa7:8201:0:b029:27b:9b59:8676 with SMTP id
 k1-20020aa782010000b029027b9b598676mr24922941pfi.47.1621873472898; 
 Mon, 24 May 2021 09:24:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 13sm11641459pfz.91.2021.05.24.09.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 09:24:32 -0700 (PDT)
Subject: Re: [PATCH 3/9] target/arm: Move fpsp/fpdp isar check into callers of
 do_vfp_2op_sp/dp
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0a6128e-cbd9-79e8-9062-c20fc901d328@linaro.org>
Date: Mon, 24 May 2021 09:24:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 8:28 AM, Peter Maydell wrote:
> The do_vfp_2op_sp() and do_vfp_2op_dp() functions currently check
> whether floating point is supported via the aa32_fpdp_v2 and
> aa32_fpsp_v2 isar checks.  For v8.1M MVE support, the VMOV_reg trans
> functions (but not any of the others) need to update this to also
> allow the insn if MVE is implemented.  Move the check out of the do_
> function and into its callsites (which are all implemented via the
> DO_VFP_2OP macro), so we have a place to change the check for the
> VMOV insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 37 +++++++++++++++++++------------------
>   1 file changed, 19 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

