Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1BA29EA2E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 12:12:04 +0100 (CET)
Received: from localhost ([::1]:48518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY5qd-0005K1-Eb
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 07:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kY5oq-0004LK-4F
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 07:10:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kY5on-0007i5-PD
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 07:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603969808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ehm26ElGtFAdk5lLj5AhslhtQ6/Lc562tDg+nclAGso=;
 b=cKpKns2dBfXDdfRSvYd93TYAqwh1BL5ep9i/y0D8RM+EqN1KRsLVGzzuKrUJFwIpBPNVtO
 1u5qsAJJNyBQzO2BU8lYJyUEHQ5h9edwveopOWne2baBGr/wQ2a3eZYIMIm063PoNQVewH
 7mikWDXHoaqf/2mBI3MhuTVOkIKtGjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-2qB9JrmLNd-QsIybcAvqoQ-1; Thu, 29 Oct 2020 07:10:06 -0400
X-MC-Unique: 2qB9JrmLNd-QsIybcAvqoQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03E238030AB
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 11:10:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC5742C31E;
 Thu, 29 Oct 2020 11:10:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6A7AB9D10; Thu, 29 Oct 2020 12:09:57 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] modules: turn off lazy binding
Date: Thu, 29 Oct 2020 12:09:57 +0100
Message-Id: <20201029110957.11062-6-kraxel@redhat.com>
In-Reply-To: <20201029110957.11062-1-kraxel@redhat.com>
References: <20201029110957.11062-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want missing symbols fail module load right away instead of having
qemu abort later on in case lazy binding fails.  Can happen -- for
example -- when trying to load a module for a pci device
(virtio-gpu-pci) into a qemu without pci support (qemu-system-avr).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20201028054944.5772-1-kraxel@redhat.com
---
 util/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 503c399421c5..c65060c167df 100644
--- a/util/module.c
+++ b/util/module.c
@@ -132,7 +132,7 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
 
     assert(QTAILQ_EMPTY(&dso_init_list));
 
-    flags = G_MODULE_BIND_LAZY;
+    flags = 0;
     if (!export_symbols) {
         flags |= G_MODULE_BIND_LOCAL;
     }
-- 
2.27.0


