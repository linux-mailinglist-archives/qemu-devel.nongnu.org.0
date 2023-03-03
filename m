Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000DB6A8F98
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:02:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvco-0007VL-25; Thu, 02 Mar 2023 21:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvce-0007QL-Iu
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:17 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvca-0001oU-Qu
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:14 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so4851499pjh.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbTFZ1f//WCKqJl3a99CsWy+g64MYDHqVH/YBzELWfQ=;
 b=PdQhN+5WzOLuvf9oh8UeVRam1saPkfblLm1VMWgrwjxS/M8iEYkEcNHkvXnguipXtn
 +4EJkwyxPCsL1BTwrH+5i0XeSPAwxx1Ii55QYn/P4d29SGhOy1PVm+CbggSGZpHVsE8N
 CrE8q7ofNAAZwiZxx+E2sGX+zqWEX7JpdXWz8Dfv7tbCvgSxnxLmgjE7VHyxI4rvJpnS
 5XjqV0VUqyBfaoLuMZOc5TtW5FylxiE6+2Ztn9XMxGuSOp98ZAvgXhwDEVhOcnTn5h8F
 v1pjo27tqzB95TCXl5XEcLu9EFfP89dMRWdh4NMKU1vqOFqF2yjqVkOTSNOkIrpYgiuw
 Jorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vbTFZ1f//WCKqJl3a99CsWy+g64MYDHqVH/YBzELWfQ=;
 b=mzocMwjyN6JiIEiKIFVZPp0REzGVDGus9kSbRo+A78eJgyM9PchlQLxN671PdGlh/L
 NGrv0L8IuzkUzvVsruzD1TbfNJI/FBMY0C/+d3nEfksOl0+zuyw0KrLX4GkpEEpkrLY9
 XqmGUNdoQuiu5r7aLzii2rw9r5d1H9rq07I+3ZDQ/7dp+USfm+hZ3A7LEwesfclNKPDd
 CFvx0s9j057wDR0Fl2rqhzI8EuzTYWOZSiKgscJAoAYH8RryBGnAyK5XT00LHiSVEzk+
 thpNAiE2fO31Optzv3OcEAJcLL3uI9MYJ96nV/5iJHkGhGJ4Hub1qOD38hto6llqlYmo
 sTqw==
X-Gm-Message-State: AO0yUKVFqU9zWwpeSIkdnkw7EQMXHOAlbDyw1tPRHT7sqlKnkmZb/pMl
 9cCFKLiQqVqkd//SXfQPd1LbKOSCHLAY4CJ4hq4=
X-Google-Smtp-Source: AK7set+ADXOFQAsm3gMWqAT3/3d0ZKVYZ72mgyfcnF3dFV9kdcjP9CljLnMbtuvLzlQHfYik9pGPbA==
X-Received: by 2002:a17:903:22ce:b0:19d:90f:6c6c with SMTP id
 y14-20020a17090322ce00b0019d090f6c6cmr698619plg.17.1677812291174; 
 Thu, 02 Mar 2023 18:58:11 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 04/29] gdbstub: clean-up indent on gdb_exit
Date: Thu,  2 Mar 2023 18:57:40 -0800
Message-Id: <20230303025805.625589-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alex Bennée <alex.bennee@linaro.org>

Otherwise checkpatch will throw a hissy fit on the later patches that
split this function up.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230302190846.2593720-5-alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index fb9c49e0fd..63b56f0027 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -3021,27 +3021,27 @@ static void gdb_read_byte(uint8_t ch)
 /* Tell the remote gdb that the process has exited.  */
 void gdb_exit(int code)
 {
-  char buf[4];
+    char buf[4];
 
-  if (!gdbserver_state.init) {
-      return;
-  }
+    if (!gdbserver_state.init) {
+        return;
+    }
 #ifdef CONFIG_USER_ONLY
-  if (gdbserver_state.socket_path) {
-      unlink(gdbserver_state.socket_path);
-  }
-  if (gdbserver_state.fd < 0) {
-      return;
-  }
+    if (gdbserver_state.socket_path) {
+        unlink(gdbserver_state.socket_path);
+    }
+    if (gdbserver_state.fd < 0) {
+        return;
+    }
 #endif
 
-  trace_gdbstub_op_exiting((uint8_t)code);
+    trace_gdbstub_op_exiting((uint8_t)code);
 
-  snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
-  put_packet(buf);
+    snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
+    put_packet(buf);
 
 #ifndef CONFIG_USER_ONLY
-  qemu_chr_fe_deinit(&gdbserver_state.chr, true);
+    qemu_chr_fe_deinit(&gdbserver_state.chr, true);
 #endif
 }
 
-- 
2.34.1


