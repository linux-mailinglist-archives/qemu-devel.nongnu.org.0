Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F482C6059
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:10:26 +0100 (CET)
Received: from localhost ([::1]:46430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiXth-0006dL-Tw
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kiXrg-00052v-Ac
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:08:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kiXrc-0003vQ-LA
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606460896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nhJT5FgKkRdbOxE74l72yK6HMopDgWPkyucqcRiX0L4=;
 b=UXtqTPjonQCwLAkywrKUxlaMcSj+OMAAdzXlGZeVITgY4FXqx91j5F/T6P/Cj2GfD2lCn3
 IHW1YVyQtVogKBUruFuBqNvMOBkHGA2nTW5yBGuLUFqE8W4P+u0s+56qZlMuAKiFtNci5s
 T3raBQXRcwyeguRVlkNchKe7+WQoO7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-S5g_48yuP62ZaUDzbI2zRw-1; Fri, 27 Nov 2020 02:08:14 -0500
X-MC-Unique: S5g_48yuP62ZaUDzbI2zRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 333431009462;
 Fri, 27 Nov 2020 07:08:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEA135D9CC;
 Fri, 27 Nov 2020 07:08:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C3134A1EE; Fri, 27 Nov 2020 08:08:11 +0100 (CET)
Date: Fri, 27 Nov 2020 08:08:11 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] qxl: fix segfault
Message-ID: <20201127070811.r2dgr72e5asgll26@sirius.home.kraxel.org>
References: <20201124122936.30588-1-kraxel@redhat.com>
 <CAJ+F1CJYeO9fGcSOZEEJmYvFwAxXe32rKGv81sfG8Dz=nCiGog@mail.gmail.com>
 <CAFEAcA9FWSwZnoGm67sswTDP29CZQr0NRJsD7dqrRWSom3B1Fw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9FWSwZnoGm67sswTDP29CZQr0NRJsD7dqrRWSom3B1Fw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > It would be nice to include this regression fix in the release. Anyone taking the patch to PR?
> 
> Looks like a safe fix and we do need to roll rc4 anyway, so if somebody wants
> to send a pullreq tomorrow I can apply it.

I had one prepared already and was waiting for ci.

Sent now,
  Gerd


