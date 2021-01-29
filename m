Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F9B3088BE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:01:08 +0100 (CET)
Received: from localhost ([::1]:39942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SSZ-0002lp-1X
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnM-0004S1-C7
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:32 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnJ-0005y8-1w
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:31 -0500
Received: by mail-ed1-x531.google.com with SMTP id z22so10125292edb.9
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WW9FjE01j//RL/qhn41ULN+iS845r2HT2fAeuJfLQAw=;
 b=d4Rm1TECVs8DwaSdmYbr5qd0DsE1ohR5AK9hpTZqZvulLzWyAiQFor7+He2VmO03Ns
 1vm6+lYOQPbKFLFRvC5k6U/S49kXg11A1E2kKtl4WS8sz8XmonZ6Jv31Cguxus0EQ7OM
 ZknZkYwdSQjGm43zZyQqhIh/X6/NdjUzCJ4KazD1JVW0HhYOqJ/MLsE+rTJr9Kq5lRrO
 OvYM+TQySSqB/RjqLaiAXeU+kV3RejJALxKV8QJt/LDBL+PxCFIkN1a/WtS4wlKo/Jch
 AcCE5UqODbHq2qlJJpJNCEEnezXWKKQiLoKksRt26N47sCwU3x3wRP+0C/1lKczkKrWl
 urpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WW9FjE01j//RL/qhn41ULN+iS845r2HT2fAeuJfLQAw=;
 b=M0lFra8JCPUdydN7LEH8voff8eJSrbVGOMOFbVP9gsNk3h8EcwTLp2hYrcI7+KOY85
 WiQGtyhJtke+Hq+WjgQXaTA3C9X87Qv7CFVB5W82Pga7/fVTolTnOpest0G7qcioqOSh
 P2hChU8L2twicetoioLT130HqlBrE+CT7Hwqzs83dnj3IUGJeF63bFlHUR5M7d25e4on
 LnkeLziyYA7u0/a7fqnM9u/IvMTt/1NEEIB51moqLVWnrfzuzxm/PpdY9w7GVB+aVOrq
 lM1ThecawXPSy6kIbyCHtyB/uWFpBCj5ZjXh4/TXjk9ZmmRprDo9A23mY9tuTkplaKh0
 yEKw==
X-Gm-Message-State: AOAM530lpl6aDBKUpnAxFVhCTkpJ6x3fMn3dRJxjm3n77pknjh++R7vx
 aBDOCjio/QAiNagRsdz4yBYhb305dULcpQ==
X-Google-Smtp-Source: ABdhPJxVa3J3c0zsW/D0ZuUdQn2XL/xZOk6OosduAs+3+IcZ1NvDoKCxtmkEnGeD24X1Rwvy0/pJmQ==
X-Received: by 2002:aa7:d4d7:: with SMTP id t23mr4391203edr.321.1611919107735; 
 Fri, 29 Jan 2021 03:18:27 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/36] fuzz: fix wrong index in clear_bits
Date: Fri, 29 Jan 2021 12:17:51 +0100
Message-Id: <20210129111814.566629-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Qiuhao Li <Qiuhao.Li@outlook.com>

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Message-Id: <SYCPR01MB3502E9F6EB06DEDCD484F738FCBA9@SYCPR01MB3502.ausprd01.prod.outlook.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 4cba96dee2..20825768c2 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -261,7 +261,7 @@ def clear_bits(newtrace, outpath):
                 data_try = hex(int("".join(data_bin_list), 2))
                 # It seems qtest only accepts padded hex-values.
                 if len(data_try) % 2 == 1:
-                    data_try = data_try[:2] + "0" + data_try[2:-1]
+                    data_try = data_try[:2] + "0" + data_try[2:]
 
                 newtrace[i] = "{prefix} {data_try}\n".format(
                         prefix=prefix,
-- 
2.29.2



