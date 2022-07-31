Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C3C5861F1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 01:05:57 +0200 (CEST)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oII0R-0004Gy-W6
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 19:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1oIHyQ-0002rV-7i
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 19:03:50 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:41767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1oIHyO-0005Fn-KH
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 19:03:49 -0400
Received: by mail-qt1-x82a.google.com with SMTP id c20so6901868qtw.8
 for <qemu-devel@nongnu.org>; Sun, 31 Jul 2022 16:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=3pM3AYH+A9pDCT70pxuPgHTGcbtBBKs+4laKLpiKIrw=;
 b=C9fXvl5Nmccp23tfz4Z8t/RAaP6hR4O1LcW27QJVOb24n67kBygW9mvCg+aUZhdk//
 crijMf46oZmICPQIhtypa7Bbv2Cyv1SrbcSpxqBCPGaopAY5Bt/d8ZDWvRk5vIyxXJFY
 1llDS3jOZ+ksv99Z0q6pwWMyve/Zr1k4GcOmkwFueXEKjAgxvYY1CgKDm/sfIZCyNt4i
 hkDDyrzLilzr1hr/yvT5cHUq0MChAmUW08ZlJXGGLQOQJqjr/9Bew0kWMCEVvHxal6Vu
 mxD9LRMneW3xF8Q0OLOkl8UAA7LstwM+IsScgQ2ZaA8q8Fv+SswJ6i7KX3njOaoZ0EsG
 GqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=3pM3AYH+A9pDCT70pxuPgHTGcbtBBKs+4laKLpiKIrw=;
 b=iJ6tYmrY6UnznrqTECr60MSg1r74+DqdpMsoxBnYvrQKPl50sjiuPFtl2k4wfsArha
 lgaBjMLb5s/0DITB88Wz5wJt+8fue4rhHz+ssULWL0M2l2bKATLUPVRH/vG8A7DPE9u9
 ja9b+GbzpTfPf6FtZT5lss977IMB8g3t3/kqJhD3dBKplEapZSv13A+og5FkUIvo1h2k
 r6XfQ7DT5fQ4Wax+9FaIX8HSMlGp2+DrByn/kdt9GNTh6ibA9wvmAN+hCkOmXl1osA3y
 mQX3qP3iOOVLzmsy7TJUb6G+G6f7GbzjnWasSHr3JM76Mv/9jOmLcvC0K1b0rCJDVhAk
 Am2w==
X-Gm-Message-State: AJIora8GTm+P4XPNcy6Emgbu9Bm1zC2EFAdk4NZtDgWzEQ1DtsCr8k7L
 nvPm2yiSN1upXW+b77MaUg==
X-Google-Smtp-Source: AGRyM1uM1HeI25Ld/XByQX1r2hP6f0i7RHZNgYm0fX9fHz92n/qZz3+ETAVSiQhbsBRaY8w0qB6msA==
X-Received: by 2002:ac8:5c87:0:b0:31f:188e:b1f with SMTP id
 r7-20020ac85c87000000b0031f188e0b1fmr12139774qta.153.1659308627246; 
 Sun, 31 Jul 2022 16:03:47 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 c129-20020ae9ed87000000b006b64a0d9ecfsm7102405qkg.55.2022.07.31.16.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 16:03:46 -0700 (PDT)
Received: from t560.minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:5014:1ce0:c372:36cb])
 by serve.minyard.net (Postfix) with ESMTPA id 65C0C180052;
 Sun, 31 Jul 2022 23:03:45 +0000 (UTC)
From: minyard@acm.org
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "M : Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Corey Minyard <cminyard@mvista.com>
Subject: [PATCH] ipmi:smbus: Add a check around a memcpy
Date: Sun, 31 Jul 2022 18:02:46 -0500
Message-Id: <20220731230245.1216949-1-minyard@acm.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Corey Minyard <cminyard@mvista.com>

In one case:

  memcpy(sid->inmsg + sid->inlen, buf, len);

if len == 0 then sid->inmsg + sig->inlen can point to one past the inmsg
array if the array is full.  We have to allow len == 0 due to some
vagueness in the spec, but we don't have to call memcpy.

Found by Coverity.  This is not a problem in practice, but the results
are technically (maybe) undefined.  So make Coverity happy.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 hw/ipmi/smbus_ipmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

I think this should do it.

diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
index 9ef9112dd5..d0991ab7f9 100644
--- a/hw/ipmi/smbus_ipmi.c
+++ b/hw/ipmi/smbus_ipmi.c
@@ -281,7 +281,9 @@ static int ipmi_write_data(SMBusDevice *dev, uint8_t *buf, uint8_t len)
              */
             send = true;
         }
-        memcpy(sid->inmsg + sid->inlen, buf, len);
+        if (len > 0) {
+            memcpy(sid->inmsg + sid->inlen, buf, len);
+        }
         sid->inlen += len;
         break;
     }
-- 
2.25.1


