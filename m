Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE12C3ACF4B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:37:57 +0200 (CEST)
Received: from localhost ([::1]:53210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGZA-0002no-Vg
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1luGWb-0006Hh-JD
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:35:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1luGWZ-0004UC-AU
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624030514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b497Plty6INS5DVpmKNuonj9C7Ksw1Na97HVdIQJWVo=;
 b=aDMmxllWYQflErGjs8fgbm6+kdGQ6Y6KwigyNeGmJTyBoYpmgvgn4LsGjzUXle0kFfizNJ
 I8FWfJcmytgJzVPvsinPUwfBGgAIDIbhyOHHadU+mHs3oYv0UHAvb/O+30MWZArtbCu6LG
 +fwErPYRY4Fl3wcBzFSf5hE23tqMXHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-nJnlRGl1ONSpPZVvCWCngA-1; Fri, 18 Jun 2021 11:35:13 -0400
X-MC-Unique: nJnlRGl1ONSpPZVvCWCngA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1057A9F92A;
 Fri, 18 Jun 2021 15:35:12 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-112-106.phx2.redhat.com [10.3.112.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EBA41001281;
 Fri, 18 Jun 2021 15:35:05 +0000 (UTC)
Subject: [PULL 3/3] vfio/migration: Correct device state from vmstate change
 for savevm case
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jun 2021 09:35:05 -0600
Message-ID: <162403050520.1793226.14555349399059942330.stgit@omen>
In-Reply-To: <162403041204.1793226.16018359908572247606.stgit@omen>
References: <162403041204.1793226.16018359908572247606.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kirti Wankhede <kwankhede@nvidia.com>

Set _SAVING flag for device state from vmstate change handler when it
gets called from savevm.

Currently State transition savevm/suspend is seen as:
    _RUNNING -> _STOP -> Stop-and-copy -> _STOP

State transition savevm/suspend should be:
    _RUNNING -> Stop-and-copy -> _STOP

State transition from _RUNNING to _STOP occurs from
vfio_vmstate_change() where when vmstate changes from running to
!running, _RUNNING flag is reset but at the same time when
vfio_vmstate_change() is called for RUN_STATE_SAVE_VM, _SAVING bit
should be set.

Reported by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Message-Id: <1623177441-27496-1-git-send-email-kwankhede@nvidia.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/migration.c |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index ef397ebe6c09..82f654afb64a 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -724,7 +724,16 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
          * _RUNNING bit
          */
         mask = ~VFIO_DEVICE_STATE_RUNNING;
-        value = 0;
+
+        /*
+         * When VM state transition to stop for savevm command, device should
+         * start saving data.
+         */
+        if (state == RUN_STATE_SAVE_VM) {
+            value = VFIO_DEVICE_STATE_SAVING;
+        } else {
+            value = 0;
+        }
     }
 
     ret = vfio_migration_set_state(vbasedev, mask, value);



