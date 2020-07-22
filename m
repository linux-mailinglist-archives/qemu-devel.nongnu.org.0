Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8EE2293CC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 10:43:04 +0200 (CEST)
Received: from localhost ([::1]:46032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyAL9-0005Iq-AD
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 04:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jyAJ7-0003lN-Im
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:40:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52724
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jyAJ4-0000No-MT
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595407253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WHHVip+jrv4qLOaTSUfIeioSoPdyvyzIY70YZURDlsQ=;
 b=XYOAJFkCkZ5RZMe7sitmwqJTP8TG5OQ332fclrehZ42Jzm/OYn1kFqIdHeswRQAYf/wtzp
 smSRTfWD99Fgs1+jn3EpKvhXXFrb5VMByMJfkF19fau4quuDBjxRqYZGnmUhmo+cjybzqD
 tmf8YU99Z7WnXafX+ercjbsqMyXwcGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-C3XxtsWzMfanLryClFYgUQ-1; Wed, 22 Jul 2020 04:40:51 -0400
X-MC-Unique: C3XxtsWzMfanLryClFYgUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E7FF19200D2
 for <qemu-devel@nongnu.org>; Wed, 22 Jul 2020 08:40:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 635456FECD
 for <qemu-devel@nongnu.org>; Wed, 22 Jul 2020 08:40:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0205610F5AF1; Wed, 22 Jul 2020 10:40:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] error: Mechanical fixes & cleanups
Date: Wed, 22 Jul 2020 10:40:44 +0200
Message-Id: <20200722084048.1726105-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 00:40:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Markus Armbruster (4):
  coccinelle/err-bad-newline: Fix for Python 3, and add patterns
  error: Strip trailing '\n' from error string arguments (again)
  error: Remove NULL checks on error_propagate() calls (again)
  error: Use error_fatal to simplify obvious fatal errors (again)

 scripts/coccinelle/err-bad-newline.cocci | 24 ++++++++++++++++++++++--
 exec.c                                   | 11 +++--------
 hw/i386/intel_iommu.c                    |  6 +++---
 hw/net/virtio-net.c                      |  8 ++------
 hw/s390x/s390-virtio-ccw.c               |  6 +-----
 hw/virtio/vhost.c                        | 10 +++-------
 migration/colo.c                         |  4 +---
 migration/migration.c                    |  8 ++------
 target/ppc/mmu-hash64.c                  |  2 +-
 9 files changed, 38 insertions(+), 41 deletions(-)

-- 
2.26.2


