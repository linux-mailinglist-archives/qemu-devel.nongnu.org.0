Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C93478565
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 08:08:52 +0100 (CET)
Received: from localhost ([::1]:38956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my7MI-0005cl-Rd
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 02:08:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1my7Iu-0004Oa-8o
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 02:05:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1my7In-0004Hi-Ac
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 02:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639724712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+6eXFuftiU9XbPKfgMRZ0sLx96n2m/FVzsSrv/FtLQA=;
 b=Pv0EtT7eRDFTCLdLPMsBXrQZrXKzG5xpTTUtRAQTGs33oW/mDH41SdRtimvUhmJ91zN1UX
 q3wNkzaO3lcW025J82sCgE0Ug/7jP14QieBAVMJU62J4laTZVMpoeMCNQaZVYm5HmXc7Oa
 ANC/jGHVZPW+F+PVjqmmjvy0ctji89I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-H3lD0Li5NyCJT_-fyModAg-1; Fri, 17 Dec 2021 02:05:09 -0500
X-MC-Unique: H3lD0Li5NyCJT_-fyModAg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22FB218C8C00;
 Fri, 17 Dec 2021 07:05:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEC897EA44;
 Fri, 17 Dec 2021 07:05:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 655D11800097; Fri, 17 Dec 2021 08:05:06 +0100 (CET)
Date: Fri, 17 Dec 2021 08:05:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 00/37] Add D-Bus display backend
Message-ID: <20211217070506.nbfwre7vwd4q37yj@sirius.home.kraxel.org>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211013052214.stif2dodyueetm3p@sirius.home.kraxel.org>
 <CAJ+F1C+ByHUSshCcrXYf+sw1yRjV4+AzWYPk_=oMwyWoAV3v_A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+ByHUSshCcrXYf+sw1yRjV4+AzWYPk_=oMwyWoAV3v_A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> I have rebased the series and added your acked-by (
> https://gitlab.com/marcandre.lureau/qemu/-/tree/dbus)
> 
> The client side is still in development. However, the libvirt series is in
> shape (
> https://patchew.org/Libvirt/20211202142411.1718032-1-marcandre.lureau@redhat.com/),
> waiting for QEMU side to land.
> 
> Should I make a PR or ask for more reviews? Since this is fairly long to
> review but quite independent from existing code, I think sending a PR is
> reasonable wdyt?

No objections.  Unlikely to break something, also we are early
in the devel cycle so plenty of time to find & fix bugs before
this lands in a release.

> For reconnect to work, we would need a better way to track name ownership
> changes (connection and disconnections) in zbus. I am working on it.

zbus == compressed dbus ?

take care,
  Gerd


