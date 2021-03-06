Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6953632F97D
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 11:56:44 +0100 (CET)
Received: from localhost ([::1]:38972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUby-0007fM-S2
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 05:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZo-0005mb-I2
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:28 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZn-000856-1J
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:28 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso847105wme.0
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ynw4rHhm1APNekgRpZNjLyKWr2jA0nlwh2JMlTwzrKk=;
 b=bT4EBgDOYQEG5RsxCMOsv3vvIpJvJUwh5OZk862a0v2C8Cn4LKevMLGC//QD36+tEf
 xprAm7QJO3zDt8AaEr++3P+nKqiKGIPPZLHDmwAfPzgXBpqJSx970d4oplL1e3eriOxz
 Ft7452lrEnx0z0fincxlgNSOJ3+BBeqysIN5drsMz+T7xmO41NOgzQ3jB2YswatqasAC
 PJvv/n9FVfoJ1jHwdZjSwgRutbrcWRdhaWGqlBLtW5sQNGHDVYujVzMotqQ0QFKTuffS
 WqPcZ673Mqy8ASaNJ/ukxDvubvd68xl4GTVfeGWfCkJHcdVNa4/qmYvpUY5UvaQP/8z4
 7Vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ynw4rHhm1APNekgRpZNjLyKWr2jA0nlwh2JMlTwzrKk=;
 b=jrQl341rHtHjR7TjYKW8SO+rdH3MiuOdBDf08JwSnJ7pG21oaciw+XOPI4iKNY95cd
 pjVl5ZQ1LlKXZ2wYlIkISG0E7RsGJAfH9j1Gigqt0/vT5eVM3yoXQIO/FZLik24UqJ7U
 QhYhI5Y4Ow0S5cKAuUMhZswn0oRmS1q8y5HmsLhWIKvrtmcEyU/oXGhjDoC4Ndk0m5qr
 EKngyNVpGhhfokGsYLGQiMJ99O44rdS+4TH/DRzAiEQ0zDZ+UX9R6mpIa/KsGskVsrqp
 OD9mWS9e99Iy3K0MTjXfe8wsAUGgHby1++I8cvxlH5rUyX83R6+0/INDDmote02Yh2m9
 4bag==
X-Gm-Message-State: AOAM532o3yNZpdT/Tk6xy5BqpF9IbMPvGzfuvN1YcPxfnHB41jLmP5YM
 RxLhObvAvwjvEWnxPpfAgbuKJORGWV0=
X-Google-Smtp-Source: ABdhPJzIBVSttxX7y6WD0dpsc2mMHAX7jeFRn32m7F1m2C8662pOGRG8mFyRtWoA5uUF0/aiUb+wSA==
X-Received: by 2002:a1c:5f89:: with SMTP id
 t131mr12654201wmb.173.1615028065791; 
 Sat, 06 Mar 2021 02:54:25 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/23] qom: Check for wellformed id in user_creatable_add_type()
Date: Sat,  6 Mar 2021 11:54:01 +0100
Message-Id: <20210306105419.110503-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

Most code paths for creating a user creatable object go through
QemuOpts, which ensures that the provided 'id' option is actually a
valid identifier.

However, there are some code paths that don't go through QemuOpts:
qemu-storage-daemon --object (since commit 8db1efd3) and QMP object-add
(since it was first introduced in commit cff8b2c6). We need to have the
same validity check for those, too.

This adds the check and makes it print the same error message as
QemuOpts on failure.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210302171623.49709-1-kwolf@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qom/object_interfaces.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 1e9ad6f08a..7661270b98 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -8,6 +8,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qom/object_interfaces.h"
 #include "qemu/help_option.h"
+#include "qemu/id.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qapi/opts-visitor.h"
@@ -41,11 +42,19 @@ Object *user_creatable_add_type(const char *type, const char *id,
                                 const QDict *qdict,
                                 Visitor *v, Error **errp)
 {
+    ERRP_GUARD();
     Object *obj;
     ObjectClass *klass;
     const QDictEntry *e;
     Error *local_err = NULL;
 
+    if (id != NULL && !id_wellformed(id)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id", "an identifier");
+        error_append_hint(errp, "Identifiers consist of letters, digits, "
+                          "'-', '.', '_', starting with a letter.\n");
+        return NULL;
+    }
+
     klass = object_class_by_name(type);
     if (!klass) {
         error_setg(errp, "invalid object type: %s", type);
-- 
2.29.2



