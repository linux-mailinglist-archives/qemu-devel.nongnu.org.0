Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428E43C1645
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:47:06 +0200 (CEST)
Received: from localhost ([::1]:53896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WEz-0000OS-7W
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnF-0001CN-Sm
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:25 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnB-0008L5-0K
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:22 -0400
Received: by mail-ej1-x62c.google.com with SMTP id c17so10206221ejk.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D1LwxSKpvmQHORK5d6Lk9IDrh5/OjUa/lWWSxJEsvEE=;
 b=Mupqm+KXukD3LDvI59Luc5GD1lK7CGNJwVK/VqXTQuE41UpiK/aNH77eMdZAmwFdzu
 fTyCN6be0Z1CaOE9dp/OI1dF/wWr5byU63D81DROQFoDtTpTwJtVF2wVaCS5jtbkp92Y
 Cq3POiAc3e1YyY0FY4yprPlLv7fQ+YsioMKPnhflr5EZFrkf6d3AtQN7PKwqjBTGaMxO
 kcirWVjtlmc04nQ271xxqs/XcFTkEGp276kHXFvUCZFLcA8gci/4A+qLPBoAfW/XC3SV
 VhwV62jT/rWFZeLJruevwYJyLbD8QPyJUNN4Q0afiHlrxi9cu5SN1gahePAHqtKfWBm/
 ucLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D1LwxSKpvmQHORK5d6Lk9IDrh5/OjUa/lWWSxJEsvEE=;
 b=JjedJYmmQkoyBUjWZyFIKmDX98GVx7J29FqNGIuF4KXETyFMTroEJZsF7pcCJUVv8b
 wEzAvzw9WAWrhWDSpWUZROc9eJ8T1i1jF90LlRtDCIoV2X4USzUg7QfA+1A44EIfVRiU
 TueawmiBUp+Y5HD1DEwQ6Y6FreZz/Ai4Ok0ZsoSrBO1K40ZAVeam3tjHNNWU2dmeBHD6
 wLR+jFhibkhKXLRu84vrR8tvNXC6FF6O+mexeQ0sKdztwZ+q+xU/QCErdI05fgRkOORt
 NG2tfB5vW8PA7VYQF5KiCStj1NRaqW4XLfszSx365pT0fWy6OqlV9pBVfNerljCKhiGe
 yitw==
X-Gm-Message-State: AOAM530ZjKPPtHT4lTBsRtOGrbkpsAWT/czH+7ha27iGN7bdNnShXAiz
 buWxFVnZrKVCmSm1iCl1t646Pb0rWtE=
X-Google-Smtp-Source: ABdhPJxWzR99hSorN0jVzQXWR/lpVAUPnF0yceo8eKQhklVgiazyvo9ZBds4lMaWBbJocVhrDbDR5g==
X-Received: by 2002:a17:906:58cc:: with SMTP id
 e12mr31439808ejs.279.1625757499383; 
 Thu, 08 Jul 2021 08:18:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 42/48] vl: fix leak of qdict_crumple return value
Date: Thu,  8 Jul 2021 17:17:42 +0200
Message-Id: <20210708151748.408754-43-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
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
 softmmu/vl.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 2004d57108..4df1496101 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2193,12 +2193,17 @@ static void qemu_parse_config_group(const char *group, QDict *qdict,
     if (!crumpled) {
         return;
     }
-    if (qobject_type(crumpled) != QTYPE_QDICT) {
-        assert(qobject_type(crumpled) == QTYPE_QLIST);
+    switch (qobject_type(crumpled)) {
+    case QTYPE_QDICT:
+        qemu_record_config_group(group, qobject_to(QDict, crumpled), false, errp);
+        break;
+    case QTYPE_QLIST:
         error_setg(errp, "Lists cannot be at top level of a configuration section");
-        return;
+        break;
+    default:
+        g_assert_not_reached();
     }
-    qemu_record_config_group(group, qobject_to(QDict, crumpled), false, errp);
+    qobject_unref(crumpled);
 }
 
 static void qemu_read_default_config_file(Error **errp)
-- 
2.31.1



