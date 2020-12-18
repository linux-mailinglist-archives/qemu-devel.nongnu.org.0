Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00612DE29A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:16:31 +0100 (CET)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEgQ-0006mw-Re
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEb1-0001b7-JF
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:10:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEaz-0001a7-Nb
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yYfj+3UAF3EBVjBlM6EZF6ZxpDVAIpo0eDHVbH38mY=;
 b=hD9DA4LDzDtNy/cvAPKwM2N2k4cX85xjJ9sZDEmLq5t5k63NTjaFX3wL3H5iF+u+qiqa6K
 Q0wL9pmq+F2ChXrHTDViNihFsYjl14oCptVsbetLaAaiNIAPKXug9jQzYiNnguoLj7g1lA
 p5lKUAtyE86Zv//uvUOduSo0wtazKg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-NrlOz-pHPHOfFQb9-pCTsA-1; Fri, 18 Dec 2020 07:10:50 -0500
X-MC-Unique: NrlOz-pHPHOfFQb9-pCTsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2FC68049D7;
 Fri, 18 Dec 2020 12:10:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E34E460C47;
 Fri, 18 Dec 2020 12:10:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/17] hw/block/nand: Decommission the NAND museum
Date: Fri, 18 Dec 2020 13:10:26 +0100
Message-Id: <20201218121041.299788-3-kwolf@redhat.com>
In-Reply-To: <20201218121041.299788-1-kwolf@redhat.com>
References: <20201218121041.299788-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

This is the QEMU equivalent of this Linux commit (but 7 years later):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7025a43a9da2

    The MTD subsystem has its own small museum of ancient NANDs
    in a form of the CONFIG_MTD_NAND_MUSEUM_IDS configuration option.
    The museum contains stone age NANDs with 256 bytes pages, as well
    as iron age NANDs with 512 bytes per page and up to 8MiB page size.

    It is with great sorrow that I inform you that the museum is being
    decommissioned. The MTD subsystem is out of budget for Kconfig
    options and already has too many of them, and there is a general
    kernel trend to simplify the configuration menu.

    We remove the stone age exhibits along with closing the museum,
    but some of the iron age ones are transferred to the regular NAND
    depot. Namely, only those which have unique device IDs are
    transferred, and the ones which have conflicting device IDs are
    removed.

The machine using this device are:
- axis-dev88
- tosa (via tc6393xb_init)
- spitz based (akita, borzoi, terrier)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201214002620.342384-1-f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/nand.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/hw/block/nand.c b/hw/block/nand.c
index 1d7a48a2ec..9ed54a0a92 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -137,7 +137,7 @@ static void mem_and(uint8_t *dest, const uint8_t *src, size_t n)
 # define ADDR_SHIFT		16
 # include "nand.c"
 
-/* Information based on Linux drivers/mtd/nand/nand_ids.c */
+/* Information based on Linux drivers/mtd/nand/raw/nand_ids.c */
 static const struct {
     int size;
     int width;
@@ -147,21 +147,11 @@ static const struct {
 } nand_flash_ids[0x100] = {
     [0 ... 0xff] = { 0 },
 
-    [0x6e] = { 1,	8,	8, 4, 0 },
-    [0x64] = { 2,	8,	8, 4, 0 },
     [0x6b] = { 4,	8,	9, 4, 0 },
-    [0xe8] = { 1,	8,	8, 4, 0 },
-    [0xec] = { 1,	8,	8, 4, 0 },
-    [0xea] = { 2,	8,	8, 4, 0 },
-    [0xd5] = { 4,	8,	9, 4, 0 },
     [0xe3] = { 4,	8,	9, 4, 0 },
     [0xe5] = { 4,	8,	9, 4, 0 },
     [0xd6] = { 8,	8,	9, 4, 0 },
-
-    [0x39] = { 8,	8,	9, 4, 0 },
     [0xe6] = { 8,	8,	9, 4, 0 },
-    [0x49] = { 8,	16,	9, 4, NAND_BUSWIDTH_16 },
-    [0x59] = { 8,	16,	9, 4, NAND_BUSWIDTH_16 },
 
     [0x33] = { 16,	8,	9, 5, 0 },
     [0x73] = { 16,	8,	9, 5, 0 },
-- 
2.29.2


