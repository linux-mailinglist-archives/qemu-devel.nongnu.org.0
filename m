Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1194B653E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:09:27 +0100 (CET)
Received: from localhost ([::1]:57430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJstp-00056T-Tn
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:09:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsob-00025Z-VY
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:04 -0500
Received: from [2607:f8b0:4864:20::62c] (port=36393
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsoY-0002Ae-LU
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:01 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u5so1328105ple.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yNwQWcROv1TG5S2Qw4iwbs1DWfRgKeSzxs3LLnK2L7c=;
 b=DyNeRG53iTzqc2vFZJ2yVu6CylTKhUmRo4wQuRu1blFBNfxlr98aVYJ7nlFHD1hEv+
 LbvadMpe/lsjoBhYIQAhpSrFY8dZfJXIUeQt63raXE7t+1MYo5hGHIVPhLkdlWApqTA4
 nZlON7itn0DwWvwk9oK+8kr5GSvn6iTp1QAxpWtHs7jW5YbwFsLb1Gwbfk0vypMsjEho
 KM/pEuROjd/5CtQVo5l6ZOD2W0lQTunPf7nf1MPPdmIDLf2xqZGULesSvFn9a2hbXOFX
 OjOYEecgLHyEnp9hlUfQMwVLWfNBifQlUhh5Bk/WNOrXdEDfBL596zmUqRWXv8gjIBSC
 Shzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yNwQWcROv1TG5S2Qw4iwbs1DWfRgKeSzxs3LLnK2L7c=;
 b=yRs8NqMk0o+YyydxuM0tUYq8xgkikreJOIFGf4urCO48G4hpzQ3WJ/wny0R75cdawR
 rXm/I4pzHxuPU0x2f3O6OlaygKt9m631m2fZaFyGpAkKwCFyPJleQ5vKDr+lNNxr6GGS
 sUCfoMImcS2k86qEnWmpE5rkgk+1F1eP1iPKlX/k4UCyrISOp2TdIPv3PcbqRj0LQ6iu
 AxEW/mCXuspUFlmhDcODHBzn+qvhMDW4RjW5tiyosO0Jsi8gSGdnSG6LORzyqzw04BJ9
 6KVU8zUp5WzayluVkWa/zgIiqX7YM75DvByv7iYfYpScvf6ELeIb5KGCwnG+k4PGi6E6
 nSZw==
X-Gm-Message-State: AOAM53081Kgmk841VNuqZUAlTpAA/8eoZBLouNQmHwV2eSjLLv9HDllh
 2t8Ox49fFRlAn98Avxclvf8NCHyZJos=
X-Google-Smtp-Source: ABdhPJy4rWRMWSTQa0xZvPyjNzlt4fOkizDYBTYGrOFojD5dGgGDXc9R9V+crw81Jj/X2qDrca/Ovw==
X-Received: by 2002:a17:903:185:: with SMTP id z5mr2824731plg.71.1644912235989; 
 Tue, 15 Feb 2022 00:03:55 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id a9sm1720318pgb.56.2022.02.15.00.03.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:03:55 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 05/15] hvf: Make hvf_get_segments() / hvf_put_segments()
 local
Date: Tue, 15 Feb 2022 09:02:57 +0100
Message-Id: <20220215080307.69550-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

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


