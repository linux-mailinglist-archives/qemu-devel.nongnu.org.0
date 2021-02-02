Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9707B30C0BB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:07:02 +0100 (CET)
Received: from localhost ([::1]:44122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wKb-0006nB-Mj
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l6w9l-0005Yr-VZ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:55:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l6w9f-0005XY-Nq
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612274142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rOIMto2fMNY2mX9O4pSDSWTVMZ8n+xTciDhcunf/9qg=;
 b=KtHhRBFCFkiyCcv4oURIY2u/6U4raWeAsNf5heog3/VEc5OaQkry9X670PSPOHVhwWoqHh
 pfj4w/rG4+GxfeCZupwD4YHKuUgl06sFfxVgKJNUjHdSmi9vIZJhfwYUz7ihmubaPFQ17i
 0kOO4JYNn2iQEYYMahHlYf1eCprzB+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-fqrbse6WN-i7th1bzg08Lw-1; Tue, 02 Feb 2021 08:55:40 -0500
X-MC-Unique: fqrbse6WN-i7th1bzg08Lw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFD0A100A61D
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 13:55:39 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-83.ams2.redhat.com
 [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8185E6EF46;
 Tue,  2 Feb 2021 13:55:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peterx@redhat.com, eblake@redhat.com,
 alex.williamson@redhat.com, laine@redhat.com
Subject: [PATCH 0/2] migration blocker information
Date: Tue,  2 Feb 2021 13:55:20 +0000
Message-Id: <20210202135522.127380-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Hi,
  This is a rework of 'migration: Provide a test for migratability',
based on Eric's feedback this is now an addition to the existing
info/query migrate commands rather than a new command.

  One other importovement is that we now list all the reasons for the
block rather than just one.

Dave

Dr. David Alan Gilbert (2):
  migration: Add blocker information
  migration: Display the migration blockers

 migration/migration.c | 25 +++++++++++++++++++++++--
 migration/savevm.c    | 13 +++++++++++++
 migration/savevm.h    |  1 +
 monitor/hmp-cmds.c    |  9 +++++++++
 qapi/migration.json   |  6 ++++++
 5 files changed, 52 insertions(+), 2 deletions(-)

-- 
2.29.2


