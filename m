Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7BE44E574
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:14:29 +0100 (CET)
Received: from localhost ([::1]:46900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUVo-0003Et-Rq
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:14:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlURz-0005AY-Eb; Fri, 12 Nov 2021 06:10:36 -0500
Received: from [2a02:6b8:0:1472:2741:0:8b6:217] (port=51962
 helo=forwardcorp1p.mail.yandex.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlURu-0006Pa-NT; Fri, 12 Nov 2021 06:10:30 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 8D48E2E1265;
 Fri, 12 Nov 2021 14:10:20 +0300 (MSK)
Received: from myt6-10e59078d438.qloud-c.yandex.net
 (myt6-10e59078d438.qloud-c.yandex.net [2a02:6b8:c12:5209:0:640:10e5:9078])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 EmzLDz0AFM-AJs4Nk5n; Fri, 12 Nov 2021 14:10:20 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636715420; bh=J8mlaB4OTznuEBlxYpowCxnMo45igcw4N9gQfvFWiPY=;
 h=In-Reply-To:Subject:To:From:Message-ID:Cc:References:Date;
 b=nTAva20WKylM706AlMWrCnY4Ev80mdZeJm7vV71Pk0u7TiEhkMVMH4qaFEpbMTa6k
 i/hOiXKXyo9fMVBIT2ezwOlKa4DTBS7rD2fj1tEdSBpS7sGOWNS8kW1XWEOKcu6RUO
 HONCRk1yLmVGynPAPVy9h3kXwOCMMmOcanQfvSls=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1211::1:29])
 by myt6-10e59078d438.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 booG69A0BB-AIwWW7lh; Fri, 12 Nov 2021 14:10:19 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Fri, 12 Nov 2021 14:10:17 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 05/10] vhost-backend: avoid overflow on memslots_limit
Message-ID: <YY5LmZtVBzX+PpYm@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, yc-core@yandex-team.ru,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-6-rvkagan@yandex-team.ru>
 <681e58cf-af57-3c5d-423d-49f32c86dfcf@redhat.com>
 <YY4b5rZLB9151ZSN@rvkaganb.lan> <YY46QcVhFa2qEMcB@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YY46QcVhFa2qEMcB@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2a02:6b8:0:1472:2741:0:8b6:217 (failed)
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 09:56:17AM +0000, Daniel P. Berrangé wrote:
> On Fri, Nov 12, 2021 at 10:46:46AM +0300, Roman Kagan wrote:
> > On Thu, Nov 11, 2021 at 06:59:43PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 11/11/21 16:33, Roman Kagan wrote:
> > > > Fix the (hypothetical) potential problem when the value parsed out of
> > > > the vhost module parameter in sysfs overflows the return value from
> > > > vhost_kernel_memslots_limit.
> > > > 
> > > > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > > > ---
> > > >  hw/virtio/vhost-backend.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> > > > index b65f8f7e97..44f7dbb243 100644
> > > > --- a/hw/virtio/vhost-backend.c
> > > > +++ b/hw/virtio/vhost-backend.c
> > > > @@ -58,7 +58,7 @@ static int vhost_kernel_memslots_limit(struct vhost_dev *dev)
> > > >      if (g_file_get_contents("/sys/module/vhost/parameters/max_mem_regions",
> > > >                              &s, NULL, NULL)) {
> > > >          uint64_t val = g_ascii_strtoull(s, NULL, 10);
> > > 
> > > Would using qemu_strtou64() simplify this?
> > 
> > I'm afraid not.  None of the existing strtoXX converting functions has
> > the desired output range (0 < retval < INT_MAX), so the following
> > condition will remain necessary anyway; then it doesn't seem to matter
> > which particular parser is used to extract the value which is in the
> > range, so I left the one that was already there to reduce churn.
> 
> If  qemu_strtou64() can't handle all values in (0 < retval < INT_MAX)
> isn't that a bug in qemu_strtou64 ?

I must have been unclear.  It sure can handle all values in this range;
the point is that the range check after it would still be needed, so
switching from g_ascii_strtoull to qemu_strtoXX saves nothing, therefore
I left it as it was.

Thanks,
Roman.

