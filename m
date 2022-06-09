Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB32544C08
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:31:54 +0200 (CEST)
Received: from localhost ([::1]:37556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHKL-0000dX-Hz
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzF0C-0001TU-Ab
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:02:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzF05-0006M4-SH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654768969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TXCfSltdFHumjZWwf/I28FvCa6ExEX6Q/EkhlVJsb/k=;
 b=eseUxWybU+2HwYbyw0tFNcG2ROLygBS/9uQBa4DgLGvMhiAKOfxhHojxMeyFbKhuLPuZtu
 Bc02q4b5F0ljfUHNb2O3qzLnp0inIdZD0DclXYwrFC4FQ2p8HCB2zx+LtBDMoDgUXNbBid
 B27EnoRgQjdrs9WPzaaFLULkyFbaYNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-953HsTWSOjOqLxLBLvRChQ-1; Thu, 09 Jun 2022 06:02:44 -0400
X-MC-Unique: 953HsTWSOjOqLxLBLvRChQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64FF1185A7BA;
 Thu,  9 Jun 2022 10:02:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39DB8492C3B;
 Thu,  9 Jun 2022 10:02:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B33291800094; Thu,  9 Jun 2022 12:02:42 +0200 (CEST)
Date: Thu, 9 Jun 2022 12:02:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Arnout Engelen <arnout@bzzt.net>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/usb/hcd-ehci: fix writeback order
Message-ID: <20220609100242.kyv2kxlfsg3tm52y@sirius.home.kraxel.org>
References: <20220508153222.3560803-1-arnout@bzzt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220508153222.3560803-1-arnout@bzzt.net>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

On Sun, May 08, 2022 at 05:32:22PM +0200, Arnout Engelen wrote:
> The 'active' bit passes control over a qTD between the guest and the
> controller: set to 1 by guest to enable execution by the controller,
> and the controller sets it to '0' to hand back control to the guest.
> 
> ehci_state_writeback write two dwords to main memory using DMA:
> the third dword of the qTD (containing dt, total bytes to transfer,
> cpage, cerr and status) and the fourth dword of the qTD (containing
> the offset).
> 
> This commit makes sure the fourth dword is written before the third,
> avoiding a race condition where a new offset written into the qTD
> by the guest after it observed the status going to go to '0' gets
> overwritten by a 'late' DMA writeback of the previous offset.
> 
> This race condition could lead to 'cpage out of range (5)' errors,
> and reproduced by:
> 
> ./qemu-system-x86_64 -enable-kvm -bios $SEABIOS/bios.bin -m 4096 -device usb-ehci -blockdev driver=file,read-only=on,filename=/home/aengelen/Downloads/openSUSE-Tumbleweed-DVD-i586-Snapshot20220428-Media.iso,node-name=iso -device usb-storage,drive=iso,bootindex=0 -chardev pipe,id=shell,path=/tmp/pipe -device virtio-serial -device virtconsole,chardev=shell -device virtio-rng-pci -serial mon:stdio -nographic
> 
> (press a key, select 'Installation' (2), and accept the default
> values. On my machine the 'cpage out of range' is reproduced while
> loading the Linux Kernel about once per 7 attempts. With the fix in
> this commit it no longer fails)
> 
> This problem was previously reported as a seabios problem in
> https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/OUTHT5ISSQJGXPNTUPY3O5E5EPZJCHM3/
> and as a nixos CI build failure in
> https://github.com/NixOS/nixpkgs/issues/170803
> 
> Signed-off-by: Arnout Engelen <arnout@bzzt.net>

Patch queued up.

thanks,
  Gerd


