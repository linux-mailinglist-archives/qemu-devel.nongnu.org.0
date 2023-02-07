Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0967968D4B0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:45:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPLSX-0005Yy-FN; Tue, 07 Feb 2023 05:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPLSV-0005Y8-9b
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:44:19 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPLSS-000154-Fo
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x55fqrQYLpg8ohnDNGEzXoUfU5HlDK9JnMCa93r3LlI=; b=DXywbxULxB94RXa1gPgyDDLG4K
 AmJiowgmf2C8sAPRKjnHVcUv62HQptILMamhgd6ZP7UQCcVSGi6msfbY53aTM4aoV3iysNZh6Fuxu
 B5QpoNP4Mmz505e9rtGB6oFvrOjm8rXgzlr1ZagcaOchckmiftErQRTnMFHk079tH48k=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org
Subject: [PATCH 1/3] include/exec: Introduce `CF_PCREL`
Date: Tue,  7 Feb 2023 11:43:50 +0100
Message-Id: <20230207104352.11055-2-anjo@rev.ng>
In-Reply-To: <20230207104352.11055-1-anjo@rev.ng>
References: <20230207104352.11055-1-anjo@rev.ng>
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Adds a new field to TranslationBlock.cflags denoting whether or not the
instructions of a given translation block are pc-relative. This field
aims to replace the macro `TARGET_TB_PCREL`.

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 include/exec/exec-all.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 54585a9954..b54df1c28f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -544,6 +544,7 @@ struct TranslationBlock {
 #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
 #define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
 #define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
+#define CF_PCREL         0x00200000 /* Opcodes in TB are PC-relative */
 #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
 
-- 
2.39.1


