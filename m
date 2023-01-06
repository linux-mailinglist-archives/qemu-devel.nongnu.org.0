Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE7166034E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 16:30:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDoel-0008Rj-29; Fri, 06 Jan 2023 10:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDoei-0008QN-JG
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 10:29:16 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDoeg-0002uZ-Qw
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 10:29:16 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso5542100pjt.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 07:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K7RAIrzySmmFFVV2DS5JS6Kr9Ly46/TP3wfUCXZHT7g=;
 b=Enmwt7PVA2eD5bwAcAEICwhefDIPXYgL5vjvOOjvYy2Id1Q3MBq4XxWxTxLcgMdPPt
 FVrlaq1g6R5Pin2LeVHqKhycY0G1fhx92c6kezMvj/ghkQK5xerZMB3cqlscukJ/538E
 3H/gPNN8eF/6q/r++/K0XXKDLXmZQ/ohhHVE+sSJ4zeyi+aXYtZcKn9jrS1outv7X4xv
 jzN5UmPp8PJtWAxHlX2WE7qIR7wKtspzBF7iBWJWhDAtwi1gSYcpC7DgUsfuiotdm7DO
 4FMzxk0pocsg58wFaQRKkD6jPyxFmSyPYL+tK2Cw+53OLh2B0F98ZkFhzyOWMNz5TbVs
 kdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K7RAIrzySmmFFVV2DS5JS6Kr9Ly46/TP3wfUCXZHT7g=;
 b=LfVg7fela2s4ADdU1FoJu9Z2XwqvohS/38EPtBBewMg/gz4JjeQwevYLRsDMQgQNtN
 rhr7LOQsAnk5ObXip1Xm6RypMg/gxhs9rTdUeJlboxiibNrjJVm3nXtIBFzsDSKVRU57
 Rb2+hDyUEIYTeuozLa9i3tW6uqBy8u0AWa0SioJ1ZjWIvqwuskalGamEDzN++X++8ZQF
 Rj885QZzgeb9vLU63E2ketQMb0GQ+c15NX8kHmUkdKctTAy/iG+Ug5YRk42dn2opJGk1
 jwLJXiu3nZRIGVOdxHq1/78LkYyhdvV61h73pq0S/Pi2a9xuC7hRzi4wWaZl6aNVvmV3
 mDBA==
X-Gm-Message-State: AFqh2kqBbZYOYJI+k+iY6Y6HQ5tX2ecyL0OZ+91O9PK9GGv2+htGzIlv
 MHyN/L+7uVWukm4vOzvOeNOspCmrXbGGe1hs6eduOw==
X-Google-Smtp-Source: AMrXdXt9aB5MaxKpo1zz7QyBfrdYvNtL+61NVFPkEbql12iEv0MjBsMIB1nZg52iPQtUyddEeyNCj3aIyQk/J157Xm8=
X-Received: by 2002:a17:903:2653:b0:189:cdc8:7261 with SMTP id
 je19-20020a170903265300b00189cdc87261mr3743910plb.168.1673018952659; Fri, 06
 Jan 2023 07:29:12 -0800 (PST)
MIME-Version: 1.0
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105045619-mutt-send-email-mst@kernel.org>
 <20230105113111-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Dr_vT2YrrrapL5vAtL5baGxPpk0busNPU-vutJcA10A@mail.gmail.com>
 <20230105165242-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230105165242-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 15:29:01 +0000
Message-ID: <CAFEAcA8C5cfBc6qU1bZ_U0PusAAemOD6TYGhgxtQbwP-YA3yVQ@mail.gmail.com>
Subject: Re: [PULL 00/51] virtio,pc,pci: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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

On Thu, 5 Jan 2023 at 21:53, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jan 05, 2023 at 09:04:37PM +0000, Peter Maydell wrote:
> > On Thu, 5 Jan 2023 at 16:32, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Thu, Jan 05, 2023 at 04:56:39AM -0500, Michael S. Tsirkin wrote:
> > > > On Thu, Jan 05, 2023 at 04:14:20AM -0500, Michael S. Tsirkin wrote:
> > > > > The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
> > > > >
> > > > >   .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
> > > > >
> > > > > are available in the Git repository at:
> > > > >
> > > > >   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > > > >
> > > > > for you to fetch changes up to 6529cb46fa76bb4b4f217d6fcc68b61b543062c4:
> > > >
> > > > 7c77271205339d3b161bdf925f5ead799b582e47 now - I dropped one patch
> > > > as v2 is forthcoming.
> > >
> > > And now it's c46dcec9f699508e811cb6a140250d07486b0e41 as I replaced that
> > > patch with it's v2. Sorry about the back and forth, but it seemed
> > > important :(
> > >
> > > >
> > > > >   vhost-scsi: fix memleak of vsc->inflight (2023-01-05 04:07:39 -0500)
> > > > >
> > > > > ----------------------------------------------------------------
> > > > > virtio,pc,pci: features, cleanups, fixes
> > > > >
> > > > > mostly vhost-vdpa:
> > > > >     guest announce feature emulation when using shadow virtqueue
> > > > >     support for configure interrupt
> > > > >     startup speed ups
> > > > >
> > > > > an acpi change to only generate cluster node in PPTT when specified for arm
> > > > >
> > > > > misc fixes, cleanups
> > > > >
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > >
> > > > > ----------------------------------------------------------------
> > > > >
> > > > > Note: linux-user build is failing for me on master, I just
> > > > > disabled it for now as nothing I'm doing should affect linux-user.
> > > > > Didn't debug yet.
> >
> > Compile failures on freebsd in the bsd-user build:
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/3561556072
> > https://gitlab.com/qemu-project/qemu/-/jobs/3561556071
> >
> > Probably something in Markus' include-file cleanup, I suspect
> > some file is missing its osdep.h include.
> >
> > thanks
> > -- PMM
>
>
> Pushed a fixup, commit 1df76fab679e9a673b71531925fe12ceb89eaecb now.
> Pls let me know, thanks!

Still failing on FreeBSD, for a different reason:
https://gitlab.com/qemu-project/qemu/-/jobs/3565200188

thanks
-- PMM

