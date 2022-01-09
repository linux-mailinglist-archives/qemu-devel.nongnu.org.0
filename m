Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367CC488B29
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 18:27:01 +0100 (CET)
Received: from localhost ([::1]:40090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6by8-0004gX-Ay
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 12:27:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6bee-0006Nw-Ea; Sun, 09 Jan 2022 12:06:52 -0500
Received: from [2a00:1450:4864:20::331] (port=40800
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6bed-0005Uv-3x; Sun, 09 Jan 2022 12:06:52 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 2-20020a05600c02c200b003470f96e778so5675195wmn.5; 
 Sun, 09 Jan 2022 09:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F9FAq6nwbgCvDM7C2Sg9iiaLq9FrL+HtewEtG7ypUf8=;
 b=ZreSRK8E8JULy4y6elY3p1BA2kf1xKZOaVH/wCym7FLyGagfFrsLLyGfMCeBNJpIt0
 VVF1tiSuWFeNx7Fl1Z3mCjO1dJ/gUKIl+BvW7AJsMex8t4GQMPjwTAFvz+DM7n7DWWyy
 67gw79sqHMswnHO+yJesaE9MuAyu0rlkg6X9YpQt08NQ1zaOq2oRqp02lbszH8yRv1cR
 r+pGx0+1qumwl3NIe6LRW94nIAB6lPH0bgUEB3HRu1wA4fZdSb49vrnycdLmf6MYAqWK
 b7VnUTdmv9Vg6ceqi+AFH7x9AsF162pocPHe9qfJXtxiKJFmf4AJYQL2o3sWXLfHmTHw
 SGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F9FAq6nwbgCvDM7C2Sg9iiaLq9FrL+HtewEtG7ypUf8=;
 b=B+8UThxzkpITKR3yxRFrzuInkJATR2eIyqAB7RiczjmKQZfqRze79mSfROqKimnOFR
 VR3xG5KBYGoerpU/heTCDyVETjtM8RBcSW0gejkdcPoapgCIsZT0IRuTVYSk3OcPLbpq
 5XDXCD8uH0KwDbIjas/XkxQT81Q5aWZvTQwZnIz9WJwiexfxgmkgqB6p81o+AGRawJXm
 c9RWLD1K0lbf2KLAYCl/Nwwf5z0v6vmvXzUUFoKZyhDmhjxGTCQd9KrF+ilTrlaQIkE7
 Lb/y7fqj1SlcGEo6mzdoXZK8Duc2qdgezWe77LGJXKgOSa90mt58T25aAY/mSYiAryE2
 KpWQ==
X-Gm-Message-State: AOAM530JG1Wmoi+Dixb+fhFnFVKJs3SzNeUFiop7SPmOIGEHc4yfn+qb
 gd+pp9Gx+8yDRXk4ZzxZp7WhJ9H4EmLuMg==
X-Google-Smtp-Source: ABdhPJy8oi3ieGBIjsY6paWq79Ni7fHjqGYH+yhLMI1wyaEew+eKhRKCxWZrFpxM4uwwXKwCQ13rrg==
X-Received: by 2002:a05:600c:2113:: with SMTP id
 u19mr3979369wml.16.1641748009312; 
 Sun, 09 Jan 2022 09:06:49 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id bd21sm4565503wmb.8.2022.01.09.09.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:06:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 4/6] hvf: Make hvf_get_segments() / hvf_put_segments()
 local
Date: Sun,  9 Jan 2022 18:06:10 +0100
Message-Id: <20220109170612.574104-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109170612.574104-1-f4bug@amsat.org>
References: <20220109170612.574104-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both hvf_get_segments/hvf_put_segments() functions are only
used within x86hvf.c: do not declare them as public API.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/x86hvf.h | 2 --
 target/i386/hvf/x86hvf.c | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
index 99ed8d608dd..db6003d6bda 100644
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
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 05ec1bddc4e..907f09f1b43 100644
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
 
-- 
2.33.1


