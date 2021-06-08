Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38B239F625
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:13:52 +0200 (CEST)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqacB-0003zd-Kk
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaX4-0008Fd-SC
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaX1-0001hi-Rd
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNw5eGudw9WBoLReA4J5b0oLrlUqDnC3SrhmeNvvkHw=;
 b=IC830Idslgn5UNGPfIxXly//He4K+V2aU9WqOBXZKAd90xK6jB4CvN8aWU9IwxySegRFMq
 5Y0snmRR1Ry40T+KOjbxlHj+98NXKfp3/bhYRvLHCWFCvF/snA++IDIA1uSsvN5xLVLfKH
 HHHddNsUAETMgDCm3QERocDgep11gok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-YEF3f19nPXSHFqECT0LiDQ-1; Tue, 08 Jun 2021 08:08:29 -0400
X-MC-Unique: YEF3f19nPXSHFqECT0LiDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDFA0BBEE4;
 Tue,  8 Jun 2021 12:08:28 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEA1A18B4B;
 Tue,  8 Jun 2021 12:08:26 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v8 2/9] i386: clarify 'hv-passthrough' behavior
Date: Tue,  8 Jun 2021 14:08:10 +0200
Message-Id: <20210608120817.1325125-3-vkuznets@redhat.com>
In-Reply-To: <20210608120817.1325125-1-vkuznets@redhat.com>
References: <20210608120817.1325125-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clarify the fact that 'hv-passthrough' only enables features which are
already known to QEMU and that it overrides all other 'hv-*' settings.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
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


