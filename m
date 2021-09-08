Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4370A4037A5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:14:22 +0200 (CEST)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuaz-0001F3-BH
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRl-0006QH-Qe
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:49 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRh-0002vW-G0
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:49 -0400
Received: by mail-wr1-x433.google.com with SMTP id b6so2368167wrh.10
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X98lXPUBye1x4dkXr+a8pPzZR1wl6g0L6Pc/Ipe7d9w=;
 b=qf0uuzVNUhnYljnDkFE2MoufHi4JdO1D3J0ujV9mBWJ8uMNZXzafI9eqZ5RNHIfH2l
 9RiEapBMxWODDGpon8wmsSKzULVySysz4rV+U3YfTxSAqcvGkai1jTL6BeoKpaR+nLFQ
 cjgifgh+qknQPTlTDyM/b6MNqIoDcR1zsU7a/CO2DLRo2VPdwutATIafM91LewAQd3CV
 cZvX5mavWD48Kuc1H31wKXLcX+1RSdq4EMXEJINI5a92jBZw/umCo0b6xea/AgJBnVj/
 XUtvV8XwiYKpiMvdXu+XoctfeR+APXxOFlfGOA1jqb0rTHe6cInQcBYK4wUHcsI1X6Xf
 Rubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X98lXPUBye1x4dkXr+a8pPzZR1wl6g0L6Pc/Ipe7d9w=;
 b=k6cCpn2f5FfQHtMmvzFaJoabXScmQLMMOmSXGj9A2CDN3BY30Co5sfLdA40wVrTjfT
 OnzjyoqtBRbH2KSYWL+5UABGW6Z+xTWqkL3Pt1MibSofip4UCJ8Wfik0r6gBJuT9JkI/
 AqjGIOiBfYagP7p52saoqdlPg5d/bWsEAgGmW7vDKu5qx5v4GgQO16ALHCn9iA9qOG7K
 JwwT2CxQafh9NAOZ8CtLolo+SgBS3rYbvAhFeXITssFusU+qp/1cvXaxOe2cVEwCCwxG
 ha6kYFXqUoF0DzaePfKYKWx5sqpQN9KHJwFUnE2NqIM/JILZDku5sFOX5tCpWTS70f+e
 Y2+g==
X-Gm-Message-State: AOAM532v+nKv8h7BOnMj69kD7jozoFHxZIwLiQwqf6a93R5NCSKZNWiz
 F97Qwu2mNwFmEDA7D0B0K0kdx747uIc=
X-Google-Smtp-Source: ABdhPJz8On8Voxfu0Cyg3R2JA7Q7B7vtfUQfvS6zYaBz7s6oo2tLCsN7W9UDi9yS49X+q1eyRhe4Uw==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr3147641wrz.242.1631095483816; 
 Wed, 08 Sep 2021 03:04:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 11/43] qom: Add memory-backend-epc ObjectOptions support
Date: Wed,  8 Sep 2021 12:03:54 +0200
Message-Id: <20210908100426.264356-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

v1-->v2:
   - Added the new MemoryBackendEpcProperties and related documents,
     and updated the blurb(Eric Blake).
Message-Id: <20210719112136.57018-4-yang.zhong@intel.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/qom.json | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index a25616bc7a..16ba30e5b9 100644
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
+# Since: 6.1
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



