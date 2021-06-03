Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5739A033
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:51:54 +0200 (CEST)
Received: from localhost ([::1]:56626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loltB-0003aN-3I
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolqC-0004qa-U5
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:48:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolq9-00021Z-T0
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622720925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QCY58JX8hnn40e/d2Qq11GOt2O++6pCaxA+8FKsrUs=;
 b=Siaad9xbBdKLGgCBxyv1wlIFyobE6r8q5fCUkR8NyEDj5Nny8Av0DX1p/YY1avVbs6Z8N2
 6nfB8clr7//ZqH9AEoostNp7RktizuUymfZejgabnjK1AydyVFIL7p2fqEoPbJq+AX2rvJ
 bRbRDBkNWo1wED3dHJ7lo/h9PPXGt30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-oDx5cUpLN-Ke9lP9xY6Uvw-1; Thu, 03 Jun 2021 07:48:43 -0400
X-MC-Unique: oDx5cUpLN-Ke9lP9xY6Uvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1935E6A2B2
 for <qemu-devel@nongnu.org>; Thu,  3 Jun 2021 11:48:43 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E8F319704;
 Thu,  3 Jun 2021 11:48:41 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v7 2/9] i386: clarify 'hv-passthrough' behavior
Date: Thu,  3 Jun 2021 13:48:28 +0200
Message-Id: <20210603114835.847451-3-vkuznets@redhat.com>
In-Reply-To: <20210603114835.847451-1-vkuznets@redhat.com>
References: <20210603114835.847451-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clarify the fact that 'hv-passthrough' only enables features which are
already known to QEMU and that it overrides all other 'hv-*' settings.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index e53c581f4586..a51953daa833 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -209,8 +209,11 @@ In some cases (e.g. during development) it may make sense to use QEMU in
 'pass-through' mode and give Windows guests all enlightenments currently
 supported by KVM. This pass-through mode is enabled by "hv-passthrough" CPU
 flag.
-Note: enabling this flag effectively prevents migration as supported features
-may differ between target and destination.
+Note: "hv-passthrough" flag only enables enlightenments which are known to QEMU
+(have corresponding "hv-*" flag) and copies "hv-spinlocks="/"hv-vendor-id="
+values from KVM to QEMU. "hv-passthrough" overrides all other "hv-*" settings on
+the command line. Also, enabling this flag effectively prevents migration as the
+list of enabled enlightenments may differ between target and destination hosts.
 
 
 4. Useful links
-- 
2.31.1


