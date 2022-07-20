Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B728457AF90
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 05:42:36 +0200 (CEST)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE0bb-0005zr-Ap
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 23:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE0Zt-0004cv-Hu
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 23:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE0Zp-0001QN-Gp
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 23:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658288443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GV83zRtfV/ZnC+ZdITl5mzJCfuVegLmHgNrfbDRzAhY=;
 b=E9Z/g07Kgy9nZ2bbRWgfnGDvtryJHyuPbeC1156RREjAzkWPfK/ezA1YOZIJB8vykEKFhU
 8wO14W6/aP7F1PbU+viko97jr2DoF4r8erUFiFiIlYYfEeBJ+QDmpaep1EaRDvVHKbs8B5
 Tw4f5zhJLBIju1394VCsGEZn32s7zvw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-P9WxeH8kPN2zGyXoI_zMGw-1; Tue, 19 Jul 2022 23:40:42 -0400
X-MC-Unique: P9WxeH8kPN2zGyXoI_zMGw-1
Received: by mail-lj1-f199.google.com with SMTP id
 l14-20020a2e99ce000000b0025dd695437fso72571ljj.21
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 20:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GV83zRtfV/ZnC+ZdITl5mzJCfuVegLmHgNrfbDRzAhY=;
 b=Xr8fgr19fby6q5Xwjf5s6H58QChw6M9t5m+kTQhtbVIVArfJrFVCJZculq6ygOeRDV
 ER6FJFBBQnZeYlahuUxwjkT0VQ1teLcajGaUCZ9z+6mynmFHd1v70Dv9fIKdvICEa94B
 9aEF1TjAhkORWUdXVTrvhxRFyjPc1IT2JV8voGZdHNrJcakk1NWdHlpac+bQEo9ehAuc
 LCIxuui28obq7PoQqUay0YyxSbdUwp3VvKO/9BgADkgfpzyzgWXBqhOeh5cTsAs/ggkh
 fXlqa8SKfBHSHvhn5317DcmpsvQYvYgojZQUvVr6jwfbSY5Y1jBjnW39f3fMi3LAaZWy
 LNbw==
X-Gm-Message-State: AJIora+0KPKM+djJ1VZPCV7ToDsD9B12k538XnzZcFRktZZV8eGpbih3
 D6AqrHnekEwFZRG/8IW+EbZbAmi1219S2yO4iN4HyGAp339zL381zdASzxsjM0XfXDhHKk54YqV
 XMOX8mmTeM/N30nySJuPn5TafyHcxtUc=
X-Received: by 2002:a2e:9e17:0:b0:25d:7654:4c6b with SMTP id
 e23-20020a2e9e17000000b0025d76544c6bmr16462660ljk.130.1658288440435; 
 Tue, 19 Jul 2022 20:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s4+TY6DxIpzdZ+eFOvhIBcRTWMuDbl3F77x3+B/VkB99PlVaUuoocG4kAoV2m5VOpaISlMdbYMRTEHfYyMkbc=
X-Received: by 2002:a2e:9e17:0:b0:25d:7654:4c6b with SMTP id
 e23-20020a2e9e17000000b0025d76544c6bmr16462655ljk.130.1658288440144; Tue, 19
 Jul 2022 20:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220719131637.46131-1-jasowang@redhat.com>
 <CAFEAcA8Kce5SJeR0_+Mj6a48V6ju+nyT=CWGwrgi4cjPxuby2g@mail.gmail.com>
In-Reply-To: <CAFEAcA8Kce5SJeR0_+Mj6a48V6ju+nyT=CWGwrgi4cjPxuby2g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Jul 2022 11:40:28 +0800
Message-ID: <CACGkMEspsAKtkh2AOsWkNU8Rn1qG2-j8RVmLHK04Rm4XBMvw_g@mail.gmail.com>
Subject: Re: [PULL 00/24] Net Patches
To: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jul 20, 2022 at 12:40 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 19 Jul 2022 at 14:17, Jason Wang <jasowang@redhat.com> wrote:
> >
> > The following changes since commit f9d9fff72eed03acde97ea2d66104748dc474b2e:
> >
> >   Merge tag 'qemu-sparc-20220718' of https://github.com/mcayland/qemu into staging (2022-07-19 09:57:13 +0100)
> >
> > are available in the git repository at:
> >
> >   https://github.com/jasowang/qemu.git tags/net-pull-request
> >
> > for you to fetch changes up to f8a9fd7b7ab6601b76e253bbcbfe952f8c1887ec:
> >
> >   net/colo.c: fix segmentation fault when packet is not parsed correctly (2022-07-19 21:05:20 +0800)
> >
> > ----------------------------------------------------------------
> >
> > ----------------------------------------------------------------
>
> Fails to build, many platforms:
>
> eg
> https://gitlab.com/qemu-project/qemu/-/jobs/2742242194
>
> libcommon.fa.p/net_vhost-vdpa.c.o: In function `vhost_vdpa_cvq_unmap_buf':
> /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:234: undefined
> reference to `vhost_iova_tree_find_iova'
> /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:242: undefined
> reference to `vhost_vdpa_dma_unmap'
> /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:247: undefined
> reference to `vhost_iova_tree_remove'
> libcommon.fa.p/net_vhost-vdpa.c.o: In function `vhost_vdpa_cleanup':
> /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:163: undefined
> reference to `vhost_iova_tree_delete'
> libcommon.fa.p/net_vhost-vdpa.c.o: In function `vhost_vdpa_cvq_map_buf':
> /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:285: undefined
> reference to `vhost_iova_tree_map_alloc'
> /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:291: undefined
> reference to `vhost_vdpa_dma_map'
> /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:300: undefined
> reference to `vhost_iova_tree_remove'
> libcommon.fa.p/net_vhost-vdpa.c.o: In function
> `vhost_vdpa_net_handle_ctrl_avail':
> /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:445: undefined
> reference to `vhost_svq_push_elem'
> /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:408: undefined
> reference to `vhost_svq_add'
> /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:422: undefined
> reference to `vhost_svq_poll'
> /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:434: undefined
> reference to `virtio_net_handle_ctrl_iov'
> libcommon.fa.p/net_vhost-vdpa.c.o: In function `net_init_vhost_vdpa':
> /builds/qemu-project/qemu/build/../net/vhost-vdpa.c:611: undefined
> reference to `vhost_iova_tree_new'
> libcommon.fa.p/net_vhost-vdpa.c.o: In function
> `glib_autoptr_cleanup_VhostIOVATree':
> /builds/qemu-project/qemu/hw/virtio/vhost-iova-tree.h:20: undefined
> reference to `vhost_iova_tree_delete'
> collect2: error: ld returned 1 exit status
> [2436/4108] Compiling C object
> libqemu-s390x-softmmu.fa.p/meson-generated_.._qapi_qapi-introspect.c.o
>
>
>
> Presumably the conditions in the various meson.build files are
> out of sync about when to build the net/vhost-vdpa.c code vs
> the code that's implementing the functions it's trying to call.
>
> Specifically, the functions being called will only be present
> if the target architecture has CONFIG_VIRTIO, which isn't
> guaranteed, but we try to link the vhost-vdpa code in anyway.

Right, this is probably because vhost-vdpa start to use virtio loigc (cvq).

Eugenio, please fix this and I will send a new version of the pull request.

Thanks

>
> thanks
> -- PMM
>


