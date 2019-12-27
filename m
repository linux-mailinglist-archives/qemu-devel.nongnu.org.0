Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1B112B4E7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Dec 2019 14:43:30 +0100 (CET)
Received: from localhost ([::1]:35544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ikptp-000803-19
	for lists+qemu-devel@lfdr.de; Fri, 27 Dec 2019 08:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1ikprb-0006Hg-7c
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1ikprY-0002yP-S0
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:09 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29627
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1ikprY-0002u4-AV
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577454067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z+hHePf5hMQ/6kHC3ZHzL2X6Zrb+WxhoD4CjpOeVki4=;
 b=SFtYnf+nI/7AP0EuOxZG/IvC1jAtR/iUct3JCHt0EG5KnTA0HPjBWn1VlcyfU6EELutI5A
 u370uhDGN5PSsW9NfoPs9XoLRBXrqwzYixlnXpsBmjvABQZtCWLYR2FetcGCdnSOJzhqsL
 HQKkYSJh0bPHsxxFxlPPOzHk+atISSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-au-Xu0BNNuCgvNbbnwPZZQ-1; Fri, 27 Dec 2019 08:41:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97946107ACC4
 for <qemu-devel@nongnu.org>; Fri, 27 Dec 2019 13:41:04 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-24.gru2.redhat.com
 [10.97.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2509981C10;
 Fri, 27 Dec 2019 13:41:02 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] python/qemu: qmp: Fix, delint and improvements
Date: Fri, 27 Dec 2019 10:40:56 -0300
Message-Id: <20191227134101.244496-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: au-Xu0BNNuCgvNbbnwPZZQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I started fixing an issue on exception handling which in some places
currently use the deprecated (in Python 3.3) `socket.error`. Then I
ended up delinting the module code and making some improvements.

Git:
- Tree: https://github.com/wainersm/qemu
- Branch: python_qmp_sockets_error=20

CI:
- Travis (FAIL): https://travis-ci.org/wainersm/qemu/builds/629772066
  Failure not related with this series. Even QEMU master branch is
  failing to build when `--without-default-devices --disable-user`.

Wainer dos Santos Moschetta (5):
  python/qemu: qmp: Replace socket.error with OSError
  python/qemu: Delint the qmp module
  python/qemu: qmp: Make accept()'s timeout configurable
  python/qemu: qmp: Make QEMUMonitorProtocol a context manager
  python/qemu: qmp: Remove unnused attributes

 python/qemu/qmp.py | 91 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 65 insertions(+), 26 deletions(-)

--=20
2.23.0


