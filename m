Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE04A3727E9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:14:51 +0200 (CEST)
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldr8k-0004Wa-Te
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ldr57-0001bI-27
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:11:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ldr51-0007Eo-5a
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620119458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YpEasZR2crJ4o/k8bDDtkUiePUvMwaXIHqAg7fPm1WI=;
 b=jRFP1456Xrtv2m8m+XCDZd6rWoMKgTMGGI7mibIwXzwHCUgOfmYfJ3PGUIhVwApEOtFMSH
 8oQ4oPS/U+ddV4gTkfwPEtSHy9qZZLM8AnyvjcrpU6zn3yFA4tAMXSg2jPlpfaT+jyRNej
 SO53DJH+H+ttUR6ERgPgfTfyPDvfVQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-Vo4u4vTGPgug7U3kY_T6Dw-1; Tue, 04 May 2021 05:10:54 -0400
X-MC-Unique: Vo4u4vTGPgug7U3kY_T6Dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEC7019251A2;
 Tue,  4 May 2021 09:10:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-48.ams2.redhat.com [10.36.114.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29ABD60C0F;
 Tue,  4 May 2021 09:10:49 +0000 (UTC)
Date: Tue, 4 May 2021 11:10:47 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v2 2/6] vhost-user-blk: Don't reconnect during
 initialisation
Message-ID: <YJEPlyyvDguh46Bb@merkur.fritz.box>
References: <20210429171316.162022-1-kwolf@redhat.com>
 <20210429171316.162022-3-kwolf@redhat.com>
 <20210503170107.GA21884@raphael-debian-dev>
MIME-Version: 1.0
In-Reply-To: <20210503170107.GA21884@raphael-debian-dev>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "den-plotnikov@yandex-team.ru" <den-plotnikov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 03.05.2021 um 19:01 hat Raphael Norwitz geschrieben:
> So we're not going with the suggestion to retry once or a fixed number
> of times? Any reason why not?

I thought we agreed that we'd add reconnection back in a follow-up
series that also addresses the different kinds of errors and retries
only when it makes sense?

Kevin

> On Thu, Apr 29, 2021 at 07:13:12PM +0200, Kevin Wolf wrote:
> > This is a partial revert of commits 77542d43149 and bc79c87bcde.
> > 
> > Usually, an error during initialisation means that the configuration was
> > wrong. Reconnecting won't make the error go away, but just turn the
> > error condition into an endless loop. Avoid this and return errors
> > again.
> > 
> > Additionally, calling vhost_user_blk_disconnect() from the chardev event
> > handler could result in use-after-free because none of the
> > initialisation code expects that the device could just go away in the
> > middle. So removing the call fixes crashes in several places.
> > 
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
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  hw/block/vhost-user-blk.c | 59 +++++++++++----------------------------
> >  1 file changed, 17 insertions(+), 42 deletions(-)
> > 
> > diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> > index 7c85248a7b..c0b9958da1 100644
> > --- a/hw/block/vhost-user-blk.c
> > +++ b/hw/block/vhost-user-blk.c
> > @@ -50,6 +50,8 @@ static const int user_feature_bits[] = {
> >      VHOST_INVALID_FEATURE_BIT
> >  };
> >  
> > +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event);
> > +
> >  static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *config)
> >  {
> >      VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > @@ -362,19 +364,6 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
> >      vhost_dev_cleanup(&s->dev);
> >  }
> >  
> > -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> > -                                 bool realized);
> > -
> > -static void vhost_user_blk_event_realize(void *opaque, QEMUChrEvent event)
> > -{
> > -    vhost_user_blk_event(opaque, event, false);
> > -}
> > -
> > -static void vhost_user_blk_event_oper(void *opaque, QEMUChrEvent event)
> > -{
> > -    vhost_user_blk_event(opaque, event, true);
> > -}
> > -
> >  static void vhost_user_blk_chr_closed_bh(void *opaque)
> >  {
> >      DeviceState *dev = opaque;
> > @@ -382,12 +371,11 @@ static void vhost_user_blk_chr_closed_bh(void *opaque)
> >      VHostUserBlk *s = VHOST_USER_BLK(vdev);
> >  
> >      vhost_user_blk_disconnect(dev);
> > -    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL,
> > -            vhost_user_blk_event_oper, NULL, opaque, NULL, true);
> > +    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_event,
> > +                             NULL, opaque, NULL, true);
> >  }
> >  
> > -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> > -                                 bool realized)
> > +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
> >  {
> >      DeviceState *dev = opaque;
> >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > @@ -401,17 +389,7 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> >          }
> >          break;
> >      case CHR_EVENT_CLOSED:
> > -        /*
> > -         * Closing the connection should happen differently on device
> > -         * initialization and operation stages.
> > -         * On initalization, we want to re-start vhost_dev initialization
> > -         * from the very beginning right away when the connection is closed,
> > -         * so we clean up vhost_dev on each connection closing.
> > -         * On operation, we want to postpone vhost_dev cleanup to let the
> > -         * other code perform its own cleanup sequence using vhost_dev data
> > -         * (e.g. vhost_dev_set_log).
> > -         */
> > -        if (realized && !runstate_check(RUN_STATE_SHUTDOWN)) {
> > +        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
> >              /*
> >               * A close event may happen during a read/write, but vhost
> >               * code assumes the vhost_dev remains setup, so delay the
> > @@ -431,8 +409,6 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> >               * knowing its type (in this case vhost-user).
> >               */
> >              s->dev.started = false;
> > -        } else {
> > -            vhost_user_blk_disconnect(dev);
> >          }
> >          break;
> >      case CHR_EVENT_BREAK:
> > @@ -489,33 +465,32 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
> >      s->vhost_vqs = g_new0(struct vhost_virtqueue, s->num_queues);
> >      s->connected = false;
> >  
> > -    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> > -                             vhost_user_blk_event_realize, NULL, (void *)dev,
> > -                             NULL, true);
> > -
> > -reconnect:
> >      if (qemu_chr_fe_wait_connected(&s->chardev, errp) < 0) {
> >          goto virtio_err;
> >      }
> >  
> > -    /* check whether vhost_user_blk_connect() failed or not */
> > -    if (!s->connected) {
> > -        goto reconnect;
> > +    if (vhost_user_blk_connect(dev) < 0) {
> > +        error_setg(errp, "vhost-user-blk: could not connect");
> > +        qemu_chr_fe_disconnect(&s->chardev);
> > +        goto virtio_err;
> >      }
> > +    assert(s->connected);
> >  
> >      ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
> >                                 sizeof(struct virtio_blk_config));
> >      if (ret < 0) {
> > -        error_report("vhost-user-blk: get block config failed");
> > -        goto reconnect;
> > +        error_setg(errp, "vhost-user-blk: get block config failed");
> > +        goto vhost_err;
> >      }
> >  
> > -    /* we're fully initialized, now we can operate, so change the handler */
> > +    /* we're fully initialized, now we can operate, so add the handler */
> >      qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> > -                             vhost_user_blk_event_oper, NULL, (void *)dev,
> > +                             vhost_user_blk_event, NULL, (void *)dev,
> >                               NULL, true);
> >      return;
> >  
> > +vhost_err:
> > +    vhost_dev_cleanup(&s->dev);
> >  virtio_err:
> >      g_free(s->vhost_vqs);
> >      s->vhost_vqs = NULL;
> > -- 
> > 2.30.2
> >
> 


