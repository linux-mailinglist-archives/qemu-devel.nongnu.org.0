Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE0A635A58
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 11:41:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxnAS-00080s-LP; Wed, 23 Nov 2022 05:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxnAQ-00080d-95
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 05:39:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxnAM-0000Ee-4n
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 05:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669199981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvbJHCbpFsW6+ROBKHCtIJq1iRo9JLOhhS1xrG0Yv3o=;
 b=Aj/kb/DDTYUnDAe/AeQvzpHiERcvHh9tnnvA9ytVKKQgU38WGJGrYmAxuNuHSKeq1X8omM
 707aDgq6RpkQiUSkgMS1gbQFT0Fd3WA+I9auN++TMMuLZIndHtFj0/bS3/icMhQux93isx
 5pVD5Wtutt4LLf0rTzfrCYtb1CnqOmY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-bj6_yjhlPniR0lP37gS8Uw-1; Wed, 23 Nov 2022 05:39:39 -0500
X-MC-Unique: bj6_yjhlPniR0lP37gS8Uw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF722185A7A8;
 Wed, 23 Nov 2022 10:39:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CCF92024CBE;
 Wed, 23 Nov 2022 10:39:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D223D18003BA; Wed, 23 Nov 2022 11:39:34 +0100 (CET)
Date: Wed, 23 Nov 2022 11:39:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: seabios@seabios.org, qemu-devel@nongnu.org
Subject: Re: [SeaBIOS] [PATCH 3/4] move 64bit pci window to end of address
 space
Message-ID: <20221123103934.wc33zirloo2hupmd@sirius.home.kraxel.org>
References: <20221121103213.1675568-1-kraxel@redhat.com>
 <20221121103213.1675568-4-kraxel@redhat.com>
 <8aef330c-c5e4-1af9-7018-5eff00ac91d3@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8aef330c-c5e4-1af9-7018-5eff00ac91d3@molgen.mpg.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 21, 2022 at 11:57:35AM +0100, Paul Menzel wrote:
> Dear Gerd,
> 
> 
> Thank you for the patch.
> 
> Am 21.11.22 um 11:32 schrieb Gerd Hoffmann:
> > When the size of the physical address space is known (PhysBits is not
> > zero) move the 64bit pci io window to the end of the address space.
> 
> It’d be great, if you elaborated, why this is an improvement.

It makes seabios follow a common pattern.  real mode address space
has io resources mapped high (below 1M).  32-bit address space has
io resources mapped high too (below 4G).  This does the same for
64-bit resources.

Physical hardware does simliar things, here is my workstation:

    # sudo cat /proc/iomem 
    [ ... regions below 4G snipped ... ]
    100000000-a36ffffff : System RAM
      2e6000000-2e7002607 : Kernel code
      2e7200000-2e7e84fff : Kernel rodata
      2e8000000-2e8326e7f : Kernel data
      2e8b6e000-2e8ffffff : Kernel bss
    a37000000-a37ffffff : RAM buffer
    2000000000-2fffffffff : PCI Bus 0000:00
      2ffff00000-2ffff0ffff : 0000:00:1f.3
      2ffff10000-2ffff1ffff : 0000:00:14.0
        2ffff10000-2ffff1ffff : xhci-hcd
      2ffff20000-2ffff23fff : 0000:00:1f.3
        2ffff20000-2ffff23fff : ICH HD audio
      2ffff24000-2ffff240ff : 0000:00:1f.4
      2ffff25000-2ffff25fff : 0000:00:16.0
        2ffff25000-2ffff25fff : mei_me

There is a larger gap between the end of memory and start of the pci io
window.  It's not the end of the *cpu* physical address space (that
would be 7fffffffff aka phys-bits=39).  Maybe there are additional
constrains in the io chipset (which is a non-issue for virtual
machines).

take care,
  Gerd


