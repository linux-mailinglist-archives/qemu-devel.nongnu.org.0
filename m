Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1CA380D49
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:35:40 +0200 (CEST)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZql-0003W7-FX
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW3-00060G-M9
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:16 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:34452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVv-000746-Nd
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:14 -0400
Received: by mail-qv1-xf30.google.com with SMTP id o59so2379720qva.1
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=faTSI+eS0bqFqEREdWJLgJIJnnf/2ZzvZH+BYJ5ylfM=;
 b=xKZAhxZYENEFEt4Px9ygMyhuYvAsJTenUCmesD0ZoXAyjihL0DL7rlrrbECLZ948cU
 B/z5kBbiL92BKUNq5/+d+cyLOVDNQ4FqxJuyFKDFOccv3fERVWUjjC3c947wZGOzWVxe
 iY2XEFVm6xsBiQgqhmxkpyOKpmW82PjW4WuV5002HOGLMZ2aJ+IFIFLSp57/9aD+7GPR
 5AjsFhftIOmv8xYq2OcNFLvrRYnFGGoxDTyiiYTMVHjRhU6uwe5GErZ00IkwRO5rt5jM
 JlauHhozdf01aezep6vxNM9yTylnL0WbWBZb60PrrQo3Syo97/DITrW7fF3dyi41Y87I
 mdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=faTSI+eS0bqFqEREdWJLgJIJnnf/2ZzvZH+BYJ5ylfM=;
 b=onXN3FVHTkBdOFVbLjXksTfsChUPI9LMnf06zNrvJRVdmQ+RKhVwFbbEpV91vBaFJJ
 hxldin0WMycNV2V+chkSwoRBa8AV4w4doTlWLPm8VFvTiZ2D5nw7AUNmFxilCJrepO2W
 9/6gKWghyjuZuq+ZvIubkiA4/lVGv4DTAOl7Znfm40CPWmGcHmMkAux8xT9PIK4UfagI
 wiRzqKUx+gX0nbz7Rg3gEsokMIHMDggPmTKe32sybPeQ14+ibhfkSdcWxx5BHU/P4rRr
 tYNbfMzPRUsjRCBlCvnZSO3eJboMr+0hOyCEUe4zLV6K6v+MXwG18LVFJV8CeIXOgNLW
 T1aQ==
X-Gm-Message-State: AOAM533bckyQxzb323FylDG3T/gPmkJ7s/07xD8JVfYX8FtvwLvB0jga
 XAjKDP79cQFgvhZPUWSDJZxYGMe6fdDlqL2cmcs=
X-Google-Smtp-Source: ABdhPJyWC2AOC0D4aWEA8lGDz+wYjuPAIMT22SloRyJKXvUBK3FlvA3tLRcFZS3E6CWGaDbKFKL++w==
X-Received: by 2002:ad4:4ee4:: with SMTP id dv4mr46631078qvb.10.1621005246291; 
 Fri, 14 May 2021 08:14:06 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/50] target/i386: Reduce DisasContext popl_esp_hack and
 rip_offset to uint8_t
Date: Fri, 14 May 2021 10:13:16 -0500
Message-Id: <20210514151342.384376-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both of these fields store the size of a single memory access,
so the range of values is 0-8.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 1367e53e4e..847502046f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -106,8 +106,8 @@ typedef struct DisasContext {
     int repz_opt; /* optimize jumps within repz instructions */
     int mem_index; /* select memory access functions */
     uint32_t flags; /* all execution flags */
-    int popl_esp_hack; /* for correct popl with esp base handling */
-    int rip_offset; /* only used in x86_64, but left for simplicity */
+    uint8_t popl_esp_hack; /* for correct popl with esp base handling */
+    uint8_t rip_offset; /* only used in x86_64, but left for simplicity */
     int cpuid_features;
     int cpuid_ext_features;
     int cpuid_ext2_features;
-- 
2.25.1


