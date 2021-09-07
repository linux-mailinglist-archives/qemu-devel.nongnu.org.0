Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC36402504
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 10:19:49 +0200 (CEST)
Received: from localhost ([::1]:53054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNWKa-0004x4-L0
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 04:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFM-0004o2-5F
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNWFJ-0005kR-Or
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 04:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631002459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8g8l8Ml+nsGpirhpofSC2EU1nlgTx2mwvEh928NtqY=;
 b=XNGPF7EuRkvWAmNuPGnp73yT4yMW5BvWoUDgbaOccdmICdSJubsiu0ftNfOk2bj7eLqSg5
 nIBuJuiDcxABZQ1syosFcDlFaLyWt7d5jYTecx/lJGjTGRTAE0Ta5BwZRCAuBSP3ILqtDJ
 kPAOqi94/QF/Ti7rD4spUf4gohdo0MM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-Nn9qrgH2N7aaK2UoYc59Rg-1; Tue, 07 Sep 2021 04:14:18 -0400
X-MC-Unique: Nn9qrgH2N7aaK2UoYc59Rg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 581621009479;
 Tue,  7 Sep 2021 08:14:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00E3460C05;
 Tue,  7 Sep 2021 08:14:07 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/11] util/vfio-helpers: Let qemu_vfio_verify_mappings() use
 error_report()
Date: Tue,  7 Sep 2021 09:13:54 +0100
Message-Id: <20210907081403.816404-3-stefanha@redhat.com>
In-Reply-To: <20210907081403.816404-1-stefanha@redhat.com>
References: <20210907081403.816404-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Instead of displaying the error on stderr, use error_report()
which also report to the monitor.

Reviewed-by: Fam Zheng <fam@euphon.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210902070025.197072-3-philmd@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/vfio-helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 911115b86e..1d14913629 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -660,13 +660,13 @@ static bool qemu_vfio_verify_mappings(QEMUVFIOState *s)
     if (QEMU_VFIO_DEBUG) {
         for (i = 0; i < s->nr_mappings - 1; ++i) {
             if (!(s->mappings[i].host < s->mappings[i + 1].host)) {
-                fprintf(stderr, "item %d not sorted!\n", i);
+                error_report("item %d not sorted!", i);
                 qemu_vfio_dump_mappings(s);
                 return false;
             }
             if (!(s->mappings[i].host + s->mappings[i].size <=
                   s->mappings[i + 1].host)) {
-                fprintf(stderr, "item %d overlap with next!\n", i);
+                error_report("item %d overlap with next!", i);
                 qemu_vfio_dump_mappings(s);
                 return false;
             }
-- 
2.31.1


