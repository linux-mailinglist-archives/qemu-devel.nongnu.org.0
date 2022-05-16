Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20A9528B8C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:04:43 +0200 (CEST)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqe9C-0005Ax-WD
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqdyR-000729-4r; Mon, 16 May 2022 12:53:37 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:37881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqdyP-0004j3-N4; Mon, 16 May 2022 12:53:34 -0400
Received: by mail-oi1-x230.google.com with SMTP id r1so19326926oie.4;
 Mon, 16 May 2022 09:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zEsOvcrjsdDHiqYtQBv82TLxP+8TTdVfmUPw6divdy8=;
 b=psBAP7JcSJ8xokaYzS7eOAs5crl97DfI7OgHC4bqMWDQ6/B3umRxVGJ3aajmXWroWR
 Q/ehuJAwGGVl2M6ZreMlyB12Wgk5VtxRuKbQnbz4zJB5SltO7cyT2I6T9vVuaMDDDLz3
 hoYexnoYxOhxzqdYidKsf6ON83fe0QYsvFKrgo4qmaewCGBHc5odIxPIIGueayvdhS7u
 oLJSEBZfUaXnfOuDP/WYbOyjHbbVR3Tf9hpv74QkCP7Jb9aRRoPF0wx3Rn1UfI6Hoytf
 1BWBKbQ75qJ++xOy/mSLMDgr1EPlxPlHEORYTbofv1bIEWWy+I1MLMaGE1X7rMyTTHzq
 dWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zEsOvcrjsdDHiqYtQBv82TLxP+8TTdVfmUPw6divdy8=;
 b=Nd5YSQPQKk+/vUqnXT7XSM6IbPPCCIKeF0WMlziR37MJOSDUh3ig/azwrotaZxWHpF
 P7c7NVTokmbytkaFAC/BnuS2TDhfMs/Mereac/JbiVG7grlaM3QRZsE2C7CS8TzReUY2
 iQITmb3C4rmQKG4KwsA+4ONmBol9Sj6LCSy2PM1+lOSeBGIINLuJaPi4IATtHuEkCac6
 CuPjgBPy10RTr5WG8hUVNsMG1WxPRDHYjITV++6ESfNAclnfSbGe+ridS0Hxlp6m+Cj3
 6oDwiaCs26cVxomGmSiz9/uMeYAwM+gUEyWxoe/5oQ7LlSJ8bk56hwXeubMLzaIlcs2T
 82cw==
X-Gm-Message-State: AOAM530ze8hxRLB5WAWIXKTxa8PaYt6aeBfpgueiY4O7UsEvZTAzSUGF
 kMzWG85VhNNO0NA/5G/beM3GeAkkLYo=
X-Google-Smtp-Source: ABdhPJzEM4GmS5hguXu/u5j76lXev0vNtFMJgKFXqHxO7TbENmCON72S9hkayDWO5QPfB0AkbbG7nA==
X-Received: by 2002:a05:6808:168b:b0:2f7:338b:7a55 with SMTP id
 bb11-20020a056808168b00b002f7338b7a55mr14228340oib.133.1652720012312; 
 Mon, 16 May 2022 09:53:32 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.151.26])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a056870e30e00b000e686d13889sm5780731oad.35.2022.05.16.09.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:53:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 jsnow@redhat.com, crosa@redhat.com, f4bug@amsat.org, wainersm@redhat.com,
 bleal@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 1/5] avocado/empty_cpu_model.py: use machine:none tag
Date: Mon, 16 May 2022 13:53:17 -0300
Message-Id: <20220516165321.872394-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516165321.872394-1-danielhb413@gmail.com>
References: <20220516165321.872394-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Using tags=machine:none will do two things: it will avoid the need to
passing '-machine none' via self.vm.add_args() and it will set the
self.machine attribute of the parent QEMUSystemTest class (via its
setUp() method).

We'll be relying on self.machine being set apropriately for an upcoming
fix.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/empty_cpu_model.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/empty_cpu_model.py b/tests/avocado/empty_cpu_model.py
index 22f504418d..723ecc73af 100644
--- a/tests/avocado/empty_cpu_model.py
+++ b/tests/avocado/empty_cpu_model.py
@@ -10,8 +10,11 @@
 from avocado_qemu import QemuSystemTest
 
 class EmptyCPUModel(QemuSystemTest):
+    """
+    :avocado: tags=machine:none
+    """
     def test(self):
-        self.vm.add_args('-S', '-display', 'none', '-machine', 'none', '-cpu', '')
+        self.vm.add_args('-S', '-display', 'none', '-cpu', '')
         self.vm.set_qmp_monitor(enabled=False)
         self.vm.launch()
         self.vm.wait()
-- 
2.32.0


