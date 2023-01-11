Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4F666559E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 09:02:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFW2r-0000TV-46; Wed, 11 Jan 2023 03:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFW2o-0000Sz-PJ
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFW2l-0007kI-S1
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673424067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CVbki5tl4S7gTkjB0Ce95Vh3x8cSRYeuEyuKQMdpYRE=;
 b=fIkk7fZ9XFB2M+K3fHbLZX0mWom22JMSkw9/nI/UdEuu9YLHn7RQhLX+fEqJjRppVTLut0
 QsY/gaKRppRQtHele6s99iFKQoUTfyWfO+E2iGII3luUhCLqwjErHbetb5sVbARX++tT4y
 nAJ4yUEFBXaDugFl4WElbPfiBcFop6U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-28WDQNBNOmaMPn4JYvgfSg-1; Wed, 11 Jan 2023 03:01:05 -0500
X-MC-Unique: 28WDQNBNOmaMPn4JYvgfSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DEDB857F40
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:01:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DB2D2166B26;
 Wed, 11 Jan 2023 08:01:04 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 0/3] python/qemu/machine: fix potential hang in QMP accept
Date: Wed, 11 Jan 2023 12:00:58 +0400
Message-Id: <20230111080101.969151-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

As reported earlier by Richard Henderson ("virgl avocado hang" thread), avocado
tests may hang when QEMU exits before the QMP connection is established.

v3:
 - after merge in https://gitlab.com/qemu-project/python-qemu-qmp
 - resend as requested by John Snow

v2:
 - use a socketpair() for QMP (instead of async concurrent code from v1) as
   suggested by Daniel Berrange.
 - should not regress (hopefully)

Marc-André Lureau (3):
  python/qmp/protocol: add open_with_socket()
  python/qmp/legacy: make QEMUMonitorProtocol accept a socket
  python/qemu/machine: use socketpair() for QMP by default

 python/qemu/machine/machine.py | 24 ++++++++++++++++--------
 python/qemu/qmp/legacy.py      | 18 +++++++++++++++---
 python/qemu/qmp/protocol.py    | 25 ++++++++++++++++++++-----
 3 files changed, 51 insertions(+), 16 deletions(-)

-- 
2.39.0


