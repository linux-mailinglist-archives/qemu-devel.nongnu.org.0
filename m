Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F554AA210
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:19:30 +0100 (CET)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5zN-0005RQ-6z
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:19:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Wc-0000Ah-53
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:46 -0500
Received: from [2a00:1450:4864:20::332] (port=38580
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5WM-0008A0-CQ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:49:45 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so10202839wms.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RF5y4dzhS8bG68f7NLy4ZRBD5ccx4mYs0zSlmwkW1WI=;
 b=ZcPU6nkRILyMXl/MEFbqzJw9PVRYUGoCq0W8XF8Yq4FxOH5WlKqsIGhqwXXraGgi1I
 Eu9ZokwiB0MM0OIsRYOtQCerM9vg2DroCz14rKLFmJzK/rgPwYSCM5NDgHGHxgI5Iw09
 bk+Xw4K3Gx7d0N4qaiKAb4lNbyPXah4QGrEmWqIOSk0P05H9II+FefMQaHKb1bGpe5k1
 n0aGImS9S0BYK8YKSBTiMGNhy1qesWQOD4pFGCUFmm08X6CB79Yg2aY/I5EFMR4j+ozF
 VLWYU72r032EZfHBYrpfCAFnPUU/pSmbJjA15d5R2mi8UJoOcO4+eZ+JYQPcV6OOTHhS
 sjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RF5y4dzhS8bG68f7NLy4ZRBD5ccx4mYs0zSlmwkW1WI=;
 b=sHr+x4Fq4a8NY5TpXOWnfEY2INLWenPEuvqF9ro06rbJheJMdiqjQrlgOrAORFhpfO
 BYNmaiTGAL2Zhk0ODgYVIiNpel7eOg/6IxQk6d6hBfI6afwaQ1cXtO72BtQWYripTpGR
 oyByj2yrBwDhBTAUAFr8Jq62OZrohIgir82x3kmzumpFAGdAavzYqkxC7kDFcoe31tjW
 ru56y5JS0dg4zJ3dTcv9PCxlSBlhqz69wQoGJUGlgtvhbrOm0Ym6WOqLUabw7u0xYGes
 jEGqnwLCAeZKNc3YCQgc0ziw/2iHgrRTvFyhY6FCDmQcwnLhQsRoByHYwiV5NGE1bPHP
 97/Q==
X-Gm-Message-State: AOAM532H870iIPOx3z8ZmsNgbOndENxDIro6F0kMHWeB2asX/fkIEmh3
 MqrVCcYtfKnbVpuEZzlgzzq3/g==
X-Google-Smtp-Source: ABdhPJy7oMkh+Zl3nod8fua9L4OCyLd5qhpdLOyhSg5UiRaatzz+hAeaEjUlucx9nplE1OHrZZNdxw==
X-Received: by 2002:a05:600c:8a9:: with SMTP id
 l41mr423230wmp.51.1644007762235; 
 Fri, 04 Feb 2022 12:49:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j13sm2944100wrw.116.2022.02.04.12.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:49:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B86911FFC9;
 Fri,  4 Feb 2022 20:43:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 17/26] docs: remove references to TCG tracing
Date: Fri,  4 Feb 2022 20:43:26 +0000
Message-Id: <20220204204335.1689602-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, Luis Vilanova <vilanova@imperial.ac.uk>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Users wanting this sort of functionality should turn to TCG plugins
instead.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Luis Vilanova <vilanova@imperial.ac.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220124201608.604599-14-alex.bennee@linaro.org>
---
 docs/about/removed-features.rst | 13 +++++
 docs/devel/tracing.rst          | 85 ---------------------------------
 2 files changed, 13 insertions(+), 85 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4c4da20d0f..b0156e0f25 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -601,6 +601,19 @@ the upstream Linux kernel in 2018, and it has also been dropped from glibc, so
 there is no new Linux development taking place with this architecture. For
 running the old binaries, you can use older versions of QEMU.
 
+TCG introspection features
+--------------------------
+
+TCG trace-events (since 6.2)
+''''''''''''''''''''''''''''
+
+The ability to add new TCG trace points had bit rotted and as the
+feature can be replicated with TCG plugins it was removed. If
+any user is currently using this feature and needs help with
+converting to using TCG plugins they should contact the qemu-devel
+mailing list.
+
+
 System emulator devices
 -----------------------
 
diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
index 4290ac42ee..ec9a687cfd 100644
--- a/docs/devel/tracing.rst
+++ b/docs/devel/tracing.rst
@@ -413,88 +413,3 @@ disabled, this check will have no performance impact.
         return ptr;
     }
 
-"tcg"
------
-
-Guest code generated by TCG can be traced by defining an event with the "tcg"
-event property. Internally, this property generates two events:
-"<eventname>_trans" to trace the event at translation time, and
-"<eventname>_exec" to trace the event at execution time.
-
-Instead of using these two events, you should instead use the function
-"trace_<eventname>_tcg" during translation (TCG code generation). This function
-will automatically call "trace_<eventname>_trans", and will generate the
-necessary TCG code to call "trace_<eventname>_exec" during guest code execution.
-
-Events with the "tcg" property can be declared in the "trace-events" file with a
-mix of native and TCG types, and "trace_<eventname>_tcg" will gracefully forward
-them to the "<eventname>_trans" and "<eventname>_exec" events. Since TCG values
-are not known at translation time, these are ignored by the "<eventname>_trans"
-event. Because of this, the entry in the "trace-events" file needs two printing
-formats (separated by a comma)::
-
-    tcg foo(uint8_t a1, TCGv_i32 a2) "a1=%d", "a1=%d a2=%d"
-
-For example::
-
-    #include "trace-tcg.h"
-    
-    void some_disassembly_func (...)
-    {
-        uint8_t a1 = ...;
-        TCGv_i32 a2 = ...;
-        trace_foo_tcg(a1, a2);
-    }
-
-This will immediately call::
-
-    void trace_foo_trans(uint8_t a1);
-
-and will generate the TCG code to call::
-
-    void trace_foo(uint8_t a1, uint32_t a2);
-
-"vcpu"
-------
-
-Identifies events that trace vCPU-specific information. It implicitly adds a
-"CPUState*" argument, and extends the tracing print format to show the vCPU
-information. If used together with the "tcg" property, it adds a second
-"TCGv_env" argument that must point to the per-target global TCG register that
-points to the vCPU when guest code is executed (usually the "cpu_env" variable).
-
-The "tcg" and "vcpu" properties are currently only honored in the root
-./trace-events file.
-
-The following example events::
-
-    foo(uint32_t a) "a=%x"
-    vcpu bar(uint32_t a) "a=%x"
-    tcg vcpu baz(uint32_t a) "a=%x", "a=%x"
-
-Can be used as::
-
-    #include "trace-tcg.h"
-    
-    CPUArchState *env;
-    TCGv_ptr cpu_env;
-    
-    void some_disassembly_func(...)
-    {
-        /* trace emitted at this point */
-        trace_foo(0xd1);
-        /* trace emitted at this point */
-        trace_bar(env_cpu(env), 0xd2);
-        /* trace emitted at this point (env) and when guest code is executed (cpu_env) */
-        trace_baz_tcg(env_cpu(env), cpu_env, 0xd3);
-    }
-
-If the translating vCPU has address 0xc1 and code is later executed by vCPU
-0xc2, this would be an example output::
-
-    // at guest code translation
-    foo a=0xd1
-    bar cpu=0xc1 a=0xd2
-    baz_trans cpu=0xc1 a=0xd3
-    // at guest code execution
-    baz_exec cpu=0xc2 a=0xd3
-- 
2.30.2


