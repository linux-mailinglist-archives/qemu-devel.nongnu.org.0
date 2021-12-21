Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3847BEAD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:14:27 +0100 (CET)
Received: from localhost ([::1]:48826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzd6A-000524-5n
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:14:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mzd3a-0002PL-A2
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:11:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mzd3W-0005mi-HC
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640085101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0uoquT+5vtLI6J1Rtu8+QBkIni9oXmR70VMB9gXxDQo=;
 b=KMx1UwqfL+HHR8up8LkNh5szluIk/YXIZsl9R13DXYdFwdFqmjCJ1YF9oCn7yRkTiQI0Hv
 F16NRflPcLqT8HfAjdUoXCS1wDxMzsIbBo9ZQOqJL/zN+dpRRl7KbozMXDyzlYtfHGhoTS
 V1eCdzQswrPBYA/V+AvhEMxkYWpE0AM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-iNw6fTlQOMyoOeQgRPioRQ-1; Tue, 21 Dec 2021 06:11:38 -0500
X-MC-Unique: iNw6fTlQOMyoOeQgRPioRQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A14AF1023F4E;
 Tue, 21 Dec 2021 11:11:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E04F16AB89;
 Tue, 21 Dec 2021 11:11:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 368511800091; Tue, 21 Dec 2021 12:11:25 +0100 (CET)
Date: Tue, 21 Dec 2021 12:11:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Pratik Parvati <pratikp@vayavyalabs.com>
Subject: Re: Virtio-GPU Xres and Yres seettings
Message-ID: <20211221111125.lbx6or2wg2d762a7@sirius.home.kraxel.org>
References: <CA+aXn+EZQ=S+P=8fyfCxYikEMLLdqAEeQgi580Tqtsuot-r2dw@mail.gmail.com>
 <aedfa17d-6d31-6d5d-b367-cf84e77d27ed@redhat.com>
 <20211220103548.lpgtad57woenpshi@sirius.home.kraxel.org>
 <CA+aXn+F1tPYMahODkE1qi_OM65zJ4ubHqcOi1drJWvC+PopiZQ@mail.gmail.com>
 <20211220121814.rkg7z7rki22qpzhj@sirius.home.kraxel.org>
 <CA+aXn+HPOK-N9smZsjas6EXaTD6hQjXbgrJcKK9E3u5VrSYCeg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+aXn+HPOK-N9smZsjas6EXaTD6hQjXbgrJcKK9E3u5VrSYCeg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 20, 2021 at 10:44:06PM +0530, Pratik Parvati wrote:
> > EDID is optional, so you can try disable the EDID feature bit and see
> > what happens.
> 
> Thanks Gerd, after disabling the EDID, I was able to get the required
> resolution (basically width and height) from the driver.
> 
> Another strange observation - When the device receives the
> command VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING with the number of
> entries having a pixel data in scatter gather format, the device is trying
> to store these bytes in contiguous memory. When I read those sg memory, the
> device receives all zeros from the driver (for a 1024x768 display,
> the device receives 3MB of data from the driver). Is this an expected
> behaviour? - If not, what is the driver trying to display on the screen?

How about reading the virtio spec?
display updates are handled with transfer and flush commands.

take care,
  Gerd


