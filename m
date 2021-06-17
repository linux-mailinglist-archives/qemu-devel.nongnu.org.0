Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8F53AAFFE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:43:23 +0200 (CEST)
Received: from localhost ([::1]:42628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoYU-00025p-Il
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNC-0002dy-Ow; Thu, 17 Jun 2021 05:31:42 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNA-00062F-KP; Thu, 17 Jun 2021 05:31:42 -0400
Received: by mail-ej1-x630.google.com with SMTP id nd37so8768672ejc.3;
 Thu, 17 Jun 2021 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=heHCUXk2lYlY4womrST8MVwquaQIh6Pc6yFu//DhDE0=;
 b=ojzGIj/GQau9eqlf5tRBHGG7yTtNRVewdjWdVPydm0y60V6CYXcjUwL+TFaDZjLf6t
 dUO1pT5cVTDL+KkUsMEVsROsVU4O7rbbM4SLkFHlTy/bttKf7ah/us9iyeufU2HOpsAz
 vrKJsLmw9IJ2VpLo+SL9qfkgnyH+bJCTom8BYJvKc8GThyHlBS8lbBUp+jQNj0KFJUyj
 ijW8Bjn00OgXpL/UlmgHVLcoWgZK4x8kqxG3126oTnorAqgkTzXZuPN+QdoMhrjgeREw
 WbUUvMQ7a5MrglcdBHK526W3DNHuT0nhN23XI3AohSGZXpwOG29+zO/xZUpC3jGztUgq
 AX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=heHCUXk2lYlY4womrST8MVwquaQIh6Pc6yFu//DhDE0=;
 b=ZMjiTrWOFZge/6bBnL5XjzIAz/NBmQpVdQWrEdOq+XLz2lGz/AU4LtJlRcSltghW6X
 Ay0BAQaF3sJMtkq3aSt0c9a2A4uNyUEEWm01wx/i0+MaQTGbYlSS8iXU365CguULLLuK
 VMh8rFVZcSfHbeXZukqa2NKAehraiGOVIFC6nr+JXAOlaDy5mOYyYcGQX9Iq1jWXNMEy
 5v2nutpvqfNK3wPM13LvNpf/ZDFJrAz8gqmJ5sDJPnk6yjWoh/l8iGH/MvS5+faoGcks
 5xtcq8hXK1sQesumVxc1mTXLEEfpfoUuKSdMS5a6nJ/h9+viejvPKF3nkX+qFqWdmEgX
 ybnw==
X-Gm-Message-State: AOAM532P36wUVs80aOuHdjgNVcmr3SkR1Qgy1M+OkThnxoclJGevG3iP
 hcaaUXUubcMgzNOn+JRbTKfFyzFQTKA=
X-Google-Smtp-Source: ABdhPJwAkRxOMfJ3QW3jFscuW4qbiWE+Fvnog20y6oLsH5xessQxVXnvNCGnAw3KOzfDSC2GKfgS8g==
X-Received: by 2002:a17:906:488f:: with SMTP id
 v15mr4167034ejq.428.1623922298809; 
 Thu, 17 Jun 2021 02:31:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/45] runstate: Initialize Error * to NULL
Date: Thu, 17 Jun 2021 11:30:54 +0200
Message-Id: <20210617093134.900014-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peng Liang <liangpeng10@huawei.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peng Liang <liangpeng10@huawei.com>

Based on the description of error_setg(), the local variable err in
qemu_init_subsystems() should be initialized to NULL.

Fixes: efd7ab22fb ("vl: extract qemu_init_subsystems")
Cc: qemu-stable@nongnu.org
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
Message-Id: <20210610131729.3906565-1-liangpeng10@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/runstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 15640572c0..10d9b7365a 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -747,7 +747,7 @@ static void qemu_run_exit_notifiers(void)
 
 void qemu_init_subsystems(void)
 {
-    Error *err;
+    Error *err = NULL;
 
     os_set_line_buffering();
 
-- 
2.31.1



