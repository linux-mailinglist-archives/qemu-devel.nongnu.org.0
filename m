Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502D82CE833
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 07:39:28 +0100 (CET)
Received: from localhost ([::1]:57962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl4kY-0006ep-SQ
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 01:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kl4jF-00060J-60
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 01:38:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kl4jB-0000ux-TW
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 01:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607063874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJDIKh9Tk6m+r+S1jJwIW/n7iIfvHC8LrisSoyB8i3s=;
 b=YS/jgXkf5emTNEHdvqCwvNJVHBTOAqUabnABIO5n786ut6GeFACWNbHb7p1q50beXUPFCE
 0YisVMheJYxfxc5+2GIUG9DuTDhAnaoGKOJApr+gFyqbvAk/Yk4A0YDQRZoSaocMaNM4BW
 h0cHy1CMtY163S4LhGAIUXzWP/5p1mI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-4P2WGv2fM2ug3YmQvUZ87Q-1; Fri, 04 Dec 2020 01:37:52 -0500
X-MC-Unique: 4P2WGv2fM2ug3YmQvUZ87Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E768810054FF
 for <qemu-devel@nongnu.org>; Fri,  4 Dec 2020 06:37:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B20E0620D7;
 Fri,  4 Dec 2020 06:37:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BBC7C17532; Fri,  4 Dec 2020 07:37:50 +0100 (CET)
Date: Fri, 4 Dec 2020 07:37:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 8/9] vnc: add support for extended desktop resize
Message-ID: <20201204063750.txm24fnbo4vqq4tt@sirius.home.kraxel.org>
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-9-kraxel@redhat.com>
 <20201203112845.GC2952498@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203112845.GC2952498@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

  Hi,

> > +        case VNC_ENCODING_DESKTOP_RESIZE_EXT:
> > +            vs->features |= VNC_FEATURE_RESIZE_EXT_MASK;
> 
> IIUC, we shouldn't set this flag unless all current displays adapters
> associated with the VNC server support the "ui_info" callbacks,
> otherwise the client will think it can send resize requests
> but they'll never be honoured.

Well, that can happen anyway as honoring the request is in the hands of
the guest and not something qemu can guarantee.  So vnc clients must be
able to deal with that no matter what.  The spec even explicitly states
that rejecting all resize requests from the client is perfectly valid
behavior for a server.

For tigervnc it seems to make no difference whenever the server supports
extended desktop resize or not.

I doubt making this conditional buys us anything ...

take care,
  Gerd


