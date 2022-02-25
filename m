Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D93C4C504A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:04:24 +0100 (CET)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhlE-0005RK-9h
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:04:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhJ-0002lY-5o
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:00:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhF-0004wd-GV
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:00:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645822812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yyd+id4Nn2mF89G9w7AKz3djd8dDf7TfoBi5OI+2FMY=;
 b=MisvIJJt10DhPQ1rolg/fBy+GZO0jTkmOMN5k1sfC+AwH/kVWrPO4DWr3y8O6dhTqwLd01
 upFq6S5i+4LCt4SMgVREsagi7eePqleDDOlMYjw59eIr8RDBFVVBb7FtBvheZVq2mXwBNS
 BXIH5hgRo4Ghw7EoFfByj7cefvlHcuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-i38iHq8wNg6f1uU1xqGV1Q-1; Fri, 25 Feb 2022 16:00:10 -0500
X-MC-Unique: i38iHq8wNg6f1uU1xqGV1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBCC51006AB0;
 Fri, 25 Feb 2022 21:00:08 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CA821081357;
 Fri, 25 Feb 2022 20:59:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] Python: Fix qmp race condition on accept()
Date: Fri, 25 Feb 2022 15:59:38 -0500
Message-Id: <20220225205948.3693480-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-accept-changes=
=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/479795153=0D
=0D
This redesigns the async QMP interface to allow for race-free=0D
connections from the synchronous interface. It should hopefully address=0D
the race conditions Peter has been seeing on the NetBSD vm tests.=0D
=0D
John Snow (10):=0D
  python/aqmp: add _session_guard()=0D
  python/aqmp: rename 'accept()' to 'start_server_and_accept()'=0D
  python/aqmp: remove _new_session and _establish_connection=0D
  python/aqmp: split _client_connected_cb() out as _incoming()=0D
  python/aqmp: squelch pylint warning for too many lines=0D
  python/aqmp: refactor _do_accept() into two distinct steps=0D
  python/aqmp: stop the server during disconnect()=0D
  python/aqmp: add start_server() and accept() methods=0D
  python/aqmp: fix race condition in legacy.py=0D
  python/aqmp: drop _bind_hack()=0D
=0D
 python/qemu/aqmp/legacy.py   |   7 +-=0D
 python/qemu/aqmp/protocol.py | 393 +++++++++++++++++++++--------------=0D
 python/tests/protocol.py     |  45 ++--=0D
 3 files changed, 273 insertions(+), 172 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


