Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F9544E29B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 08:48:51 +0100 (CET)
Received: from localhost ([::1]:51758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlRIo-0004YP-JS
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 02:48:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlRGy-0003j1-LX; Fri, 12 Nov 2021 02:46:56 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:38124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlRGu-00064l-F8; Fri, 12 Nov 2021 02:46:54 -0500
Received: from vla1-a78d115f8d22.qloud-c.yandex.net
 (vla1-a78d115f8d22.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:2906:0:640:a78d:115f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id CA28E2E0AF8;
 Fri, 12 Nov 2021 10:46:49 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-a78d115f8d22.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 MDlfybiS7u-kmsu7l8l; Fri, 12 Nov 2021 10:46:49 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636703209; bh=qVEOlHMsVBOQMPSZYTvUh76xXS2WZw4IgO/twA2GHpA=;
 h=In-Reply-To:Subject:To:From:Message-ID:Cc:References:Date;
 b=kMj4y30JVtCPb/OC7ARmTVNQj5pHowUIWc4OijQyU2JH/DTKn0VTOt/5bh0HL3WhE
 a7WGr9LiTLt8bO77hsha3qnddm5tbnkqhYs7gNNBX1cZ2GSKTp2ZbbGU0UVtWHylcj
 AwtLr57lizD0RxkdNjr6NMwEbUjHlQ8kxG3r2ZYY=
Authentication-Results: vla1-a78d115f8d22.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:14::1:32])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 Hqra91fZuR-kmw8SmLd; Fri, 12 Nov 2021 10:46:48 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Fri, 12 Nov 2021 10:46:46 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 05/10] vhost-backend: avoid overflow on memslots_limit
Message-ID: <YY4b5rZLB9151ZSN@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <681e58cf-af57-3c5d-423d-49f32c86dfcf@redhat.com>
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 06:59:43PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/11/21 16:33, Roman Kagan wrote:
> > Fix the (hypothetical) potential problem when the value parsed out of
> > the vhost module parameter in sysfs overflows the return value from
> > vhost_kernel_memslots_limit.
> > 
> > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > ---
> >  hw/virtio/vhost-backend.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> > index b65f8f7e97..44f7dbb243 100644
> > --- a/hw/virtio/vhost-backend.c
> > +++ b/hw/virtio/vhost-backend.c
> > @@ -58,7 +58,7 @@ static int vhost_kernel_memslots_limit(struct vhost_dev *dev)
> >      if (g_file_get_contents("/sys/module/vhost/parameters/max_mem_regions",
> >                              &s, NULL, NULL)) {
> >          uint64_t val = g_ascii_strtoull(s, NULL, 10);
> 
> Would using qemu_strtou64() simplify this?

I'm afraid not.  None of the existing strtoXX converting functions has
the desired output range (0 < retval < INT_MAX), so the following
condition will remain necessary anyway; then it doesn't seem to matter
which particular parser is used to extract the value which is in the
range, so I left the one that was already there to reduce churn.

> 
> > -        if (!((val == G_MAXUINT64 || !val) && errno)) {
> > +        if (val < INT_MAX && val > 0) {
> >              g_free(s);
> >              return val;
> >          }

Thanks,
Roman.

