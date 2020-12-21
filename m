Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8282DFC65
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:47:43 +0100 (CET)
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLXK-0006p3-Jo
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krLV6-0005PZ-DA
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:45:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krLV1-0003WS-SV
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608558318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtQzKNXjYD4lFF08F+TTwiC5ZxxU5jwPrRyrZnivy38=;
 b=XI0Kd/Y/kaSJ8yUe0IBpDpvJVoDHozDnTEkNRCLnxnMstrs776dN+thNVORwW4GP4NWd42
 t2RL7CiFQoe3OgyucAP22br9Svf6GGoSP7NvqrncbIWtDAuOUW7DiipJTrxl2AsCNXW70L
 LhyOIhLv6NWXVuvhykW8YW0BGXGYI9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-ePtAD-PHOFKiiU2UWhBU0g-1; Mon, 21 Dec 2020 08:45:16 -0500
X-MC-Unique: ePtAD-PHOFKiiU2UWhBU0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10D7B800D55;
 Mon, 21 Dec 2020 13:45:15 +0000 (UTC)
Received: from thuth.com (ovpn-113-232.ams2.redhat.com [10.36.113.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6F7D5D9CA;
 Mon, 21 Dec 2020 13:45:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/5] fuzz: fix the generic-fuzz-floppy config
Date: Mon, 21 Dec 2020 14:45:01 +0100
Message-Id: <20201221134504.764-3-thuth@redhat.com>
In-Reply-To: <20201221134504.764-1-thuth@redhat.com>
References: <20201221134504.764-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

On the pc-i440fx machine, the floppy drive relies on the i8257 DMA
controller. Add this device to the floppy fuzzer config, and silence the
warning about a missing format specifier for the null-co:// drive.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20201216203328.41112-1-alxndr@bu.edu>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index fbc9779f7f..7fed035345 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -92,9 +92,9 @@ const generic_fuzz_config predefined_configs[] = {
     },{
         .name = "floppy",
         .args = "-machine pc -nodefaults -device floppy,id=floppy0 "
-        "-drive id=disk0,file=null-co://,file.read-zeroes=on,if=none "
+        "-drive id=disk0,file=null-co://,file.read-zeroes=on,if=none,format=raw "
         "-device floppy,drive=disk0,drive-type=288",
-        .objects = "fd* floppy*",
+        .objects = "fd* floppy* i8257",
     },{
         .name = "xhci",
         .args = "-machine q35 -nodefaults "
-- 
2.27.0


