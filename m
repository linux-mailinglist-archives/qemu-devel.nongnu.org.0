Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8912320A3A
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 13:15:05 +0100 (CET)
Received: from localhost ([::1]:47554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDndg-0008Qj-OX
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 07:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDnb1-0007OB-Q1
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 07:12:19 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDnay-0001rN-Ra
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 07:12:19 -0500
Received: by mail-ed1-x536.google.com with SMTP id i14so18024646eds.8
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 04:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ePgzoOyWpt4Witqye3vdqFhEOaApnPYTFSOKtHPnDJg=;
 b=XIyPdCCJfw+EzhdOefRgsznjvu+mXcQTLQwgcZ0hQgZJirMLSYEXdTlsViCb1gxFAu
 omgh7eCbS6vjwyPxEIAYhkTx9hEtXAhOxu9K2nHgjA+tVPCQndHEMSvJo++K0zb6Q1Sq
 Yyf2e55bBVj+Wvr84H4Rka01lozexgCo3Gi3jj1iVCobYBmWhE8mHv4Tt4apwItcjAcR
 cza92zytt5kdIoaueCZbVaKs+xfnZrnjk6IYPmOhog/NPa8zOST227wrT3khBhlWtyv4
 otPeLpMyvpqjRdNcEOGoOGVBtTnM+PugX4NkWvV1g5b1jGBFx0fs80NvMODFSpnK+WuI
 eztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ePgzoOyWpt4Witqye3vdqFhEOaApnPYTFSOKtHPnDJg=;
 b=srbXHpnBzV5wgSQn6KjlpV6EW1vq3RccI7SXyRJk35jslIHR7WDTkv8rBkenE4yqXh
 APApGhAi/5wcPl/eXyVOIdslrq3NKdPGTl+MVifnaAIxK7OUgeGxEXzLYv+uDbGMFmyz
 dKy0AKPFrluTtgkTdtNNRJq88tPEctNPr/+W+RQw0hbj6YVrVJbi9iZ/OHDTIEI7w/m5
 gbeFwbSR9ae/Olomv8OkUc0uDtGPLMNtE4WJVntmMhK28R6G3Ls2vIrdhG+GHg+t0tx+
 I3xA26YjbBwmD0i/SE1VI8pjUQAyRzjlwHuvoDtfvMaQDXpF/uMKFxreg45/6I+TI2f4
 7+kQ==
X-Gm-Message-State: AOAM530SowqTW9xHrLTHmb7FHHiAfoLFF4ltiYuDrgb9ptZ8u0Zf9Z2k
 WTqHvwy8XsXv2MkRxyyNAdtsMsFBeHiLYvGncn5Drg==
X-Google-Smtp-Source: ABdhPJw51TzcIf3s0P82pd1BpUT2+hJ5O2ZmYHevM4LqGnBLPsWru7Lz2ufMUP997+K2Jb7Ay5MYqQolhr2BTeCS1f8=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr17390252edd.100.1613909535184; 
 Sun, 21 Feb 2021 04:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20210220212903.20944-1-richard.henderson@linaro.org>
In-Reply-To: <20210220212903.20944-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 12:12:04 +0000
Message-ID: <CAFEAcA_3GUsYLY89Y62k0Rfaqu3JHdPYphueW2t04C6FgvQmTA@mail.gmail.com>
Subject: Re: [PATCH 0/2] tcg/aarch64: Fixes to vector ops
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Feb 2021 at 21:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> I guess it has been a while since I've run aa32 risu on aa64 host.
>
> The launchpad bug is something that should have been seen from the
> beginning, but the similar aa64 operations are expanded as integer
> code, not vector code.  The aa32 neon code has only recently been
> converted to use gvecs.
>
> The cmle0 (zero) bug has been exposed by the recent constant
> propagation improvements; previously we saw a reg/reg compare.

Idle thought: would it be possible to have a test framework that
exercised the TCG backend without being dependent on a particular
guest frontend?

thanks
-- PMM

