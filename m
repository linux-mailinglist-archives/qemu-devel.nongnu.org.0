Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470EA39236D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:54:25 +0200 (CEST)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3M0-0000x2-AC
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FJ-0005c4-Bu
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:29 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FC-0004V2-Q9
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:29 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso1272777pjb.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mpkeb86nCt4YUDAKzgfY/W/JicHyTofw1YZI7AZcguo=;
 b=Yg4Hs4z/XzZXsrOsVa3KiNKOzgy/3jAsZ8Ujh8Z+su1RkMXvKXV5/pVQ7cQhX44tb2
 ohq5tgetdDVfQ5xCDHjhmheix4fUryCyN340W8DQNmhUxLuNjHdXgeUBb5pZ91Y8v44E
 JnmUsq+OFD3/3QH/IVMk5qpg3MXsPRWFqL/LUx4CSUBOnt/KnSz796E+PkPbw0meDoMp
 RDnxZuD7i/ZmcWF/jprdz4GVnYt957ebZ5Esh8VLRMd+qLEeJLRPyxi2zZ/tCPo+lchX
 ZCflVSLjxUD85pwVTaBt5rmeS19/Nkr9Lk8jk1THzk6nZGVvunnQ8Qvq23smVZilIWue
 +9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mpkeb86nCt4YUDAKzgfY/W/JicHyTofw1YZI7AZcguo=;
 b=hGujgCa61953D1P9DW2m9A6PKN/pw/I1J1NlYaJHS6Sn7OZS6kAu87JURTWxsT9+cg
 FsyRn41f6fnmZ3R039yW+0nDY/NR6PKm0N4MhWfvxLI15o3XXIEQ8v8TSB17uc6usecJ
 KbnHo+WGcBAtCjGzyuhP2xejJj3M+zRi8UdjJTIjECSwPxu+0DvDS/Iz80zFFcZGwG6A
 CX5v1CWbbo5fzWoSODbWprLAflGykThxqCpPLMRvuve9TmE2lUroNkFb8xSHRsSHJ+3j
 MAnwj+xfdvw00hhHC5buqgsTpaeZOG3pq5GKSJxWVepIW3KcsKMSiXHfVOlPEuR2ecwa
 S3XA==
X-Gm-Message-State: AOAM530d1sbwgMQ8+JbzNdY2o0g72h9bqU9Ni9MJBq4AAfSuytsyTYi2
 HbUqO1MlgsBz830WI2Rlazo2KVQ6jHs49A==
X-Google-Smtp-Source: ABdhPJzEgTmX3eRZZaiPZuzShuQeeOBNE3bMcOp37LZDvz44OMnqgaQ70nO5oxpd5g/NzTN9rBNHmg==
X-Received: by 2002:a17:90b:341:: with SMTP id
 fh1mr707193pjb.136.1622072840374; 
 Wed, 26 May 2021 16:47:20 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/31] replay: fix watchpoint processing for reverse debugging
Date: Wed, 26 May 2021 16:46:48 -0700
Message-Id: <20210526234710.125396-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: peter.maydell@linaro.org, Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch enables reverse debugging with watchpoints.
Reverse continue scans the execution to find the breakpoints
and watchpoints that should fire. It uses helper function
replay_breakpoint() for that. But this function needs to access
icount, which can't be correct in the middle of TB.
Therefore, in case of watchpoint, we have to retranslate the block
to allow this access.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <162072430303.827403.7379783546934958566.stgit@pasha-ThinkPad-X280>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/physmem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index e1da81ed2f..1c8717684a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -904,6 +904,16 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
         if (watchpoint_address_matches(wp, addr, len)
             && (wp->flags & flags)) {
             if (replay_running_debug()) {
+                /*
+                 * replay_breakpoint reads icount.
+                 * Force recompile to succeed, because icount may
+                 * be read only at the end of the block.
+                 */
+                if (!cpu->can_do_io) {
+                    /* Force execution of one insn next time.  */
+                    cpu->cflags_next_tb = 1 | CF_LAST_IO | curr_cflags(cpu);
+                    cpu_loop_exit_restore(cpu, ra);
+                }
                 /*
                  * Don't process the watchpoints when we are
                  * in a reverse debugging operation.
-- 
2.25.1


