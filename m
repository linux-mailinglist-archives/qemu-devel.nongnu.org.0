Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1F73AAFDE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:35:56 +0200 (CEST)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoRH-0000ms-H3
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNB-0002aN-86; Thu, 17 Jun 2021 05:31:41 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:46733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoN9-00060r-C2; Thu, 17 Jun 2021 05:31:40 -0400
Received: by mail-ed1-x529.google.com with SMTP id s15so3014664edt.13;
 Thu, 17 Jun 2021 02:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DClC4N0hOztFtxZU3fiXh86K8OwDPTmIEleNDEV+GRg=;
 b=XCXGOFoxS2/QR0BNcTPwxXWTIZpvsP7/DZqFhpzElKZoHhzGR7JiDuNxR9LDEaLi9K
 b72XTzjE/45bKk7VLr3Cfz+1c8au7uuieEvZI8xIItzyIi4AqktGjEKoak6/+S8aJ1Nn
 g8sl60lus9tDM7lo+DJxE9cso1aShUtnzr3pURtYgqUPt5PEX3NwOgZ/ibeUR3d8NI9w
 PcvEyhS8VzGe3rQWwMuE9UOcolcr6GWv43oX2Xh1zWjaOpqdCvpwrXmmKE+X2EhSu3Nd
 637pfBG9d7GJiwVSTLh94B1z/QqVWSSg3excz79MjQvYXcPZ0Z+vxMIZfdwomkuTHPMh
 2DsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DClC4N0hOztFtxZU3fiXh86K8OwDPTmIEleNDEV+GRg=;
 b=jyteUrb04QKiD89oCfjWBQ3qWd61DLbmvtInC/lAzAPeo3Jq5KvkYq5FiSzGDJGTT3
 e+KVtWvROpeyd8RgUp1BOUubDgqsQrCidZql42kr7oV+pPx8eiYL7U29yK/NbOMyjav6
 nR1spbrnmxE5OzGLDF9GSGCNF0mXDjzWTzvNkgttvcFRS7b9nE5s7sM5Ewfbma/nlrwk
 aCvoJE1hdadUPsGtX2LiC2+4chXkU5Nl45naiu98rZhAaLLSiIJ9Ei121gpLlyuxdLBi
 E3nibKzn+Alj0y485WjjSIDlMhbysV0wqC0Qr2vUckvqpKJLNUi5IX292XpizCpqKaMN
 by7Q==
X-Gm-Message-State: AOAM532l6bOZBOMPh+oN4ExM8QnPg++UoUscg4GqGKDgUYnCHpnnY5wc
 bxmdz1s0Jhy/P8X5eZgIGWf7lS6Rc3w=
X-Google-Smtp-Source: ABdhPJzzv56jtdvp1oncDR0Uik9MPnw/pGoS2nz7cxoU/LFsE3uHVeFASYLYFTEe9qBKH1LUuA1r2Q==
X-Received: by 2002:aa7:d388:: with SMTP id x8mr5144496edq.338.1623922297338; 
 Thu, 17 Jun 2021 02:31:37 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/45] qemu-config: use qemu_opts_from_qdict
Date: Thu, 17 Jun 2021 11:30:52 +0200
Message-Id: <20210617093134.900014-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using qemu_opts_absorb_qdict, and then checking for any leftover options,
is redundant because there is already a function that does the same,
qemu_opts_from_qdict.  qemu_opts_from_qdict consumes the whole dictionary
and therefore can just return an error message if an option fails to validate.

This also fixes a bug, because the "id" entry was retrieved in
qemu_config_do_parse and then left there by qemu_opts_absorb_qdict.
As a result, it was reported as an unrecognized option.

Reported-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Fixes: 3770141139 ("qemu-config: parse configuration files to a QDict")
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-config.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/util/qemu-config.c b/util/qemu-config.c
index 374f3bc460..84ee6dc4ea 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -429,29 +429,14 @@ out:
 void qemu_config_do_parse(const char *group, QDict *qdict, void *opaque, Error **errp)
 {
     QemuOptsList **lists = opaque;
-    const char *id = qdict_get_try_str(qdict, "id");
     QemuOptsList *list;
-    QemuOpts *opts;
-    const QDictEntry *unrecognized;
 
     list = find_list(lists, group, errp);
     if (!list) {
         return;
     }
 
-    opts = qemu_opts_create(list, id, 1, errp);
-    if (!opts) {
-        return;
-    }
-    if (!qemu_opts_absorb_qdict(opts, qdict, errp)) {
-        qemu_opts_del(opts);
-        return;
-    }
-    unrecognized = qdict_first(qdict);
-    if (unrecognized) {
-        error_setg(errp, QERR_INVALID_PARAMETER, unrecognized->key);
-        qemu_opts_del(opts);
-    }
+    qemu_opts_from_qdict(list, qdict, errp);
 }
 
 int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)
-- 
2.31.1



