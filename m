Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D05228E04A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 14:08:51 +0200 (CEST)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSfaM-0000ka-7L
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 08:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSfYu-0007we-Nc
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 08:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSfYt-0002iw-0j
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 08:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602677238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Dt7HmsPbaTS9gjt5Qs1zLIGLSsrh7TIRk+fnnQbG6o=;
 b=LjhPOKfPtVEuY7JDd+H6MjyaYslybNQ5rlHfxmZ+1iq/D9MvYlfhpQTG2iRpnu6BWj3UnW
 X1oKJDJ6PfZNfx6VMHU+LfPqW+c72SpRo3ApEQwvX4xx46O3CLpUv9+faXDD6HRfvTVZIn
 U75RowjQFNjG661NXNxZnG+Qd/ETe1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-8bHFIO09PImG0NVuKoPa7Q-1; Wed, 14 Oct 2020 08:07:15 -0400
X-MC-Unique: 8bHFIO09PImG0NVuKoPa7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA0B780EF9B;
 Wed, 14 Oct 2020 12:07:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1CA37366B;
 Wed, 14 Oct 2020 12:07:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B88489CA5; Wed, 14 Oct 2020 14:07:12 +0200 (CEST)
Date: Wed, 14 Oct 2020 14:07:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] usb/hcd-ehci: Fix error handling on missing device for iTD
Message-ID: <20201014120712.4x32437zp3vvcjfu@sirius.home.kraxel.org>
References: <20201014104106.2962640-1-anthony.perard@citrix.com>
MIME-Version: 1.0
In-Reply-To: <20201014104106.2962640-1-anthony.perard@citrix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 01:12:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Oct 14, 2020 at 11:41:06AM +0100, Anthony PERARD wrote:
> The EHCI Host Controller emulation attempt to locate the device
> associated with a periodic isochronous transfer description (iTD) and
> when this fail the host controller is reset.
> 
> But according the EHCI spec 1.0 section 5.15.2.4 Host System
> Error, the host controller is supposed to reset itself only when it
> failed to communicate with the Host (Operating System), like when
> there's an error on the PCI bus. If a transaction fails, there's
> nothing in the spec that say to reset the host controller.
> 
> This patch rework the error path so that the host controller can keep
> working when the OS setup a bogus transaction, it also revert to the
> behavior of the EHCI emulation to before commits:
> e94682f1fe ("ehci: check device is not NULL before calling usb_ep_get()")
> 7011baece2 ("usb: remove unnecessary NULL device check from usb_ep_get()")
> 
> The issue has been found while trying to passthrough a USB device to a
> Windows Server 2012 Xen guest via "usb-ehci", which prevent the USB
> device from working in Windows. ("usb-ehci" alone works, windows only
> setup this weird periodic iTD to device 127 endpoint 15 when the USB
> device is passthrough.)
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Added to usb queue.

thanks,
  Gerd


