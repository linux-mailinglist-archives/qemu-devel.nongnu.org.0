Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216FB30C163
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:22:18 +0100 (CET)
Received: from localhost ([::1]:38336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wZN-0000B4-3S
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6wUz-00048G-1n
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:17:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6wUw-0006n0-3V
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612275461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cI3w4neIZvUXX/EH+JtYOa6nujEGrLnZv0D6Tmgjo6E=;
 b=IOnbHyaIyku/Hvm88fVp0f8B++Qo6gmfpBx/X5+nbXOzVqyQ6zwe3JCn/IV4HhBRMwvXx9
 LDt7JfczDngucQ5SZrI4k0AbI6MKIqgMyFetKLQs8wBZ1JogNfhk9EEcBHuFxTf15RU7gz
 HuNgq1xDvCM6RnfCHFgxzM35X4aMIDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-7lh86TRANkGArLoDgDmKsQ-1; Tue, 02 Feb 2021 09:17:36 -0500
X-MC-Unique: 7lh86TRANkGArLoDgDmKsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 033DA1800D41
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:17:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7FD260C66;
 Tue,  2 Feb 2021 14:17:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D3F4113865F; Tue,  2 Feb 2021 15:17:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] migration: Fixes and cleanups aroung
 migrate-set-parameters
Date: Tue,  2 Feb 2021 15:17:30 +0100
Message-Id: <20210202141734.2488076-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: berrange@redhat.com, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
* Rebased
* PATCH 1 dropped.  Fixes a crash bug.  Daniel asked me to modify the
  fix.  Unfortunately, I don't understand this anymore, and don't have
  the time & energy to start over.
* PATCH 4 dropped.  Plugs a hole in input validation.  David pointed
  asked me to additionally fix an error message, but I don't quite
  understand what he wants.

We can discuss what to do about the dropped patches, but I don't want
to hold the remainder of the series any longer just for that.

Markus Armbruster (4):
  migration: Fix migrate-set-parameters argument validation
  migration: Clean up signed vs. unsigned XBZRLE cache-size
  migration: Fix cache_init()'s "Failed to allocate" error messages
  migration: Fix a few absurdly defective error messages

 qapi/migration.json    | 32 ++++++++++++++++----------------
 migration/migration.h  |  2 +-
 migration/page_cache.h |  2 +-
 migration/ram.h        |  2 +-
 migration/migration.c  | 27 +++++++++++++--------------
 migration/page_cache.c |  8 +++-----
 migration/ram.c        |  2 +-
 monitor/hmp-cmds.c     | 24 ++++++++++++------------
 8 files changed, 48 insertions(+), 51 deletions(-)

-- 
2.26.2


