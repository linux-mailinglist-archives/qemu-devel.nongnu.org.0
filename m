Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13847B348
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:57:13 +0100 (CET)
Received: from localhost ([::1]:50092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNqS-0003A4-Ir
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:57:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mzL0H-0005kv-29
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:55:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mzL0F-0005jp-E2
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640015706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhzkEhxUUOitTZs1buy/det566z+GXWNcyW7MNlVuV8=;
 b=EayQZ3mAMCAFCIeWrNzzkv7sNekEFosYMX8Z1Bu593jEQZxdydLpL/iV73Lh5H5lUnau/m
 UXpWvrjMQ/HnvPiTVh0LrWP4Kb2bSwjuWF9ZDqWwIqYfFimfhCdz5c4Ifnmpxk3t4ijXPz
 PRNOf90hLVsxF31aGOjdQYyey4MImsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-F9UqvqQcNwGpn_MrpU7rxw-1; Mon, 20 Dec 2021 05:36:02 -0500
X-MC-Unique: F9UqvqQcNwGpn_MrpU7rxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DF85801B2A;
 Mon, 20 Dec 2021 10:36:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 592196ABB4;
 Mon, 20 Dec 2021 10:35:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 64FCF180063A; Mon, 20 Dec 2021 11:35:48 +0100 (CET)
Date: Mon, 20 Dec 2021 11:35:48 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: Virtio-GPU Xres and Yres seettings
Message-ID: <20211220103548.lpgtad57woenpshi@sirius.home.kraxel.org>
References: <CA+aXn+EZQ=S+P=8fyfCxYikEMLLdqAEeQgi580Tqtsuot-r2dw@mail.gmail.com>
 <aedfa17d-6d31-6d5d-b367-cf84e77d27ed@redhat.com>
MIME-Version: 1.0
In-Reply-To: <aedfa17d-6d31-6d5d-b367-cf84e77d27ed@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Pratik Parvati <pratikp@vayavyalabs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 20, 2021 at 09:55:00AM +0100, Philippe Mathieu-Daudé wrote:
> Cc'ing Gerd & Marc-André.
> 
> On 12/20/21 05:26, Pratik Parvati wrote:
> > Hi Team,
> > 
> > I am working on a Virtio-GPU device (backend) for one of our customer
> > projects - we are using the Virtio-GPU driver (frontend) to drive our
> > device. Our device code has been written using Qemu virtio-gpu device
> > code as a reference. Our device is setting the resolution to 1024x768 as
> > a response to the command received from the driver (i.e,
> > VIRTIO_GPU_CMD_GET_DISPLAY_INFO) - I also verified that driver is
> > receiving the response bytes properly, but the next
> > command (i.e, VIRTIO_GPU_CMD_RESOURCE_CREATE_2D) that device receive has
> > a width and height as 4096 and 2160 respectively. The driver is assuming
> > a 4k display for some reason and I need your help to understand why this
> > is happening.

Wild guess: virtio_gpu_resp_display_info.pmodes[0].enabled is false?

> > Our display is corrupted for the same Xres and Yres misunderstanding
> > between the device and the driver

Oh, the VIRTIO_GPU_CMD_GET_DISPLAY_INFO reply is just a hint for the
driver.  The driver is free to choose whatever it wants, your device
must be prepared for that.

The linux kms driver specifically returns a long list of standard modes
(including 4k) to userspace, with the resolution returned by
VIRTIO_GPU_CMD_GET_DISPLAY_INFO tagged as 'preferred'.  Typically
userspace (aka display server, aka xorg / wayland / ...) uses the
preferred resolution by default, but userspace can also pick something
else and the kernel driver will forward the request to the device.

So, it might also be the software running inside the guest which
picks 4k ...

HTH & take care,
  Gerd


