Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FCE65F63C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:51:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDY8h-0003kA-Eu; Thu, 05 Jan 2023 16:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDY8f-0003k1-Jc
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:51:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDY8b-0005iP-B3
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672955460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iI7T8q+LVep+uQwT10vs9riTF8j0M/F9XfxRr2nLpC8=;
 b=ZbxBT2EQcreZJtVOsaDqbbAYzRkGlGAOh6MdOwHhnULJjV/uSMQdO17+ueiJrh2TFwHIVY
 U2VoahE0QB6lP7cR1PJ880RwSHJdHTOnM8Iz/vqsowIwgg4UnoVthLQSoFyZ48Ek2mU2Oh
 66IC7ZKPkeNHujwMSm00DwKaRNm6b18=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-353-jDa3RUnsMTylQTBqEN5W3w-1; Thu, 05 Jan 2023 16:50:56 -0500
X-MC-Unique: jDa3RUnsMTylQTBqEN5W3w-1
Received: by mail-wr1-f70.google.com with SMTP id
 u15-20020adfa18f000000b002b129dc55bfso701748wru.11
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iI7T8q+LVep+uQwT10vs9riTF8j0M/F9XfxRr2nLpC8=;
 b=OlD7NK8TYvCGOcOmbc3h6UwT0DszeJzQgJmIiqQxiTLDQwTLcyDLA2hxKXFBhqdHII
 KEqPOc6Sxrfvlw+LPIggLLyKVt7UB38fZP76toRLwJx2Ouesn8TBfF2JoaCZK+cyc+vO
 WAVnVkMDJIyaByMh8hte3jcwpe5HEiG1tNUIk+zEixj6KGTw8hhqo21O9uElhnYcZG+d
 xkj0NAakeCZfKn1gTxK+PmxUgKYjvUPugUjo8Q/c+vY4cAo3AO3UX6/TcEI2ybwSZimY
 /o6Wl6dUaM08QlDd6IPAUtXpiaUK+wYtvP7j9/roPRkeTgfKdESYsai2fCiTjycFALhR
 jdsw==
X-Gm-Message-State: AFqh2krJJlFuzgHE9k9dZk0sYjy9OJx/wevNqlKhfK9s+NsuhGISHvnr
 gLzS8IVW1dByW6nFI0ETQTbon7MlDwSRWEb7W5k2ahn7GBGJKymQC6S0X/fpPWIsNWo3ZFa4bI2
 ST8t7pmdnpbAenQ0=
X-Received: by 2002:adf:dfc3:0:b0:294:c208:c921 with SMTP id
 q3-20020adfdfc3000000b00294c208c921mr10644392wrn.42.1672955451678; 
 Thu, 05 Jan 2023 13:50:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtYZY8pnism4x7Pw/pkHy8NhuJrhzt/K4ZoM3Fz1ftd0xF5SfRStwCux+fCV3Bh7A/D0/ibZA==
X-Received: by 2002:adf:dfc3:0:b0:294:c208:c921 with SMTP id
 q3-20020adfdfc3000000b00294c208c921mr10644385wrn.42.1672955451380; 
 Thu, 05 Jan 2023 13:50:51 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 q187-20020a1c43c4000000b003c6c182bef9sm4499439wma.36.2023.01.05.13.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 13:50:50 -0800 (PST)
Date: Thu, 5 Jan 2023 16:50:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/51] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20230105165012-mutt-send-email-mst@kernel.org>
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105045619-mutt-send-email-mst@kernel.org>
 <20230105113111-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Dr_vT2YrrrapL5vAtL5baGxPpk0busNPU-vutJcA10A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8Dr_vT2YrrrapL5vAtL5baGxPpk0busNPU-vutJcA10A@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Jan 05, 2023 at 09:04:37PM +0000, Peter Maydell wrote:
> On Thu, 5 Jan 2023 at 16:32, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Jan 05, 2023 at 04:56:39AM -0500, Michael S. Tsirkin wrote:
> > > On Thu, Jan 05, 2023 at 04:14:20AM -0500, Michael S. Tsirkin wrote:
> > > > The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
> > > >
> > > >   .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > > >
> > > > for you to fetch changes up to 6529cb46fa76bb4b4f217d6fcc68b61b543062c4:
> > >
> > > 7c77271205339d3b161bdf925f5ead799b582e47 now - I dropped one patch
> > > as v2 is forthcoming.
> >
> > And now it's c46dcec9f699508e811cb6a140250d07486b0e41 as I replaced that
> > patch with it's v2. Sorry about the back and forth, but it seemed
> > important :(
> >
> > >
> > > >   vhost-scsi: fix memleak of vsc->inflight (2023-01-05 04:07:39 -0500)
> > > >
> > > > ----------------------------------------------------------------
> > > > virtio,pc,pci: features, cleanups, fixes
> > > >
> > > > mostly vhost-vdpa:
> > > >     guest announce feature emulation when using shadow virtqueue
> > > >     support for configure interrupt
> > > >     startup speed ups
> > > >
> > > > an acpi change to only generate cluster node in PPTT when specified for arm
> > > >
> > > > misc fixes, cleanups
> > > >
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > >
> > > > ----------------------------------------------------------------
> > > >
> > > > Note: linux-user build is failing for me on master, I just
> > > > disabled it for now as nothing I'm doing should affect linux-user.
> > > > Didn't debug yet.
> 
> Compile failures on freebsd in the bsd-user build:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3561556072
> https://gitlab.com/qemu-project/qemu/-/jobs/3561556071

yes - bsd-user/i386/signal.c

> 
> Probably something in Markus' include-file cleanup, I suspect
> some file is missing its osdep.h include.
> 
> thanks
> -- PMM


