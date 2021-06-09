Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3338A3A14AD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:42:17 +0200 (CEST)
Received: from localhost ([::1]:38322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxXE-0007Q8-94
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqxUe-0004MF-82; Wed, 09 Jun 2021 08:39:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqxUc-0006MN-Ok; Wed, 09 Jun 2021 08:39:35 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso4172922wmh.4; 
 Wed, 09 Jun 2021 05:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KzWaT1zEyy0mcZM5vZp8UDBcHlbr5yY7b9Gv6Pp1ZqY=;
 b=AHFWf31R9/DEObR44Sk1VTUpOf93axqMzu37F/geh9Gi13cZ+XU1GtzW269CZ8IM/L
 lMBpTpMYnIp+Z22tiqjbqU9AcTSLhJpKXZ+f6sHnq+vtDhYkrBx4dqPxTSmuTzn/2yOK
 8dc9SWLP82SzKQ3QxS3djQnUJlF1Jk6mcJ8Qe1tFgkArKF59Z5ljGW8neVMPImTqYaIP
 gG2QoL839RzjlOts74XNUWch6RT6lb3EtVRDz32vRvYSlicQT0mRlYyfrdxYknA/+EVm
 nlY2YNrA1/1BQrRZ/0F8+w+q42MZau0ocZSoQPBuAEoYVB174eIPhYegDejnQ8o9MElY
 cjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KzWaT1zEyy0mcZM5vZp8UDBcHlbr5yY7b9Gv6Pp1ZqY=;
 b=P4hvLzhc79RgtfP8EUeeWI3wsm4nF+lUhFWs032L009nQf89xmJSlJgXIrxMemkB9i
 KBnQ2l3WCeNajAQL+Od2tlV82NnxlR4eo8PlAiOyBHDWc3ELTzDgKf0jY+pFeeCnElM1
 UWrnklOsLtRilXHFWOVP7jNrSlpesGkP5pFsmHz4n92aqDAyHKEHb3PjEAZ/6YNgGUd7
 C1ZqmUT2RV9H3RhL4KAIHu5EFCgrrhU0m4MpRHn+InpOSxO++2QTQQuoLRq2DGM1T6qy
 BULk0bsBfUSGT634rNv94ZNZHyO0YAX64aJgzFl3Dr8quY64bBq3vO5s93jg6y7WRtr+
 HUwQ==
X-Gm-Message-State: AOAM530xN+cSbSgPUl4GRo5zeQ4rC0NrromZmmfaJnaM3l5ovVic6GZg
 5SnBqz1LX8gi0gorRw3jfKiA3Kmi6vNNvA==
X-Google-Smtp-Source: ABdhPJxfqhn5/NHp7dRLxdFrjCZOCGbRex3V/AoPpUr5/pnboA/+WzNRUbWN10XnRT/NlesmRdwrDg==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr9906806wme.129.1623242373001; 
 Wed, 09 Jun 2021 05:39:33 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v8sm26044380wrc.29.2021.06.09.05.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 05:39:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-config: use qemu_opts_from_qdict
Date: Wed,  9 Jun 2021 14:39:31 +0200
Message-Id: <20210609123931.553449-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


