Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC463FC7A1
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 14:53:44 +0200 (CEST)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3Gp-0006G6-HD
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 08:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2kP-00019M-9f
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:20:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2kM-0007eH-Ur
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ejRGYgoqXIWx0J70AbhTYJitCaZm4B2ApMZwxTnk4o=;
 b=Bw0b/iJTDls8/uPFAg/O7ha+j4gpZjwVtZLeK4hHScBdnrEi4w7h7mD0UzTZCd14KhAYON
 66/mWilHf0jWlzkxfzcdDfWNGw6zmTVWCBkrsNwgcUIb1ISpl1jqJnKI3Eggm0Fg/NGm+Q
 nyOwaiTAgn8YzzCDat4BNPYV+Fo4rkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-3-mCLBzcPNmm43C4JNrdEQ-1; Tue, 31 Aug 2021 08:20:06 -0400
X-MC-Unique: 3-mCLBzcPNmm43C4JNrdEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61D11100806A;
 Tue, 31 Aug 2021 12:20:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5827A60C05;
 Tue, 31 Aug 2021 12:20:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B987B1800936; Tue, 31 Aug 2021 14:20:01 +0200 (CEST)
Date: Tue, 31 Aug 2021 14:20:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 2/2] monitor: allow VNC related QMP and HMP commands to
 take a display ID
Message-ID: <20210831122001.ybfssjvk6bqurofi@sirius.home.kraxel.org>
References: <20210825093701.668122-1-s.reiter@proxmox.com>
 <20210825093701.668122-3-s.reiter@proxmox.com>
 <CAJ+F1CKf5icfpA4X_kHQQJGfiHj+dvct9OqEvtOQ2UD4WPCbtw@mail.gmail.com>
 <20210825191643.lrgdf3t2l34vflzj@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210825191643.lrgdf3t2l34vflzj@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Reiter <s.reiter@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> You could also supply the display via a flag argument
> (set_password -d vnc2 password) instead of trying to place it in a
> positional argument.

I like that idea.

take care,
  Gerd


