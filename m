Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5273EE8F1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 10:57:47 +0200 (CEST)
Received: from localhost ([::1]:56202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFuun-0008KY-LR
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 04:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mFutt-0007fW-8E
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:56:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mFutr-0004WG-0d
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629190605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DgjxDJMOxuV2UwHTihO6jrDYgqC8gKTZqmwzvtgQ0QY=;
 b=PKKrGvl/bv83NDnIbcE17C/ASLSd3GRAYhnvS+Cu5MbNPIj/VfBdu2UJjU/HC1m7sIhDUg
 NuyczwQ6ntjY9A5Mval0PfO2d+CKCl4dYy1dvL6xxFKJbVhi4mj4PVvtTLGEXeyoacFrGy
 4Slcwn8vwSBMDsm6agVlRQ3db05hCZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-ZiA_INReOteutBARQqN2bw-1; Tue, 17 Aug 2021 04:56:43 -0400
X-MC-Unique: ZiA_INReOteutBARQqN2bw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C015B802934
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 08:56:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.194.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 173D461095;
 Tue, 17 Aug 2021 08:56:41 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] monitor: Report EBADFD if fdset contains invalid FD
Date: Tue, 17 Aug 2021 10:56:28 +0200
Message-Id: <c0fa7920817020ae2744313ab631e7d76f4c1898.1629190206.git.mprivozn@redhat.com>
In-Reply-To: <cover.1629190206.git.mprivozn@redhat.com>
References: <cover.1629190206.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When opening a path that starts with "/dev/fdset/" the control
jumps into qemu_parse_fdset() and then into
monitor_fdset_dup_fd_add(). In here, corresponding fdset is found
and then all FDs from the set are iterated over trying to find an
FD that matches expected access mode. For instance, if caller
wants O_WRONLY then the FD set has to contain an O_WRONLY FD.

If no such FD is found then errno is set to EACCES which results
in very misleading error messages, for instance:

  Could not dup FD for /dev/fdset/3 flags 441: Permission denied

There is no permission issue, the problem is that there was no FD
within given fdset that was in expected access mode. Therefore,
let's set errno to EBADFD, which gives us somewhat better
error messages:

  Could not dup FD for /dev/fdset/3 flags 441: File descriptor in bad state

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 monitor/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index ffe7966870..a0eda0d574 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1347,7 +1347,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags)
         }
 
         if (fd == -1) {
-            errno = EACCES;
+            errno = EBADFD;
             return -1;
         }
 
-- 
2.31.1


