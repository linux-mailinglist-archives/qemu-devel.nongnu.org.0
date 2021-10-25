Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0046439E11
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 20:03:38 +0200 (CEST)
Received: from localhost ([::1]:57442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf4Jt-0004sc-TU
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 14:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mf4H0-0002f0-Co
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 14:00:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mf4Gp-0004aQ-JL
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 14:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635184825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jV9LtyF2zq4VbVcNZgYPqHFGKQyO46k7O+s+5FQ2s4=;
 b=AkfTh59NDBPWyEzRA4nU1ER/fLWpAWa47isovQbLlFAwh5VuCZ4bavB9B8kiU+FDNUJgje
 gPv4PzQlMYy4opbhhLFmhDMKl9Q7Q1fZOS3Vy+ZmVmLyu1UGjnrqH1ufa+I/T1Fn0HhirW
 tW1pUxhjhVTS2yEBp6BRwFqCZTGDWcs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-SlpWl6iKO_qxD-oQgGJYTw-1; Mon, 25 Oct 2021 14:00:24 -0400
X-MC-Unique: SlpWl6iKO_qxD-oQgGJYTw-1
Received: by mail-wm1-f72.google.com with SMTP id
 z20-20020a05600c221400b0032cb38a76a9so296571wml.8
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 11:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=T3DFaKFEsXZOm5gyIopmKooLsoo8QM6Z1aDxQ4gcpqc=;
 b=FTyChQEjiIJj+Dr06ImTevqGp09G5yh8Q12tOZXrWWbfRx2XlVObFQAcHzhc6muBbM
 JLzoHSOdcuGb/AZwE1+44OLL4YVH6ioh/7bgBwdddaaEIVJGNcTQ9y1xrr1ARGA7RZKL
 mDPWGAwteWpRfB8hMgbiuwZORNHBCZtzYMOcHWUH8lvl3Yl/UwzPsSprX7+/jzqpZcFc
 EI3AEngu6qkvJvM6cu5fUk4AHzkeQtWPmfPoKdZ0Xf16z81NS5LbF1B+pFrE6DmXLPL0
 TXjQ1ajQTD0B0a5NtFGmZ4sKJ6/Cost6Txp9UGe8am1wYteIjPUxnK/b4zpydi2kFVG5
 SNPA==
X-Gm-Message-State: AOAM53355TFLw7ewYQE84Ab7PWFkEfDcUkxk/DTJ178Qkp+tfLp3LDrE
 5zFGj/t+QTB8k/D0u+Xtj+ZsC171ncRV1a5dL5qbJShi7D6m64/Tl+1lE1W8sFgzAB3+GRXjsif
 b/neDJiM1Gv5j4A0=
X-Received: by 2002:adf:ea81:: with SMTP id s1mr12283362wrm.59.1635184822829; 
 Mon, 25 Oct 2021 11:00:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuOoufRer8sO6RcBbbNpPbf8L3NLz4sRvwsAVS9PaSuozVBXSPmEWsgkOkE52hhtDwiN6nwQ==
X-Received: by 2002:adf:ea81:: with SMTP id s1mr12283331wrm.59.1635184822619; 
 Mon, 25 Oct 2021 11:00:22 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id c17sm10448634wrv.22.2021.10.25.11.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 11:00:21 -0700 (PDT)
Date: Mon, 25 Oct 2021 19:00:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 00/13] virtiofsd: Support notification queue and
Message-ID: <YXbwtHt6xo7I+Jlc@work-vm>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930153037.1194279-1-vgoyal@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: stefanha@redhat.com, miklos@szeredi.hu, qemu-devel@nongnu.org,
 iangelak@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Hi,
>=20
> Here are the patches to support notification queue and blocking
> posix locks. One of the biggest change since las time has been
> creation of custom thread pool for handling locking requests.=20
> Thanks to Ioannis for doing most of the work on custom thread
> pool.
>=20
> I have posted corresponding kernel changes here.
>=20
> https://lore.kernel.org/linux-fsdevel/20210930143850.1188628-1-vgoyal@red=
hat.com/T/#mb2d0fbfdb580ef33b6e812d0acbd16333b11f2cf

I'm queuing:
[PATCH 03/13] virtiofsd: Remove unused virtio_fs_config definition
[PATCH 04/13] virtiofsd: Add a helper to send element on virtqueue
[PATCH 05/13] virtiofsd: Add a helper to stop all queues

from this series; they're separate cleanups.

Dave

> Any feedback is welcome.
>=20
> Thanks
> Vivek
>=20
> Vivek Goyal (13):
>   virtio_fs.h: Add notification queue feature bit
>   virtiofsd: fuse.h header file changes for lock notification
>   virtiofsd: Remove unused virtio_fs_config definition
>   virtiofsd: Add a helper to send element on virtqueue
>   virtiofsd: Add a helper to stop all queues
>   vhost-user-fs: Use helpers to create/cleanup virtqueue
>   virtiofsd: Release file locks using F_UNLCK
>   virtiofsd: Create a notification queue
>   virtiofsd: Specify size of notification buffer using config space
>   virtiofsd: Custom threadpool for remote blocking posix locks requests
>   virtiofsd: Shutdown notification queue in the end
>   virtiofsd: Implement blocking posix locks
>   virtiofsd, seccomp: Add clock_nanosleep() to allow list
>=20
>  hw/virtio/vhost-user-fs-pci.c              |   4 +-
>  hw/virtio/vhost-user-fs.c                  | 158 ++++++++--
>  include/hw/virtio/vhost-user-fs.h          |   4 +
>  include/standard-headers/linux/fuse.h      |  11 +-
>  include/standard-headers/linux/virtio_fs.h |   5 +
>  tools/virtiofsd/fuse_i.h                   |   1 +
>  tools/virtiofsd/fuse_lowlevel.c            |  37 ++-
>  tools/virtiofsd/fuse_lowlevel.h            |  26 ++
>  tools/virtiofsd/fuse_virtio.c              | 339 +++++++++++++++++----
>  tools/virtiofsd/meson.build                |   1 +
>  tools/virtiofsd/passthrough_ll.c           |  91 +++++-
>  tools/virtiofsd/passthrough_seccomp.c      |   2 +
>  tools/virtiofsd/tpool.c                    | 331 ++++++++++++++++++++
>  tools/virtiofsd/tpool.h                    |  18 ++
>  14 files changed, 915 insertions(+), 113 deletions(-)
>  create mode 100644 tools/virtiofsd/tpool.c
>  create mode 100644 tools/virtiofsd/tpool.h
>=20
> --=20
> 2.31.1
>=20
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


