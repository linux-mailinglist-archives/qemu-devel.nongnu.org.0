Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD08620AC79
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 08:44:24 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joi63-0007Zo-Pa
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 02:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1joi3V-0003jn-9D
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 02:41:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35793
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1joi3S-0001ZO-B0
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 02:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593153701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YqH1QU9PbMdH2k5uJqypd3cikFYJ1ExseHF+8Y/4DtI=;
 b=it8QtmCDit9gJypGMMWzj2RgHb5w/MXfLFPWU5+6GHrFaRFdC1IILCSmM8cXGyHpvDnCnh
 aRK6f3+wrFkmlYUXoMjSRuyAbOjdeSBbLlQ4htVfOz//xICyp64mpdZ77FAhV6D2qGxy+Q
 26RgmJdPaTJXyexW9P0XYAeGbOMqyKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-lJ1iFIgVNUqRxbH2tIMdXw-1; Fri, 26 Jun 2020 02:41:38 -0400
X-MC-Unique: lJ1iFIgVNUqRxbH2tIMdXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D6DC64ACA;
 Fri, 26 Jun 2020 06:41:37 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-248.ams2.redhat.com
 [10.36.112.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 615E37FE8B;
 Fri, 26 Jun 2020 06:41:35 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 1/1] memory: Delete assertion in
 memory_region_unregister_iommu_notifier
Date: Fri, 26 Jun 2020 08:41:22 +0200
Message-Id: <20200626064122.9252-2-eperezma@redhat.com>
In-Reply-To: <20200626064122.9252-1-eperezma@redhat.com>
References: <20200626064122.9252-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eperezma@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:49:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, Avi Kivity <avi@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bug reference: https://bugs.launchpad.net/qemu/+bug/1885175

It is possible to hit this assertion on rhel7 guests if iommu is
properly enabled.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 memory.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/memory.c b/memory.c
index 2f15a4b250..7f789710d2 100644
--- a/memory.c
+++ b/memory.c
@@ -1915,8 +1915,6 @@ void memory_region_notify_one(IOMMUNotifier *notifier,
         return;
     }
 
-    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
-
     if (entry->perm & IOMMU_RW) {
         request_flags = IOMMU_NOTIFIER_MAP;
     } else {
-- 
2.18.1


