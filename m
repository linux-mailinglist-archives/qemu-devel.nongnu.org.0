Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A386615A4
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 15:00:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEWBf-0004pi-O6; Sun, 08 Jan 2023 08:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pEWBe-0004pK-7R
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 08:58:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pEWBc-0007jp-0A
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 08:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673186286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNNawYOyLPhfKLT7b0A9DcIE+tkEsOJ4y2c3fVOa/vc=;
 b=eq/vh6uAujFb6nIsvWTruWC/fRSjRJ6jIZcO7RuqxhRMX2BfjZOr1ruiOOtqrE7AZTkWa+
 SWJVDfTEy3pY03w4KHe/dsjFHNWV5qQ1AnIAPoFVlyggXVEfKZ02DUo4zKCnhQ+3AWBvux
 BRJHEZIJJGmJeydKewKdkx/5MyfNrZ0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-hHYESo_6PJaaAPp1fy5ZhA-1; Sun, 08 Jan 2023 08:58:05 -0500
X-MC-Unique: hHYESo_6PJaaAPp1fy5ZhA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l31-20020a05600c1d1f00b003d9720d2a0eso5758796wms.7
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 05:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cNNawYOyLPhfKLT7b0A9DcIE+tkEsOJ4y2c3fVOa/vc=;
 b=ZVJ7mKNeR7WO1LdNYHq9FoXPmzE8dODJHgTFajFGRtC7oISYpmC1VHpaJtafhLXgKb
 4szzNfiE8TpfpVnJd8epsPxFovfdHc4AJGH8Y3D/4O7ybuTt1A/mziDwxk+t0+xs0EBI
 aVgYkxrQdZfNzLr1RBI46yNlyITbt2D/YK5l4xw6aMKlSqysd7tm83yZj+9A94HwT/nR
 Msv2KA7Qu/Vs5CWtAPXJrxGkhdUTqG1Uh/ELswN6/bZlvHr2jxAYiX43NHPC7+jx84uy
 PlmZPjrin+DADtUchxJj80a3cmWvsgypzgU1OpA/EW9cpn8vcMRlDQR2mHwUCslYBdSu
 Py+g==
X-Gm-Message-State: AFqh2kpZKhIJoB7jrc6VnzGPFU1WO8GLHSg/kK/1n39yGkexleo/WHBY
 A8ArMc1gBOe5eqZMB/VWktUn1dexoSJSgUihSOBBiWiI5/XpAYJk+VwkPRZm0hPhjNfAlq/y5Zh
 grFaSns4r5PiFkps=
X-Received: by 2002:a05:600c:4a90:b0:3d2:3ae8:886a with SMTP id
 b16-20020a05600c4a9000b003d23ae8886amr47743674wmp.17.1673186283791; 
 Sun, 08 Jan 2023 05:58:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvm2iaqSyKNCg1QMkWT09SzDZQx6ZD9/a/rw3mVIQVGQwhaspve1S3hKpZepPCzAEoXdYj/QA==
X-Received: by 2002:a05:600c:4a90:b0:3d2:3ae8:886a with SMTP id
 b16-20020a05600c4a9000b003d23ae8886amr47743667wmp.17.1673186283520; 
 Sun, 08 Jan 2023 05:58:03 -0800 (PST)
Received: from redhat.com ([2.52.141.223]) by smtp.gmail.com with ESMTPSA id
 t19-20020a0560001a5300b002362f6fcaf5sm6100615wry.48.2023.01.08.05.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 05:58:02 -0800 (PST)
Date: Sun, 8 Jan 2023 08:57:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/51] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20230108015336-mutt-send-email-mst@kernel.org>
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105045619-mutt-send-email-mst@kernel.org>
 <20230105113111-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Dr_vT2YrrrapL5vAtL5baGxPpk0busNPU-vutJcA10A@mail.gmail.com>
 <20230105165242-mutt-send-email-mst@kernel.org>
 <CAFEAcA8C5cfBc6qU1bZ_U0PusAAemOD6TYGhgxtQbwP-YA3yVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8C5cfBc6qU1bZ_U0PusAAemOD6TYGhgxtQbwP-YA3yVQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Jan 06, 2023 at 03:29:01PM +0000, Peter Maydell wrote:
> On Thu, 5 Jan 2023 at 21:53, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Jan 05, 2023 at 09:04:37PM +0000, Peter Maydell wrote:
> > > On Thu, 5 Jan 2023 at 16:32, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Thu, Jan 05, 2023 at 04:56:39AM -0500, Michael S. Tsirkin wrote:
> > > > > On Thu, Jan 05, 2023 at 04:14:20AM -0500, Michael S. Tsirkin wrote:
> > > > > > The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
> > > > > >
> > > > > >   .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
> > > > > >
> > > > > > are available in the Git repository at:
> > > > > >
> > > > > >   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > > > > >
> > > > > > for you to fetch changes up to 6529cb46fa76bb4b4f217d6fcc68b61b543062c4:
> > > > >
> > > > > 7c77271205339d3b161bdf925f5ead799b582e47 now - I dropped one patch
> > > > > as v2 is forthcoming.
> > > >
> > > > And now it's c46dcec9f699508e811cb6a140250d07486b0e41 as I replaced that
> > > > patch with it's v2. Sorry about the back and forth, but it seemed
> > > > important :(
> > > >
> > > > >
> > > > > >   vhost-scsi: fix memleak of vsc->inflight (2023-01-05 04:07:39 -0500)
> > > > > >
> > > > > > ----------------------------------------------------------------
> > > > > > virtio,pc,pci: features, cleanups, fixes
> > > > > >
> > > > > > mostly vhost-vdpa:
> > > > > >     guest announce feature emulation when using shadow virtqueue
> > > > > >     support for configure interrupt
> > > > > >     startup speed ups
> > > > > >
> > > > > > an acpi change to only generate cluster node in PPTT when specified for arm
> > > > > >
> > > > > > misc fixes, cleanups
> > > > > >
> > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > >
> > > > > > ----------------------------------------------------------------
> > > > > >
> > > > > > Note: linux-user build is failing for me on master, I just
> > > > > > disabled it for now as nothing I'm doing should affect linux-user.
> > > > > > Didn't debug yet.
> > >
> > > Compile failures on freebsd in the bsd-user build:
> > >
> > > https://gitlab.com/qemu-project/qemu/-/jobs/3561556072
> > > https://gitlab.com/qemu-project/qemu/-/jobs/3561556071
> > >
> > > Probably something in Markus' include-file cleanup, I suspect
> > > some file is missing its osdep.h include.
> > >
> > > thanks
> > > -- PMM
> >
> >
> > Pushed a fixup, commit 1df76fab679e9a673b71531925fe12ceb89eaecb now.
> > Pls let me know, thanks!
> 
> Still failing on FreeBSD, for a different reason:
> https://gitlab.com/qemu-project/qemu/-/jobs/3565200188
> 
> thanks
> -- PMM

Dropped the offending patch, commit aba0d042b1c1be38818cec16af3f34e9e9e2aed2 
now.  Pls let me know, thanks!

-- 
MST


