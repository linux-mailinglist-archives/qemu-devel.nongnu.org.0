Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3D5307915
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:08:31 +0100 (CET)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58uM-00033e-H3
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l58sX-0001kP-7g
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:06:38 -0500
Received: from 9.mo51.mail-out.ovh.net ([46.105.48.137]:57906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l58sU-00080Y-JH
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:06:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.173])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id B0E1625BE3F;
 Thu, 28 Jan 2021 16:06:30 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 16:06:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006def2469b-a363-452c-9bf6-cb306231fa85,
 12ABEFCAB104A9A3990DEAE01579FEA45C2F0BE3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 28 Jan 2021 16:06:25 +0100
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 2/6] libvhost-user: Use slave_mutex in all slave messages
Message-ID: <20210128160625.45cf09fc@bahia.lan>
In-Reply-To: <20210128144835.GA3342@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
 <20210125180115.22936-3-vgoyal@redhat.com>
 <20210128153123.4aba231c@bahia.lan>
 <20210128144835.GA3342@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 15d10315-567f-441a-b7c6-283a2aa2341a
X-Ovh-Tracer-Id: 15201337593857874281
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehmshhtsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=groug@kaod.org;
 helo=9.mo51.mail-out.ovh.net
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL=0.141,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 virtio-fs@redhat.com, stefanha@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 09:48:35 -0500
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Thu, Jan 28, 2021 at 03:31:23PM +0100, Greg Kurz wrote:
> > On Mon, 25 Jan 2021 13:01:11 -0500
> > Vivek Goyal <vgoyal@redhat.com> wrote:
> > 
> > > dev->slave_mutex needs to be taken when sending messages on slave_fd.
> > > Currently _vu_queue_notify() does not do that.
> > > 
> > > Introduce a helper vu_message_slave_send_receive() which sends as well
> > > as receive response. Use this helper in all the paths which send
> > > message on slave_fd channel.
> > > 
> > 
> > Does this fix any known bug ?
> 
> I am not aware of any bug. This fix is based on code inspection.
> 
> Also I wanted a central place/function to send messages on slave channel
> so that I can check state of slave channel (open/close) and act
> accordingly. Otherwise I will have to do the check at every place
> which is trying to send/receive message on slave channel.
> 

Makes sense. Thanks for the clarification.

> Vivek
> 
> > 
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > ---
> > 
> > LGTM
> > 
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > 
> > >  subprojects/libvhost-user/libvhost-user.c | 50 ++++++++++++-----------
> > >  1 file changed, 27 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> > > index 4cf4aef63d..7a56c56dc8 100644
> > > --- a/subprojects/libvhost-user/libvhost-user.c
> > > +++ b/subprojects/libvhost-user/libvhost-user.c
> > > @@ -403,7 +403,7 @@ vu_send_reply(VuDev *dev, int conn_fd, VhostUserMsg *vmsg)
> > >   * Processes a reply on the slave channel.
> > >   * Entered with slave_mutex held and releases it before exit.
> > >   * Returns true on success.
> > > - * *payload is written on success
> > > + * *payload is written on success, if payload is not NULL.
> > >   */
> > >  static bool
> > >  vu_process_message_reply(VuDev *dev, const VhostUserMsg *vmsg,
> > > @@ -427,7 +427,9 @@ vu_process_message_reply(VuDev *dev, const VhostUserMsg *vmsg,
> > >          goto out;
> > >      }
> > >  
> > > -    *payload = msg_reply.payload.u64;
> > > +    if (payload) {
> > > +        *payload = msg_reply.payload.u64;
> > > +    }
> > >      result = true;
> > >  
> > >  out:
> > > @@ -435,6 +437,25 @@ out:
> > >      return result;
> > >  }
> > >  
> > > +/* Returns true on success, false otherwise */
> > > +static bool
> > > +vu_message_slave_send_receive(VuDev *dev, VhostUserMsg *vmsg, uint64_t *payload)
> > > +{
> > > +    pthread_mutex_lock(&dev->slave_mutex);
> > > +    if (!vu_message_write(dev, dev->slave_fd, vmsg)) {
> > > +        pthread_mutex_unlock(&dev->slave_mutex);
> > > +        return false;
> > > +    }
> > > +
> > > +    if ((vmsg->flags & VHOST_USER_NEED_REPLY_MASK) == 0) {
> > > +        pthread_mutex_unlock(&dev->slave_mutex);
> > > +        return true;
> > > +    }
> > > +
> > > +    /* Also unlocks the slave_mutex */
> > > +    return vu_process_message_reply(dev, vmsg, payload);
> > > +}
> > > +
> > >  /* Kick the log_call_fd if required. */
> > >  static void
> > >  vu_log_kick(VuDev *dev)
> > > @@ -1340,16 +1361,8 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
> > >          return false;
> > >      }
> > >  
> > > -    pthread_mutex_lock(&dev->slave_mutex);
> > > -    if (!vu_message_write(dev, dev->slave_fd, &vmsg)) {
> > > -        pthread_mutex_unlock(&dev->slave_mutex);
> > > -        return false;
> > > -    }
> > > -
> > > -    /* Also unlocks the slave_mutex */
> > > -    res = vu_process_message_reply(dev, &vmsg, &payload);
> > > +    res = vu_message_slave_send_receive(dev, &vmsg, &payload);
> > >      res = res && (payload == 0);
> > > -
> > >      return res;
> > >  }
> > >  
> > > @@ -2395,10 +2408,7 @@ static void _vu_queue_notify(VuDev *dev, VuVirtq *vq, bool sync)
> > >              vmsg.flags |= VHOST_USER_NEED_REPLY_MASK;
> > >          }
> > >  
> > > -        vu_message_write(dev, dev->slave_fd, &vmsg);
> > > -        if (ack) {
> > > -            vu_message_read_default(dev, dev->slave_fd, &vmsg);
> > > -        }
> > > +        vu_message_slave_send_receive(dev, &vmsg, NULL);
> > >          return;
> > >      }
> > >  
> > > @@ -2942,17 +2952,11 @@ int64_t vu_fs_cache_request(VuDev *dev, VhostUserSlaveRequest req, int fd,
> > >          return -EINVAL;
> > >      }
> > >  
> > > -    pthread_mutex_lock(&dev->slave_mutex);
> > > -    if (!vu_message_write(dev, dev->slave_fd, &vmsg)) {
> > > -        pthread_mutex_unlock(&dev->slave_mutex);
> > > -        return -EIO;
> > > -    }
> > > -
> > > -    /* Also unlocks the slave_mutex */
> > > -    res = vu_process_message_reply(dev, &vmsg, &payload);
> > > +    res = vu_message_slave_send_receive(dev, &vmsg, &payload);
> > >      if (!res) {
> > >          return -EIO;
> > >      }
> > > +
> > >      /*
> > >       * Payload is delivered as uint64_t but is actually signed for
> > >       * errors.
> > 
> 


