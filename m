Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71D32B1603
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 07:57:20 +0100 (CET)
Received: from localhost ([::1]:34378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdT1L-0007WE-Pp
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 01:57:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdSwx-0003fc-1h
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:52:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdSwr-0006EB-Rt
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605250360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fj5TeiK1tFKhoajtPdu9GuKi+l+7T6X36Wq//0E+SJE=;
 b=O3OeDdDT+EXgx9zzlUakaX0RqbM7VZQQxqxB+q7MMWgrJHUnglH5EJb27guxKq/JLpKuVe
 2OEAkxvjSZGqLHDM3jiMox6ORvO2l0P7aoe4kbjXSSe8c0KdQzf5UlmwN/919O1WycPEdC
 q5RSyABWqorI5SrffISStZOjC0qs+WI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-nLATNECINVe8y1Es8V8uEw-1; Fri, 13 Nov 2020 01:52:38 -0500
X-MC-Unique: nLATNECINVe8y1Es8V8uEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5B2A8049DE
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 06:52:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A6D55789;
 Fri, 13 Nov 2020 06:52:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1FEC411386A0; Fri, 13 Nov 2020 07:52:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] migration: Fixes and cleanups aroung
 migrate-set-parameters
Date: Fri, 13 Nov 2020 07:52:30 +0100
Message-Id: <20201113065236.2644169-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
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
Cc: dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not sure about 5.2.  The bugs aren't recent regressions.

Markus Armbruster (6):
  migration: Fix and clean up around @tls-authz
  migration: Fix migrate-set-parameters argument validation
  migration: Clean up signed vs. unsigned XBZRLE cache-size
  migration: Check xbzrle-cache-size more carefully
  migration: Fix cache_init()'s "Failed to allocate" error messages
  migration: Fix a few absurdly defective error messages

 qapi/migration.json    | 34 ++++++++++++++++----------------
 migration/migration.h  |  2 +-
 migration/page_cache.h |  2 +-
 migration/ram.h        |  2 +-
 migration/migration.c  | 44 ++++++++++++++++++++++++++----------------
 migration/page_cache.c | 23 +++++++---------------
 migration/ram.c        |  9 +--------
 monitor/hmp-cmds.c     | 26 ++++++++++++-------------
 8 files changed, 68 insertions(+), 74 deletions(-)

-- 
2.26.2


