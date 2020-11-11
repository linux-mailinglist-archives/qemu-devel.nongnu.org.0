Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3B12AF1F0
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:22:02 +0100 (CET)
Received: from localhost ([::1]:51754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcq4X-0007P5-2e
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpuz-0006oG-W3
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpuw-0002Ad-22
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=ymPUE+ScEWk1hTBYuCkLoMMhjnzq71jGS94MFgRySGo=;
 b=JrEUwLXKmFvCHleg9rMF1PciEeFQ44rx7X6HV46WlPHN5M5HfIkwOXIx1oAo1Kp4BuyR1F
 Gz7GuSi1G3HA9O/GVeaeofAxR76Tbv5IvQV7+Vjwz9lLVpfNP5CZ7DjgL1tkfXNg5xXx9T
 ZXq+xlKWQr02pOeJU0CGFrqpuYoYrKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-AKcp77L5NvCPefGuEEAazg-1; Wed, 11 Nov 2020 08:12:00 -0500
X-MC-Unique: AKcp77L5NvCPefGuEEAazg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 308C01009461;
 Wed, 11 Nov 2020 13:11:59 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-61.pek2.redhat.com
 [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52FA755760;
 Wed, 11 Nov 2020 13:11:57 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 05/17] Fix the qemu crash when guest shutdown in COLO mode
Date: Wed, 11 Nov 2020 21:11:29 +0800
Message-Id: <1605100301-11317-6-git-send-email-jasowang@redhat.com>
In-Reply-To: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
References: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>, "Rao, Lei" <lei.rao@intel.com>,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

In COLO mode, if the startup parameters of QEMU include "no-shutdown",
QEMU will crash when the guest shutdown. The root cause is when the
guest shutdown, the state of VM will switch COLO to SHUTDOWN. When do
checkpoint again, the state will be changed to COLO. But the state
switch is undefined in runstate_transitions_def, we should add it.
This patch fixes the following:
qemu-system-x86_64: invalid runstate transition: 'shutdown' -> 'colo'
Aborted

Signed-off-by: Lei Rao <lei.rao@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 softmmu/vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index a711644..e32fd48 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -632,6 +632,7 @@ static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_SHUTDOWN, RUN_STATE_PAUSED },
     { RUN_STATE_SHUTDOWN, RUN_STATE_FINISH_MIGRATE },
     { RUN_STATE_SHUTDOWN, RUN_STATE_PRELAUNCH },
+    { RUN_STATE_SHUTDOWN, RUN_STATE_COLO },
 
     { RUN_STATE_DEBUG, RUN_STATE_SUSPENDED },
     { RUN_STATE_RUNNING, RUN_STATE_SUSPENDED },
-- 
2.7.4


