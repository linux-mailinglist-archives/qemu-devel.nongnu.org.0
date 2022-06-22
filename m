Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D475544D1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 11:19:59 +0200 (CEST)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3wWk-00036F-9g
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 05:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o3wTP-0000Tv-FU
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:16:32 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o3wTF-0007Ky-Fv
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:16:28 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 p3-20020a17090a428300b001ec865eb4a2so11072055pjg.3
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BIETDIj5tUXeCXT+wMcB0HSQ2K+sKEnNnkyw8+90Xxo=;
 b=IQSHaYfxFajzbKWN1OhHdX++7rzU97FtQf3xoUM7ztcs+YX51MhDHWQqlyKOb+CeHc
 Xhpf2rmf7/ezMrHyyNnLZdVSXzpVC76rh0EL9NX9pUDBWymyX/uWwpBzi8DkXnBeVguz
 GABMXfT/brYdr+EDzk04uRZBCNjpmC0CRHNWLke2mFAJEnTItPTaQnwE9IDhAEKxbfdP
 6MJMWQEnUmXw0MethdyB6vYBlX4TUjZnq6DdjfFNMMOgz+hhgel4ALHP3luJDuSmUpK/
 1gWmXe2hMzu5jWWhWNyCorjL5Mu/dFe7Hq3aSyvtBrwMd4Y6ByZ9TqV7NeiYU/zPfEuW
 qYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BIETDIj5tUXeCXT+wMcB0HSQ2K+sKEnNnkyw8+90Xxo=;
 b=jxxXloN/LUMDNR7LCWxT/U7ZdEUF2sEbLRYhJNxehYRXwq19rBnoAzZwDU+hg6ht7A
 andDRRkIIuqdyG07h6DZsY9w/X7myx9PeDcGsgqC4sUa2dizu8/ycbQQyyDfrMTbKNQd
 qHrxy4UHyVPwoKKra4ze4c+XosK3BeaRIhNsh77GLDFLdpRZz0EZuhyvBZUgOiPJW4vv
 2Usdc6jHHyCe7JCy9exOZccgWguYqsDLbRB7/sgrgIqG3O2Ke/XPzfWv6eBV0vRTB5DS
 YbQZ1q7h3iEgPTdePDTkSYgNlWH5pQRGdAYjRg3t21CHuwkwFBtnYtkLndFq8nfljOYB
 RIWw==
X-Gm-Message-State: AJIora8ii4apCxQGGUtn9NlhZNON56SSHquZExbMWRZDQVlVEpXEcRMa
 JHhqC4a+i0DVQUXkZ5yRXKfEoj8fTYGrng==
X-Google-Smtp-Source: AGRyM1siZf5XMc0UGvUJlizQx4jZEhxeeFD1hZO7VNQ/S37lZY2kvij8QcA6khrT5jUpEudtjaC9iA==
X-Received: by 2002:a17:902:8309:b0:167:9a4c:cd58 with SMTP id
 bd9-20020a170902830900b001679a4ccd58mr32621418plb.166.1655889379992; 
 Wed, 22 Jun 2022 02:16:19 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([139.177.225.234])
 by smtp.gmail.com with ESMTPSA id
 ja13-20020a170902efcd00b0016a087cfad8sm9833900plb.264.2022.06.22.02.16.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jun 2022 02:16:19 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: qemu-devel@nongnu.org,
	berrange@redhat.com,
	f4bug@amsat.org
Cc: mst@redhat.com, pizhenwei@bytedance.com, jasowang@redhat.com,
 helei.sig11@bytedance.com
Subject: [PATCH v2 3/7] crypto: Remove "qemu/osdep.h" in rsakey.h
Date: Wed, 22 Jun 2022 17:15:45 +0800
Message-Id: <20220622091549.31115-4-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220622091549.31115-1-helei.sig11@bytedance.com>
References: <20220622091549.31115-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Move 'include "qemu/osdep.h"' from rsakey.h to rsakey.c.

Signed-off-by: lei he <helei.sig11@bytedance.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/rsakey.c | 1 +
 crypto/rsakey.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/rsakey.c b/crypto/rsakey.c
index cc40e072f0..dcdbd9ec57 100644
--- a/crypto/rsakey.c
+++ b/crypto/rsakey.c
@@ -19,6 +19,7 @@
  *
  */
 
+#include "qemu/osdep.h"
 #include "rsakey.h"
 
 void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *rsa_key)
diff --git a/crypto/rsakey.h b/crypto/rsakey.h
index 974b76f659..ba88974d12 100644
--- a/crypto/rsakey.h
+++ b/crypto/rsakey.h
@@ -22,7 +22,6 @@
 #ifndef QCRYPTO_RSAKEY_H
 #define QCRYPTO_RSAKEY_H
 
-#include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "crypto/akcipher.h"
 
-- 
2.11.0


