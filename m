Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6A04170D5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:27:42 +0200 (CEST)
Received: from localhost ([::1]:60238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjMj-00021H-KQ
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKS-0007ay-8B
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:20 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKO-0000O4-O7
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:19 -0400
Received: by mail-ed1-x52c.google.com with SMTP id dm26so547718edb.12
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gW5+cqtFW8998bP2+Q+N3gwvZIfrKBuSNRSwxC4KxeU=;
 b=n8TRG/lqjYt0e9/zuS8yoyPfBkITDCaFNkRwZvvf3inmMBY1+fLxrBugRAHFrMcjEI
 ZiIvA/CLHJMJBbFiGOQ46JBgmPSyiXXqRxC1bqwDaWNsymRLAP+r+K0twreGXkWD1al5
 70hR0rMvCltNzXi4qBRUZ1qdYIu+ZvPqN8oQ+2GfPoM/RACjdfZrlgmYPvIciSLshc4i
 v9ec1b5uj34pA4kFcjsPp93dwHssUMdBlG6yKBHkHqVDwmqxOy83bl3GO/89em/crfX5
 7fICxx8WvGrASDInhO+V4SAsqWSCo3AOMLnfisJsH9h72oydCfRcvUyQBT9GMJWzt0HT
 ms9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gW5+cqtFW8998bP2+Q+N3gwvZIfrKBuSNRSwxC4KxeU=;
 b=OdoBXDJ+fQVoA0QxNd2eq3VIRawrsNngBl0rHtbKTo1JptPUz3+QMJRcStwpQTU3Dz
 ah9GKuGKW7vWuB3K1D+kzhLHSLqO5e9aOBU/G2C3K3/b8Ilu2884CfWA6qDuEBbQbMVv
 +kF7Fj+ebWRxiZyTFxDH+Y1Lc3Py3aXUt/FbEUljefX+5JtjezC1JUKNgGDFUJNvpXxb
 wnTfzO/9HcVS18QDG03Wg/ico7PiCqiY7YaueHrY9w+MLy9LeGz8z2J+JO3GEQ1l1ZgT
 6bTZhG9reg9Dp+/JAugt4edJ/+DlRz0bJ6o7mjb7sTXymvdeZQBMsgr4lcV+810hI2Cu
 sGXg==
X-Gm-Message-State: AOAM530b/IHnFJZpnS/BDwrHCGxD4Wt5HSI5DuaJAJYQ7/E5cCgD77Rx
 KF5tX7RtlqbDxAeMND1sQ0ANVZ9ZNnM=
X-Google-Smtp-Source: ABdhPJz1Y8Q8LOIuZiHL2SpB+k8JPzFoIsDBOExySsdEQX8wcgnZAEfN/rDS044TkLPUJUEjYRXgug==
X-Received: by 2002:a17:906:2505:: with SMTP id
 i5mr10549862ejb.450.1632482714376; 
 Fri, 24 Sep 2021 04:25:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/26] qom: Add memory-backend-epc ObjectOptions support
Date: Fri, 24 Sep 2021 13:24:47 +0200
Message-Id: <20210924112509.25061-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Add the new 'memory-backend-epc' user creatable QOM object in
the ObjectOptions to support SGX since v6.1, or the sgx backend
object cannot bootup.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-4-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/qom.json | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index a25616bc7a..0222bb4506 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -647,6 +647,23 @@
             '*hugetlbsize': 'size',
             '*seal': 'bool' } }
 
+##
+# @MemoryBackendEpcProperties:
+#
+# Properties for memory-backend-epc objects.
+#
+# The @share boolean option is true by default with epc
+#
+# The @merge boolean option is false by default with epc
+#
+# The @dump boolean option is false by default with epc
+#
+# Since: 6.2
+##
+{ 'struct': 'MemoryBackendEpcProperties',
+  'base': 'MemoryBackendProperties',
+  'data': {} }
+
 ##
 # @PrManagerHelperProperties:
 #
@@ -797,6 +814,7 @@
     { 'name': 'memory-backend-memfd',
       'if': 'CONFIG_LINUX' },
     'memory-backend-ram',
+    'memory-backend-epc',
     'pef-guest',
     'pr-manager-helper',
     'qtest',
@@ -855,6 +873,7 @@
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
                                       'if': 'CONFIG_LINUX' },
       'memory-backend-ram':         'MemoryBackendProperties',
+      'memory-backend-epc':         'MemoryBackendEpcProperties',
       'pr-manager-helper':          'PrManagerHelperProperties',
       'qtest':                      'QtestProperties',
       'rng-builtin':                'RngProperties',
-- 
2.31.1



