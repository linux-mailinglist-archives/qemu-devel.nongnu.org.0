Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0F4D9BCD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:05:40 +0100 (CET)
Received: from localhost ([::1]:41316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6rr-0006Bk-EE
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:05:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6h8-0004Eu-UB
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:34 -0400
Received: from [2607:f8b0:4864:20::630] (port=44818
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6h7-0007ii-Av
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:34 -0400
Received: by mail-pl1-x630.google.com with SMTP id q11so16127319pln.11
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ArFcmNt0gGLU+mr5/TYFcI9zp4Pabr8VQk5NFCrO7o4=;
 b=X/OJRggSFgvLrn605ZAG8YkgQVRSqmaVL5ubenTjIvqmqilKMytR1bFqOsKYNCYhpt
 Q5dCcYTNdgTVWCUWrD82kwrba5967gKyb4S/adh/ksR55o+hLnkDhdca0lFEH7GIYUp7
 bFM3CGQ9YyXuqH1AfHz0mjEmoUVr2Na6mnHReBkhK6pa2twzBUapGw5p0nZDSFx5qDDc
 y+50tcZuumFG7skwUOdLZs76tVgQYYMgUjb9rGa4LgrpLiOauGCUcbYtnMZjDWJIAwpV
 XWh+am3osS2bhLhkLei0AbeSNn189sSlIYglKsuRtu+8AhwVdoYunzd4H2wVT9coqvxB
 NxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ArFcmNt0gGLU+mr5/TYFcI9zp4Pabr8VQk5NFCrO7o4=;
 b=Vdl9fxmHKfxneClFU5tob3IJnyRDy6+lXteNWPCHS5MAxHbnBlQT2RR+LN7Ed2LyhK
 VssWiavvH1qohP6MynqxI+kEGTig3CsINXTfcIvaBfXqsOYDMM0D6o3z+r7b0cPxcFkQ
 1/Id7f7utjmqMT7/Cz9+DjCtxBaUPxIhCBO+C+T7ekINE3X/ZiHB7tZOvKCuJ89SiOiN
 aMnNtVDtPeByw2DuzgrTh/e2IGcd7UYcX5D6UsazV3knY6HF7qC1P0/IsRTVcwhiD/kH
 D7RzITwjjtf6TIWvV/taK3cvrNuwRfuaks3BrVo2B6mOU0UQZ0QbamGwMHkztRcodsaZ
 upig==
X-Gm-Message-State: AOAM531rU2ZE8fvslNa0S9j0CaPvp3FqBALxokFNq8aw6Wx05gmxYNud
 wbSojCvPcj4LM89i9rl/ERuH3MWga+U=
X-Google-Smtp-Source: ABdhPJw8WNXVljoRfvDS3cGvUPSzGK0zNt1Jj68dlWTk0cHlAPcUeq2hEoK/sokqiQjT8XSCbP/+oA==
X-Received: by 2002:a17:90a:d0c4:b0:1bc:b02e:ed75 with SMTP id
 y4-20020a17090ad0c400b001bcb02eed75mr4474573pjw.104.1647348871863; 
 Tue, 15 Mar 2022 05:54:31 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm24476939pfu.62.2022.03.15.05.54.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:54:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/21] hvf: Make hvf_get_segments() / hvf_put_segments() local
Date: Tue, 15 Mar 2022 13:53:33 +0100
Message-Id: <20220315125350.82452-5-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Both hvf_get_segments/hvf_put_segments() functions are only
used within x86hvf.c: do not declare them as public API.

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/x86hvf.c | 4 ++--
 target/i386/hvf/x86hvf.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 05ec1bddc4..907f09f1b4 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -83,7 +83,7 @@ void hvf_put_xsave(CPUState *cpu_state)
     }
 }
 
-void hvf_put_segments(CPUState *cpu_state)
+static void hvf_put_segments(CPUState *cpu_state)
 {
     CPUX86State *env = &X86_CPU(cpu_state)->env;
     struct vmx_segment seg;
@@ -166,7 +166,7 @@ void hvf_get_xsave(CPUState *cpu_state)
     x86_cpu_xrstor_all_areas(X86_CPU(cpu_state), xsave, xsave_len);
 }
 
-void hvf_get_segments(CPUState *cpu_state)
+static void hvf_get_segments(CPUState *cpu_state)
 {
     CPUX86State *env = &X86_CPU(cpu_state)->env;
 
diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
index 99ed8d608d..db6003d6bd 100644
--- a/target/i386/hvf/x86hvf.h
+++ b/target/i386/hvf/x86hvf.h
@@ -26,11 +26,9 @@ void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr);
 void hvf_get_segment(SegmentCache *qseg, struct vmx_segment *vmx_seg);
 void hvf_put_xsave(CPUState *cpu_state);
-void hvf_put_segments(CPUState *cpu_state);
 void hvf_put_msrs(CPUState *cpu_state);
 void hvf_get_xsave(CPUState *cpu_state);
 void hvf_get_msrs(CPUState *cpu_state);
 void vmx_clear_int_window_exiting(CPUState *cpu);
-void hvf_get_segments(CPUState *cpu_state);
 void vmx_update_tpr(CPUState *cpu);
 #endif
-- 
2.34.1


