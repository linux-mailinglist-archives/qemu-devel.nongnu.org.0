Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8136F41A47
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 04:14:42 +0200 (CEST)
Received: from localhost ([::1]:56336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hasmf-0005ZH-Nj
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 22:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58463)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tiwei.bie@intel.com>) id 1hasku-0004fE-UB
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 22:12:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tiwei.bie@intel.com>) id 1haskt-0005pn-Nm
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 22:12:52 -0400
Received: from mga12.intel.com ([192.55.52.136]:23867)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tiwei.bie@intel.com>)
 id 1haskt-0005nO-E7; Tue, 11 Jun 2019 22:12:51 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 19:12:44 -0700
X-ExtLoop1: 1
Received: from npg-dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.151])
 by fmsmga008.fm.intel.com with ESMTP; 11 Jun 2019 19:12:43 -0700
Date: Wed, 12 Jun 2019 10:11:33 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Wang <jasowang@redhat.com>
Message-ID: <20190612021132.GA23690@___>
References: <20190611065137.16329-1-tiwei.bie@intel.com>
 <15f37c7d-5246-e093-e92c-1bd6ff77786a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15f37c7d-5246-e093-e92c-1bd6ff77786a@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
Subject: Re: [Qemu-devel] [RFC] vhost-user: don't ignore CTRL_VLAN feature
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
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 11, 2019 at 03:22:47PM +0800, Jason Wang wrote:
> 
> On 2019/6/11 下午2:51, Tiwei Bie wrote:
> > The VIRTIO_NET_F_CTRL_VLAN feature requires the support of
> > vhost-user backend. But it will be advertised to guest driver
> > as long as it's enabled by users in QEMU, while it's not
> > supported by vhost-user backend. This patch fixes this issue.
> > 
> > Fixes: 72018d1e1917 ("vhost-user: ignore qemu-only features")
> 
> 
> My understanding is if may want to revert this patch.
> 
> 
> > Cc: qemu-stable@nongnu.org
> > 
> > Signed-off-by: Tiwei Bie <tiwei.bie@intel.com>
> > ---
> > It's not clear in the spec that, whether vlan filtering is
> > also best-effort:
> > https://github.com/oasis-tcs/virtio-spec/blob/37057052e7/content.tex#L3372
> 
> 
> It should be a bug of the code, we should consider to implement ctrl command
> for vhost-user.

Yeah, we need to pass these information to backends if we
want to make it possible to support it in vhost-user.


> 
> Thanks
> 
> 
> > 
> >   hw/net/vhost_net.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index a6b719035c..1444fc9230 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -75,6 +75,8 @@ static const int user_feature_bits[] = {
> >       VIRTIO_NET_F_MTU,
> >       VIRTIO_F_IOMMU_PLATFORM,
> > +    VIRTIO_NET_F_CTRL_VLAN,
> > +
> >       /* This bit implies RARP isn't sent by QEMU out of band */
> >       VIRTIO_NET_F_GUEST_ANNOUNCE,

