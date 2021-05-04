Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C84372639
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 09:06:44 +0200 (CEST)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldp8l-0007ho-Fq
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 03:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldof6-0005YC-ED
 for qemu-devel@nongnu.org; Tue, 04 May 2021 02:36:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldof2-0001Uv-Cx
 for qemu-devel@nongnu.org; Tue, 04 May 2021 02:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620110158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FVzMiOBuLflSA0rYxxIhUm96EJKa3aMDlG80qjrXTQY=;
 b=BRT6apIFU8OMDnbBOMV723F8572GkNxuM0TIVYcZELSde3cdSXGe5cUWJNsr3qzmnj2YD2
 ywJPr6O1bEQYl4aXi0xHdIk4SYgB9HOFTdnEq1qO/JaHNcGmwf7Ji6undgqX6PdQfG+GPV
 GX+m24rFHmwSI1/PXUrfP6vq/nSTFtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-0MQFUCI7Mz2U72A-tvH6kQ-1; Tue, 04 May 2021 02:35:56 -0400
X-MC-Unique: 0MQFUCI7Mz2U72A-tvH6kQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD662802938;
 Tue,  4 May 2021 06:35:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75BDC19D9B;
 Tue,  4 May 2021 06:35:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B39821800383; Tue,  4 May 2021 08:35:53 +0200 (CEST)
Date: Tue, 4 May 2021 08:35:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: Ethernet-over-usb with linux guest using USB Device Controller ?
Message-ID: <20210504063553.3wsmrwnzvuipzsmj@sirius.home.kraxel.org>
References: <CADPb22QnVowGz2oCWk8mBtjZz-4Cuzu0z=LmfvwotG_QjbuPzQ@mail.gmail.com>
 <20210427073053.ny6fiwxdb6jkhmd2@sirius.home.kraxel.org>
 <CADPb22Qz3E-nyvkQSaiPPpghd1bYy_+_Qm0o7DnUPXdcrv+gxw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADPb22Qz3E-nyvkQSaiPPpghd1bYy_+_Qm0o7DnUPXdcrv+gxw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 03, 2021 at 02:27:39PM -0700, Doug Evans wrote:
> On Tue, Apr 27, 2021 at 12:31 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> >   Hi,
> >
> > > Questions: Is this support in QEMU and if so got any pointers to source
> > for
> > > existing examples?
> > > If not, any guidance on how to proceed?
> >
> > qemu has only usb host controller emulation, not any usb device
> > controller emulation.  So you are entering new territory and there are
> > no existing code exsamples, sorry.
> >
> 
> 
> Thanks. Any suggestions on how you would do it? Even just high level design
> points would be helpful.
> 
> As far as implementation goes:
> 1) Is there a "libusb" kinda thing for devices?
>   [any sort of utility library that takes the device's point of view]

No clue, sorry.

> 2) Would it make sense to use the usbredir protocol for speaking USB over
> sockets?
>   [where in this case QEMU is the device and not the host]
>   ref: https://www.spice-space.org/usbredir.html

Depends on how you design this.  Running usbredir-over-vsock is clearly
one option, and it would for the most part take qemu out of the loop.
Drawback is that this wouldn't be transparent to the guest, the guest
would have to implement the usb device as usbredir server instead of
using the usual usb gadget interfaces which one would use on physical
hardware.

Another obvious option would be to implement a usb device controller in
qemu (either emulate existing hardware, or design something paravirtual,
probably using virtio).  Reusing existing software would be easier that
way.

take care,
  Gerd


