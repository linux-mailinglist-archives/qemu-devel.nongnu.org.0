Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4500D359F9D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:13:53 +0200 (CEST)
Received: from localhost ([::1]:56708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUqxM-0002li-BN
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lUqwW-0001wK-98
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:13:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lUqwT-0004MQ-8Q
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617973975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sTB+aKIjoISjW12F4ZnN7v6ZTfFmS6KAJIEs19imlXA=;
 b=iA8uCl2MkA/xWN/ZbwjGFYVZRnB6mHXyoHXx/ZFkUmOvUljNwfXSWOtBfw3OzbTGXQCgzb
 AvGHvLwFthA5RYcfKjOqRhaDPV7VSrriGSZ6FTjJKPe2qLkK7R4MXxVO7RXoDrOanH+yqx
 Z103oOlACGrcmFl2wac6ZJwh0ENTJf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-1yLTSmFUNwqREzozM_3L3Q-1; Fri, 09 Apr 2021 09:12:53 -0400
X-MC-Unique: 1yLTSmFUNwqREzozM_3L3Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BBDB193578E
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 13:12:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D71519703;
 Fri,  9 Apr 2021 13:12:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EC75618000AB; Fri,  9 Apr 2021 15:12:45 +0200 (CEST)
Date: Fri, 9 Apr 2021 15:12:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <20210409131245.oqeu4ooueazqfcir@sirius.home.kraxel.org>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210203163202.GF241524@stefanha-x1.localdomain>
 <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
 <YFiHnr/uguP8/Vtz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YFiHnr/uguP8/Vtz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> eg a trace point "dma_map_wait" gets mapped to probes in many
> .stp files, once per target, because we need to match based on
> the executable path:
> 
>   probe qemu.system.x86_64.dma_map_wait = process("/usr/libexec/qemu-system-x86_64").mark("dma_map_wait")

So, that changes with modules, we need the module name now, i.e.

    probe qemu.system.x86_64.qxl_soft_reset = \
	process("/home/kraxel/qemu-install/lib/qemu/hw-display-qxl.so").mark("qxl_soft_reset")

We could repeat that in every qemu-system-$arch.stp file.

We could also have one stp file per module, with probes like this:

    probe qemu.modules.qxl_soft_reset = \
        process("/home/kraxel/qemu-install/lib/qemu/hw-display-qxl.so").mark("qxl_soft_reset")

The later looks like a better fit to me, but has the drawback that the
tracepoints have different names in modular and non-modular builds ...

take care,
  Gerd


