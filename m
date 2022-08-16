Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F7259556D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 10:38:45 +0200 (CEST)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNs60-00052P-Db
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 04:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNs4X-0002Uz-6i
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 04:37:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNs4U-00058Y-I5
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 04:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660639029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JPWPn4WYI1UoF/pVe8UC9wKYj6qeR49oP1pyyJU3lps=;
 b=JxRSTJneRyeQe0kS5ikFHxMo4V11fATNrTUI4ZrYacvIK1exIUZNvFIgeH0KeQZv7Fv1dX
 K3WR3J2p+JEOsYKdQq8bmHJAii5jXCfkCkb+zUcyMeo8ih8Bbmu8mhzpNNIEKLDXkpi89v
 EAM0fjoG4AognozJhSqXbbyn0SPJiX4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-50adVmxpPZS4Aw86Sz6RbQ-1; Tue, 16 Aug 2022 04:37:06 -0400
X-MC-Unique: 50adVmxpPZS4Aw86Sz6RbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 053B2801231;
 Tue, 16 Aug 2022 08:37:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C56892026D07;
 Tue, 16 Aug 2022 08:37:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7B19518003A8; Tue, 16 Aug 2022 10:37:03 +0200 (CEST)
Date: Tue, 16 Aug 2022 10:37:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 mcascell@redhat.com, f4bug@amsat.org
Subject: Re: [PATCH] hw/usb/hcd-xhci: Fix endless loop in case the DMA access
 fails (CVE-2020-14394)
Message-ID: <20220816083703.vopxgj2omjittb6j@sirius.home.kraxel.org>
References: <20220802134834.454749-1-thuth@redhat.com>
 <CAFEAcA_oZni8G7LeciOywasY2rcEnpo=v01xCaaCTBp5_pDTLQ@mail.gmail.com>
 <aaa3210f-0c81-5c4e-7757-10fa99f5ac27@redhat.com>
 <CAFEAcA8Nsa131yeONs7-3H4wq885r1yuCwwSs=O09SS_Q7xUdQ@mail.gmail.com>
 <d3880c4d-b100-b412-e1f1-4f5c650cc22d@redhat.com>
 <CAFEAcA9azLEWsK-ewXT_ovsc2u+2ykMMJNK8b9UXdfBZ49w6eA@mail.gmail.com>
 <d2c8abec-1f87-01e5-a882-8502d9547f39@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2c8abec-1f87-01e5-a882-8502d9547f39@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 04, 2022 at 01:43:14PM +0200, Thomas Huth wrote:
> On 04/08/2022 12.17, Peter Maydell wrote:
> > That sounds like we do still have an unbounded-loop problem,
> > then: there's no limit on the number of consecutive TRBs
> > we try to read in that function. Maybe we're missing an
> > error check of some kind (does the spec limit how many
> > consecutive TRBs there can be somehow?) or else we need
> > another artificial limit.
> 
> I'm not an XHCI expert at all, but while at least having a quick glance at
> the spec, I did not see any limit there. So I assume that we should enforce
> an artificial limit? What would be a good value for this? Gerd, do you maybe
> have any opinion?

Hmm, dunno.  Typical workflow is that the driver allocates a page
(or multiple physically contiguous pages) for the TRBs, and when
it reaches the end of the allocation it gets a new block and chains
it using TRB_LINK.

Right now we have a limit for type=TRB_LINK only, having another one for
all TRBs makes sense.  The number of TRBs for a transfer can be quite
large (think usb-storage reads/writes), so don't set that too low, 64k
maybe?

take care,
  Gerd


