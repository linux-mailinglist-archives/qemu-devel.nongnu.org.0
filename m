Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F01A3A814A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:48:02 +0200 (CEST)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9Q9-0003DR-IU
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HV-0005a1-Uk; Tue, 15 Jun 2021 09:39:05 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HR-0002eM-Fy; Tue, 15 Jun 2021 09:39:03 -0400
Received: by mail-ed1-x52f.google.com with SMTP id t7so5973316edd.5;
 Tue, 15 Jun 2021 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DClC4N0hOztFtxZU3fiXh86K8OwDPTmIEleNDEV+GRg=;
 b=O7S119gFZP+sEGMdLHbhWlgfVY2hwOWxXzFWBywBqPuy/zTs++791AwysbVa+vJzfM
 QOqDjZdBSwDFXkCZxas/Osj/KLJnHxsUgO+mJzU2ZWuoczwUMDk2Kk1XLQXbjfx6msh4
 4eNrTkwu/Q+57JYzLa0EA/8jGxqsVOPV648iJgPSV8foIV0gwGDmBjNYC+DSO5a9q542
 T+z8xwsfkXQ+6sX9mmntVWceinqSon6ILl7bCCJh+uw6jIFcxgRM3c/+91Taue9By7sQ
 CEg/+wG8Ktbu1NixsUlGsSbST1Zy4HPkllQdsr9OtVyQ37sDg52AlXR1jt7PXjagscbu
 xZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DClC4N0hOztFtxZU3fiXh86K8OwDPTmIEleNDEV+GRg=;
 b=nq9u37JrULasaieChwnUg5xmh/9B+PQHSggEcZooS704wHluKTPTQiG+2TitVbWGZB
 lZPGpZDQbB5bLr3DVpy0FmkjhAiZ0tKFDscxva1eMkj+53v3WqD+BoVJYc9xyPYcI2QN
 MemTdb15URIN+xXea9BlMrhyOnVyItLI3AAr71TqbU4KrfhshcJyCBkPhy8v6tlwOXoW
 usxDqs0qpjw9pG0bW1zENe+MNr2M8iL2D65J1m3Lv7x0tMPEb4b5JLIL7b/TCzwI4mrE
 A577fqOGoaNvz5SphMBU96YVWpJjFhI1Xem3EWpv/uw+PXUWqvFWKC6lxYgn8IfK+zMK
 pOHQ==
X-Gm-Message-State: AOAM530wBgqF9WxqaUm6gUQhznXzd/FWeupVsl+NwxmyHU13oIOD9pjd
 5ToFny9FbQQ+1W7PILTRdANqpaj/f7o=
X-Google-Smtp-Source: ABdhPJyvA0nmNKc9omsMfJPpuLvnEY4UL3eibVU9NtBrqMYfmjlAYIxjz3i8sopn0+kabrJStHttVw==
X-Received: by 2002:a05:6402:b17:: with SMTP id
 bm23mr23148668edb.236.1623764339803; 
 Tue, 15 Jun 2021 06:38:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:38:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/33] qemu-config: use qemu_opts_from_qdict
Date: Tue, 15 Jun 2021 15:38:25 +0200
Message-Id: <20210615133855.775687-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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



