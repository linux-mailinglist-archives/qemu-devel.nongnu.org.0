Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A061D321498
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:58:59 +0100 (CET)
Received: from localhost ([::1]:50800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8va-0004Q0-M3
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lE8uS-0003sz-Qw
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:57:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lE8uR-0007gO-Ds
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613991466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nvlkKULpwYNVPS6/mh0XmFuo5ZYky+bE+E6dQG6ewlY=;
 b=cjq8NnG/SHqrk+mc3q8m9VwYKPx/3se55HAIkgdHDl/dLe6QENtKkwHe1AQbIg7GL85TFI
 v1hjntuRrAWy8jsXY8IO0EMGigow2up5G29c7jy7mhe5orh/2jGgXZE9BHnRLd2M6di2Hz
 Fa7ccqNT35nvtZZbDICBI3BznDnZ7RY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-O0U_erKjNFiOb3Hd-kM1Ng-1; Mon, 22 Feb 2021 05:57:44 -0500
X-MC-Unique: O0U_erKjNFiOb3Hd-kM1Ng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BDF41020C20;
 Mon, 22 Feb 2021 10:57:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4B2460C04;
 Mon, 22 Feb 2021 10:57:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3EF8F1800399; Mon, 22 Feb 2021 11:57:38 +0100 (CET)
Date: Mon, 22 Feb 2021 11:57:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
Message-ID: <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210221133414.7262-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 21, 2021 at 10:34:14PM +0900, Akihiko Odaki wrote:
> This change introduces an additional member, refresh_rate to
> qemu_edid_info in include/hw/display/edid.h.
> 
> This change also isolates the graphics update interval from the
> display update interval. The guest will update the frame buffer
> in the graphics update interval, but displays can be updated in a
> dynamic interval, for example to save update costs aggresively
> (vnc) or to respond to user-generated events (sdl).
> It stabilizes the graphics update interval and prevents the guest
> from being confused.

Hmm.  What problem you are trying to solve here?

The update throttle being visible by the guest was done intentionally,
so the guest can throttle the display updates too in case nobody is
watching those display updated anyway.

take care,
  Gerd


