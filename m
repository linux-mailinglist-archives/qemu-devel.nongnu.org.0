Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EFF6966E4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:31:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwKh-0005n2-Vb; Tue, 14 Feb 2023 09:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRwKg-0005ml-1p
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:30:58 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRwKe-0004EG-Ch
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:30:57 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 z14-20020a17090abd8e00b00233bb9d6bdcso10414302pjr.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 06:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LrAhc/RA3Eig7f+VGl/xcN6agdsMq84mS23lL5zf7AM=;
 b=UTnu1spmnc6wwImq0Y2xkdPN5aj4OHHQAbqcPxyZJct81pgQ8Wev7JXGWtS6Crd+eZ
 UfvqJtIUYusr+Hk5felHpLoM+E9+b3NgzawJyzo5fGPCAct2xMLfPAqyQlimB26GLCyp
 tveK4PoU1yE+rMXG6DbT65ft1jaRlT/HYZgVYKah3ftwhdENfJtpjVF6fxlABrgUmAXh
 ukHCzc8uMj1osQL/oyL+TWGns2/PVqjao2LEx/XPJWpxzXdFIBSRU9bQwZN3DNAcjlzU
 ADVf2UXXasAelEljdCwIb7NbdCqfaETg2GFQAie6aZoC4KrYxAIJK/yAdSpcyej0K39t
 bjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LrAhc/RA3Eig7f+VGl/xcN6agdsMq84mS23lL5zf7AM=;
 b=Fb55nHFLaBFcRJpcotxsoeYVw6EGV0hurqqvDEzcjZycELZGd8orAhENPgWT7Lo+cT
 WltEElXQ5ICL1lteIi+kxj66WnsnZaFiXE7IQUuNNXdXU88MMKKCkyKVDgBZkqzRbjs5
 wYlzX4/fJcJmtt4Ma7Nhr+da8y2CTQERHpZCaEBMHQwgYtzWIT8HUcXX4ffcAXoX82DE
 ceGewBbKFymeozHMKCI7Ujnbgn4yA9oCTQ29TT7OPCnP99PnBtwTa0gH4Cl7kHJAIq7S
 2Bj+0Jwpj1nuCwUouUXuUPkqYs+qVhShF2flNRf4Dpb3LXJeqGVDOwJ1/2HPgy18DtY8
 z05Q==
X-Gm-Message-State: AO0yUKUgKWpbJggtCnudaUvupabKTaUJT5mjI6dSxpW46yGJU7024Pfx
 AqYc/WjO/tubqy6WaZqIkVwYZHLX4xttdOqrfyWYPA==
X-Google-Smtp-Source: AK7set/m+xLqJmRQ9cG3lkPUYkSMh3tVtXng1BvnkUz1Jm8TS8kzDEcodMW21u63Z9PIo8y+usx3TycJDtPZ88InPDI=
X-Received: by 2002:a17:90a:4e06:b0:230:bcbd:b871 with SMTP id
 n6-20020a17090a4e0600b00230bcbdb871mr420271pjh.75.1676385054804; Tue, 14 Feb
 2023 06:30:54 -0800 (PST)
MIME-Version: 1.0
References: <20230214061140.36696-1-jasowang@redhat.com>
 <CAFEAcA937Q=KqVNbKO_hDDNwzbcP7BD_DQFm-rhzKGKBCp1XGA@mail.gmail.com>
In-Reply-To: <CAFEAcA937Q=KqVNbKO_hDDNwzbcP7BD_DQFm-rhzKGKBCp1XGA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Feb 2023 14:30:43 +0000
Message-ID: <CAFEAcA-OAe3EMA6RwZEiL+o_2Q96TO=gZ+=Pu2rdhjWqW=k62Q@mail.gmail.com>
Subject: Re: [PULL 00/10] Net patches
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 14 Feb 2023 at 14:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 14 Feb 2023 at 06:11, Jason Wang <jasowang@redhat.com> wrote:
> >
> > The following changes since commit f670b3eec7f5d1ed8c4573ef244e7b8c6b32001b:
> >
> >   Merge tag 'migration-20230213-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-13 11:54:05 +0000)
> >
> > are available in the git repository at:
> >
> >   https://github.com/jasowang/qemu.git tags/net-pull-request
> >
> > for you to fetch changes up to e4b953a26da11d214f91516cb9b0542eab5afaa0:
> >
> >   vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-14 14:00:30 +0800)
> >
> > ----------------------------------------------------------------
> >
> > ----------------------------------------------------------------
>
> xlnx-can-test fails on multiple CI hosts:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3767000949
> https://gitlab.com/qemu-project/qemu/-/jobs/3767000974
> https://gitlab.com/qemu-project/qemu/-/jobs/3767000994
> https://gitlab.com/qemu-project/qemu/-/jobs/3767000970
> https://gitlab.com/qemu-project/qemu/-/jobs/3767001009
> https://gitlab.com/qemu-project/qemu/-/jobs/3767000851
> https://gitlab.com/qemu-project/qemu/-/jobs/3767000849

more specifically, it asserts:

ERROR:../tests/qtest/xlnx-can-test.c:96:read_data: assertion failed
(int_status == ISR_RXOK): (0 == 16)

-- PMM

