Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4B04CEE68
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:23:04 +0100 (CET)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0DP-00073F-2t
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:23:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR08r-0006Vw-NC; Sun, 06 Mar 2022 18:18:21 -0500
Received: from [2a00:1450:4864:20::432] (port=42869
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR08p-0007Ll-Vw; Sun, 06 Mar 2022 18:18:21 -0500
Received: by mail-wr1-x432.google.com with SMTP id u10so19027512wra.9;
 Sun, 06 Mar 2022 15:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ArFcmNt0gGLU+mr5/TYFcI9zp4Pabr8VQk5NFCrO7o4=;
 b=YZRfxiXDBwbq1yzxYMRi4narMWbh8QHz09PZAMEG7FK4MHFsaw/GsViV/uzr5Kc3un
 PI2m7njySQSdy5U54kjtOgIuQvoZFqr4MJHiwG/7I/C4ttoRGlKjNgJe/mMzJh9LIQU9
 ql1KWZRj8Mq20nRDVIUbsPYS5T8ot/usgZ9N9rM008wgXGF0bsL2xi0gOCFmLaolID08
 ZJRi2AxsI5M1Vd5mIbmkP2x1wET3qwwbHsR/mvpS9IrkPy1px43ecK5BMZhhD7+CZj0M
 7+aPua7EPDRo1gVWLgkL6ym29FE7/rhdwB7rAjgYzSMzrnamdAlTnc3Ic7HZpKxWA9yO
 xAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ArFcmNt0gGLU+mr5/TYFcI9zp4Pabr8VQk5NFCrO7o4=;
 b=Ai3PZX87uOD3t0Jokn+n6sthukeOL/Y4GjAgoZcAzcRITPhUg0b9mdkjM7JE5pRS5/
 oAP3xSa9J3UKTGQeC4gbwlmUrM5FIGNKkxqE2nbQV5j17elaW2WutJgcTpH+qvLguEUr
 2kTQy/R3Ng3KvXh/blZTL5Nt2PqFi99Elx9F5mx2CQa/E4qA7zjahxOJl3NHCucE2OCa
 5wjRtpRAU37Kl8sDJf/50mt7rCrOEAgHMMok0wD0KBetypk2XnHvPAOa0ax8LwKe4Ehq
 jvOv4d7ATCJUtm/wVlqeq1LwF8anmdoO+0kwVqKaArPeSn5QoxSSpDgF9Y57v/7eel2K
 EN0g==
X-Gm-Message-State: AOAM533OJBacmBw+CHzPnZIdp2tB1slsQLiJGYw6vEiBsIz33vrED56T
 5VjO7xr+AD2NypclO9qSEQl2rCA5Dx0=
X-Google-Smtp-Source: ABdhPJyPKlEouONG5pcg0NmBYgWUnoJF/keOhs05LJgfqDSBunEVK5wBnXb+BYf398arfGiA7q6CPA==
X-Received: by 2002:a5d:47c2:0:b0:1f1:fc40:920b with SMTP id
 o2-20020a5d47c2000000b001f1fc40920bmr333260wrc.114.1646608696958; 
 Sun, 06 Mar 2022 15:18:16 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adfdbd2000000b001e4bbbe5b92sm10560778wrj.76.2022.03.06.15.18.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:18:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/22] hvf: Make hvf_get_segments() / hvf_put_segments()
 local
Date: Mon,  7 Mar 2022 00:17:35 +0100
Message-Id: <20220306231753.50277-5-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


