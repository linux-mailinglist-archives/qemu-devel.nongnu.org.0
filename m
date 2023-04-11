Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0464C6DDED7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:05:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFWY-0003WO-Ec; Tue, 11 Apr 2023 11:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFWH-0003EK-1g
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFW7-00026K-Gb
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681225328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GpZ8Mu5E16NaLBA9iGqtDpq8aiiLhumZQZgPEeifA4g=;
 b=IFv2SMo1IRqqr3w94Lp9yweYb6AyBAew4YJ5/cd9pf6UXD5yp5tpJu8Rv35kLA/7KYVFFC
 1gwdytLEuu0j/jUcwlwBNznct2UNkxoe2mSGOUc/9kB6Dsh2qote/x1f7qBX16E4uKE8+6
 sTMIk5qFKRxQvWXbcFPyuBA35OMEAMw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-MYy5WLXQMu2J_QkrZ0BOlQ-1; Tue, 11 Apr 2023 11:02:05 -0400
X-MC-Unique: MYy5WLXQMu2J_QkrZ0BOlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1CFD3C0F37D;
 Tue, 11 Apr 2023 15:02:04 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 390B040BC797;
 Tue, 11 Apr 2023 15:02:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 01/10] block/vhdx: fix dynamic VHDX BAT corruption
Date: Tue, 11 Apr 2023 17:01:38 +0200
Message-Id: <20230411150147.318637-2-kwolf@redhat.com>
In-Reply-To: <20230411150147.318637-1-kwolf@redhat.com>
References: <20230411150147.318637-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Lukas Tschoke <lukts330@gmail.com>

The corruption occurs when a BAT entry aligned to 4096 bytes is changed.

Specifically, the corruption occurs during the creation of the LOG Data
Descriptor. The incorrect behavior involves copying 4088 bytes from the
original 4096 bytes aligned offset to `tmp[8..4096]` and then copying
the new value for the first BAT entry to the beginning `tmp[0..8]`.
This results in all existing BAT entries inside the 4K region being
incorrectly moved by 8 bytes and the last entry being lost.

This bug did not cause noticeable corruption when only sequentially
writing once to an empty dynamic VHDX (e.g.
using `qemu-img convert -O vhdx -o subformat=dynamic ...`), but it
still resulted in invalid values for the (unused) Sector Bitmap BAT
entries.

Importantly, this corruption would only become noticeable after the
corrupted BAT is re-read from the file.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/727
Cc: qemu-stable@nongnu.org
Signed-off-by: Lukas Tschoke <lukts330@gmail.com>
Message-Id: <6cfb6d6b-adc5-7772-c8a5-6bae9a0ad668@gmail.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vhdx-log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index c48cf65d62..38148f107a 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -981,7 +981,7 @@ static int vhdx_log_write(BlockDriverState *bs, BDRVVHDXState *s,
             sector_write = merged_sector;
         } else if (i == sectors - 1 && trailing_length) {
             /* partial sector at the end of the buffer */
-            ret = bdrv_pread(bs->file, file_offset,
+            ret = bdrv_pread(bs->file, file_offset + trailing_length,
                              VHDX_LOG_SECTOR_SIZE - trailing_length,
                              merged_sector + trailing_length, 0);
             if (ret < 0) {
-- 
2.39.2


