Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88069442ED3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:08:10 +0100 (CET)
Received: from localhost ([::1]:57644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtWL-0000zI-En
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mht1j-0007Hl-Db
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mht1c-0002w1-Go
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635856583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EHRUpkGRwhmA3evGAqYUlr584d8BGpgjhOmSVD38+8=;
 b=FJE60RQwNP/mjA94jliVXVzVwPqN3dnEnojT4I/Bwmd1v0ouD/XYe7SNmVfNVAwaBpgIbX
 TMejaVNFIUDOlqWTF/NVQHA8uxH5ecvQgjzFjV7AaFDNo1QpkLfTEe56KZm6BT9cdOVEjx
 /9Bd+1fSpTxKGXhI4q3/dpq++Pco/ZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-RlhSWQRaM7-YY9VELQJcHw-1; Tue, 02 Nov 2021 08:36:20 -0400
X-MC-Unique: RlhSWQRaM7-YY9VELQJcHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A299DF8A3;
 Tue,  2 Nov 2021 12:36:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BEF25D9D5;
 Tue,  2 Nov 2021 12:36:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 36F42180092D; Tue,  2 Nov 2021 13:36:16 +0100 (CET)
Date: Tue, 2 Nov 2021 13:36:16 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2 0/4] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Message-ID: <20211102123616.f7gmfdtbznjtbgcl@sirius.home.kraxel.org>
References: <cover.1635161629.git.balaton@eik.bme.hu>
 <6f955022-ba0c-5dbf-05bd-cb73d910a40f@amsat.org>
 <a1dbf134-d273-85cb-a956-7c2be89f3fa@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <a1dbf134-d273-85cb-a956-7c2be89f3fa@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 11:53:18AM +0100, BALATON Zoltan wrote:
> Hello,
> 
> On Mon, 25 Oct 2021, Philippe Mathieu-Daudé wrote:
> > On 10/25/21 13:33, BALATON Zoltan wrote:
> > > This is the same as posted before just omitting the two patches that
> > > are optimisations by caching the func0 and avoiding QOM casts which
> > > could not be measured to have an effect but these reamaining patches
> > > are still needed to fix USB interrupts on pegasos2
> > > 
> > > Gerd, could you please take them?
> > > 
> > > Regards,
> > > 
> > > BALATON Zoltan (4):
> > >   usb/uhci: Misc clean up
> > >   usb/uhci: Disallow user creating a vt82c686-uhci-pci device
> > >   usb/uhci: Replace pci_set_irq with qemu_set_irq
> > >   hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI interrupts
> > 
> > Thanks, series applied to mips-next tree.
> 
> According to https://wiki.qemu.org/Planning/6.2 freeze starts today and I
> haven't yet seen a pull request with this series. Is it still to come?

Oh, damn, was busy with edk2 stuff and didn't notice the freeze is
*that* close already.  Going over pending bits now and prepare a pull
req ...

take care,
  Gerd


