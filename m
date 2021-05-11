Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5F137A3CD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:38:27 +0200 (CEST)
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOqQ-0004je-RA
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOR9-0003JB-9w
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:12:19 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOR4-00084k-J7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:12:19 -0400
Received: by mail-ed1-x535.google.com with SMTP id c22so21983012edn.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 02:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G9tUcGCyL6KxP6G7vp+hswa9mhFZ8w8MdNCqspqj99E=;
 b=pxe7t3iXInVQ2n1AkKfGB5My102ENdw+SQnYWmhm4xX9u6p9Wzi3LMZuv5meyloEqT
 R1XTn/Q+aOUQJzSTlbJOqOpy+EhTULShTDCSbxO/Wscs44ACE48+6cqWcAC2tQExyH0E
 nsw0zuwHvtYaTvo32puyquObnTooSB1qZCKBntD2CO+HXEAPSnm62bpMi0CfBIXEMUYm
 0Z/nb5YR0/WZtp/5oNkJWsZaKD0QTZBTksKOMc+pGtLXyap3rPUSkhWyhZ0eA94PhsZU
 Bp+xY4u/+2VPZHQSnr+nZ4KnDlvF60zU76GtPvgNg7YU47qrdAoHljOIQ0+2yhD6ql33
 KdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G9tUcGCyL6KxP6G7vp+hswa9mhFZ8w8MdNCqspqj99E=;
 b=gujMejIgt9jk33T6/Y3OtmD3Dz9K6hyid7YlcFGsb769BZ7BY3TAS32OPUjutdY15I
 Hq//f+687EwXOu13BRyHs+q7QGM+wUHu6+sBnr4gVi36KrlLfpKbI4/6xXHTndLBt0h7
 sHwIjl/LXjUytWsq0wB/r3++qNhkrdoUSiLnQK4Rd7k0/wMZ/alh5+nzLSn0bc+d2lNe
 ICqRmpv7UQ7xYJjUrxsAXX5HQ7ULRVXFXV0FBYkmBrdhwk9pqlJVVJ9rF6b5dabT1s7k
 L2ki9rs20CoqE3JpRHFgLXPPn8rNIZT+k/73fGXcAVsJJ3NGBqVv5d+N5IcfnQckyzpx
 NWOQ==
X-Gm-Message-State: AOAM532zijiZzJhe3oeALs7Sn4hyQQKbxrLlWFL7s3XX077+/xkIOM6r
 XmUC+xdual6+n9oslk4zvSL0TaTyUbx5R4MT2IWBnQ==
X-Google-Smtp-Source: ABdhPJzbQA7/Tnqa41UcwC8d0FYoXIrFp4+1kcpJE5jjdbpo2uytNEHteH3xKzgjLhwXC3hPqX2qIxg55lPYTUCJUxw=
X-Received: by 2002:a05:6402:1d8f:: with SMTP id
 dk15mr32479326edb.146.1620724333248; 
 Tue, 11 May 2021 02:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-11-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 10:11:01 +0100
Message-ID: <CAFEAcA_tfckLfk8SmqyZVrM5vxZ74P_9yx9NR=_d7utT-17hTA@mail.gmail.com>
Subject: Re: [PATCH v6 10/82] target/arm: Implement SVE2 integer add/subtract
 long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix select offsets (laurent desnogues).
> ---
>  target/arm/helper-sve.h    | 24 ++++++++++++++++++++
>  target/arm/sve.decode      | 19 ++++++++++++++++
>  target/arm/sve_helper.c    | 43 +++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 46 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 132 insertions(+)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

