Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434B34A9BB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:30:33 +0100 (CET)
Received: from localhost ([::1]:40234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnTs-0001AW-DY
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPnNj-00021x-MI; Fri, 26 Mar 2021 10:24:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPnNg-0000jN-JM; Fri, 26 Mar 2021 10:24:09 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k8so5847036wrc.3;
 Fri, 26 Mar 2021 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zDikArT0wZanXm76Q8OQWC249jp12J87tlgt7b4t7y0=;
 b=bB+jwPaIPSy2Xkklr+fBWqOfFcKZAOndJO2SlV6JcKYuRh4phTLxKPWGXqAvWddGON
 TlQMQd34zXUvAxtFmgeeZrmloRKN3vznvnaLCReSlJ5i2L9kQSovLfXETjgmfxVchaKa
 sK4JGPHy/coNCU5wZXGb53FzD5o0nRxhcVT71027y3mihjZzF377Z6WO9lYspPOSYytx
 8rAqj6KMl4M5wFwZH6xkDU/8DLcREYEc8TJg9a0H+IIj736A3mm6aSqRKEOp1UmMLFn1
 uXyMGCutiUj7B0j1lLHWARkHKA/mn4O/PvA+9C1sjNT3a2/bOCmuQgeadDOo4QWHR8dF
 TNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zDikArT0wZanXm76Q8OQWC249jp12J87tlgt7b4t7y0=;
 b=PlZhEKqfdLHrUsbBspoWRpEq1C8sOVMAJfnnWL7NlZliB5hKAG+trICJWydW8oGDbf
 x7PmoRX0FWLH9K/aq3zghaAmw0+zRv4TU/cZP94BMZmkoWEU49bgrV7Hxymw78z0INpA
 s/4ryNRxtBapFhJfpfqdfz7NpF8F+Hmr+qn/JctmwuCoXyOER4tgZuqPAtuXQe6fq7Nn
 590F/y8lN0U8yJUOOmtR91e+WX7SZf5dhleo5/2MKlp4bVTwMRoj/kbgcsBTKQZ+WeRy
 wzh4x6EuxKoUfonZ359oZ4ujLhO16XcoAYXOM6n8pRqAXlJ05jvXceMFQr+aDF9YpbDR
 jvPw==
X-Gm-Message-State: AOAM531lBzlRGPVcX7XM3JvUubkRmF0X1Mx+Dk040J+PPg+5Ywu+2Ra4
 X943j29WLTLOxSr08jXz2/lfsAChs5w=
X-Google-Smtp-Source: ABdhPJx5ueBh2P/+2YcvBHoD3wmyXdcdkWN0RyXJFw7FW0Tny411jWUMQkmCwKT/l/cEGEXy4Nngqw==
X-Received: by 2002:a5d:534e:: with SMTP id t14mr14518537wrv.202.1616768646957; 
 Fri, 26 Mar 2021 07:24:06 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m5sm13084517wrq.15.2021.03.26.07.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 07:24:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] qemu-iotests: fix case of SOCK_DIR already in the
 environment
Date: Fri, 26 Mar 2021 15:23:59 +0100
Message-Id: <20210326142359.431127-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210326142359.431127-1-pbonzini@redhat.com>
References: <20210326142359.431127-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to a typo, in this case the SOCK_DIR was not being created.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Tested-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210323181928.311862-6-pbonzini@redhat.com>
---
 tests/qemu-iotests/testenv.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index cd0e39b789..0c3fe75636 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -120,7 +120,7 @@ def init_directories(self) -> None:
         try:
             self.sock_dir = os.environ['SOCK_DIR']
             self.tmp_sock_dir = False
-            Path(self.test_dir).mkdir(parents=True, exist_ok=True)
+            Path(self.sock_dir).mkdir(parents=True, exist_ok=True)
         except KeyError:
             self.sock_dir = tempfile.mkdtemp()
             self.tmp_sock_dir = True
-- 
2.30.1


