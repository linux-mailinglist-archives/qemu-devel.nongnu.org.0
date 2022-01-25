Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961E49B1C9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:42:40 +0100 (CET)
Received: from localhost ([::1]:44862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJHb-0004be-F9
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:42:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCJ2z-0007pd-Pe
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:27:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCJ2y-0005Ki-5v
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643106451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ImyPuZVtZ9Ccd7WOYm+qLiCuBN41g5aoIGdBz9iEIEM=;
 b=Mz8xWpgEaglOIweVHY90rBXgTFZt7lHH1s3DXqabkgLZGXNxVyaJijiFb+Lum1khXe0WSZ
 c/Gf5rn5C5j1tVL1xgjxI3irJoDnPwacWRv0rPY6+Oc4c8nmpPJ2QklTKig9dCwC+gLl2A
 qa/Jfo9QcPEmQIvjuTwMzsmMufdBIsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-ba1bNs_dMRyAltl2lV3DEA-1; Tue, 25 Jan 2022 05:27:28 -0500
X-MC-Unique: ba1bNs_dMRyAltl2lV3DEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6A2583DE6D;
 Tue, 25 Jan 2022 10:27:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B031C56A86;
 Tue, 25 Jan 2022 10:27:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DAD5918003A0; Tue, 25 Jan 2022 11:27:25 +0100 (CET)
Date: Tue, 25 Jan 2022 11:27:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 0/5] Misc OHCI clean ups
Message-ID: <20220125102725.d4gx5cilfirhmqne@sirius.home.kraxel.org>
References: <cover.1642339238.git.balaton@eik.bme.hu>
 <a56cff-a9e2-365a-9d85-62f46560a7c5@eik.bme.hu>
 <20220125074430.5krdc75rn3a3nca3@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20220125074430.5krdc75rn3a3nca3@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 08:44:30AM +0100, Gerd Hoffmann wrote:
> On Mon, Jan 24, 2022 at 06:09:12PM +0100, BALATON Zoltan wrote:
> > On Sun, 16 Jan 2022, BALATON Zoltan wrote:
> > > Hello,
> > > 
> > > I have these patches from last October when we've looked at what
> > > causes problems with mac99 and USB. We've found the main problem is
> > > likely not allowing pending packets per endpoint which we did not fix
> > > but these patches came out of debugging that and trying to improve the
> > > device model so eventually the real problem could be fixed more
> > > easily. So these are just clean ups and fixing one potential issue
> > > with isochronous transfers breaking pending async packet but it does
> > > not solve all problems OHCI currently has. I'm sending it anyway as I
> > > don't plan to work further on this so this series could be taken as is
> > > for now.
> > 
> > Ping?
> 
> Queued now.

Oops, have to take that back, checkpatch throws errors:

HEAD is now at 00abd6f54a24 usb/ohci: Don't use packet from OHCIState for isochronous transfers

error: no note found for object 00abd6f54a246db5877ceb466755374b297d97cf.
ERROR: braces {} are necessary for all arms of this statement
#131: FILE: hw/usb/hcd-ohci.c:1115:
+                if (ohci_service_iso_td(ohci, &ed))
[...]

total: 1 errors, 0 warnings, 153 lines checked

Please check all patches & resend.

take care,
  Gerd


