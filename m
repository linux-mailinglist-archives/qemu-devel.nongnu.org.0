Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9323035424E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 15:16:47 +0200 (CEST)
Received: from localhost ([::1]:59952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTP5y-0008At-K8
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 09:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <basil@daynix.com>) id 1lTP3s-0006nH-Bn
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 09:14:36 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <basil@daynix.com>) id 1lTP3p-0005xa-6b
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 09:14:36 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f12so4915604wro.0
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=VTrBshtwWM7OBOos6MzLeWOAhFnKZTVaBN6IrLzCG4w=;
 b=A+os/uHn6sOyfyRLAsj8d8GkY/2mgccN7XHQdgc2cqLciQAYrLjBkN8qJTvbg8uocJ
 nt9d5zUJG9j7qkwYTFh/AXul0IPoHDe+fyul041rBXs9VVOdW08RsYfpXbdUZOhSSAvj
 0lcdIVWWW0Suj5hsihqx967hiOpctKxWmo/wiBHGkxy+dgFi4kFaHc3+C91BV1f2lBL1
 Z/r39FIssSquhH1JUXnSj3wUZfMllnIdlzP5C4uBKjY7fhS+zrV4o/jrV8HQX4ZEPRTU
 7acf3bXdeK9I3Sp64X8NNOifQ/2IxZ/KXdvsy4PunGQc0UFzwDI14EGgYdZv1lbt2UnJ
 C2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VTrBshtwWM7OBOos6MzLeWOAhFnKZTVaBN6IrLzCG4w=;
 b=jovR5KXKULEeV6kEv0tg4fP3V6Sfdzt2w7zg7iFmgfJgkCNX4vdoBERq16jKI2Rl1g
 +G4yMkbNyjBZv+kj0xWLRTDzeWcEImrD3D25wccr67fQ1Fvx80ptAPGSRsUGqLcwIElU
 yoUfMPsUcC4qtbUuGxJAhDnwtj0sgAcrInv63lBo+D///McUivsvVCHDQkimHrm3FnuT
 pTP/M2x3Nhs9fx/gfwPttj5dXIN+ZB5cpYgn3FK2Y4jnFEfsgkLlD0gVe8rGLTLz0Xop
 9e4+ZGyFbbcJRQn+AeV9Y0lNW5yU5osTTOjyuqCetTYN0gyMnHYJpt+Im35GCG7UCeV8
 DknQ==
X-Gm-Message-State: AOAM533lwgTqZt9ZppJtBjP7ywpZA3sidIKIJ2U21aOpDM2lIAmA9d/+
 P2CJzNyMzy37w9NTGwfjx7KicInXv1wA6A==
X-Google-Smtp-Source: ABdhPJxKT30Wa2rX0bUToU1yFCV20XccyfcKTFLhojfSeF3V+t9lkDqljSLGd5mWLhzzkjic+D9bIw==
X-Received: by 2002:adf:8b4e:: with SMTP id v14mr28852465wra.103.1617628470688; 
 Mon, 05 Apr 2021 06:14:30 -0700 (PDT)
Received: from localhost.localdomain (bzq-84-110-34-91.static-ip.bezeqint.net.
 [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id e9sm12661542wrv.92.2021.04.05.06.14.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Apr 2021 06:14:30 -0700 (PDT)
From: Basil Salman <basil@daynix.com>
To: qemu-devel@nongnu.org,
	Michael Roth <michael.roth@amd.com>
Subject: [PATCH 1/3] qga-win: Increase VSS freeze timeout to 60 secs instead
 of 10
Date: Mon,  5 Apr 2021 16:14:18 +0300
Message-Id: <20210405131420.598273-1-basil@daynix.com>
X-Mailer: git-send-email 2.17.2
Received-SPF: none client-ip=2a00:1450:4864:20::42e;
 envelope-from=basil@daynix.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, Kostiantyn Kostiuk <konstantin@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently Requester freeze times out after 10 seconds, while
the default timeout for Writer Freeze is 60 seconds. according to
VSS Documentation [1].
[1]: https://docs.microsoft.com/en-us/windows/win32/vss/overview-of-processing-a-backup-under-vss

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1909073

Signed-off-by: Basil Salman <bsalman@daynix.com>
Signed-off-by: Basil Salman <basil@daynix.com>
---
 qga/vss-win32/requester.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
index 5378c55d23..940a2c8f55 100644
--- a/qga/vss-win32/requester.cpp
+++ b/qga/vss-win32/requester.cpp
@@ -18,7 +18,7 @@
 #include <inc/win2003/vsbackup.h>
 
 /* Max wait time for frozen event (VSS can only hold writes for 10 seconds) */
-#define VSS_TIMEOUT_FREEZE_MSEC 10000
+#define VSS_TIMEOUT_FREEZE_MSEC 60000
 
 /* Call QueryStatus every 10 ms while waiting for frozen event */
 #define VSS_TIMEOUT_EVENT_MSEC 10
-- 
2.17.2


