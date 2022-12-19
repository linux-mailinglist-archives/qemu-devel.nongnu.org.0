Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FEE651161
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7KKg-0005vr-SZ; Mon, 19 Dec 2022 12:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7KKe-0005vC-Fo
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:53:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7KKc-0001b9-ET
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671472421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hVPMiTLD+yJAi+joz9/h8c+n8izk3FAdxYbTfNgqUMo=;
 b=ihucVYs7elpzq0JlVzWz0JleT9aeKo60XvIYA1UFJ9Cg1ZOlWglnQKHayixvXX6c9SKGse
 /quW855jBw7G9tM5uY6oQ5lLroKfmeEZj3nLsxS+9IfKGtQtFglKgR36+QRAIRNP1UMKhx
 VzyRB038RI9u0cHaJrWC14orzdWkfxc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-365-TrMw0VN8MZiRk_DS_nb9KA-1; Mon, 19 Dec 2022 12:53:39 -0500
X-MC-Unique: TrMw0VN8MZiRk_DS_nb9KA-1
Received: by mail-qt1-f199.google.com with SMTP id
 g12-20020ac870cc000000b003a8112df2e9so4277010qtp.9
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hVPMiTLD+yJAi+joz9/h8c+n8izk3FAdxYbTfNgqUMo=;
 b=X0aGDFBFBhPP4yJT+8K+Azc86EGicwA34VaFHw/5Mqgc0G0sBGVtvvAg951j7ag4Gb
 +anGBqESglHhGeTlCmc7ce5bH0B7P/mDWHPXNatqdBk9hEBfKTzj8yGK/F+qpjFSH0+g
 R9k/sR5dKml6tLex0XgGkqTQXNyicTNvEhSv9UaspxuI+zflPa9XonDtjQ+mAkaSrlxw
 o8qEAsbO4ZntgaPa/dKdWrx1kG9YCFpAUubyRZ4hzdLFnCFMM/HVf//Lr0YeDt/rkFEx
 wBFYO+l5OYzBOiBlllIRdtmaMvnbpN6YVoE/93SHV26RKbcgNqqtG4nrzNcg6Li2HkLI
 znYQ==
X-Gm-Message-State: ANoB5pmsW0m0ZhagNCSMMzdQfbweKOQxfbUCE4LAwVNnqlw69s5bD1PL
 dWxuea6LuRjQ3ca9/vetGkjotgnpDneywFUuMHTXiROqOzA5Sc1u04RJ7m8wbhv17EAIC+U4uHX
 lpNhR+i3QwTbQp8M=
X-Received: by 2002:ac8:5299:0:b0:3a8:21cb:11d2 with SMTP id
 s25-20020ac85299000000b003a821cb11d2mr30881982qtn.1.1671472419186; 
 Mon, 19 Dec 2022 09:53:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5voU7aNX6HcZOsyJ+Q/aKcytcjavRhJr3gbgdh5KD01eg8oS3fyRVi8Ew8mo/Rv5GtqWes8w==
X-Received: by 2002:ac8:5299:0:b0:3a8:21cb:11d2 with SMTP id
 s25-20020ac85299000000b003a821cb11d2mr30881955qtn.1.1671472418941; 
 Mon, 19 Dec 2022 09:53:38 -0800 (PST)
Received: from redhat.com ([45.144.113.29]) by smtp.gmail.com with ESMTPSA id
 bc6-20020a05622a1cc600b003a820f9fb70sm6346551qtb.36.2022.12.19.09.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 09:53:38 -0800 (PST)
Date: Mon, 19 Dec 2022 12:53:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, sgarzare@redhat.com
Subject: Re: [RFC PATCH for 8.0] backends/vhost-user: relax the ioeventfd check
Message-ID: <20221219125312-mutt-send-email-mst@kernel.org>
References: <20221202132231.1048669-1-alex.bennee@linaro.org>
 <87v8m7i8s5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v8m7i8s5.fsf@linaro.org>
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

On Mon, Dec 19, 2022 at 05:48:50PM +0000, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
> > While you certainly need ioeventfds to work for KVM guests it
> > shouldn't be limited to that. We can run vhost-user backends for TCG
> > guests and either use ioeventfds or in band signalling.
> >
> > Maybe we should apply the same fix as b0aa77d36d (vhost-user: fix
> > ioeventfd_enabled)?
> >
> > With this change I can run:
> >
> >   $QEMU $OPTS \
> >     -display gtk,gl=on \
> >     -device vhost-user-gpu-pci,chardev=vhgpu \
> >     -chardev socket,id=vhgpu,path=vhgpu.sock
> >
> > with:
> >
> >   ./contrib/vhost-user-gpu/vhost-user-gpu \
> >     -s vhgpu.sock \
> >     -v
> >
> > and at least see things start-up (although the display gets rotated by
> > 180 degrees).
> >
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > ---
> >  backends/vhost-user.c | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> >
> > diff --git a/backends/vhost-user.c b/backends/vhost-user.c
> > index 5dedb2d987..87d43fb03a 100644
> > --- a/backends/vhost-user.c
> > +++ b/backends/vhost-user.c
> > @@ -21,12 +21,6 @@
> >  #include "io/channel-command.h"
> >  #include "hw/virtio/virtio-bus.h"
> >  
> > -static bool
> > -ioeventfd_enabled(void)
> > -{
> > -    return kvm_enabled() && kvm_eventfds_enabled();
> > -}
> > -
> >  int
> >  vhost_user_backend_dev_init(VhostUserBackend *b, VirtIODevice *vdev,
> >                              unsigned nvqs, Error **errp)
> > @@ -35,8 +29,8 @@ vhost_user_backend_dev_init(VhostUserBackend *b, VirtIODevice *vdev,
> >  
> >      assert(!b->vdev && vdev);
> >  
> > -    if (!ioeventfd_enabled()) {
> > -        error_setg(errp, "vhost initialization failed: requires kvm");
> > +    if (kvm_enabled() && !kvm_eventfds_enabled()) {
> > +        error_setg(errp, "vhost initialization failed: kvm required ioeventfds");
> >          return -1;
> >      }
> 
> Gentle ping?
> 

Yea why not. Pls post a non RFC patch.

-- 
MST


