Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55DD31FA45
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:05:31 +0100 (CET)
Received: from localhost ([::1]:35536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD6PS-0003fw-OW
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD6Nv-00039n-LV
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:03:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD6Nu-0001x8-4X
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613743433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HvdPfFXeeHncRoUQWeXIrub4bqTC1dqCLnnMdCwm7bo=;
 b=Y4lorMivjWu4d/K4AzhEwq1XkIWYnxKY2S5PbOwq+4CfOMoW4lcEr4MOZg9b7ApaNohgnp
 EIkP7pfspnhOFfvt341lUtu9wdpmZZ+N8Dhtna+DfLWhIUlSXI2sgLzXIM3drSAnZXQdXD
 uTfEFkWotRW28Z36czO5CUPrOzOx5I8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-73V18QtvPCGLMVgZ24lSNw-1; Fri, 19 Feb 2021 09:03:49 -0500
X-MC-Unique: 73V18QtvPCGLMVgZ24lSNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77D46192FDA4;
 Fri, 19 Feb 2021 14:03:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FAAE5C238;
 Fri, 19 Feb 2021 14:03:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C88418000A2; Fri, 19 Feb 2021 15:03:46 +0100 (CET)
Date: Fri, 19 Feb 2021 15:03:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Statically allocate dcl
Message-ID: <20210219140346.utjva252czvnaiiw@sirius.home.kraxel.org>
References: <20210219084419.90181-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210219084419.90181-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On Fri, Feb 19, 2021 at 05:44:19PM +0900, Akihiko Odaki wrote:
> There is no need of dynamic allocation as dcl is a small singleton.
> Static allocation reduces code size and makes hacking with ui/cocoa a
> bit easier.

Added to UI patch queue.

thanks,
  Gerd


