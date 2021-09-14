Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6148B40B456
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:17:15 +0200 (CEST)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQB7S-0005wm-Ap
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQAv7-0002WL-0u
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:04:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQAv1-0004UE-Py
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:04:25 -0400
Received: by mail-wm1-x32f.google.com with SMTP id i3so9734440wmq.3
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 09:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X4W6fsDrgGpl5u4XVYe8lmnczVXROPfb5m8+PFMTt3Y=;
 b=A9HA90IARBK0HW+W6CdDpnIEiuDEQa50n73sYgKxxgbB8pvwXNCN5aArtlyNM068eQ
 urbxLPrPlBZB4vIYBGUviwEDZ0/B7U9OCnOofdHW8Q3Xx08Kr/PCWPceNdXqyIUQyUit
 9N7icw9Wiev5N2G/+9CKd5kCI1V9XufiCNpe/bKeVtzAOWXe0n44rbXthJuU9G8CxMVA
 fUrDpGozl18J8Ol19nGZhvKo4rlx561J7hjbDOT8regp5+PU0INODnrlrVzMndD2kddX
 lUTIDoMmbP8hVw5m6g81aIMTpWmKZf5zWrP68gTb0gU1HA2zDOFaLbfspKfsvouWTPn+
 NRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X4W6fsDrgGpl5u4XVYe8lmnczVXROPfb5m8+PFMTt3Y=;
 b=dLibgghjT9BWuDL31O8lyGAq86dyErvpc+/qSpCZCIgJd5bhRCePw9wprGi/Mc37/C
 Dj7AEpRiIQ/JtRO8ys6gbygAIpW0xH8jFFRVY/QJWRfZfG/iOk0WoxIfP2zrJEzKekoe
 amUYsd/FkkLHHsdkLWfaeYNq2vBs+netMSbOUqCXQTsF8TLuFgxQaggeeRCN96khrRUs
 LPoLR34phhpC1Qek5dFu6EI+SKwBo+C/NkE0Y3BTwNweiHDIXuV74BeNd3XA3y/7JSdX
 hr+CLXUyNiyHx/TpzTS2aQ8P97o8d2mYFsnnxx95UADmsxrX2sAISAJWfJWW/QtQqxSx
 GFuQ==
X-Gm-Message-State: AOAM530cn6CmzyKWhcjE2BH8+6+jo17UJB0DChwdSsbit6OSirweE6Me
 E2mo45ktWTvkvO3ddLQXQxZNEp9i85fpD8GdDDA3T7BEXKY=
X-Google-Smtp-Source: ABdhPJwupnfNxzWiHnEqV+bVViFHcm67uZSax+sJd4moJ5p19fGIjkUA6+q4wOdbTX/JMFRDz+RkepySuXeFrKaPoN8=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr3050074wmm.133.1631635461971; 
 Tue, 14 Sep 2021 09:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210913101948.12600-1-peter.maydell@linaro.org>
In-Reply-To: <20210913101948.12600-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 17:03:31 +0100
Message-ID: <CAFEAcA9i4kGzsmpGkVZkH-NdV4d3BwsK0VgHh=PeOs1pbdR6qA@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Make more custom runner jobs manual, and don't
 allow failure
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 11:19, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently we define a lot of jobs for our custom runners:
> for both aarch64 and s390x we have
>  - all-linux-static
>  - all
>  - alldbg
>  - clang (manual)
>  - tci
>  - notcg (manual)
>
> This is overkill.  The main reason to run on these hosts is to get
> coverage for the host architecture; we can leave the handling of
> differences like debug vs non-debug to the x86 CI jobs.
>
> The jobs are also generally running OK; they occasionally fail due to
> timeouts, which is likely because we're overloading the machine by
> asking it to run 4 CI jobs at once plus the ad-hoc CI.
>
> Remove the 'allow_failure' tag from all these jobs, and switch the
> s390x-alldbg, aarch64-all, s390x-tci and aarch64-tci jobs to manual.
> This will let us make the switch for s390x and aarch64 hosts from
> the ad-hoc CI to gitlab.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Pushed to master so I can turn off my ad-hoc CI for this.

thanks
-- PMM

