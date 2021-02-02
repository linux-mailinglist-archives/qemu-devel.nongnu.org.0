Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1098030C28A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:53:45 +0100 (CET)
Received: from localhost ([::1]:43406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6x3o-0005gW-14
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wjN-0006pZ-3R
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:32:37 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wjK-0005T4-4g
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:32:36 -0500
Received: by mail-ed1-x529.google.com with SMTP id s11so23175655edd.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s5Gk2o1CzVX6IK3vpvcfcamLozBF6pYpC0k3t7ydwP4=;
 b=vrrG6P1xbngi6z0wks9rVFc9OvagCOaGeZJEZnSh9OcgdtI39fO/EcjPRt6bFOEBup
 IjS9C7SmIFJuDaUxgvhfL46BGz7hoVT5R6RFssU+cLZPoFci8zMG9jGf6l+b7/BSIZ53
 5NPffWeH/MUlsSzBXEgffecjiYJQAQxLnq/1u1pYL9sr8vD5IsEWHLwNM6z3OC86FwQx
 qYg/vKbdHVLl9JalPvBViElrPPpOOfViLoboY/VWJEvNdCAoI8k75TSDLTBm9wGHZdBO
 NupHsuhJkGS9V5Opk42GVc0zHzZky7dU8jqrKwp4dE3k1b2+aoJOvq1ZPuzpnzKJ/qW1
 dACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s5Gk2o1CzVX6IK3vpvcfcamLozBF6pYpC0k3t7ydwP4=;
 b=J402u5vH9nPlESMDKpSotYS1fGPfuIdcSN/UKYYeIoahlurqMrXcZ/YMLJh+GQh4Y/
 FDn7k1b1jIQvlu2ECRDfcMNt3G1EyVIczyocvYLJQigq1QXl3pmSDt16001rw1PExfD8
 brcvEYLyOcLwTnIHRuJiNDl2WA59mAzIqvActj0li8wAssLEdlZjtt5inWAZympJib5V
 000hBdTakQai/96o9KUYQbUDiE2it2YsbRWA/Zshb6/Dp2OsUa/GdIZcss71clKh2Ijr
 Tt14vVbF7VX2dILJZB3EJLSkGfxhQLYglkPkHyBf/+7Eln33m6ZrvMKN03RSqh0uwywg
 k4dQ==
X-Gm-Message-State: AOAM53356qHiYZ45qZwN1TJtcc8W5vAvtaxszmEJK4Czvn5D7cHxzUP7
 vMZPNRf5KfdtGt8LFl/F60Xo4VTnM2PpuJd7tDETSw==
X-Google-Smtp-Source: ABdhPJzIC9XdUzXKJcy/V3+XXL9cis7DN8OW7qRhDFKFLlSOxjjs2Evs4l9O2eZ6ITC2pXzdHM7z2/VFdphN0NkOb8Y=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr23807761edv.36.1612276352447; 
 Tue, 02 Feb 2021 06:32:32 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-5-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:32:21 +0000
Message-ID: <CAFEAcA-nYeEi=L0jxPw7=kguT9RJGPZ+1oCZ3ZeFK-c-973vGQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/23] exec: Use uintptr_t in cpu_ldst.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Thu, 28 Jan 2021 at 22:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is more descriptive than 'unsigned long'.
> No functional change, since these match on all linux+bsd hosts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

