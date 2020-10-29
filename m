Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25F629ED51
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 14:44:01 +0100 (CET)
Received: from localhost ([::1]:49486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY8Dg-0002qU-TP
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 09:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kY88f-0005qu-Oz
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 09:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kY88d-0008JR-SV
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 09:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603978727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J5PRvGSuIhq8Jxu/sY4b9DpnsY7lqwYtIdFrZ6mpHFs=;
 b=Ei2+4G81BX1hcFnurwQd5fRaE4JO20jolOhHuKPNAlJucb6bRnkQGnftG58yg4myRfQzRj
 QNWKY+oxQo1ulyJFM8Rqvo6PwHq2xY8Qr4QHETsT+i6/Y0qSksiXaY8PrRc9ov3QAv2rof
 iafGiwdignT15W1Omof0OpYGWawhFls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-nWqd1ivKOwu8JsND9sEp6A-1; Thu, 29 Oct 2020 09:38:42 -0400
X-MC-Unique: nWqd1ivKOwu8JsND9sEp6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 082B46D582;
 Thu, 29 Oct 2020 13:38:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22E0C1974D;
 Thu, 29 Oct 2020 13:38:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9757C113865F; Thu, 29 Oct 2020 14:38:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] sockets: Attempt to drain the abstract socket swamp
Date: Thu, 29 Oct 2020 14:38:22 +0100
Message-Id: <20201029133833.3450220-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 00:47:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, zxq_yx_007@163.com,
 kraxel@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In my opinion, the Linux-specific abstract UNIX domain socket feature
introduced in 5.1 should have been rejected.  The feature is niche,
the interface clumsy, the implementation buggy and incomplete, and the
test coverage insufficient.  Review fail.

Fixing the parts we can still fix now is regrettably expensive.  If I
had the power to decide, I'd unceremoniously revert the feature,
compatibility to 5.1 be damned.  But I don't, so here we go.

I'm not sure this set of fixes is complete.  However, I already spent
too much time on this, so out it goes.  Lightly tested.

Regardless, I *will* make time for ripping the feature out if we
decide to do that.  Quick & easy way to avoid reviewing this series
*hint* *hint*.

For additional information, see

    Subject: Our abstract UNIX domain socket support is a mess
    Date: Wed, 28 Oct 2020 13:41:06 +0100
    Message-ID: <87o8kmwmjh.fsf@dusky.pond.sub.org>

Markus Armbruster (11):
  test-util-sockets: Plug file descriptor leak
  test-util-sockets: Correct to set has_abstract, has_tight
  test-util-sockets: Clean up SocketAddress construction
  test-util-sockets: Factor out test_socket_unix_abstract_one()
  test-util-sockets: Synchronize properly, don't sleep(1)
  test-util-sockets: Test the complete abstract socket matrix
  sockets: Fix default of UnixSocketAddress member @tight
  sockets: Fix socket_sockaddr_to_address_unix() for abstract sockets
  char-socket: Fix qemu_chr_socket_address() for abstract sockets
  sockets: Bypass "replace empty @path" for abstract unix sockets
  sockets: Make abstract UnixSocketAddress depend on CONFIG_LINUX

 qapi/sockets.json         |  14 ++--
 chardev/char-socket.c     |  22 +++++-
 chardev/char.c            |   2 +
 tests/test-util-sockets.c | 155 ++++++++++++++++++++------------------
 util/qemu-sockets.c       |  54 ++++++++++---
 5 files changed, 156 insertions(+), 91 deletions(-)

-- 
2.26.2


