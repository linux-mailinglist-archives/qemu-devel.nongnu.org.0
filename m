Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD593BC1C0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:42:02 +0200 (CEST)
Received: from localhost ([::1]:42412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RfV-0003aP-2H
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0Rdd-00026R-Gc
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m0Rdb-0002aW-8f
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625503202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+b3WQEfFG/B8G4REVnIwFyhNx7Xl78jhBtnfToHLwQ0=;
 b=K8zNcHhx6RiPh5h/7d8iPy5hKMHGV2Xf/CMSmOFd91tbLJCvfiTedQBFtw3heZOfFPjIKD
 DkHh/6w73wY75FdWG4AmUBrO9PoDTislBVsBz7dDbepzJaKhdhMpkWcdXmCxD5oTcD7I0i
 +s2pH18vkWCViDEJ+O5u5Bl79KXol2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-ZxrHZiJ3MC2n7YJ306ghnw-1; Mon, 05 Jul 2021 12:40:01 -0400
X-MC-Unique: ZxrHZiJ3MC2n7YJ306ghnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41A7B362FA;
 Mon,  5 Jul 2021 16:40:00 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-112-39.ams2.redhat.com [10.36.112.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E629F60877;
 Mon,  5 Jul 2021 16:39:58 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>
Subject: [PATCH v2 2/2] css: fix actl handling for unit exceptions
Date: Mon,  5 Jul 2021 18:39:52 +0200
Message-Id: <20210705163952.736020-3-cohuck@redhat.com>
In-Reply-To: <20210705163952.736020-1-cohuck@redhat.com>
References: <20210705163952.736020-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a subchannel becomes pending with unit exception, start
pending (and for that matter, halt or clear pending) are not
removed in the actl. Device active and subchannel active,
however, are (due to the subchannel becoming status pending
with primary respectively secondary status).

The other conditions in the actl are only cleared when the
guest executes tsch on the subchannel.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 include/hw/s390x/css.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/s390x/css.h b/include/hw/s390x/css.h
index 10ed1df1bb74..75e53816135a 100644
--- a/include/hw/s390x/css.h
+++ b/include/hw/s390x/css.h
@@ -146,7 +146,8 @@ struct SubchDev {
 
 static inline void sch_gen_unit_exception(SubchDev *sch)
 {
-    sch->curr_status.scsw.ctrl &= ~SCSW_ACTL_START_PEND;
+    sch->curr_status.scsw.ctrl &= ~(SCSW_ACTL_DEVICE_ACTIVE |
+                                    SCSW_ACTL_SUBCH_ACTIVE);
     sch->curr_status.scsw.ctrl |= SCSW_STCTL_PRIMARY |
                                   SCSW_STCTL_SECONDARY |
                                   SCSW_STCTL_ALERT |
-- 
2.31.1


