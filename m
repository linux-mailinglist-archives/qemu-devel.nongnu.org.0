Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DAD287C6F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 21:24:09 +0200 (CEST)
Received: from localhost ([::1]:49612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQbWK-0002Ft-ST
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 15:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c477717430aa4b6d4b9cf688b587d369b5c66637@lizzy.crudebyte.com>)
 id 1kQbLw-0005To-G4
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:13:24 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:49897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c477717430aa4b6d4b9cf688b587d369b5c66637@lizzy.crudebyte.com>)
 id 1kQbLu-0005Fr-Ux
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=PFFmgNGyfC+nMCQ95QvPope9mXT2GQdf/3JbIMDlfLo=; b=NMMbQ
 0FOIecHW07EiIZlMMJUt5kMLvlgNbKq4DRft8cdT50odJ1pm/GDNjd+Lvt2KQkk7lpA7VKRFEC1Q5
 F65FWlxheCjOLfxMGzaMFFjrWLubR7F+vrpLxjH3YUm2zZf3beYW6/dEda0/eFU17xQA2c11uS0sR
 3lUUn1u7c9I6BlIvjzu9YlRzi98sOs5cf+E1Wsbh0kwpyJuKkEsTJcBSg+EVA1zBVNDDf3/QHZ3+W
 V6b9/J0yGFDZZWVaC/tmKePB1TgN/V2aHmofEONp7WqNan8VpP67E5NUlfIIt5qQL2hZz6CBTAjWe
 FSDyqjRg9Czj/Db+UMufIwev5bbQQ==;
Message-Id: <c477717430aa4b6d4b9cf688b587d369b5c66637.1602182956.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1602182956.git.qemu_oss@crudebyte.com>
References: <cover.1602182956.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 8 Oct 2020 20:34:56 +0200
Subject: [PATCH v4 03/12] libqos/qgraph_internal: add qos_printf() and
 qos_printf_literal()
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
    Laurent Vivier <lvivier@redhat.com>,
    Paolo Bonzini <pbonzini@redhat.com>,
    Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
    Greg Kurz <groug@kaod.org>,
    "Daniel P. Berrangé" <berrange@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=c477717430aa4b6d4b9cf688b587d369b5c66637@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 15:12:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


