Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE31FA539
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 02:40:10 +0200 (CEST)
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkze5-0002J7-RN
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 20:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Jason@zx2c4.com>) id 1jkzb4-0007Ak-Ni
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 20:37:02 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:56045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Jason@zx2c4.com>) id 1jkzb3-00048o-3Z
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 20:37:02 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c5213c7;
 Tue, 16 Jun 2020 00:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
 :subject:date:message-id:mime-version:content-transfer-encoding;
 s=mail; bh=pmc0MsIW43s8iPyo3c0JpQpRfcE=; b=BzmvhXrn2E1wQblaWoV6
 NnARYyrTM/dquR+KwAqbBWe1Gc0F1cHZyLuKwH2N0oDaBgxCLljWs2s/cmek3Up5
 ArLK36Q2rYRl1gLpIGN3HDxkGtkSMhHlG4mN0QxHBn34s99Nnl/v7W/1zK73wiqS
 gOUWNmkuw7GvWGxY4XGZAdMYl/y8vRPnU81TkMLpvRGQwwdyWT0ANiNBPE6TtrvZ
 wZU735aSP+yeD/M1W6RN+0wRVr8qUp5UOkvucBsIajAbUeUHukn8MibsW5/9bzAp
 7c/bZokbDSaYgjj98/GMkC3IouSnrBnzsglnCb0a9aHnP7YaK1MXtgDfyaFyvPoH
 6w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f15f786c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 16 Jun 2020 00:19:06 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com
Subject: [PATCH] hw/acpi: specify 64-bit acpi table
Date: Mon, 15 Jun 2020 18:36:54 -0600
Message-Id: <20200616003654.1058035-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.95.5.64; envelope-from=Jason@zx2c4.com;
 helo=mail.zx2c4.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 20:37:00
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSDTs cannot address 64-bit physical addresses in 32-bit tables, so we
increment the revision to '2' so that these larger addresses are
addressable. This matters because the DSDT revision represents the
maximum capability of all other SSDTs. This is also what arm does.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 900f786d08..51420d90a8 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2073,7 +2073,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-        "DSDT", dsdt->buf->len, 1, NULL, NULL);
+        "DSDT", dsdt->buf->len, 2, NULL, NULL);
     free_aml_allocator();
 }
 
-- 
2.27.0


