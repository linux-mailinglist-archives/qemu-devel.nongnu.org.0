Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0B9401C29
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:16:39 +0200 (CEST)
Received: from localhost ([::1]:54506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEUI-0000sx-W6
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPE-0000hp-KZ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:31 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPC-0007Vb-RZ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id u16so9795015wrn.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X98lXPUBye1x4dkXr+a8pPzZR1wl6g0L6Pc/Ipe7d9w=;
 b=ZhrFCmaI6cjhWvAe77pmjwzokiaj3J049Qibcx0vf7sX5Hwz74aD2CaCK9bznle/jS
 yGfKbJEoeQRS3vafwqxlndKw5loaEQKmDLFk52M8WAbEcQdryXjPLVCWxDdfl7bUZq9o
 48wb5CEi7JBGwVitARMszlalSdsC1ILcoKpqIfOsTEykscEu/9+8nQan45Qfy+jOLUPT
 7V1InlOHaTcnR3aFy53MgN6vDLL2ZQ0q3cabiUvy8oOd+i5/Cm2iln0Wpy9guGrseIEF
 MPdyNrfVxpqFHnSVaG57rybmE40ET2zucBvADjj9leXVTwDw/FQMmVZH+qWMc9W3sL4X
 LsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X98lXPUBye1x4dkXr+a8pPzZR1wl6g0L6Pc/Ipe7d9w=;
 b=gpg1hqEvk2mGh2/oYvaKGr/ZUPVGnLk5CYILssBvixl158gAPC7w9IWCBQeNJBwigB
 ySXA29PpE5RyCOhPoEL9zBRp5qikcLoXHhXo1YKnpWzIaKlIX2iiRitu8o9MoW7wW88t
 1KmbFVnjch50O1xrtAM6QcjwCpVJzrEJl1V1JI5FT2dHVIW18y1dWtCZaoTsdgoMLprO
 i2BRCN5ynH+igfL6E8LcsfnsxQ4yKhxQlEkrhEEJE/J8k4Mak1msToIy+yPHjH1JI8uo
 1d7SbmBFE88HOLiRl9X1/8wvqH6GO/+/pio4PDecIDta6Fo/nX9j0n6JovoQ0zOb67S0
 DkfQ==
X-Gm-Message-State: AOAM532AmpVat3xQJFlevl7F2aBcHYb+jJQJ/+Nw3dL37daIKMcvKtYi
 uLoF/GBZJXg61KpOEg3i1zqcP2vO8jM=
X-Google-Smtp-Source: ABdhPJzxWAIveeZO9UZkwZhE5ByLWR9xNVQNZ/90dXmWwIoyTZQA0lpUWeQdHFFnC14lIA71/CCAjQ==
X-Received: by 2002:adf:f892:: with SMTP id u18mr12776546wrp.31.1630933881563; 
 Mon, 06 Sep 2021 06:11:21 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/36] qom: Add memory-backend-epc ObjectOptions support
Date: Mon,  6 Sep 2021 15:10:34 +0200
Message-Id: <20210906131059.55234-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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



