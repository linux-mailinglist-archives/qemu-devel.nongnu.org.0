Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786422E9A69
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 17:13:11 +0100 (CET)
Received: from localhost ([::1]:45990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwSTm-0002g9-0N
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 11:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwSSk-000225-Gv
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 11:12:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwSSi-00011D-NC
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 11:12:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id q75so19860588wme.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 08:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h8pNyJ836HLzEfXpdcCWNxjo3UWXVl+yWbBekmEdz4A=;
 b=zuL19lO2wYFJJokJ6C4AgI/DfbwFQJEQqYVOlTRU9q1XyDc7v6qANVOVaKsPLmBKEM
 l/sA9CHPoT1ZQgNT7nY8emC3TlbTZ4yXU/UvVxzABo5fF/2oNDrD91IPZGUsq0XjZ5lk
 k2cbkxhs5TuTKTxXMkybovHUHXo1420mYi3BNrK08obq5gAY9aOZ0qVOqevuSq0gWxJ9
 jdw3wFBsZzxTcQcQKqBPviBcrBIzcXsomU0wuG89SgKlYvT9xP3R1/SFkabXOd2ZBONG
 A1wl8LWukq9JO8wiB740yEKN63u4UhzsxXwBDtxQKiQASRQyMRWtWgK7sDqw5GMVmpPg
 fN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h8pNyJ836HLzEfXpdcCWNxjo3UWXVl+yWbBekmEdz4A=;
 b=hm5r3colKbvocdC3Jjzg6M1TU2+Dg4ahKGrmfBOqONYXS5M8znj4UD5MwJDxiYKZjN
 NI+D7Z7+CJ/6cTmKnkJvAXnxyrTPJF+jp9gf0Oz6UJieXfmRxSqfMEWlmLrdFaIjTkJs
 N1d/gZadRFWnRHQTwRtoUfanFH/tnUC7fG3f9R5EdN8N0IpmddsIsg80suxBBGJSCD8r
 1jv3fLIpLRCWmdzrZ2rUZXcFCCpBv/rqB9txAxTblyl1okWcVIm6zHx87QDjGO3NbHJ8
 73t2LfDFhg7SjjYU6GIvk/4+mnU7q7spvGa8NdTD8VByU6DUE6o0zFC31j/Ebvh4B0aH
 Q6tg==
X-Gm-Message-State: AOAM531pvslYbJS5Uz3n2mQ0LhpDBql/NYkEGVC3CISBfQc3dtV21xup
 Vj6vGsK3TGHDfzPISDSe1YA6mNMpqz0oQQ==
X-Google-Smtp-Source: ABdhPJwuz9jcjzmrLJ3HZrKrytCHXn8JwLwysEoRudPzIX6UNcEt2jqBAfEPXjvnQwjfYgUmdKHHxA==
X-Received: by 2002:a1c:7f52:: with SMTP id a79mr27078446wmd.157.1609776722479; 
 Mon, 04 Jan 2021 08:12:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b19sm34249812wmj.37.2021.01.04.08.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 08:12:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] monitor/qmp-cmds.c: Don't include ui/vnc.h
Date: Mon,  4 Jan 2021 16:12:00 +0000
Message-Id: <20210104161200.15068-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qmp-cmds.c file currently includes ui/vnc.h, which (being located
in the ui/ directory rather than include) is really supposed to be
for use only by the ui subsystem.  In fact the function prototypes we
need (vnc_display_password(), etc) are all declared in
include/ui/console.h, so we can switch to including that instead.

(ui/vnc.h includes include/ui/console.h, so this change strictly
reduces the quantity of headers qmp-cmds.c pulls in.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Spotted while trying to reduce the number of source files that
indirectly include <gnutls.h>...
---
 monitor/qmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 34f7e75b7bf..c95e5001d72 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -23,7 +23,7 @@
 #include "qemu/uuid.h"
 #include "chardev/char.h"
 #include "ui/qemu-spice.h"
-#include "ui/vnc.h"
+#include "ui/console.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/runstate-action.h"
-- 
2.20.1


