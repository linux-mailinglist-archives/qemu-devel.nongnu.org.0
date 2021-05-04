Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F17372817
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:29:54 +0200 (CEST)
Received: from localhost ([::1]:49378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrNH-0000o4-Gt
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ldrKw-0007wD-Sf
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:27:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ldrKu-0007oj-Hu
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620120442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BYZ5xqqTk3EmDRFuz6yABx9La0JIhF3w/gQ6c/hPM/0=;
 b=S4l7cvMT5Miuh/ILqHSBHd0/Iwgo/tEKV6o3ZBE/wzBYDbaTtqMr4obI6X60wQ/GYRFwfp
 x8X7SNt9NUp//oaT0n7MJaYRGsqB1C5BzAHvsZfUYIo5QZtgF/5vnkhRMfygqFOEqDTwS/
 d9DVbqWuDg5xejWg42VLhY9bni4CcRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-WNozxWEfOReOFRhxLtzMXQ-1; Tue, 04 May 2021 05:27:20 -0400
X-MC-Unique: WNozxWEfOReOFRhxLtzMXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D4EE8042C5;
 Tue,  4 May 2021 09:27:19 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-48.ams2.redhat.com [10.36.114.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6FCF61156;
 Tue,  4 May 2021 09:27:13 +0000 (UTC)
Date: Tue, 4 May 2021 11:27:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 2/6] vhost-user-blk: Don't reconnect during
 initialisation
Message-ID: <YJETcFAyQUHB13N6@merkur.fritz.box>
References: <20210429171316.162022-1-kwolf@redhat.com>
 <20210429171316.162022-3-kwolf@redhat.com>
 <20210504044050-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210504044050-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: den-plotnikov@yandex-team.ru, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.05.2021 um 10:59 hat Michael S. Tsirkin geschrieben:
> On Thu, Apr 29, 2021 at 07:13:12PM +0200, Kevin Wolf wrote:
> > This is a partial revert of commits 77542d43149 and bc79c87bcde.
> > 
> > Usually, an error during initialisation means that the configuration was
> > wrong. Reconnecting won't make the error go away, but just turn the
> > error condition into an endless loop. Avoid this and return errors
> > again.
> 
> So there are several possible reasons for an error:
> 
> 1. remote restarted - we would like to reconnect,
>    this was the original use-case for reconnect.
> 
>    I am not very happy that we are killing this usecase.

This patch is killing it only during initialisation, where it's quite
unlikely compared to other cases and where the current implementation is
rather broken. So reverting the broken feature and going back to a
simpler correct state feels like a good idea to me.

The idea is to add the "retry during initialisation" feature back on top
of this, but it requires some more changes in the error paths so that we
can actually distinguish different kinds of errors and don't retry when
we already know that it can't succeed.

> 2. qemu detected an error and closed the connection
>    looks like we try to handle that by reconnect,
>    this is something we should address.

Yes, if qemu produces the error locally, retrying is useless.

> 3. remote failed due to a bad command from qemu.
>    this usecase isn't well supported at the moment.
> 
>    How about supporting it on the remote side? I think that if the
>    data is well-formed just has a configuration remote can not support
>    then instead of closing the connection, remote can wait for
>    commands with need_reply set, and respond with an error. Or at
>    least do it if VHOST_USER_PROTOCOL_F_REPLY_ACK has been negotiated.
>    If VHOST_USER_SET_VRING_ERR is used then signalling that fd might
>    also be reasonable.
> 
>    OTOH if qemu is buggy and sends malformed data and remote detects
>    that then hacing qemu retry forever is ok, might actually be
>    benefitial for debugging.

I haven't really checked this case yet, it seems to be less common.
Explicitly communicating an error is certainly better than just cutting
the connection. But as you say, it means QEMU is buggy, so blindly
retrying in this case is kind of acceptable.

Raphael suggested that we could limit the number of retries during
initialisation so that it wouldn't result in a hang at least.

> > Additionally, calling vhost_user_blk_disconnect() from the chardev event
> > handler could result in use-after-free because none of the
> > initialisation code expects that the device could just go away in the
> > middle. So removing the call fixes crashes in several places.
> > For example, using a num-queues setting that is incompatible with the
> > backend would result in a crash like this (dereferencing dev->opaque,
> > which is already NULL):
> > 
> >  #0  0x0000555555d0a4bd in vhost_user_read_cb (source=0x5555568f4690, condition=(G_IO_IN | G_IO_HUP), opaque=0x7fffffffcbf0) at ../hw/virtio/vhost-user.c:313
> >  #1  0x0000555555d950d3 in qio_channel_fd_source_dispatch (source=0x555557c3f750, callback=0x555555d0a478 <vhost_user_read_cb>, user_data=0x7fffffffcbf0) at ../io/channel-watch.c:84
> >  #2  0x00007ffff7b32a9f in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
> >  #3  0x00007ffff7b84a98 in g_main_context_iterate.constprop () at /lib64/libglib-2.0.so.0
> >  #4  0x00007ffff7b32163 in g_main_loop_run () at /lib64/libglib-2.0.so.0
> >  #5  0x0000555555d0a724 in vhost_user_read (dev=0x555557bc62f8, msg=0x7fffffffcc50) at ../hw/virtio/vhost-user.c:402
> >  #6  0x0000555555d0ee6b in vhost_user_get_config (dev=0x555557bc62f8, config=0x555557bc62ac "", config_len=60) at ../hw/virtio/vhost-user.c:2133
> >  #7  0x0000555555d56d46 in vhost_dev_get_config (hdev=0x555557bc62f8, config=0x555557bc62ac "", config_len=60) at ../hw/virtio/vhost.c:1566
> >  #8  0x0000555555cdd150 in vhost_user_blk_device_realize (dev=0x555557bc60b0, errp=0x7fffffffcf90) at ../hw/block/vhost-user-blk.c:510
> >  #9  0x0000555555d08f6d in virtio_device_realize (dev=0x555557bc60b0, errp=0x7fffffffcff0) at ../hw/virtio/virtio.c:3660
> 
> Right. So that's definitely something to fix.
> 
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Kevin


