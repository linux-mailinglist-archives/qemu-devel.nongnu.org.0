Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3BD51227A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 21:19:52 +0200 (CEST)
Received: from localhost ([::1]:33634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njnCZ-0006cI-8R
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 15:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <233e6406128f5b90278e3d717e93b70c8e987217@lizzy.crudebyte.com>)
 id 1njn58-0003OV-Aj; Wed, 27 Apr 2022 15:12:11 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:38587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <233e6406128f5b90278e3d717e93b70c8e987217@lizzy.crudebyte.com>)
 id 1njn56-0000CD-7y; Wed, 27 Apr 2022 15:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=9e+j84JOd+3vjiq5peNtNOibkFPVEgahs9aMHNwCat8=; b=Sfw9H
 54oDyJaLukftwGXr7g2DPsOk5fBdybShf48MAkgzcSuYIfk9f7dOIWV6hmU9yx1/JhhdU+imPQjCU
 ESaaeThkAlRpMRdplfEYAMjksPmvqDWr7BftxghsmTrEkZMlsy1VTnVDCcOx46mc4vqhQwt1UMyBt
 36Lsky4+e03jMZKT3y2e0qJmwxRiSdh/oGFlkALCX5WF1g6eChvsMjfjLZM1K6hooOQXz0obKN0gC
 QPIL8I3QBzDOn6emsnlPyrKT/bGaR5qRLNZkY1mJBP8GeSbDAyT4WNZJ6CXe7BcPnaPnD1ETiFzMq
 VQh3Vtajx6Ezt3vByKJ+wo+Iw72WQ==;
Message-Id: <233e6406128f5b90278e3d717e93b70c8e987217.1651085922.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1651085921.git.qemu_oss@crudebyte.com>
References: <cover.1651085921.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 27 Apr 2022 20:56:38 +0200
Subject: [PATCH v4 6/6] 9pfs: fix qemu_mknodat() to always return -1 on error
 on macOS host
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=233e6406128f5b90278e3d717e93b70c8e987217@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_mknodat() is expected to behave according to its POSIX API, and
therefore should always return exactly -1 on any error, and errno
should be set for the actual error code.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p-util-darwin.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index 7d00db47a9..649a3ec61c 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -127,7 +127,8 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
     }
     if (!pthread_fchdir_np) {
         error_report_once("pthread_fchdir_np() not available on this version of macOS");
-        return -ENOTSUP;
+        errno = ENOTSUP;
+        return -1;
     }
     if (pthread_fchdir_np(dirfd) < 0) {
         return -1;
-- 
2.32.0 (Apple Git-132)


