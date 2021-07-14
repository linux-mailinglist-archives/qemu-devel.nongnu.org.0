Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF033C87B3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:33:58 +0200 (CEST)
Received: from localhost ([::1]:43606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gtU-0006YU-A7
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m3gZs-0003hH-Qt
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:13:36 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m3gZr-0007J2-4n
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:13:36 -0400
Received: by mail-wr1-x432.google.com with SMTP id g16so3671076wrw.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b+SyzHYFOk1E/GaAQ0K5wVgZaD0erJqoG+fb+9OgOB8=;
 b=Mq5DJDt6LsAiKPtkoJuqhTRoDRgc6444H24A09+6ESOkPaaNdHOA6hJHOSegCY8K/Y
 s2Bv3YlihLmb2glTehL1scff64AC5IzTdWOoqWwMTSIBqjGma0HV+7zoMCKtOfnCN9lO
 zk/OWwsRa9Nm34dhfK1924iYO/L28qaULyW6pVQrM4RAfnpVoHUE8kRmDRbkzrvyvCbZ
 TM5a9KyyW00Gr8pzB82hQA5fXmaaeBVUkG0p7JlvjcG7ylZF5ETDQF3qzxLgUiSG3x/2
 efCzHMWC7kOfONVi1OBKKjShaBu1Y9fORjAl6FURXMUbhqKEhdhEikaCovIonD0k2qeI
 F73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b+SyzHYFOk1E/GaAQ0K5wVgZaD0erJqoG+fb+9OgOB8=;
 b=BZdr+G1ybAgS51Ou5jBjViDJkTbqkJU5wUqibr3fYI/c+chn83nKuWv9AmaW9iJaz8
 pg+z+5Wkj+X73fxGr8GDgmh+FWGkq+93arbXADdVNq1FSWbNmLx1WON/11oGRE7FAdN/
 +t02yRCiOB8QvykfIIkPIt5cG3x5+8FFK3859p0aNBpY9M6p/2t+vP7neq2J6RaOz3BW
 5XwU4bzvYW2RgV8l2ZkBRhzL89IEqd/lTBee7hVaBMq1s4eZTKc6cYYpQRycDRXmBz11
 xF1hoxSGbCte0R9drt1bTm/63TV1AIm4DelNpsoZUT2IYkHHrlTNDg4RsRTuMvBOScNx
 P8Cg==
X-Gm-Message-State: AOAM530EcXClUEd8lGrby9sC9yj2d8tCOadRBVfAu0MJf7zepjBPn+bb
 gXA0Tk3Ct2eQp1F2YO53N7iSt/EDwLg=
X-Google-Smtp-Source: ABdhPJwdRA2yln/Z27sI+P+wfrZCJ3hyIDQtAKQ6N09nBo2Skv6eq+N9+r3aHiBu99/ezw0PFQuoJA==
X-Received: by 2002:a5d:634e:: with SMTP id b14mr13227997wrw.81.1626275612672; 
 Wed, 14 Jul 2021 08:13:32 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 p12sm1623689wma.19.2021.07.14.08.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:13:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] qemu-config: never call the callback after an error
Date: Wed, 14 Jul 2021 17:13:18 +0200
Message-Id: <20210714151319.617860-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714151319.617860-1-pbonzini@redhat.com>
References: <20210714151319.617860-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ensure that the callback to qemu_config_foreach is never called upon
an error, by moving the invocation before the "out" label.

Cc: armbru@redhat.com
Fixes: 3770141139 ("qemu-config: parse configuration files to a QDict", 2021-06-04)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-config.c b/util/qemu-config.c
index 84ee6dc4ea..7db810f1e0 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -417,12 +417,12 @@ static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
         return res;
     }
     res = count;
-out:
     if (qdict) {
         cb(group, qdict, opaque, errp);
-        qobject_unref(qdict);
     }
+out:
     loc_pop(&loc);
+    qobject_unref(qdict);
     return res;
 }
 
-- 
2.31.1



