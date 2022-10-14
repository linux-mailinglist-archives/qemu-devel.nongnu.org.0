Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9310C5FF668
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 00:39:25 +0200 (CEST)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojTKu-0007zd-39
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 18:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ojTId-0005gy-NK
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 18:37:03 -0400
Received: from rev.ng ([5.9.113.41]:52827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ojTIb-00089m-VW
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 18:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=doFEzAtwHPTHzx/noVGMkntXW6lZcpVNr2+nRkUxL98=; b=tlWcj7Z2oUOQ+h2zNSLcyfkPxD
 31zRLyL+bcmFnOoHvyP3dIFhhQyCuMgpTBcdBltPkWgFBJmGjEkwZ4PpEbvohYEJPbi+TcZJ6lGJE
 hPvnHg4vxlMnRm4lcIbbjFhOtduZ3kC+Js/f6foFvTHC9VkBD8Vt3wStlzE0DJ0FJJrw=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 alex.bennee@linaro.org
Subject: [PATCH] tests/docker: Add flex/bison to `debian-hexagon-cross`
Date: Sat, 15 Oct 2022 00:36:42 +0200
Message-Id: <20221014223642.147845-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

debian-hexagon-cross contains two images, one to build the toolchain
used for building the Hexagon tests themselves, and one image to build
QEMU and run the tests.

This commit adds flex/bison to the final image that builds QEMU so that
it can also build idef-parser.

Note: This container is not built by the CI and needs to be rebuilt and
updated manually.

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 tests/docker/dockerfiles/debian-hexagon-cross.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index 8d219bb81d..c4238e893f 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -43,7 +43,7 @@ RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.lis
 # Install QEMU build deps for use in CI
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy git ninja-build && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy bison flex git ninja-build && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt build-dep -yy --arch-only qemu
 COPY --from=0 /usr/local /usr/local
--
2.37.3

