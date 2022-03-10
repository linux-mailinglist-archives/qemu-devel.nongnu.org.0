Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC77F4D514F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:37:24 +0100 (CET)
Received: from localhost ([::1]:38956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNf9-0006py-E1
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:37:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYX-000855-4f; Thu, 10 Mar 2022 13:30:33 -0500
Received: from [2607:f8b0:4864:20::c2c] (port=38704
 helo=mail-oo1-xc2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYV-0006Rw-CT; Thu, 10 Mar 2022 13:30:32 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 x26-20020a4a9b9a000000b003211029e80fso7799032ooj.5; 
 Thu, 10 Mar 2022 10:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVGtHh0scFIFCaqU1H66eFsWF/LxNL0KwdPPDWuxtaQ=;
 b=FttKeaGM5ukGDDtp4+J+IGRrEq3sQ6VE58HcYE80jI+34MDhTPKQ9Q4WqSs9R6nWTB
 6woCQjdiPKGq+MKlFGbe1oMreUvV1ZEA6N1MQNEgQSPG/jfp7OIExDH9/YKQFnRpn+tc
 wX+PctlzKKRjCRzt2LSPfVJd5LjKjrU64F2R7dZW0rFYgw085/+SqGZoid7ViXwLW3J+
 kCFZnuCiyJJdsMV/crND4bX8EIhh5CoZ+gQV07yRAWDeBLJLq/6j0XJDG8NT+PxsfVtN
 q6ROZHAJDJrS1JT9WUhZv3KxbkFkuOmzpq/mZBJHNEeHgrWT0G0HNs7gHSS6uDMyAeTU
 7UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wVGtHh0scFIFCaqU1H66eFsWF/LxNL0KwdPPDWuxtaQ=;
 b=35EFT6h9czMlpX6LYL7WIAYl6NfrHoJlQy4TrimJ5PJWaSgCFqwKzzJxYR7RRcOnwE
 pK7Y/bfdchtbbrZl9NRMZn3WydMJlJ4oClZiTyVttWk1fFM/A0cViink6XXZ5gN6EmUV
 /1+ZcpJfnL9XTdb3G6hntpQe3vryVuBR0JmGGQ8f+q12vw5/nqnQ0JXvyQlBX3YJq3cO
 zOEHGS73KCSPl7592tHR1ELGl32zVbLace5uxBM7udPGbFBQaddo/GDkJc2pUWZvXr58
 9xYpM2M0cJ5TKlDlInw7BBgvwhdKFwne27RxycFP2d7XTg5u1Y+39LcuRA8nkVVqzx7t
 /cSw==
X-Gm-Message-State: AOAM5310GNRSyQ55I9yi3khF2eNp1loagON89spDhjkJnLv65PlEyV05
 RAkrV0cyeazQtyY/YzFAOlIWHw1+A4Q=
X-Google-Smtp-Source: ABdhPJwkIrla6tXtcAmGeA6V5tho6Evtfuk5dPRK/SXYOHzkkTqZQpiFLyA85FWZwv1QpgYbWK0ZfQ==
X-Received: by 2002:a05:6870:b39c:b0:d1:4a9f:35f9 with SMTP id
 w28-20020a056870b39c00b000d14a9f35f9mr3492472oap.119.1646937029922; 
 Thu, 10 Mar 2022 10:30:29 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a4aae47000000b0031d17643eaasm2763175oon.22.2022.03.10.10.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:30:29 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] avocado/ppc_405.py: remove test_ppc_taihu()
Date: Thu, 10 Mar 2022 15:30:05 -0300
Message-Id: <20220310183011.110391-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310183011.110391-1-danielhb413@gmail.com>
References: <20220310183011.110391-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, muriloo@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Running this test gives us a deprecation warning telling that this
machine type is no longer supported:

	Output: qemu-system-ppc: Machine type 'taihu' is deprecated:
incomplete, use 'ref405ep' instead

Moreover, this test fails to pass running in an IBM POWER host when
building QEMU with --disable-tcg.

Since the machine type is already being considered deprecated let's not
bother fixing the test with --disable-tcg. Remove test_ppc_taihu().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/ppc_405.py | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/avocado/ppc_405.py b/tests/avocado/ppc_405.py
index a47f89b934..a69b7c5e97 100644
--- a/tests/avocado/ppc_405.py
+++ b/tests/avocado/ppc_405.py
@@ -25,14 +25,6 @@ def do_test_ppc405(self):
         wait_for_console_pattern(self, 'AMCC PPC405EP Evaluation Board')
         exec_command_and_wait_for_pattern(self, 'reset', 'AMCC PowerPC 405EP')
 
-    def test_ppc_taihu(self):
-        """
-        :avocado: tags=arch:ppc
-        :avocado: tags=machine:taihu
-        :avocado: tags=cpu:405ep
-        """
-        self.do_test_ppc405()
-
     def test_ppc_ref405ep(self):
         """
         :avocado: tags=arch:ppc
-- 
2.35.1


