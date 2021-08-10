Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E115D3E531E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 07:51:32 +0200 (CEST)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDKfh-0004UH-LQ
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 01:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDKej-00037f-30
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:50:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDKef-00069P-4t
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628574621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F1xDNWT2iTdH6oxMkNypdjjfF44a6J9ersnL1Jw/cqw=;
 b=UHmAhdH8te7v1v5/8hzTJyNBYr4YHIElSfQTFcPXE6OiTR7zDsoYEk4gD5xhvdZx+9EaA0
 +YrIkPkXcnSH58a6JhvL2p5VzGtALRtaK6bkuTDEYpZ63bx6VNyRPJycNb6/jJlK1bBxUx
 O+y3bJBS9a4paO6EPdAREZQehZi3ECQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-NyPcuOSyMvSa3zS4E1InBQ-1; Tue, 10 Aug 2021 01:50:18 -0400
X-MC-Unique: NyPcuOSyMvSa3zS4E1InBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A9B6A0BDE;
 Tue, 10 Aug 2021 05:50:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA5555C23A;
 Tue, 10 Aug 2021 05:50:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C32D18003AA; Tue, 10 Aug 2021 07:50:15 +0200 (CEST)
Date: Tue, 10 Aug 2021 07:50:15 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] ui/sdl2: Check return value from g_setenv()
Message-ID: <20210810055015.ijymupi4canvjloa@sirius.home.kraxel.org>
References: <20210809161424.32355-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210809161424.32355-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Setting environment variables can fail; check the return value
> from g_setenv() and bail out if we couldn't set SDL_VIDEODRIVER.

Hmm, looking at the comment I'm wondering whenever we maybe should just
drop the setenv (after 6.1).  It's quite old, I doubt svgalib talking
directly to the hardware is still a thing these days, and we have the
x11 -> wayland shift happening ...

take care,
  Gerd


