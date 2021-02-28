Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F7A32704A
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 06:03:17 +0100 (CET)
Received: from localhost ([::1]:49464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGEEe-0002HT-8K
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 00:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGEDu-0001sN-SQ
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 00:02:30 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGEDt-0002hy-Co
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 00:02:30 -0500
Received: by mail-pj1-x1033.google.com with SMTP id l18so8616008pji.3
 for <qemu-devel@nongnu.org>; Sat, 27 Feb 2021 21:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Dwv/yU8l+chSZlF4QjjujpCRnVXfnxiyJ/lQOdkJj4=;
 b=hd8N72cWqZ10dAVXEZANRGrWf9w7nfQmPQ+Uj1yC3XS8JFiyxP4LuDmSCaZuG60wfR
 eEFIdmEMOeLb9FK0OWPqLdGEECK1CWqKQvUDF/lS7EXEdgxU35kwLlJYS2VudcPJNSbH
 ikjzjTqKEliwH0XFya2v1ZHw031H7qBmAYnqbeWNPwoZzLM8+v4SvnrfihwWY35hiBYL
 ClzYKURXjTSBmkDXuk018r3c15vsovz2I6bTZiDz7XCV6Z3zSiIZlMlBSVys5e65goQL
 /LLxf5BX5JygVQSzbzguzerxPOhoUuAtgkhGhpOnIpX9dtPUt/563rYUs+tGhXg2Towb
 ep3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Dwv/yU8l+chSZlF4QjjujpCRnVXfnxiyJ/lQOdkJj4=;
 b=GugvHKg1fERnewnxZTGbYqUXntPTbo7731jskyd5MwllOqj4cvYwqZ1xfmV+9GroEj
 Bq/3o19NxJKYf4RRhyReefRH41btQiGvumt6lGGqMiPGQVE1DYuzzb7JI/GvydOPX0MU
 d47NeOwLZuVI6FMdmjhyFLFjgpmMoFxxGf/+t/C/RD5w+G1PbQZXUDc2OMWNOzxVWq/4
 xd2xUHFGVsEZv1Shk2idKOF2RGWna6fJEaRh2D38btpMHUc+PtO157PYsghNJXyLVO1x
 /sx8BlM9WcPgw7w66iLVoLOT81bLNstF6E4/Z5Yy8FgCEuZgR6e4NswQtJbQXcLC6RjL
 A7Iw==
X-Gm-Message-State: AOAM530q3RgD+ESZA2W9aES2VJ+YwyUGXcFzPY6vVJDCCbIhGt50jX+e
 NQoZs9MdwsJ06kWPI3eHq9I=
X-Google-Smtp-Source: ABdhPJwN1cibU/vl0izpX6RrN8Bl/9lF7N1zznJwDREt6EMj2brTSPUTfRO0PCyIkLJ4BAAu7owk/Q==
X-Received: by 2002:a17:90a:3d47:: with SMTP id
 o7mr10830893pjf.149.1614488547491; 
 Sat, 27 Feb 2021 21:02:27 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id fs9sm2929344pjb.40.2021.02.27.21.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 21:02:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] net: Fix build error when DEBUG_NET is on
Date: Sun, 28 Feb 2021 13:02:18 +0800
Message-Id: <20210228050218.24517-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

"qemu-common.h" should be included to provide the forward declaration
of qemu_hexdump() when DEBUG_NET is on.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

---

Changes in v2:
- add "Reviewed-By" tag

 net/net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/net.c b/net/net.c
index fb7b7dcc25..32d71c1172 100644
--- a/net/net.c
+++ b/net/net.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu-common.h"
 
 #include "net/net.h"
 #include "clients.h"
-- 
2.25.1


