Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B1323B3B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:24:17 +0100 (CET)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsHA-0006db-T4
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEsGD-0006A8-LN
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:23:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEsGB-0007Af-3N
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:23:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614165794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rLwYzffrccWLL0mRpPbPdLR9WV3/MIRvOfL/rgaycug=;
 b=Qb3VhD5w5rjLBvGSt4xM0FDT5K7STyNeIgGys1299abKFIryfJbH2QR6/01+Rda0kc8HWc
 R7v/43bGrtJ6kcijN6hpR1hqQQGCqkWZ8D8tW7I5j+DUFnYY3nWmaEdoqF/YLnlSSlW8EV
 iYCyVeXJ++SuAKajRODQI1j48mWC+/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-Gi0V0HmMNNCRBuJOjxsPkQ-1; Wed, 24 Feb 2021 06:23:10 -0500
X-MC-Unique: Gi0V0HmMNNCRBuJOjxsPkQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AA791020C22;
 Wed, 24 Feb 2021 11:23:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27F235D9D0;
 Wed, 24 Feb 2021 11:23:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 445DD18000AE; Wed, 24 Feb 2021 12:23:07 +0100 (CET)
Date: Wed, 24 Feb 2021 12:23:07 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix stride resolution of pixman image
Message-ID: <20210224112307.vfz3qz6bgrboj627@sirius.home.kraxel.org>
References: <CAFEAcA9E73_a0hEMV+jFm6YbcOz=hFR-NyYKa_Roisw_MR_cNg@mail.gmail.com>
 <20210222144012.21486-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210222144012.21486-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 11:40:12PM +0900, Akihiko Odaki wrote:
> A display can receive an image which its stride is greater than its
> width. In fact, when a guest requests virtio-gpu to scan out a
> smaller part of an image, virtio-gpu passes it to a display as an
> image which its width represents the one of the part and its stride
> equals to the one of the whole image.

Probably not limited to virtio-gpu.  Wayland rounds display framebuffers
to the next multiple of 64, so when running -- for example -- 800x600
wayland will create an image 832 pixels wide.  Other UIs had simliar
issues.

Patch added to UI patch queue.

thanks,
  Gerd


