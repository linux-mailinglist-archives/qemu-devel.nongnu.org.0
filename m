Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05944879FB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 16:56:11 +0100 (CET)
Received: from localhost ([::1]:57764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5rb8-0008JV-QE
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 10:56:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5rXC-0005GD-9Y
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:52:06 -0500
Received: from [2a00:1450:4864:20::430] (port=37662
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5rX8-0006u9-1m
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:52:03 -0500
Received: by mail-wr1-x430.google.com with SMTP id t28so5082535wrb.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 07:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pCIuiETVkwzHH2HyMAOKEe29sJPkHGYEVRaaAemOwWk=;
 b=pO8XK1bxPViF+U+AC3DxXF6kaSkwCkmrae+vbeVGcyvBMPTNEysf8Yj5NN8wvpwKJH
 6bth6srkdgZhK5VhQmFGVddsEUZuDX0HFQTIoPsgUrvDERiCIwY0Cjv2sIatFpHTUE3+
 Mdzq7d3Yt+s/1rPRN16CCpRWdD2gEHxB8XlvHeR/91+7BrrqmOdn2vSVEK17IqyRkr5m
 FdyvJMOR9PHA+rEySakk1Xvdqvgn+X17PcEj4VHFkID/gg1GEOVK3LpI4DjfbNkY6JFo
 krtR6EwlLUsSoC/V+6S6LCeO6VxuEWkXvnZx90F5lXdL/p5O9pRLcnim8ggqDn844rTt
 Dq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pCIuiETVkwzHH2HyMAOKEe29sJPkHGYEVRaaAemOwWk=;
 b=gz3q8/M8skFHmT1WXgURahuBbvjDjOnPt4FTUeLViIQCMFNwhW7KsReiBbMms2iShh
 +lYYaNb255RKZSoBW+7OeNDVDHPTqlwdKex5iAA50UOa+Hg2sLWHsaIpJNHODvht9JPb
 TQGHDtb1M6OoIRE7Rt1rxYcbunsJm0ipGE2tk9ou2T83jPnWFG4kcXEuu1jGgnGuGcz2
 BxDZDfme/tzjeWl5mfCutg56HDyf1CqU05FCO6m4gcC7kwZVSQbx508WsIe+BDBc2lkW
 bOwdfSh3mmGVgRWxWKND3g/GmebjrLPY6HUQvEB0OFzLLAd5miWd4WLDY18pa+RSyCva
 G3WQ==
X-Gm-Message-State: AOAM533oTjsoBxLuYti+mCp3W022qL+FxQtYSs/FIzWYshYce5zsTiHB
 r616txxDj4Fi6Og74rd3W4ygP/OLfRIqrCsSpnL1afzO150=
X-Google-Smtp-Source: ABdhPJyPQDYVluqVEc4VqBiVJqldttJpJfMY/AAikQ5J88jCfK7gfYND+Bd9hi4lZGeqmLdY+0evfoDbH15IczbCyHE=
X-Received: by 2002:a5d:6986:: with SMTP id g6mr3930567wru.172.1641570718640; 
 Fri, 07 Jan 2022 07:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
 <20211214110354.21816-3-francisco.iglesias@xilinx.com>
In-Reply-To: <20211214110354.21816-3-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 15:51:47 +0000
Message-ID: <CAFEAcA9W_70aYSO8bHB488D7kp1cKykqTbDw0ZhLW4OMbw8T+A@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] hw/arm/xlnx-versal: 'Or' the interrupts from the
 BBRAM and RTC models
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Dec 2021 at 11:04, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Add an orgate and 'or' the interrupts from the BBRAM and RTC models.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

