Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27C3A4B5A
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:44:13 +0200 (CEST)
Received: from localhost ([::1]:52392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqou-0005Nw-6A
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmg-0002Ty-TR
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:54 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmf-0002d8-4H
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:54 -0400
Received: by mail-pg1-x532.google.com with SMTP id j12so3672821pgh.7
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=20wQQlls/fCaj92TazJBcMQ1M/HJlvVa/gvE7cqK+n4=;
 b=AKGQ2jPvAkyElvDqa9QIYvsAuMiBeSvLPL0aLeAbRPCiGw7aoynD8Zn3Px1FsLw8vT
 YSpgXI1VCKE+i/6zpkgkHeMHPM1Wl/g5gzjxA8ujEKlMYb9fAIF5/Y5/SSVpxIzQ8JOR
 6ux1mbCk8VEbKZutYXjwYrlUYTuJmI9j4hUUkqIdmGconCmDwIVjXQH1YmsUm8CFxm6q
 hLH7wBBTtZbU+TfdHWwwSo40DxOOcqdWMXIZlWvqw3FXy0P2N/Ka3UgMbWsoc2fQtOJk
 EXObcgQD7mM3MsDI/4uIQCtNI01AuDEK+LiaS82WGRGxBGIeOm0+xkfFEUSbuAzRQq6C
 b9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=20wQQlls/fCaj92TazJBcMQ1M/HJlvVa/gvE7cqK+n4=;
 b=rPciTwMV9SmeyGnGE/kADTgN5htQWRy9VEvtH4px1FOW3l3Lbryr8ay1iJJbpHgSKt
 CO4AK3hxJjV10b8Kf091CGzFNlahPbnqiycr4dop2odlU/w/3OnmPhD4WJ3y1v+i1ZOT
 2ufvCrWeUs3CE+vvOYr2tOR4Zz8bE9ErAGur6uOIrTELUZED4Wbmqrtelrc/PoJEorUu
 oQu/WXoiS507MLruTvb3WzbmYciaqVVXAtACwgOqu3NeV4YlXInTZhQNSw/DPZSWJYz9
 othGdxhOzxB1UVdOy6X9Cz01UPdpm/5vpPSKPfsTY4NUbbk5CONQFS5kCq1PJAk6Kaho
 o7eA==
X-Gm-Message-State: AOAM533Jly4bBG1VDVO2Hm8JNF4IVTQspaUzYpywAS6mkjtKEaYoH2wn
 pNFLbGkV9OUbKxHVjKKhEtOQCMjCQuv1Ag==
X-Google-Smtp-Source: ABdhPJyROnN+W0NKMcHEUqJqhBmGoF9qLYqIosNsTJmZxDT76fG9PuYQYl+RePDITk1jd+xcQf0/ww==
X-Received: by 2002:a63:fe4a:: with SMTP id x10mr5944803pgj.132.1623454911566; 
 Fri, 11 Jun 2021 16:41:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/34] accel/tcg: Rename tcg_init to tcg_init_machine
Date: Fri, 11 Jun 2021 16:41:20 -0700
Message-Id: <20210611234144.653682-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We shortly want to use tcg_init for something else.
Since the hook is called init_machine, match that.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index f132033999..30d81ff7f5 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -105,7 +105,7 @@ static void tcg_accel_instance_init(Object *obj)
 
 bool mttcg_enabled;
 
-static int tcg_init(MachineState *ms)
+static int tcg_init_machine(MachineState *ms)
 {
     TCGState *s = TCG_STATE(current_accel());
 
@@ -189,7 +189,7 @@ static void tcg_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
     ac->name = "tcg";
-    ac->init_machine = tcg_init;
+    ac->init_machine = tcg_init_machine;
     ac->allowed = &tcg_allowed;
 
     object_class_property_add_str(oc, "thread",
-- 
2.25.1


