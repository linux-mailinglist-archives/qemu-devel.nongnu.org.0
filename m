Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27AD632963
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:28:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9dd-0000bp-CL; Mon, 21 Nov 2022 11:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ox9db-0000bT-0w
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:27:15 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.226] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ox9dY-0001sw-Tp
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:27:14 -0500
HMM_SOURCE_IP: 172.18.0.218:59746.263116816
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.40.159 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 11BB22800A3;
 Tue, 22 Nov 2022 00:27:04 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([125.69.40.159])
 by app0025 with ESMTP id f1adc6e37b564d6992ecced2f1a6a755 for
 qemu-devel@nongnu.org; Tue, 22 Nov 2022 00:27:07 CST
X-Transaction-ID: f1adc6e37b564d6992ecced2f1a6a755
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.40.159
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v2 02/11] softmmu/dirtylimit: Add parameter check for hmp
 "set_vcpu_dirty_limit"
Date: Mon, 21 Nov 2022 11:26:34 -0500
Message-Id: <56f207f3f962da7d90772cce1e724d50ba415d79.1669047366.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1669047366.git.huangy81@chinatelecom.cn>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1669047366.git.huangy81@chinatelecom.cn>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

dirty_rate paraemter of hmp command "set_vcpu_dirty_limit" is invalid
if less than 0, so add parameter check for it.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 softmmu/dirtylimit.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 940d238..c42eddd 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -515,6 +515,11 @@ void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict)
     int64_t cpu_index = qdict_get_try_int(qdict, "cpu_index", -1);
     Error *err = NULL;
 
+    if (dirty_rate < 0) {
+        monitor_printf(mon, "invalid dirty page limit %ld\n", dirty_rate);
+        return;
+    }
+
     qmp_set_vcpu_dirty_limit(!!(cpu_index != -1), cpu_index, dirty_rate, &err);
     if (err) {
         hmp_handle_error(mon, err);
-- 
1.8.3.1


