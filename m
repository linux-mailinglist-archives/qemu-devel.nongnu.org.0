Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0FB50E0B0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 14:48:36 +0200 (CEST)
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niy8p-00082P-SA
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 08:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a48ced8707c1e07420e692088905ee23fde132f8@lizzy.crudebyte.com>)
 id 1niy2H-0006HT-Rz; Mon, 25 Apr 2022 08:41:49 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:34935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <a48ced8707c1e07420e692088905ee23fde132f8@lizzy.crudebyte.com>)
 id 1niy2G-0002F9-F0; Mon, 25 Apr 2022 08:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=myq6ngtHVzBS4tdzAixde8cZaPnHU7WFY+q0wZWZ53M=; b=Vuvs8
 1nC3O11WiCvE4KA8g06rfeNr1iykCPhs3KqrX8+tOO+h5uIZ3gVMPLQH31tndhWFEeh1y43L/JX6k
 0eYZswfHcScjBwvi20Vq/E5ZLsX0AyfJKtXESaXSgZC2iLUUcIFkGCMNaQRSo8qWwBjCixe16Xmd+
 5VLDzY/jRD+E4zshAYzHUWb75chUaenRFnJ/0S94T1m06+lDQ1dsHJ6yEWPFuzpUDMfhxF89GJNlL
 jz/Bb/uEyAh0khkWHMBt18jZDVQrfudeu8EsNbim4fuca0DR4K7GOo0WMHSo8eizbomW2MGGWMzJC
 nhGHKL9HT8dmbxKd0c0/EoOeLK2MA==;
Message-Id: <a48ced8707c1e07420e692088905ee23fde132f8.1650889269.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1650889268.git.qemu_oss@crudebyte.com>
References: <cover.1650889268.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 25 Apr 2022 14:21:00 +0200
Subject: [PATCH v3 6/6] 9pfs: fix qemu_mknodat() to always return -1 on error
 on macOS host
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=a48ced8707c1e07420e692088905ee23fde132f8@lizzy.crudebyte.com;
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
---
 hw/9pfs/9p-util-darwin.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index 63797e60cd..7364da394c 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -116,7 +116,8 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
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


