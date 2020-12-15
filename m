Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF9B2DA8D7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 09:00:34 +0100 (CET)
Received: from localhost ([::1]:36412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp5G4-0008RN-4x
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 03:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kp5EJ-0007ma-Up
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 02:58:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kp5EH-0005eS-9d
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 02:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608019119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s5e9TJMDX3fNasf/XqjJeEauiYve7PEyVTJdkwliUsE=;
 b=Pwhkb8rhAUpZ3bQHapy41VSzh1uGu0FH7DV9gxfe1+3duPlMjxMtgxb3f1hPM1gpgYwB03
 fe8OTvKjfzVgxh6q2JNAU206qgH4CMI2g77i1Np3o5aVtpZDRGfmUgjQv+bF5GrLo2bfnb
 zqGzUqb+LnrvEbHVFtmlT1xAy2jOJt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-L-EcN2kCO36icQZ4tf7GxQ-1; Tue, 15 Dec 2020 02:58:36 -0500
X-MC-Unique: L-EcN2kCO36icQZ4tf7GxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09F97801817;
 Tue, 15 Dec 2020 07:58:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B33FCE70A;
 Tue, 15 Dec 2020 07:58:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D99A017532; Tue, 15 Dec 2020 08:58:33 +0100 (CET)
Date: Tue, 15 Dec 2020 08:58:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [PATCH v2] hw/usb/host-libusb.c: fix build with kernel < 5.0
Message-ID: <20201215075833.ibutxmev7iavo4v2@sirius.home.kraxel.org>
References: <20201213213016.457350-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201213213016.457350-1-fontaine.fabrice@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

On Sun, Dec 13, 2020 at 10:30:16PM +0100, Fabrice Fontaine wrote:
> USBDEVFS_GET_SPEED is used since version 5.2.0 and
> https://gitlab.com/qemu-project/qemu/-/commit/202d69a715a4b1824dcd7ec1683d027ed2bae6d3
> resulting in the following build failure with kernel < 5.0:
> 
> ../hw/usb/host-libusb.c: In function 'usb_host_open':
> ../hw/usb/host-libusb.c:953:32: error: 'USBDEVFS_GET_SPEED' undeclared (first use in this function); did you mean 'USBDEVFS_GETDRIVER'?
>          int rc = ioctl(hostfd, USBDEVFS_GET_SPEED, NULL);
>                                 ^~~~~~~~~~~~~~~~~~
>                                 USBDEVFS_GETDRIVER
> 
> A tentative was made to fix this build failure with
> https://gitlab.com/qemu-project/qemu/-/commit/4969e697c15ac536d5c0700381d5d026ef7f0588
> 
> However, the assumption that distros with old kernels also have old
> libusb is just wrong so also add a check for defined(USBDEVFS_GET_SPEED)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Added to usb queue.

thanks,
  Gerd


