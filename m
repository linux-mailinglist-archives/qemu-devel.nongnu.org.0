Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00553D1AC9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 02:38:03 +0200 (CEST)
Received: from localhost ([::1]:47144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Miw-0007Q2-99
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 20:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Mhn-0006On-5A
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 20:36:51 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6Mhk-0007uq-5Q
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 20:36:50 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o8so2510507plg.11
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 17:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=e5SWj0rqVly4g+/a2oOMafoA6VwmntAPEou+1nWxqOc=;
 b=xhKtZ4TQO22EMy1RSR1CEsccBmdxuEDyfuaeewPg6k/yKYlS7EJtW1RNWbOS+PIehg
 Op/nIWnzglFMHsRr69uFrF62CBz+m5AyGbB+TgPSO6rRUNH0oKQ3W86Ay3bPW1p9zE5+
 HIvmVs7hki0+AEZj8wYQHe//CrfMJSYgEp9LjCylISdmRupzTsccyiWzLz8jpcnVydPa
 QC9PzhdDNwdfAIpF6wd11FlveGpeOWPMoqfvgb67QPRyOkaUVONFAF4ulvzXgNw/4P4+
 ncBiVayCYfPODjUJupZ/rZi3s/nNMDhq/6Fadp1cHzg5e0vQhhGodDbKZyzovPu4koKE
 nLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e5SWj0rqVly4g+/a2oOMafoA6VwmntAPEou+1nWxqOc=;
 b=jYU44rEcTOv2M3cnQwoCa2xi4GP+Um/K6U/IhvKdcNOebBhc0gPkNUF1PIGspqIjo3
 sv9r6CkQM8nS3nbQknXbhYVc0D+6tl79wOL4EACJJN33WZmmLjdiiwGmSeKzYmGC4GHg
 HvVxE6so+9ooSyle/tMhqoPFXmORnV+Jk4zajnSYrJ1gQyFhYyDnnwXknlfFru0u45Cd
 ENC3e2cLWVCEA5lkIK6gt94F70cgXNrM6l6wXkf6etUndEHq6mm1xz8QXs8FCqhjIJQL
 PbESuf8aKKHrmyO3a5/fEpYA1WhTq0f/nwC2C0pGdJpN1HeJgFYiOun5SwmELmSUlVYf
 TpbQ==
X-Gm-Message-State: AOAM531NMOWfvPe3zMq0y9hiS+Iwf5Mww0xTsEtroe3E6q/wGHdxPuL1
 u9AEh2hda0EUFr8jsNhM+VFM2EkBHkWvdQ==
X-Google-Smtp-Source: ABdhPJxRVkkTPyAsX9C6sr7WksWs0/iL7auQ3pXxLa1kuEhxohC09smUb+2oFAUaszxxMwL8CrrZew==
X-Received: by 2002:a17:90a:bf0a:: with SMTP id
 c10mr13270956pjs.59.1626914205881; 
 Wed, 21 Jul 2021 17:36:45 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id s36sm31625615pgk.64.2021.07.21.17.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 17:36:45 -0700 (PDT)
Subject: Re: [PATCH for-6.2 32/34] target/arm: Implement MVE scatter-gather
 insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-33-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3421f037-6aac-b91b-1fa4-806af98e5ece@linaro.org>
Date: Wed, 21 Jul 2021 14:36:41 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-33-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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

On 7/13/21 3:37 AM, Peter Maydell wrote:
> +static bool do_ldst_sg(DisasContext *s, arg_vldst_sg *a, MVEGenLdStSGFn fn)
> +{
> +    TCGv_i32 addr;
> +    TCGv_ptr qd, qm;
> +
> +    if (!dc_isar_feature(aa32_mve, s) ||
> +        !mve_check_qreg_bank(s, a->qd | a->qm) ||
> +        !fn || a->rn == 15) {
> +        /* Rn case is UNPREDICTABLE */
> +        return false;
> +    }

No Qd != Qm check for loads?  Given that we know in advance that it simply won't work for 
VLDRD, it would be nice to diagnose the error.

> +static bool trans_VLDR_S_sg(DisasContext *s, arg_vldst_sg *a)
> +{
> +    static MVEGenLdStSGFn * const fns[2][4][4] = { {
> +            { NULL, F(vldrb_sg_sh), F(vldrb_sg_sw), NULL },
> +            { NULL, NULL,           F(vldrh_sg_sw), NULL },
> +            { NULL, NULL,           NULL,           NULL },
> +            { NULL, NULL,           NULL,           NULL }
> +        }, {
> +            { NULL, NULL,              NULL,              NULL },
> +            { NULL, NULL,              F(vldrh_sg_os_sw), NULL },
> +            { NULL, NULL,              NULL,              NULL },
> +            { NULL, NULL,              NULL,              NULL }
> +        }
> +    };

A little bit unfortunate with table density here, but whatever.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

