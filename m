Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38694A7F20
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 11:18:49 +0200 (CEST)
Received: from localhost ([::1]:54922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5RR9-0001Cl-RO
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 05:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tiwei.bie@intel.com>) id 1i5RDW-0005Op-4C
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:04:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tiwei.bie@intel.com>) id 1i5RDT-0001oB-1G
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:04:41 -0400
Received: from mga07.intel.com ([134.134.136.100]:50904)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tiwei.bie@intel.com>) id 1i5RDJ-0001gB-3R
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:04:32 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 02:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,465,1559545200"; d="scan'208";a="266592088"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.71])
 by orsmga001.jf.intel.com with ESMTP; 04 Sep 2019 02:04:22 -0700
Date: Wed, 4 Sep 2019 17:01:55 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Message-ID: <20190904090154.GA12778@___>
References: <20190903200422.11693-1-johannes@sipsolutions.net>
 <20190904020655.GA30746@___>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190904020655.GA30746@___>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
Subject: Re: [Qemu-devel] [PATCH v2] libvhost-user: fix SLAVE_SEND_FD
 handling
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Johannes Berg <johannes.berg@intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 04, 2019 at 10:06:55AM +0800, Tiwei Bie wrote:
> On Tue, Sep 03, 2019 at 11:04:22PM +0300, Johannes Berg wrote:
> > From: Johannes Berg <johannes.berg@intel.com>
> > 
> > It doesn't look like this could possibly work properly since
> > VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD is defined to 10, but the
> > dev->protocol_features has a bitmap. I suppose the peer this
> > was tested with also supported VHOST_USER_PROTOCOL_F_LOG_SHMFD,
> > in which case the test would always be false, but nevertheless
> > the code seems wrong.
> 
> Ooops.. I tested `tests/vhost-user-bridge -H`. But as you
> said it worked because VHOST_USER_PROTOCOL_F_LOG_SHMFD has
> been negotiated. Thanks for spotting this!
> 
> > 
> > Use has_feature() to fix this.
> > 
> > Fixes: d84599f56c82 ("libvhost-user: support host notifier")
> 
> Cc: qemu-stable@nongnu.org
> 
> > Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> > ---
> >  contrib/libvhost-user/libvhost-user.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
> > index 6a02eaffc672..fcf4a8a00ed2 100644
> > --- a/contrib/libvhost-user/libvhost-user.c
> > +++ b/contrib/libvhost-user/libvhost-user.c
> > @@ -1097,7 +1097,8 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
> >  
> >      vmsg.fd_num = fd_num;
> >  
> > -    if ((dev->protocol_features & VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD) == 0) {
> > +    if (!has_feature(dev->protocol_features,
> > +                     VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD)) {
> 
> We have both of has_feature() and vu_has_feature() called by
> other code in this file directly. Not sure which one is preferred..
> Personally, I think vu_has_feature() might be better.

Thanks for the patch introducing vu_has_protocol_feature().
This fix looks good to me. Thanks a lot!

I'm not the maintainer. But anyway, if this helps:
Reviewed-by: Tiwei Bie <tiwei.bie@intel.com>

