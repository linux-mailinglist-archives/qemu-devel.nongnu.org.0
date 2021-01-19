Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6BF2FBC5D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:27:03 +0100 (CET)
Received: from localhost ([::1]:50146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tqQ-0000DU-F6
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1tec-0007Y8-AZ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:14:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1tea-0003ld-5i
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611072886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h+KlB9/THIyYnOAkD7aWFkrGboqCTwfCtIJlcFpzwV8=;
 b=LKMpoxK7TiE9euv/k38Wbv4h6DlTzjvScov84iUOwh/gCwx/EnpHcEU0Hk5b13u7q8LZjJ
 HN3elJYOdnEJtJes+v5dw9+gVccjlmW8w6CFWZJArxg8HCoBF2pEA5nt7EyuuZAsl3FXYz
 Mjd9fg0b/Cnp8ki1pqFiJtwgUna54r8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-QduXzzY_PTGjOIGxQdkY9g-1; Tue, 19 Jan 2021 11:14:44 -0500
X-MC-Unique: QduXzzY_PTGjOIGxQdkY9g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49A011966321;
 Tue, 19 Jan 2021 16:14:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A39A60CCB;
 Tue, 19 Jan 2021 16:14:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A01C218003A1; Tue, 19 Jan 2021 17:14:35 +0100 (CET)
Date: Tue, 19 Jan 2021 17:14:35 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] hw/usb: Convert to qdev_realize()
Message-ID: <20210119161435.s5aw6udffdthbtxq@sirius.home.kraxel.org>
References: <20210119120151.53757-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210119120151.53757-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: sai.pavan.boddu@xilinx.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 01:01:51PM +0100, Markus Armbruster wrote:
> Device code shouldn't mess with QOM property "realized" since we have
> proper interfaces (merge commit 6675a653).  Commit 8ddab8dd3d
> "usb/hcd-xhci: Split pci wrapper for xhci base model" and commit
> f00ff136ee "usb: hcd-xhci-sysbus: Attach xhci to sysbus device"
> reintroduced two instances.  Clean them up.  Note that s->xhci is
> a (bus-less) TYPE_XHCI device.

Added to usb queue.

thanks,
  Gerd


