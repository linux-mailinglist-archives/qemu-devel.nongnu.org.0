Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD4E4862B0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:08:54 +0100 (CET)
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5PhW-0000ko-3R
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:08:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5PX1-0000u8-RU
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:58:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5PWy-0008TS-2J
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:58:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641463079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KS3ww/0+jFmstvI0O6USjQ0BSTqwW1wcRUooJFJq1ts=;
 b=bSZLKIdmIaWhRVdWTT2TcEyMym/8IZEx4oPTfgUraLWnAARVs0cqKX/SEkiajowGxy+vq8
 kujYlBiE0V4i37VZKs7SsZBRfHVFK0zaO986i5l5VmfT7VNjJSGaHD7p6l4Z70yTT9b/4l
 OFQ/Uc1GjXuOPY5wDGOMMfP7NJIz/Pk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-G7T1kRj_MBO5L1LCvyjfvA-1; Thu, 06 Jan 2022 04:57:58 -0500
X-MC-Unique: G7T1kRj_MBO5L1LCvyjfvA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m9-20020a05600c4f4900b0034644da3525so139546wmq.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 01:57:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KS3ww/0+jFmstvI0O6USjQ0BSTqwW1wcRUooJFJq1ts=;
 b=h+pP6AndjP+rKD6OUM96IE/faSzraOgW/kpqS1H2ePsecNQwxeoepcNhjDV3peY4bC
 LXnhznZrIo33JuVCyojZZaYTv/R8lyzXbmr9NX19clnytsJ9+6z2RJQmKnNN2TyrT77r
 pyBIYveR3IK5L7Ytmh5+JpW80DoE/qShufF0W2v6OqfNV/pKwRbF6Cs9hG6k2x2AP5vM
 U+RCeHzB5nfBQWU3MHLUOCh0SXounHv65koDuHctzguaoUpGYB3N+v9O0pT67ZlPrv05
 g+7WLqqosd2OyffWm62uIRj/RqsSajNr3MiI4EQOlR3dqAV9nQgEOExpvwm1dcAzxV8+
 h5NA==
X-Gm-Message-State: AOAM530FcGx5oxIgoZJzHik0jn9E99ZLS4bYrANZou/HdtIfNpMq8hCG
 GAyBKhuOkM74T0drEdyCwOxBRwrdzboE7RkqVD30VgcbRIPMd356+O0aeH3e/YIIKLkGxp+7wZJ
 s6k17jkb8qtFFbig=
X-Received: by 2002:a7b:cbda:: with SMTP id n26mr185684wmi.191.1641463076873; 
 Thu, 06 Jan 2022 01:57:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyZEBHZGL9tk2ZEtdngAW1Qbuv3iL9ImWkfSuc4jc64mkvwuzMg2i0wqcGNUT4cr5FNHP4bw==
X-Received: by 2002:a7b:cbda:: with SMTP id n26mr185666wmi.191.1641463076667; 
 Thu, 06 Jan 2022 01:57:56 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id x20sm4761921wmi.43.2022.01.06.01.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 01:57:55 -0800 (PST)
Date: Thu, 6 Jan 2022 04:57:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>
Subject: Re: [PATCH 00/10] vhost: stick to -errno error return convention
Message-ID: <20220106045718-mutt-send-email-mst@kernel.org>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20211111153354.18807-1-rvkagan@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 06:33:44PM +0300, Roman Kagan wrote:
> Error propagation between the generic vhost code and the specific backends is
> not quite consistent: some places follow "return -1 and set errno" convention,
> while others assume "return negated errno".  Furthermore, not enough care is
> taken not to clobber errno.
> 
> As a result, on certain code paths the errno resulting from a failure may get
> overridden by another function call, and then that zero errno inidicating
> success is propagated up the stack, leading to failures being lost.  In
> particular, we've seen errors in the communication with a vhost-user-blk slave
> not trigger an immediate connection drop and reconnection, leaving it in a
> broken state.
> 
> Rework error propagation to always return negated errno on errors and
> correctly pass it up the stack.
> 
> Roman Kagan (10):
>   vhost-user-blk: reconnect on any error during realize
>   chardev/char-socket: tcp_chr_recv: don't clobber errno
>   chardev/char-socket: tcp_chr_sync_read: don't clobber errno
>   chardev/char-fe: don't allow EAGAIN from blocking read

So I dropped this one. If you are so inclined, pls work on
this separately.

>   vhost-backend: avoid overflow on memslots_limit
>   vhost-backend: stick to -errno error return convention
>   vhost-vdpa: stick to -errno error return convention
>   vhost-user: stick to -errno error return convention
>   vhost: stick to -errno error return convention
>   vhost-user-blk: propagate error return from generic vhost
> 
>  chardev/char-fe.c         |   7 +-
>  chardev/char-socket.c     |  17 +-
>  hw/block/vhost-user-blk.c |   4 +-
>  hw/virtio/vhost-backend.c |   4 +-
>  hw/virtio/vhost-user.c    | 401 +++++++++++++++++++++-----------------
>  hw/virtio/vhost-vdpa.c    |  37 ++--
>  hw/virtio/vhost.c         |  98 +++++-----
>  7 files changed, 307 insertions(+), 261 deletions(-)
> 
> -- 
> 2.33.1
> 


