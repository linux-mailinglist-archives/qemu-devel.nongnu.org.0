Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C143D3A08
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 14:20:39 +0200 (CEST)
Received: from localhost ([::1]:37880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6uAQ-00076p-5D
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 08:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6u8n-0006SJ-7v
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:18:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6u8j-0006Xp-ML
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627042732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sgijzzQ5rPnHM8B3Lkm+AQ3RWEXlzA5e6pi1P6+r2GA=;
 b=XKdfF/E++AmLuOA0gIGvZNiBKjSI0iwAkIor0ZJOutBxIqLmUGbmoDk7z+4BJQ6WQWtZGn
 +Kr7uR76xPSwl5Et+WcPooULf9F+b/bh3tk3YNvx6CMlprS1WBFPwFYlRPSCcVLZVPhwqi
 y6mOD99vDmiDAHVrLAwCzfR4z6cAyiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-T-uwNYGLNAKJ4WoMaCUhdw-1; Fri, 23 Jul 2021 08:18:50 -0400
X-MC-Unique: T-uwNYGLNAKJ4WoMaCUhdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B94C31084F56;
 Fri, 23 Jul 2021 12:18:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 437B126E6D;
 Fri, 23 Jul 2021 12:18:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AFA5018000A3; Fri, 23 Jul 2021 14:18:47 +0200 (CEST)
Date: Fri, 23 Jul 2021 14:18:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dennis =?utf-8?Q?W=C3=B6lfing?= <denniswoelfing@gmx.de>
Subject: Re: [PATCH for 6.1 v2] ui/gtk: Fix relative mouse with multiple
 monitors
Message-ID: <20210723121847.dswkcikomkanynvq@sirius.home.kraxel.org>
References: <20210720143940.291413-1-denniswoelfing@gmx.de>
MIME-Version: 1.0
In-Reply-To: <20210720143940.291413-1-denniswoelfing@gmx.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 04:39:41PM +0200, Dennis Wölfing wrote:
> To handle relative mouse input the event handler needs to move the mouse
> away from the screen edges. Failing to do so results in the mouse
> getting stuck at invisible walls. However the current implementation for
> this is broken on hosts with multiple monitors.
> 
> With multiple monitors the mouse can be located outside of the current
> monitor which is not handled by the current code. Also the monitor
> itself might be located at coordinates different from (0, 0).
> 
> Signed-off-by: Dennis Wölfing <denniswoelfing@gmx.de>
> ---
> Changes in v2:
> Warp the mouse to the center of the monitor.

Added to my 6.1-fixes queue.

thanks,
  Gerd


