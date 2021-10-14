Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49EF42D9B4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 15:04:24 +0200 (CEST)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb0PH-0000Hw-Pp
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 09:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mb0NB-0007qf-Gg
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:02:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mb0N7-0000wB-5S
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 09:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634216527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=++MjkeYg+hPRPw7AzVbhhl8mjJ3JlvqBUcxxRrO5yhs=;
 b=JEVmy21PwYB4cOEqHS6ZfLkyXqOmfVdk0936bMyARjna5+UTQk2qo+GCi6VDiFG6HJKfY7
 d+uwWJNjwk0O3UTwTUjq8+E+Ty3Jqr7qpYMNMwzfyjhCojTieePCGymrNwn3ClT6uUH0Si
 /iS8zLTS8V4HlbOuTATC2JSS7pF+fls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-FKVfj2NaO6-LX55lZEhm4g-1; Thu, 14 Oct 2021 09:02:04 -0400
X-MC-Unique: FKVfj2NaO6-LX55lZEhm4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E15A1922962;
 Thu, 14 Oct 2021 13:02:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0E861981F;
 Thu, 14 Oct 2021 13:02:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 255E818007AC; Thu, 14 Oct 2021 15:01:59 +0200 (CEST)
Date: Thu, 14 Oct 2021 15:01:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v3] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Message-ID: <20211014130159.cwkub7g7akco76ls@sirius.home.kraxel.org>
References: <20211013121929.9E835746333@zero.eik.bme.hu>
 <20211014091035.xlhh74aioxhkxelf@sirius.home.kraxel.org>
 <1e91fd14-f112-b5b7-abfb-117cbb109c39@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <1e91fd14-f112-b5b7-abfb-117cbb109c39@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 12:22:58PM +0200, BALATON Zoltan wrote:
> On Thu, 14 Oct 2021, Gerd Hoffmann wrote:
> > On Wed, Oct 13, 2021 at 02:13:09PM +0200, BALATON Zoltan wrote:
> > > This device is part of a superio/ISA bridge chip and IRQs from it are
> > > routed to an ISA interrupt set by the Interrupt Line PCI config
> > > register. Change uhci_update_irq() to allow this and implement it in
> > > vt82c686-uhci-pci.
> > 
> > Looks good.  There are some unrelated changes in though (whitespace,
> > comments, ...), and the vt82c686-uhci-pci.c changes should be a
> > separate patch.
> 
> So you mean split it into a series of three small patches? Should I do a w4
> with that?

I was thinking about two patches: drop the unrelated stuff, one patch
for the irq signaling change, and one for the vt82c686 changes.

But of course you can add more patches for the other changes, i.e.
dropping the else branch for level = 0 and other small tweaks.

take care,
  Gerd


