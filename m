Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D6B304D79
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 01:40:39 +0100 (CET)
Received: from localhost ([::1]:37458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ysw-0004fO-S0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 19:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <653a5ef61c5e7d160e4d6294e542c57ea324cee4@lizzy.crudebyte.com>)
 id 1l4YqQ-0003vm-1y
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 19:38:02 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:41355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <653a5ef61c5e7d160e4d6294e542c57ea324cee4@lizzy.crudebyte.com>)
 id 1l4YqO-0006xM-Gx
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 19:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=PFFmgNGyfC+nMCQ95QvPope9mXT2GQdf/3JbIMDlfLo=; b=B9iw+
 bhC5gWm8uC08iqMHq4Xm08g+rsmWzLtcXJnZrYWK+x2yriy7MRM2I81uRDFjgMGYizB0RL8Hkq111
 CsglRfsLMXfjyCKOpb/eKk46NthOvBo84w4S2GRkxf66z2U3BFdEWefAV5k+hvrpoF/UdBfeB36Nv
 yOU17Z8z6eFD3lGGbphjuydoqz5Pa5pRmVO1D8OULKPUPvYwv+LO5KOgGHsYjrQRlNPh1pQFevVJU
 XpHZK78FnZBlJXD9JoTILun1YbPUejEgFgYX3w8KJopI2XqiHwSPrju4ln33XVUJAA5fWCtQPi6pT
 LSZU8h4TWoAplcSKAbU2mRLYnkoHw==;
Message-Id: <653a5ef61c5e7d160e4d6294e542c57ea324cee4.1611704181.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1611704181.git.qemu_oss@crudebyte.com>
References: <cover.1611704181.git.qemu_oss@crudebyte.com>
Date: Wed, 27 Jan 2021 00:04:22 +0100
Subject: [PATCH 2/5] libqos/qgraph_internal: add qos_printf() and
 qos_printf_literal()
To: qemu-devel@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=653a5ef61c5e7d160e4d6294e542c57ea324cee4@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From: qemu_oss--- via <qemu-devel@nongnu.org>

These two are macros wrapping regular printf() call. They are intended
to be used instead of calling printf() directly in order to avoid
breaking TAP output format.

TAP output format is enabled by using --tap command line argument.
Starting with glib 2.62 it is enabled by default.

Unfortunately there is currently no public glib API available to check
whether TAP output format is enabled. For that reason qos_printf()
simply always prepends a '#' character for now.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/qgraph_internal.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/qtest/libqos/qgraph_internal.h b/tests/qtest/libqos/qgraph_internal.h
index 974985dce9..c0025f5ab9 100644
--- a/tests/qtest/libqos/qgraph_internal.h
+++ b/tests/qtest/libqos/qgraph_internal.h
@@ -255,4 +255,15 @@ void qos_delete_cmd_line(const char *name);
  */
 void qos_graph_node_set_availability(const char *node, bool av);
 
+/*
+ * Prepends a '#' character in front for not breaking TAP output format.
+ */
+#define qos_printf(...) printf("# " __VA_ARGS__)
+
+/*
+ * Intended for printing something literally, i.e. for appending text as is
+ * to a line already been started by qos_printf() before.
+ */
+#define qos_printf_literal printf
+
 #endif
-- 
2.20.1


