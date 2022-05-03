Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C50518DA8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:59:38 +0200 (CEST)
Received: from localhost ([::1]:40092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlygL-0007kJ-BQ
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW9-0001Vd-02
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:05 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW4-0003YB-Tk
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:04 -0400
Received: by mail-pf1-x42c.google.com with SMTP id v11so6093062pff.6
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WN+exJ1hbQPzvMVT+L6AO18pYzO8jIYQwhbqxtMuNbU=;
 b=z5qul+tKrMWBjIMyxDqBAHSxaIjC8t0vuywF+XiC0leeeoVVy1yxxMD229Xbdu9Eh8
 2O7IP+5ewmqq5TqYog3fxI1h74kJuShtqVRh+kxYF/0/iSvuDGkO2rgkO60hcwR6NDYu
 Bhv4/MuByOjl5x+2TLj/Q2x+M7wpDmzeLvQ3+J8CjlJ4EoNHFH1v1RaOtFtJ48eHKvNa
 erTwncCB6hgL09RlH8IFBUWe4oF7lFRm8ixKMBh/jCmj/G2LQSkm5ZAo+MbzwuEwi9j9
 ed/7l5+B/TvVDIOfaBmI9ovExrgRxIkWihyiwPWmRPmc2SOIVWv7juVXZEbHgmUaZ9Ni
 xnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WN+exJ1hbQPzvMVT+L6AO18pYzO8jIYQwhbqxtMuNbU=;
 b=smItWueoY9MIO6pHUJynHJnKa/YjG8A5S2J/3Fve9jezIB/RhRwRRXAKREEqe9XA09
 oOh/5h08ZMxmEKiCtkIb0whSTWv/jrqTDsAf41X8DkZgGBuf8Dh4MtVZOX9PyUaRXboR
 94sLGWpeSHQ4O3qFr46uLEhOJ55bbzBNi1n+MqVzg6EfszhRSAuEsMCKYO25e9d0/hQJ
 Zx4/yFsnia58DZXq6BKebDrIhgsyGrgJM0em8VXgYQ1l6MwK2qVuTRm+IFD5NmUFb1pO
 Ty6O328S6VmcD1vNiczIInEmbm6LVJPjiLOdwCe66Iru4NwwoxhHJEy6F3+LqQExZP65
 YmpA==
X-Gm-Message-State: AOAM533orzOLbMmdN/nVlXEH1dAiPWx6vU3ORcXiDy9xUXJhiQ8wABHC
 zskEWoBBOLGPWcG7EYwQFDoL3WtUHkBbbA==
X-Google-Smtp-Source: ABdhPJyPLOVP+bS/cbwmYFZjDdvw042ulXxiydDD8CnVeOjnNtB1dCX14laosi7PtE3omyCg4TeA2g==
X-Received: by 2002:a62:15d1:0:b0:50d:3db1:babd with SMTP id
 200-20020a6215d1000000b0050d3db1babdmr17760279pfv.19.1651607339604; 
 Tue, 03 May 2022 12:48:59 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/74] include/exec: Define errno values in gdbstub.h
Date: Tue,  3 May 2022 12:47:43 -0700
Message-Id: <20220503194843.1379101-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define constants for the errno values defined by the
gdb remote fileio protocol.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 33a262a5a3..0a6e0d6eeb 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -20,6 +20,28 @@
 #define GDB_O_TRUNC   0x400
 #define GDB_O_EXCL    0x800
 
+/* For gdb file i/o remove protocol errno values */
+#define GDB_EPERM           1
+#define GDB_ENOENT          2
+#define GDB_EINTR           4
+#define GDB_EBADF           9
+#define GDB_EACCES         13
+#define GDB_EFAULT         14
+#define GDB_EBUSY          16
+#define GDB_EEXIST         17
+#define GDB_ENODEV         19
+#define GDB_ENOTDIR        20
+#define GDB_EISDIR         21
+#define GDB_EINVAL         22
+#define GDB_ENFILE         23
+#define GDB_EMFILE         24
+#define GDB_EFBIG          27
+#define GDB_ENOSPC         28
+#define GDB_ESPIPE         29
+#define GDB_EROFS          30
+#define GDB_ENAMETOOLONG   91
+#define GDB_EUNKNOWN       9999
+
 /* For gdb file i/o stat/fstat. */
 typedef uint32_t gdb_mode_t;
 typedef uint32_t gdb_time_t;
-- 
2.34.1


