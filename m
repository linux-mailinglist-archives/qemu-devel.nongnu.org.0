Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318841AFA5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:07:36 +0200 (CEST)
Received: from localhost ([::1]:34140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCpb-0000VZ-I9
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa3-0006OX-52
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:33 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa0-0001Kt-FX
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:30 -0400
Received: by mail-ed1-x532.google.com with SMTP id v10so78449250edj.10
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gW5+cqtFW8998bP2+Q+N3gwvZIfrKBuSNRSwxC4KxeU=;
 b=b1LL6PkSZHHjD9NQOLGJ7L1MiBY+qoqnjC7jRgNvzrTUm3Ig3acWUUc+4eI+OasDKb
 pb2hGjyjjolErCicx2CJ5cV0XnJmSUrikteDTDjoC8+yR3xlRWvnhTnJ8eoOARuoHQiH
 lRXOu7GvyxQBEgFVW9aLNg00xm3lufyU0UeqYD8QndpzjZN+QtCoWvRHp6N9zo4iasxM
 keg6kv5bFOALNU48ckeWJmFy7ogiqrSAGbJrnDGo6b6j3CRgt8Co788frZ0d1bqQH/Cq
 VdbcxemC/nVrabZemSrZJ5VahTmUPERiBb+ObwfGGUNqAIMdOblQDJGicCk44VwvN0hG
 X1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gW5+cqtFW8998bP2+Q+N3gwvZIfrKBuSNRSwxC4KxeU=;
 b=f3dIFwoBBkniQz6P9So2sP11I5S2juRZAQeLmp/P7GaNEagVL4ft1rz07RWF/4VCf5
 M1aQTs/+Z8gC6ioi7Kp1NodHfPMuGGFQg6OxMTP0TODUxSFNIWbch0tzBKG/P5YeAt9H
 8OivsQ/+aJsBm5GUVUgVvqTg7/Fp/nKfJ5r8SMvdO7nrgW3i5+9B1pI9oGKAqjJd96Ka
 2nuYOI+r3GtrQfVEL0WP3R7pKjwqm1YxdaCzsIcCe19v5LspmO4a9Uk3I3vp0kgrVPMB
 jbNcgapyfmw29XM7fFU4MXq3P+fSH3BYHJFME5rnKQ8gbUHqD6ZMbRpO/wp3nFpOqjtl
 Q3Fw==
X-Gm-Message-State: AOAM532LTu6ZPi8Er4hCHU9me/Y7uP6M5OqqDT+vD5XnuOzrcp8BMg3E
 KHX2cBGCp3mnAoBFizjTeyBfuL2nI1Q=
X-Google-Smtp-Source: ABdhPJzS7zvAWrmWksbj56VCmkQIm0w7y3SPAiVDDuV+0eC6BqaQLyHI5epg3pGPdxHj11YQaijNlA==
X-Received: by 2002:a17:906:d9ca:: with SMTP id
 qk10mr354545ejb.220.1632833482038; 
 Tue, 28 Sep 2021 05:51:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/33] qom: Add memory-backend-epc ObjectOptions support
Date: Tue, 28 Sep 2021 14:50:47 +0200
Message-Id: <20210928125116.183620-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>
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



