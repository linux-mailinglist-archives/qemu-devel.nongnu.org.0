Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3D6687286
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:52:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNq1-0006BM-8n; Wed, 01 Feb 2023 19:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpy-00068l-UG
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:27 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpx-0000Qm-Af
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:26 -0500
Received: by mail-pj1-x1033.google.com with SMTP id j5so413154pjn.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGDFqs4b4PgNASJU8FaMgpzRM7ATeSa1LZg6XuMJWq4=;
 b=XgR40jcADklJL6xzlRwWYBJvIOmZY1CAbII19wDLzTILhZ3hqpjXdQs6xVKJRBi1ND
 DAXt7EeAIbNCOMzcxiLzceRBtFrWxbdUNkcJT9pxerFiqS8E/VmU9V413SJM0bnUhKNf
 ef2SoD/ciAV7GgBX0a797ExWDB5AD41gkNnPrTtW8v+ti/4TehckS8QpI+5JkG8rS5jk
 O4TQJLgcnNJhEmdMVQ+8Tz/C9GJ/+BqJz0h/b6uyGl7kyrcVSm1G7fFZ7fVYgx478Uac
 CL2DvRGN9kHwk/+8QTVkdT+fqagmHmcYxpNCzIvEKA+cTwzkvIw7jE3Xv/so+pI11Tj9
 PN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uGDFqs4b4PgNASJU8FaMgpzRM7ATeSa1LZg6XuMJWq4=;
 b=x6S2MGaCfEMzpB8B4MdHioI8N9kBLrogs6kRdGeoVV/FlvFWS5S+K2so1hwXtOSi9i
 Fz6MTfidtv4nynju04IjFDaSacG93QH3n1ixdgi1HkSgd61mmA6mXGmnxydcO1zvuYZL
 e9wVgbj4p9JTEXtm7ghr8qpegNB1iqAWoqmXea6WHQoEmrn2UZy0+d1Et7o9ed676XbA
 SwPega2v0UxH0C22zGtV29rMidJzfqHpOiALURcW0IGj3jrQaEPArmxO7Psly5Vg5ZGk
 1RniIZQhgq5Z33+YqK5LEdR3/6IrEH/U7wdZxSwfev+RLHZygm07swMoob+Z+zI1N34Z
 Zx0g==
X-Gm-Message-State: AO0yUKWlkvpeV9masEt98O+bVTsT6fvPKxHcSe2pdLtjrKnA3y8TWjfN
 vvMaM+PRsrgpX9gAzu+0/3lEY9d1ZyGQ7pbm
X-Google-Smtp-Source: AK7set/JIaFAUWkE+y0y7W9ivXy57uXZqFTeop8BsiWsA5Z37sxrH0/CiEgcW72Dit41fYRuneA9Iw==
X-Received: by 2002:a17:902:e5cb:b0:196:86c2:ee60 with SMTP id
 u11-20020a170902e5cb00b0019686c2ee60mr6283202plf.15.1675299144131; 
 Wed, 01 Feb 2023 16:52:24 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 09/14] linux-user/sparc: Handle priviledged opcode trap
Date: Wed,  1 Feb 2023 14:51:59 -1000
Message-Id: <20230202005204.2055899-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

For the most part priviledged opcodes are ifdefed out of the
user-only sparc translator, which will then incorrectly produce
illegal opcode traps.  But there are some code paths that
properly raise TT_PRIV_INSN, so we must handle it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 370eb4e1a1..3af791455f 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -307,6 +307,9 @@ void cpu_loop (CPUSPARCState *env)
         case TT_ILL_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
+        case TT_PRIV_INSN:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
-- 
2.34.1


