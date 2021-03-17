Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8A433EA0E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:46:59 +0100 (CET)
Received: from localhost ([::1]:35826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPxK-0002fM-6z
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMPva-00022m-Bq
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:45:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMPvY-0001f6-Mh
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615963507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kkh7A/cNTGDHv+K3sVgoSJFPiDeWzEimSHg9w1/SDRs=;
 b=W+QB0CP4TjaGi1wY+LaIL8lUNa//m2Q33X81MyFUvs1nSp9eV9YQ6Y6h5bzpobkNprKL8v
 SNUPk8nGCkz+ERY9ZaqXNtrOJTUkqNQOyTMcGI6RVWWpfjM6u+B/auzrXqa6Lgj8txOXZr
 VRSWKOrFMmfl/qu0CtNuSjJXv5OAS0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522--YiF-TkdNBiyDf-qG8Wrsg-1; Wed, 17 Mar 2021 02:45:05 -0400
X-MC-Unique: -YiF-TkdNBiyDf-qG8Wrsg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E77A31007467;
 Wed, 17 Mar 2021 06:45:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF3345C1A3;
 Wed, 17 Mar 2021 06:45:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 29DBC180038B; Wed, 17 Mar 2021 07:45:03 +0100 (CET)
Date: Wed, 17 Mar 2021 07:45:03 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vitaly Chipounov <vitaly@cyberhaven.com>
Subject: Re: [PATCH] hw/display/virtio-vga: made vga memory size configurable
Message-ID: <20210317064503.wj7zgpvztnps6jck@sirius.home.kraxel.org>
References: <20210314122314.3201195-1-vitaly@cyberhaven.com>
 <20210315072150.rst46y4l23box7jq@sirius.home.kraxel.org>
 <CACjSjcvDNZccKCAeQ5d_E+EiB+5pkHByi7wJJYA+NKhreqqHBg@mail.gmail.com>
 <20210315152438.crifvkfhvmmxnxut@sirius.home.kraxel.org>
 <CACjSjctXNbdX=Kiu6oQ+R6c2nee4mYm0oO0HWS207AWz864ouw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACjSjctXNbdX=Kiu6oQ+R6c2nee4mYm0oO0HWS207AWz864ouw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 08:51:21PM +0100, Vitaly Chipounov wrote:
> On Mon, Mar 15, 2021 at 4:24 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Mon, Mar 15, 2021 at 12:29:16PM +0100, Vitaly Chipounov wrote:
> > > On Mon, Mar 15, 2021 at 8:21 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > >
> > > > If your guest has no virtio driver use stdvga instead of running
> > > > virtio-vga permanently in vga compatibility mode.
> > >
> > > I tried -device VGA,vgamem_mb=32. I did not see any resolution above
> > > 1080p on a Windows 10 guest.
> >
> > Try "-device VGA,vgamem_mb=32,edid=off".  Windows seems to not like our
> > edid block for some reason.
> >
> 
> This worked, thanks for the tip. Regarding the patch, I can resubmit
> it with an amended commit message if people think it's still better to
> have a configurable memory size here.

Given that the vram is used for vga compatibility only and not used any
more once the virtio-gpu driver initialized the device I don't think
this should be configurable.

take care,
  Gerd


