Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8386A57B0D3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 08:09:01 +0200 (CEST)
Received: from localhost ([::1]:36918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE2tE-00030k-2U
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 02:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE2rG-0001aG-Mh
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 02:06:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE2rD-0006pW-Gw
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 02:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658297210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aVFXvcN/Yi4aJrnvR7I4MqqNAPgSAfiemzbIzJzOs+o=;
 b=aVaEUp5kvN17OXr0bNAYKlqSwKqnGeuCV7coEmp22tzlf+uy68wTWXieRmgqDzU6howgIw
 DaqQxPsjj7QwTGX3gtvGc1GJ2LntvoRaP65pAE461fYw5FHfA8hyqWjDQ4vqGBb+RPDwKw
 oAKGC5Hcbu8TXznQAKcQbA1C9F+tNyM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-TPm_oeGsMCaJ3GxW4S37ZA-1; Wed, 20 Jul 2022 02:06:43 -0400
X-MC-Unique: TPm_oeGsMCaJ3GxW4S37ZA-1
Received: by mail-lf1-f71.google.com with SMTP id
 u19-20020a05651206d300b0048a335d5cb1so3992046lff.21
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 23:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aVFXvcN/Yi4aJrnvR7I4MqqNAPgSAfiemzbIzJzOs+o=;
 b=mSVkJzuCi3rCnoz0LQG90BaYlGB6OJ/63m/ktNTD5/+aovEyS96pVCkMfNoUoDiDUL
 T3ZB/RCdOjYQ4KaY71TgsUDtzdsa4nIcTH9lU2vjIiAcHop3oK+ax0SvlHzV1sHZ/swu
 jWAfI500ZOgnq7HGKUxrYcEME0uzddSl94qQqISlJLq09urnKHDhNjpYsnE7XV8NSx15
 fYOomptprX5oqUscRiKnHTDoYjrXjNx2pDzo4Fh04vPxOLKyIXczSG9LYJwSbRRKVaS8
 H6+upJylsu/zqszjOHcofe+zZRL6JLlJxw3Kgj1DMC9HUSFNOsvLD7uE1GxaFooY9cXu
 LRSQ==
X-Gm-Message-State: AJIora8gC5PRdPWV3xRcVFO80bKvKWtUe2C3HJ2uURmgMsXyhZgxkfK7
 9qzJrgR7Ek1zyuoBxxVycALBxKi38pwsnJK8XLCLuFtCjSwhcPCHvb8XO8B+MaXQyB7vABzO+2j
 VUcKDndtxDLEhigQZLbnVfDYlTY1H+eo=
X-Received: by 2002:a2e:a9a6:0:b0:25d:601a:d3d8 with SMTP id
 x38-20020a2ea9a6000000b0025d601ad3d8mr15976924ljq.141.1658297201209; 
 Tue, 19 Jul 2022 23:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vP09ARw4eGRjap8PtglbBc/UI+uPfbFjLbOA5rb5P9UuejvxzVAgeHdOUDycu7INm19I4CDAb8sda6o6AR/94=
X-Received: by 2002:a2e:a9a6:0:b0:25d:601a:d3d8 with SMTP id
 x38-20020a2ea9a6000000b0025d601ad3d8mr15976915ljq.141.1658297200934; Tue, 19
 Jul 2022 23:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220719131637.46131-1-jasowang@redhat.com>
 <CAFEAcA8Kce5SJeR0_+Mj6a48V6ju+nyT=CWGwrgi4cjPxuby2g@mail.gmail.com>
 <CACGkMEspsAKtkh2AOsWkNU8Rn1qG2-j8RVmLHK04Rm4XBMvw_g@mail.gmail.com>
 <CAJaqyWfF=4fTA_+mRts+HcBVHo9Q7XsQeOMg8uFuX3D74Mm2VQ@mail.gmail.com>
In-Reply-To: <CAJaqyWfF=4fTA_+mRts+HcBVHo9Q7XsQeOMg8uFuX3D74Mm2VQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Jul 2022 14:06:29 +0800
Message-ID: <CACGkMEsiEB85n5eNY=+1ov3wAP+pSvv7UHrEO1M+pd2hhgtNEQ@mail.gmail.com>
Subject: Re: [PULL 00/24] Net Patches
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 20, 2022 at 2:03 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Wed, Jul 20, 2022 at 5:40 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Jul 20, 2022 at 12:40 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Tue, 19 Jul 2022 at 14:17, Jason Wang <jasowang@redhat.com> wrote:
> > > >
> > > > The following changes since commit f9d9fff72eed03acde97ea2d66104748dc474b2e:
> > > >
> > > >   Merge tag 'qemu-sparc-20220718' of https://github.com/mcayland/qemu into staging (2022-07-19 09:57:13 +0100)
> > > >
> > > > are available in the git repository at:
> > > >
> > > >   https://github.com/jasowang/qemu.git tags/net-pull-request
> > > >
> > > > for you to fetch changes up to f8a9fd7b7ab6601b76e253bbcbfe952f8c1887ec:
> > > >
> > > >   net/colo.c: fix segmentation fault when packet is not parsed correctly (2022-07-19 21:05:20 +0800)
> > > >
> > > > ----------------------------------------------------------------
> > > >
> > > > ----------------------------------------------------------------
> > >
> > > Fails to build, many platforms:
> > >
> > > eg
> > > https://gitlab.com/qemu-project/qemu/-/jobs/2742242194
> > >
> > > libcommon.fa.p/net_vhost-vdpa.c.o: In function `vhost_vdpa_cvq_unmap_buf':
> > > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:234: undefined
> > > reference to `vhost_iova_tree_find_iova'
> > > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:242: undefined
> > > reference to `vhost_vdpa_dma_unmap'
> > > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:247: undefined
> > > reference to `vhost_iova_tree_remove'
> > > libcommon.fa.p/net_vhost-vdpa.c.o: In function `vhost_vdpa_cleanup':
> > > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:163: undefined
> > > reference to `vhost_iova_tree_delete'
> > > libcommon.fa.p/net_vhost-vdpa.c.o: In function `vhost_vdpa_cvq_map_buf':
> > > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:285: undefined
> > > reference to `vhost_iova_tree_map_alloc'
> > > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:291: undefined
> > > reference to `vhost_vdpa_dma_map'
> > > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:300: undefined
> > > reference to `vhost_iova_tree_remove'
> > > libcommon.fa.p/net_vhost-vdpa.c.o: In function
> > > `vhost_vdpa_net_handle_ctrl_avail':
> > > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:445: undefined
> > > reference to `vhost_svq_push_elem'
> > > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:408: undefined
> > > reference to `vhost_svq_add'
> > > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:422: undefined
> > > reference to `vhost_svq_poll'
> > > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:434: undefined
> > > reference to `virtio_net_handle_ctrl_iov'
> > > libcommon.fa.p/net_vhost-vdpa.c.o: In function `net_init_vhost_vdpa':
> > > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:611: undefined
> > > reference to `vhost_iova_tree_new'
> > > libcommon.fa.p/net_vhost-vdpa.c.o: In function
> > > `glib_autoptr_cleanup_VhostIOVATree':
> > > /builds/qemu-project/qemu/hw/virtio/vhost-iova-tree.h:20: undefined
> > > reference to `vhost_iova_tree_delete'
> > > collect2: error: ld returned 1 exit status
> > > [2436/4108] Compiling C object
> > > libqemu-s390x-softmmu.fa.p/meson-generated_.._qapi_qapi-introspect.c.o
> > >
> > >
> > >
> > > Presumably the conditions in the various meson.build files are
> > > out of sync about when to build the net/vhost-vdpa.c code vs
> > > the code that's implementing the functions it's trying to call.
> > >
> > > Specifically, the functions being called will only be present
> > > if the target architecture has CONFIG_VIRTIO, which isn't
> > > guaranteed, but we try to link the vhost-vdpa code in anyway.
> >
> > Right, this is probably because vhost-vdpa start to use virtio loigc (cvq).
> >
> > Eugenio, please fix this and I will send a new version of the pull request.
> >
>
> Is the right solution to build vhost-vdpa.c only if CONFIG_VIRTIO_NET
> is defined?

If you meant net/vhost-vdpa.c. I think so, since we're using cvq logic
in virtio-net.c.

>
> It would make it equal as vhost_net_user in net/meson.buikd:
> if have_vhost_net_user
>   softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true:
> files('vhost-user.c'), if_false: files('vhost-user-stub.c'))
>   softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-user-stub.c'))
> endif
>
> vs
>
> if have_vhost_net_vdpa
>   softmmu_ss.add(files('vhost-vdpa.c'))
> endif
>
> Or that would be considered as a regression?

Probably not since the compilation is not broken.

> The other solution would
> be to add vhost-shadow-virtqueue-stub.c and make these functions
> return -ENOTSUP and similar.

Either should be fine, just choose the one that is easier.

Thanks

>
> Thanks!
>


