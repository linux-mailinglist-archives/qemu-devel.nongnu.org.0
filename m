Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FCB30AC84
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:22:44 +0100 (CET)
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6byN-0007Lm-Hs
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6brV-0003jM-Em
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:15:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6br9-0003NO-VL
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:15:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612196113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QVfR0SbRvwLuussdddkdyh1yghwiQHwPZWZmtPF2oIw=;
 b=JtAA7rT6nGHMFkJzagPBOlJjrrV0o5TQ4GPSmeJHtlyDYjw/Df6vPa+josU2YMxVKt0EvQ
 eVkbN58v0JgMaLLW2bjz2fXPHBMGxFHYEQ9RGhOEZ0XZ/cW5Rb72eELr4+Q01Y9v7jpDw7
 ua1gAUa6yzxNH27+JDgrcvpasQKH+2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-MYjYfzD6OFWdCTFnYuMPcg-1; Mon, 01 Feb 2021 11:15:11 -0500
X-MC-Unique: MYjYfzD6OFWdCTFnYuMPcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 521A259
 for <qemu-devel@nongnu.org>; Mon,  1 Feb 2021 16:15:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC2A160D06;
 Mon,  1 Feb 2021 16:15:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40702113865F; Mon,  1 Feb 2021 17:15:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Maximize QMP availability for OOB commands
Date: Mon,  1 Feb 2021 17:15:01 +0100
Message-Id: <20210201161504.1976989-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While bisecting a crash bug, I noticed OOB commands can get delayed
unduly when a full request queue becomes non-full.  Improve that.

Related:

* [PATCH] docs/interop/qmp-spec: Document the request queue limit
  Message-Id: <20210127144734.2367693-1-armbru@redhat.com>
  https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06931.html

* Crash bug report (regression):
  Message-ID: <87bld7ucor.fsf@dusky.pond.sub.org>
  https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07719.html


Markus Armbruster (3):
  qmp: Fix up comments after commit 9ce44e2ce2
  qmp: Add more tracepoints
  qmp: Resume OOB-enabled monitor before processing the request

 monitor/qmp.c        | 44 ++++++++++++++++++++++++++++++++++++--------
 monitor/trace-events |  4 ++++
 2 files changed, 40 insertions(+), 8 deletions(-)

-- 
2.26.2


