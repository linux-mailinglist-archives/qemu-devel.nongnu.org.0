Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74006229761
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 13:27:39 +0200 (CEST)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyCuQ-0005WD-HU
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 07:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jyCtJ-0004fP-NF
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 07:26:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55431
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jyCtI-0008Tf-6I
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 07:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595417187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kFfLqst55rcDpE2s2aTGDFYF1MHBBctsjDK0eCdumcM=;
 b=SdmaSEF8Dm2I5gbvKxdM5NBaDxoc6N/Q9A2IaLp0VcuL0XtXzO8f/Z+b7tD7gBFbGQoVqG
 VlnsRBTTNZDnewOqqZi6+rxXkTWH5F+yaEJcwgS2M7iGwcafUz+dg++Ka7ASNW129Wab+a
 Y11vyF249FZbL4cHxiN8jO8qCLW1Lfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-SlDR1WflO4W2hy45gLPKdw-1; Wed, 22 Jul 2020 07:26:25 -0400
X-MC-Unique: SlDR1WflO4W2hy45gLPKdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8ADE102C7EC
 for <qemu-devel@nongnu.org>; Wed, 22 Jul 2020 11:26:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57DFA1992D;
 Wed, 22 Jul 2020 11:26:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EE9789D9F; Wed, 22 Jul 2020 13:26:10 +0200 (CEST)
Date: Wed, 22 Jul 2020 13:26:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Subject: Re: [PATCH] spice: simplify chardev setup
Message-ID: <20200722112610.hkw3udjlfdm5vtii@sirius.home.kraxel.org>
References: <20200722084935.9601-1-kraxel@redhat.com>
 <lytuxzhpnk.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <lytuxzhpnk.fsf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:27:14
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 22, 2020 at 11:20:31AM +0200, Christophe de Dinechin wrote:
> 
> On 2020-07-22 at 10:49 CEST, Gerd Hoffmann wrote...
> > Initialize spice before chardevs.  That allows to register the spice
> > chardevs directly in the init function and removes the need to maintain
> > a linked list of chardevs just for registration.
> >
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Looks good to me, but I still need to test how this integrates with my work
> on putting SPICE in a module.

Hope it simplifies things.  Removes qemu_spice_register_ports(), so one
item less you have to wire up in QemuSpiceOps.

With the qom module bits being merged meanwhile too it should be easier
now to turn chardev/spice.c into a module.

take care,
  Gerd


