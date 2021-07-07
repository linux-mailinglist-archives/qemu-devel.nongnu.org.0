Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC293BE7B0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 14:17:16 +0200 (CEST)
Received: from localhost ([::1]:40774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m16UM-0003n6-LK
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 08:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m16Sz-000371-L2
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:15:49 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m16Sy-0003Aw-6b
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:15:49 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t15so2783760wry.11
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 05:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VMnD37mU4NCWXZXg8Ef7nHklX4qBZh5rC9WVK5rmyMg=;
 b=YhfP3F0KEKphRiu/Oc/+7UsPeQdTCQXHgBeXxogPIx4l2C8yNbbsG0jzNPY+hOq5YM
 3KktQbp8GZ9qE+rV24U1jJBb2SGGATuBetnSOy1IL8gOCpwNAjbSNVAVzK5XdcU6qjep
 MTHfwJftcPwJsyc06xEqmrJWO9q2zW3iNFV0a0EIUMV/UjQoMNTkPKbu18QP9gQrKhwl
 Vi77Sr90aYVeHYsevU1ff1erjZiQ6ljGSytbaJOXG/Y0JPH/RvCGj2jVexKVWLYY7fHM
 qwaKExF7B6ptBZ8r3UvEIKM+iE9yE+2G8HnKiRMXb+W6K9frR/5ZSElrlO6p/pZBhAfE
 g+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VMnD37mU4NCWXZXg8Ef7nHklX4qBZh5rC9WVK5rmyMg=;
 b=b0s/DAlABEvvYZHtx5zXpUrdUuFMD5AtGYXa2t2pJMV324neZSXH6NFocQBrKrnO2Z
 v/fgswVtxMY+Y86NzuZ+TT1Sq2wlNqzN6fqdi6O16Ml2JZeyZVS7vS4Trj4NVDX0JWO4
 AekNH1/5bQpjCnVk76LQqVCdEe2S4OMPjTRQHMUW7nY1B+TVqFp32FbBnt/IQmnD25jT
 T6WpoybAKMaKBEtnI+b9x6Nfk6JcCLmUjA4SUjg8orlwwt2raRhYbEQ+VcpD4KR6vQxS
 pgMZd5hZsIWryvTFULxpeCj6MiyktFkSW/Ec/h7mUXTEmvp7jjNhnoRefHyLnFKDQzlS
 QuHg==
X-Gm-Message-State: AOAM533UyP3VphhGocAQg6FYJX9b2MOWIoesH2pYFg2YLCwt11tBd/m9
 JRvAha7AAD5pqEzeClp8COJTw0TLTTU=
X-Google-Smtp-Source: ABdhPJzD9RrTcjO6J41og3tIJpBrLWa/mGK3B5FoMNOoqNPUpD8zyOHgKRggFPah2JxXO//v9oy7RA==
X-Received: by 2002:a05:6000:12d0:: with SMTP id
 l16mr28247727wrx.189.1625660146741; 
 Wed, 07 Jul 2021 05:15:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l7sm19987558wry.0.2021.07.07.05.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 05:15:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vl: fix leak of qdict_crumple return value
Date: Wed,  7 Jul 2021 14:15:44 +0200
Message-Id: <20210707121545.361829-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity reports that qemu_parse_config_group is returning without
unrefing the "crumpled" dictionary in case its top level item is a
list.  But actually the contract with qemu_record_config_group is
the same as for qemu_parse_config_group itself: if those function
need to stash the dictionary they get, they have to take a reference
themselves (currently this is never the case for either function).
Therefore, just add an unconditional qobject_unref(crumpled) to
qemu_parse_config_group.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 2004d57108..7b54ddf6f4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2196,9 +2196,10 @@ static void qemu_parse_config_group(const char *group, QDict *qdict,
     if (qobject_type(crumpled) != QTYPE_QDICT) {
         assert(qobject_type(crumpled) == QTYPE_QLIST);
         error_setg(errp, "Lists cannot be at top level of a configuration section");
-        return;
+    } else {
+        qemu_record_config_group(group, qobject_to(QDict, crumpled), false, errp);
     }
-    qemu_record_config_group(group, qobject_to(QDict, crumpled), false, errp);
+    qobject_unref(crumpled);
 }
 
 static void qemu_read_default_config_file(Error **errp)
-- 
2.31.1


