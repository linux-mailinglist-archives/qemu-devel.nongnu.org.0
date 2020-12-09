Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EEC2D3F3A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:54:49 +0100 (CET)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwBN-0002D0-1T
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw61-0005Lv-HK
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw5z-0007P5-Vj
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607507355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LsETqTNuu0aB9+GRsnJd4uKFkyUbCTAU9f/mtAmw/nA=;
 b=aAcDaXV5v/t66gXfmGDdEi8a9w0Aqf5/sblQgaOxt74ogciCRK+5eTJBcCUe+jlcCNsez+
 CaBhfHUm/Hk2jAOysgPL6LcFPHIJMVpuycySuU2bD+AS14IO2CR0a+R5mauDs9v5pfgyGl
 TXNbR8TY9AMSTrfG1tY+IgcCMsVIEfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-zGSwtG5sPVSZO7HPJ2mT3w-1; Wed, 09 Dec 2020 04:49:13 -0500
X-MC-Unique: zGSwtG5sPVSZO7HPJ2mT3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C8521005504;
 Wed,  9 Dec 2020 09:49:12 +0000 (UTC)
Received: from thuth.com (ovpn-112-183.ams2.redhat.com [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4465C5C234;
 Wed,  9 Dec 2020 09:49:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/13] tests/qtest/fuzz-test: Quit test_lp1878642 once done
Date: Wed,  9 Dec 2020 10:48:50 +0100
Message-Id: <20201209094856.17788-8-thuth@redhat.com>
In-Reply-To: <20201209094856.17788-1-thuth@redhat.com>
References: <20201209094856.17788-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Missed in fd250172842 ("qtest: add a reproducer for LP#1878642").

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201201191026.4149955-2-philmd@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index 9cb4c42bde..87b72307a5 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -45,6 +45,7 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
     qtest_outl(s, 0xcf8, 0x8400f841);
     qtest_outl(s, 0xcfc, 0xebed205d);
     qtest_outl(s, 0x5d02, 0xebed205d);
+    qtest_quit(s);
 }
 
 int main(int argc, char **argv)
-- 
2.18.4


