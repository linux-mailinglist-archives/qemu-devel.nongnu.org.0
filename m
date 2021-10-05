Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F6A421F21
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 08:53:59 +0200 (CEST)
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXeKs-0008E2-Rf
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 02:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXeJ0-0006dG-NF
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXeIx-0007Di-29
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633416717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O3KNtAuPWGUs3s7V0WjsY3yoRfgBdRx00xYz2/CCJPc=;
 b=h5INkcPf+B7Yn9d0sSuirvGxu/mEChvVDIoD30OtCayI20xz/M1sUtaPn7RAQuR9UwZy0r
 9qINUcL4IPGPuqPI/egZJP0WCAcXLhVlE6KoTweC0uZDWH8c/+HR+QOPhl9GEELTFncBdl
 V4ZsddPkq1oJ+CELh+kIHpvsv5kBlAI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-HY8uPc9CPVGOoCb7tzNpdQ-1; Tue, 05 Oct 2021 02:51:56 -0400
X-MC-Unique: HY8uPc9CPVGOoCb7tzNpdQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 k2-20020a50ce42000000b003dadf140b15so7986572edj.19
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 23:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O3KNtAuPWGUs3s7V0WjsY3yoRfgBdRx00xYz2/CCJPc=;
 b=ZIdSB4APhK1U3W9zaEBDySk8i9rXt6QMYJ4OaDlYp5OX9CsDiUxe9OByA5+gXirkIR
 pIdbSBuC9bSK5TK0M+fa2CD+gbh/Ov7apI9wYKyJvfGEd/MFw9yjJKWQkIQar4Nr4jWA
 adHvc1MXy29ejsO7TOoD43JV/z9ZcRI5BdD1qeHGtFwTiV2A3ex3uGy1nxL3N1sqxM+5
 of5IDX8r7kcR+IpStLr1p7MrtdxoS+0PloIVdl9ps9u1V33Sgk5hxx6F+M3TWOQrIraz
 ZJ+sl++hBSUPe1qsuzCmi6GP1Yc6zlBSMRi/XlHA7n7Wl52REUJUG4tGHn18hkJNio2Q
 fspw==
X-Gm-Message-State: AOAM531SCOQ3dIBoXRpylMcHfNL05VzJJjS0ylPB18+kzcq1NFAZXQj8
 r91iyo7XAUvBJ9ZurwiM2K5COzqpvIXIhI3DT68rBPevB0o5uiunAfErjRUR+kiChtX8TBiJKDc
 OVSyTguObr4J3bxM=
X-Received: by 2002:a17:906:5282:: with SMTP id
 c2mr23385637ejm.162.1633416715499; 
 Mon, 04 Oct 2021 23:51:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+TPOsjkZqak1vRjYw47Mn320kF2VkmyQB6wNt1kN5X8uJjcpVMOULjYoocaBqG2tvsU9xgQ==
X-Received: by 2002:a17:906:5282:: with SMTP id
 c2mr23385596ejm.162.1633416715178; 
 Mon, 04 Oct 2021 23:51:55 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id dn10sm8106166edb.84.2021.10.04.23.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 23:51:54 -0700 (PDT)
Date: Tue, 5 Oct 2021 02:51:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 raphael.norwitz@nutanix.com, kwolf@redhat.com, yc-core@yandex-team.ru
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <20211005024754-mutt-send-email-mst@kernel.org>
References: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
 <20211004110855-mutt-send-email-mst@kernel.org>
 <YVuL0FRN5ilRN2Pd@rvkaganb.lan>
MIME-Version: 1.0
In-Reply-To: <YVuL0FRN5ilRN2Pd@rvkaganb.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 02:18:40AM +0300, Roman Kagan wrote:
> On Mon, Oct 04, 2021 at 11:11:00AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Oct 04, 2021 at 06:07:29PM +0300, Denis Plotnikov wrote:
> > > It might be useful for the cases when a slow block layer should be replaced
> > > with a more performant one on running VM without stopping, i.e. with very low
> > > downtime comparable with the one on migration.
> > > 
> > > It's possible to achive that for two reasons:
> > > 
> > > 1.The VMStates of "virtio-blk" and "vhost-user-blk" are almost the same.
> > >   They consist of the identical VMSTATE_VIRTIO_DEVICE and differs from
> > >   each other in the values of migration service fields only.
> > > 2.The device driver used in the guest is the same: virtio-blk
> > > 
> > > In the series cross-migration is achieved by adding a new type.
> > > The new type uses virtio-blk VMState instead of vhost-user-blk specific
> > > VMstate, also it implements migration save/load callbacks to be compatible
> > > with migration stream produced by "virtio-blk" device.
> > > 
> > > Adding the new type instead of modifying the existing one is convenent.
> > > It ease to differ the new virtio-blk-compatible vhost-user-blk
> > > device from the existing non-compatible one using qemu machinery without any
> > > other modifiactions. That gives all the variety of qemu device related
> > > constraints out of box.
> > 
> > Hmm I'm not sure I understand. What is the advantage for the user?
> > What if vhost-user-blk became an alias for vhost-user-virtio-blk?
> > We could add some hacks to make it compatible for old machine types.
> 
> The point is that virtio-blk and vhost-user-blk are not
> migration-compatible ATM.  OTOH they are the same device from the guest
> POV so there's nothing fundamentally preventing the migration between
> the two.  In particular, we see it as a means to switch between the
> storage backend transports via live migration without disrupting the
> guest.
> 
> Migration-wise virtio-blk and vhost-user-blk have in common
> 
> - the content of the VMState -- VMSTATE_VIRTIO_DEVICE
> 
> The two differ in
> 
> - the name and the version of the VMStateDescription
> 
> - virtio-blk has an extra migration section (via .save/.load callbacks
>   on VirtioDeviceClass) containing requests in flight
> 
> It looks like to become migration-compatible with virtio-blk,
> vhost-user-blk has to start using VMStateDescription of virtio-blk and
> provide compatible .save/.load callbacks.  It isn't entirely obvious how
> to make this machine-type-dependent, so we came up with a simpler idea
> of defining a new device that shares most of the implementation with the
> original vhost-user-blk except for the migration stuff.  We're certainly
> open to suggestions on how to reconcile this under a single
> vhost-user-blk device, as this would be more user-friendly indeed.
> 
> We considered using a class property for this and defining the
> respective compat clause, but IIUC the class constructors (where .vmsd
> and .save/.load are defined) are not supposed to depend on class
> properties.
> 
> Thanks,
> Roman.

So the question is how to make vmsd depend on machine type.
CC Eduardo who poked at this kind of compat stuff recently,
paolo who looked at qom things most recently and dgilbert
for advice on migration.

-- 
MST


