Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15AE249450
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 07:05:45 +0200 (CEST)
Received: from localhost ([::1]:50870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8GIC-0007dH-Hn
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 01:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k8GHO-0007DM-EB
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 01:04:54 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32102
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k8GHL-00023L-Vv
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 01:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597813490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q6h3O6L0qcIoJdu5DLbsKwUznJsHUVsTlcQXScI3YWc=;
 b=U0o2PIMo1xNkY3/imWDfSwJUDvXvoF322UmrtePca38dnBoGVWDH7CyFOq35Mspu9T1AoK
 RUQzUDIgkNgR6qDe3NKodPytJmn4EpJHK+NGIJp2F45117oqUhE6A90awqjods8TCNmZp1
 Blc8SpXsU4TBH56+tk1SbyGsSKNqyP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-I6ZsU1vrOBOWLnYNVCKRpA-1; Wed, 19 Aug 2020 01:04:48 -0400
X-MC-Unique: I6ZsU1vrOBOWLnYNVCKRpA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A4EE1006716;
 Wed, 19 Aug 2020 05:04:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF5A95C1D0;
 Wed, 19 Aug 2020 05:04:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C9EE39D8F; Wed, 19 Aug 2020 07:04:45 +0200 (CEST)
Date: Wed, 19 Aug 2020 07:04:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Geoffrey McRae <geoff@hostfission.com>
Subject: Re: [PATCH v2] audio/jack: fix use after free segfault
Message-ID: <20200819050445.qlhafh2kwh5rt2jh@sirius.home.kraxel.org>
References: <20200819010741.91DAE3A0788@moya.office.hostfission.com>
MIME-Version: 1.0
In-Reply-To: <20200819010741.91DAE3A0788@moya.office.hostfission.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 23:06:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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

> As JACK1 and JACK2 are interchangeable and JACK2 has "cleanup" routine
> that JACK1 does not have, we need to determine which version is in use
> at runtime. Unfortunatly there is no way to determine which is in use
> other then to look for symbols that are missing in JACK1, which in this
> case is `jack_get_version`.

No.  That'll quickly becomes a maintainance nightmare.

How about moving the qjack_client_fini() call to qjack_shutdown()?  Or,
if that isn't an option due to qjack_shutdown being called from a signal
handler, schedule a bottom half calling qjack_client_fini()?

take care,
  Gerd


