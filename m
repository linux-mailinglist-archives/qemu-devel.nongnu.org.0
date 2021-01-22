Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A377B30102A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 23:42:10 +0100 (CET)
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3584-0008FG-Md
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 17:42:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l357K-0007pw-Dl
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:41:22 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l357I-0007Bb-34
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:41:22 -0500
Received: by mail-ed1-x530.google.com with SMTP id j13so8357508edp.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 14:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tKRObW4hyzOFxpxB8djXtP6LFuBL7JFgJSxWHn0/z40=;
 b=fcXiHyp79tBAdoMZ8IMt/rxCHwi9xlyNJT7Ey2A19JlOoUdjPeJGWz3i2/7lSsTPKg
 yhCtWfvvj2dX64bBaFGxFCivRwLIeI1Grs8Gm8cEskErQUNcmhjxUk4dDQMrFgCb8GIi
 zAjj57vidI2JLk2sQDtfGJJTl4+/GTKvW+1n/0LMB1L3c5LqId00Jvp18a2iCHKk7n4A
 pqrN2Jiq3Oi/hFnWllmLY3JewzdtereXBFCmDztFPAtAUADhYWUEYzCzVK4hUOWtSKcm
 FQFoJGSJyGKpPRkHpEHtUXlvvfdCfp72XyY6Sf4MiDF74jv/WmLHocLwdjPmxAalcIbo
 eoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tKRObW4hyzOFxpxB8djXtP6LFuBL7JFgJSxWHn0/z40=;
 b=AG8fBw7S4oEb1lAHeJuismntSZBuhczNeH7HruBq/Zovp1npFTi1gzFhHMWuKLjiz5
 OTI7qhni9hpQFG6R4u59p/knR5YeLPcS7lXQ5Yhn7jInv4bHsJ2wtMW6g2dckiz7feCX
 B6jnkyGQ+KzhdJCiNHweoM6w37gmb0gymtdjpFoF/aKYTsL+HJN3FmT+6laIKfjp2vTm
 50xOIKJZ9XdVT+AueJwoDdQTanEnmIt1YIiMpDYfPTEJOV6dRMu1maPzuMdqNGCEZ93F
 Pv43+VW7lEsAHQ5LD7TUFzlGZ2520TBrMcMglj6mCiUrM4AzO2NYJ+mIbBV6YFxE6GCR
 1mSg==
X-Gm-Message-State: AOAM5337lMD//bB+vOfaLu10/VqwMlhMHyN6AlgA6lkpAm1IS/FwatKl
 d9NT+0loY3c0aUnniv/0WfbmquOogGo5umaVdFYzcA==
X-Google-Smtp-Source: ABdhPJxOJGBUBFJvZ8i0iGQdOGnFA07dG41Waf1FRDzClTbXBruc0zAWquYhPRlkg9oHryAOUckJ3Yve+tSwfQsmkc8=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr448039edb.44.1611355278358; 
 Fri, 22 Jan 2021 14:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-8-j@getutm.app>
In-Reply-To: <20210122201113.63788-8-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 22:41:07 +0000
Message-ID: <CAFEAcA-nKVjcSxiDfz-XU1iUFL9de3WGYEBNkqZn-=rsXYJRBg@mail.gmail.com>
Subject: Re: [PATCH v7 07/11] darwin: fix cross-compiling for Darwin
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 20:18, Joelle van Dyne <j@getutm.app> wrote:
>
> Add objc to the Meson cross file as well as detection of Darwin.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

