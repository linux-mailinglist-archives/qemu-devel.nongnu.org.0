Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8246AF7B8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:32:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesD-0004js-Qu; Tue, 07 Mar 2023 16:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZesB-0004i2-GO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:27 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes8-0000vq-NJ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:27 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso5416wmi.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JzvS0ZfKizcL9bVYi9aisZfhh6wOuTp26q2UwdGO7aY=;
 b=w9NkaYQBAGSG6mPJf00YqCDKu2i1Hlbc2wfgJxK0iqoAW9PVAk9rxLRoPM0Lqto6NC
 1aYdSWglNlPPbkoX4SBG492MkHrEbQoBGs5Ygc6KhwaKXqIcTVLdGmMjTyejwuDTsNZZ
 Fi9YLkKtlHysltOzddcIrE1a/DaslHfGlgLZOEZzkVzpAFKerLs3dktC8WXDduO6ZkwH
 r99c0cMuhAVsWB8FtOffjXUXOPg33KhQKTpYjiJnVdjS5e6VdAK9DocJp7/maZpn778v
 qvqSycPOFNbX5hH/CCcT2D5dkl6AYIyHjavfIz3Ak0xEZQuadjRxI6WmoFaQPpmIBGBo
 yXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JzvS0ZfKizcL9bVYi9aisZfhh6wOuTp26q2UwdGO7aY=;
 b=hOXjiUL5J6d0lMEN2uKkEYx1EW34EKeqMaDP9j94yaT7R6LLwde8O2BVYI5DUnChWq
 vxUY99QYOAGUE4NIv0wD4zMjDJbQpIOzir+yrBqk8iP0Nw8tcj3cq10tj6hr1ZzleJ+/
 fzhbaaVC1UDXkoAqtlaSEqLYUwNGCPmJxqwBmt/GCdVmWa7X8nVsFrDruipc36yntpWJ
 J5R7h77wsP6VvVkFoPuiVGzwhru3s97TnHTJX6TX7YzeQxP7LEu/TATMdrhTh+M2XbSG
 e63appyzdKmH5necK/fvBauSg+LFwAWy+IcKRXm7u5/ldMbOgMELlUCKHX+xTNVqJZdv
 jKKg==
X-Gm-Message-State: AO0yUKXNkYt7ZTaFEPAI2uNLcsfnZLrlf3YyPyQKztBMMa5QAn5Ekwsd
 49Xxn9qD1gy2eHI6lZ+jeAEY0w==
X-Google-Smtp-Source: AK7set8S6rMGhXGTALofhpinI4QPtBme73EkTIBqLTsGKvyzJC0rXuzdfn5G/m34nLNY0iZKoOKCNQ==
X-Received: by 2002:a05:600c:4fc2:b0:3eb:37ce:4c3e with SMTP id
 o2-20020a05600c4fc200b003eb37ce4c3emr14535608wmq.16.1678224563326; 
 Tue, 07 Mar 2023 13:29:23 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c150500b003e91b9a92c9sm13798864wmg.24.2023.03.07.13.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 76C481FFBC;
 Tue,  7 Mar 2023 21:21:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 18/30] gdbstub: fix address type of gdb_set_cpu_pc
Date: Tue,  7 Mar 2023 21:21:27 +0000
Message-Id: <20230307212139.883112-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

The underlying call uses vaddr and the comms API uses unsigned long
long which will always fit. We don't need to deal in target_ulong
here.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-19-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-19-richard.henderson@linaro.org>

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 7301466ff5..b8aead03bd 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -535,7 +535,7 @@ static void gdb_process_breakpoint_remove_all(GDBProcess *p)
 }
 
 
-static void gdb_set_cpu_pc(target_ulong pc)
+static void gdb_set_cpu_pc(vaddr pc)
 {
     CPUState *cpu = gdbserver_state.c_cpu;
 
@@ -1290,7 +1290,7 @@ static void handle_file_io(GArray *params, void *user_ctx)
 static void handle_step(GArray *params, void *user_ctx)
 {
     if (params->len) {
-        gdb_set_cpu_pc((target_ulong)get_param(params, 0)->val_ull);
+        gdb_set_cpu_pc(get_param(params, 0)->val_ull);
     }
 
     cpu_single_step(gdbserver_state.c_cpu, gdbserver_state.sstep_flags);
-- 
2.39.2


