Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E864C2CA828
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:25:25 +0100 (CET)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk8Sy-0007aV-QS
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8Rl-00070a-J2
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:24:09 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8Rj-0001N0-Hs
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:24:09 -0500
Received: by mail-oi1-x242.google.com with SMTP id p126so2337748oif.7
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 08:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=QSqMzWL71wF/CYY1E2igpNgA7RW1EyKr4V4+aadc460=;
 b=GiEt991lTvnnikbx2O8sFfGQaHZswXM8HoTiKl+8xnQSoYyulNfcLSw8AALgG9X+oC
 i61kwCd+QKnurs1gvifz955jKolHBaC60kbChdQuclKGoit2ZJSZ25C9F3WpU2brUAU4
 vs50cHdFhUO/535ryI01PUYtl+qaTwEEu0NudNUNy5h0vaEIbH25kf5GPGSFzaS3DUD+
 +7cdgGfcaLo4xcxIHD7zwzvqFwCsnoL6+490s44R/+5tzVLqCaSrpq+vupPsJ99Pilx+
 YOa0U2zhLXI8/2Mk7ezIGgJVM8CJR3dXdm0XA0koHBVgxf/hZAefVwF14oWdVwf+3Zo8
 +EgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QSqMzWL71wF/CYY1E2igpNgA7RW1EyKr4V4+aadc460=;
 b=hmAnVvF/x2cC7/yXXkpqonFm0ES/d/JMsmi222zerTvpblxJZ50ZidTviFPhqiUWWh
 Fot5+YpOIFvJ9pahrHyFMP9sL6Ums/O4jaJdHpMisrcoflARjzzLczn8vzPMWJY+ZPV1
 Rn+w69qF446vxD+zCwo4pIyyjaYvBIs8L24+ZqfbynunMtzRCSleHH9tdX2OP8oC3bE6
 4BxvZaEPwAoGKdf2a2O5OB5z/ZRhVpakqUsJXHUfr+3Ih/UazbaJYqZqlpLAMtxO36Xx
 c8t4TvZb3pT7lQ7YtQ8QdqNHJ06iiy+3hQ8+lKdKEQk5n2QPjwQROa98MmzkFsc8Y/gr
 MJFw==
X-Gm-Message-State: AOAM533opzYdP9rHeXQ27PM3T7/H/scOM8S5026J7Pr3GTX4U4fxK0Wn
 9zifMdnMpk1Q4z5lKYB6+iQQamYd/jKD2S3K
X-Google-Smtp-Source: ABdhPJweGTfXjUFwwbhrSYAc/8o7ROK/10ZXVoUiTduP8n21APKZ0HloMBmenfnM6ySQZVTy66bK3Q==
X-Received: by 2002:aca:3ed5:: with SMTP id l204mr2166640oia.149.1606839844979; 
 Tue, 01 Dec 2020 08:24:04 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id q129sm485927oif.43.2020.12.01.08.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 08:24:03 -0800 (PST)
Subject: Re: [PATCH v2 28/28] target/arm: Implement Cortex-M55 model
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <131ade35-2194-9370-ebe3-ee12288bff78@linaro.org>
Date: Tue, 1 Dec 2020 10:24:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/19/20 3:56 PM, Peter Maydell wrote:
> Now that we have implemented all the features needed by the v8.1M
> architecture, we can add the model of the Cortex-M55.  This is the
> configuration without MVE support; we'll add MVE later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu_tcg.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

