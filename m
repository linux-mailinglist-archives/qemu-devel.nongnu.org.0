Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFA757B0C6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 08:05:49 +0200 (CEST)
Received: from localhost ([::1]:34698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE2qB-0001O7-Ip
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 02:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE2nt-0008RF-JY
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 02:03:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE2np-00060o-Ux
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 02:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658297000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IHhg1x5ZRbyu4Dl8PogR7VlRo87C5rVPuNMreFAbtys=;
 b=PWPGse37HJZyDapcrcIoKe6wPSl6IS9uiMYEBIUVsQPjqQs5MMft7JDR3spTa9aRZCKVov
 shg02xH2wN2YgONq3JFE5mwuVTeDYFd1FcmQjKOWxq54DD8pZe9v7vD+k2s16r+4n1FM2H
 gldedct1pWmIN34KApA9ZoNtNs8Is08=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488--u6xAYDgOwuU46pZ4-CMsw-1; Wed, 20 Jul 2022 02:03:19 -0400
X-MC-Unique: -u6xAYDgOwuU46pZ4-CMsw-1
Received: by mail-qt1-f198.google.com with SMTP id
 q21-20020ac84115000000b0031bf60d9b35so11494819qtl.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 23:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IHhg1x5ZRbyu4Dl8PogR7VlRo87C5rVPuNMreFAbtys=;
 b=2InNss5qxJSq1QYfivbYBr7B3oAVSS+LdGz4MTGWffVda3ass/7za6oEiec63MijIr
 a9EMiKAC2OoODshy20lFt8lsuzr4pr4psfo8TCrl/Efy2Jg9D9qxyPD0nnJeD9mi1YIY
 Sk0KILpqd+th0DJsz7ajsrScXwLUorwvDj9xrWHv32vZywD1G2uFBWhVnEHEgx5H1KIE
 w6MDg2/iIMfXQpoaNIUrpj2lTukL8WRVvcfEiixSU+n9Dh2lnWqsVbzXXrbnXU/yBnma
 B1uskdWM+hN4CQDAsJOos8s8sExiQ29Q5RaN1k4XsRip2QZb1EpdJmAtVMBImhUeRR6x
 KgFA==
X-Gm-Message-State: AJIora/hyDCLr/DPBQem0Zco9EQciN6005IBISadtRXzf0GbsPxFumQb
 MuzyVzdfmTjyPnnEZAaugv6ulZN9gBxWiwK8EeUZjF0Pre4eGH5sYUkFqiyoQcR+A0ILKrNBrmP
 mV6g3QFIIz427Ysj8xWlf5zuAOHr3APo=
X-Received: by 2002:a05:622a:1048:b0:31f:4b2:ef55 with SMTP id
 f8-20020a05622a104800b0031f04b2ef55mr2820883qte.582.1658296998222; 
 Tue, 19 Jul 2022 23:03:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tgOEPHQP3K6Lmea7b5yBFRuZAmPoxwNtnp0VaE9jziVOD87qOsmZr9X+Gu1Zx9w+scAAm3o8FOJOhF5dSUZ70=
X-Received: by 2002:a05:622a:1048:b0:31f:4b2:ef55 with SMTP id
 f8-20020a05622a104800b0031f04b2ef55mr2820865qte.582.1658296997907; Tue, 19
 Jul 2022 23:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220719131637.46131-1-jasowang@redhat.com>
 <CAFEAcA8Kce5SJeR0_+Mj6a48V6ju+nyT=CWGwrgi4cjPxuby2g@mail.gmail.com>
 <CACGkMEspsAKtkh2AOsWkNU8Rn1qG2-j8RVmLHK04Rm4XBMvw_g@mail.gmail.com>
In-Reply-To: <CACGkMEspsAKtkh2AOsWkNU8Rn1qG2-j8RVmLHK04Rm4XBMvw_g@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 20 Jul 2022 08:02:41 +0200
Message-ID: <CAJaqyWfF=4fTA_+mRts+HcBVHo9Q7XsQeOMg8uFuX3D74Mm2VQ@mail.gmail.com>
Subject: Re: [PULL 00/24] Net Patches
To: Jason Wang <jasowang@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Wed, Jul 20, 2022 at 5:40 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Jul 20, 2022 at 12:40 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 19 Jul 2022 at 14:17, Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > The following changes since commit f9d9fff72eed03acde97ea2d66104748dc474b2e:
> > >
> > >   Merge tag 'qemu-sparc-20220718' of https://github.com/mcayland/qemu into staging (2022-07-19 09:57:13 +0100)
> > >
> > > are available in the git repository at:
> > >
> > >   https://github.com/jasowang/qemu.git tags/net-pull-request
> > >
> > > for you to fetch changes up to f8a9fd7b7ab6601b76e253bbcbfe952f8c1887ec:
> > >
> > >   net/colo.c: fix segmentation fault when packet is not parsed correctly (2022-07-19 21:05:20 +0800)
> > >
> > > ----------------------------------------------------------------
> > >
> > > ----------------------------------------------------------------
> >
> > Fails to build, many platforms:
> >
> > eg
> > https://gitlab.com/qemu-project/qemu/-/jobs/2742242194
> >
> > libcommon.fa.p/net_vhost-vdpa.c.o: In function `vhost_vdpa_cvq_unmap_buf':
> > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:234: undefined
> > reference to `vhost_iova_tree_find_iova'
> > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:242: undefined
> > reference to `vhost_vdpa_dma_unmap'
> > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:247: undefined
> > reference to `vhost_iova_tree_remove'
> > libcommon.fa.p/net_vhost-vdpa.c.o: In function `vhost_vdpa_cleanup':
> > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:163: undefined
> > reference to `vhost_iova_tree_delete'
> > libcommon.fa.p/net_vhost-vdpa.c.o: In function `vhost_vdpa_cvq_map_buf':
> > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:285: undefined
> > reference to `vhost_iova_tree_map_alloc'
> > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:291: undefined
> > reference to `vhost_vdpa_dma_map'
> > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:300: undefined
> > reference to `vhost_iova_tree_remove'
> > libcommon.fa.p/net_vhost-vdpa.c.o: In function
> > `vhost_vdpa_net_handle_ctrl_avail':
> > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:445: undefined
> > reference to `vhost_svq_push_elem'
> > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:408: undefined
> > reference to `vhost_svq_add'
> > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:422: undefined
> > reference to `vhost_svq_poll'
> > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:434: undefined
> > reference to `virtio_net_handle_ctrl_iov'
> > libcommon.fa.p/net_vhost-vdpa.c.o: In function `net_init_vhost_vdpa':
> > /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:611: undefined
> > reference to `vhost_iova_tree_new'
> > libcommon.fa.p/net_vhost-vdpa.c.o: In function
> > `glib_autoptr_cleanup_VhostIOVATree':
> > /builds/qemu-project/qemu/hw/virtio/vhost-iova-tree.h:20: undefined
> > reference to `vhost_iova_tree_delete'
> > collect2: error: ld returned 1 exit status
> > [2436/4108] Compiling C object
> > libqemu-s390x-softmmu.fa.p/meson-generated_.._qapi_qapi-introspect.c.o
> >
> >
> >
> > Presumably the conditions in the various meson.build files are
> > out of sync about when to build the net/vhost-vdpa.c code vs
> > the code that's implementing the functions it's trying to call.
> >
> > Specifically, the functions being called will only be present
> > if the target architecture has CONFIG_VIRTIO, which isn't
> > guaranteed, but we try to link the vhost-vdpa code in anyway.
>
> Right, this is probably because vhost-vdpa start to use virtio loigc (cvq).
>
> Eugenio, please fix this and I will send a new version of the pull request.
>

Is the right solution to build vhost-vdpa.c only if CONFIG_VIRTIO_NET
is defined?

It would make it equal as vhost_net_user in net/meson.buikd:
if have_vhost_net_user
  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true:
files('vhost-user.c'), if_false: files('vhost-user-stub.c'))
  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-user-stub.c'))
endif

vs

if have_vhost_net_vdpa
  softmmu_ss.add(files('vhost-vdpa.c'))
endif

Or that would be considered as a regression? The other solution would
be to add vhost-shadow-virtqueue-stub.c and make these functions
return -ENOTSUP and similar.

Thanks!


