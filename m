Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCB24318C7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 14:17:46 +0200 (CEST)
Received: from localhost ([::1]:34488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcRaL-0004nD-7j
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 08:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mcRXr-000327-7Z
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:15:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mcRXp-0003CV-QV
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634559309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X1uAKSvzo5B71lM5fm4Z1JJV8UjeCd8SWhYv/YoETD4=;
 b=JPozI3htPOVoOVkPx01B4Fxl4FslACfBD7ULvRMeCMvyGN3EivkzL1QrPAq7ygMJFezmeM
 AuWKNour3hZpUL+YvD78ccm8oUWR/LjVqSuzmm9vtJPvCpjTQk7pZDGG6RD4qc4/n4LrVP
 QVgCdj5BuaAV7iN723TnLIB7B7bMzgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-7r8g3PVuOweQF-oOCKE-Dw-1; Mon, 18 Oct 2021 08:15:06 -0400
X-MC-Unique: 7r8g3PVuOweQF-oOCKE-Dw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B58A0101AFA7;
 Mon, 18 Oct 2021 12:15:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75B727092E;
 Mon, 18 Oct 2021 12:15:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7A6D6180063D; Mon, 18 Oct 2021 14:15:01 +0200 (CEST)
Date: Mon, 18 Oct 2021 14:15:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v4 0/3] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Message-ID: <20211018121501.cu5e66wtbpuirtyk@sirius.home.kraxel.org>
References: <cover.1634232746.git.balaton@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <cover.1634232746.git.balaton@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Thu, Oct 14, 2021 at 07:32:26PM +0200, BALATON Zoltan wrote:
> v4 splits up the single patch into a series
> 
> BALATON Zoltan (3):
>   usb/uhci: Misc clean up
>   usb/uhci: Replace pci_set_irq with qemu_set_irq
>   hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI interrupts
> 
>  hw/usb/hcd-uhci.c          | 11 +++++------
>  hw/usb/hcd-uhci.h          |  2 +-
>  hw/usb/vt82c686-uhci-pci.c | 12 ++++++++++++
>  3 files changed, 18 insertions(+), 7 deletions(-)

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


