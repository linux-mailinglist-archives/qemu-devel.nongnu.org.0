Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA36A894F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 20:14:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXoNu-0006jP-To; Thu, 02 Mar 2023 14:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoNq-0006aV-LS
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 14:14:30 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoNj-0000kS-Ak
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 14:14:30 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso2535617wmq.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 11:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mDcBmWouGnqGshBynFnpTf0FCw+Ej8aBvk380H3UuI=;
 b=BXhYzlIz4j2CWr7staJK2ZrwQKbpSJoV8+CqliJorOBQviI6qlvhy8hs/bRlc8iHzK
 2d8waRQy+vebFK4XDNLRiTHY+tdbnJ0FfASQMOZ+rjY+pRu+vEGgpgdlfuMb6DjhEMgS
 FK/nNatkJbpwbdhWrWI9tnYRH/dysVdyKNVqA8dGn+DwgFSM096dN388OZGadt3S6ruA
 WhRe13FdZYLXrr/2thq3+du5LceKbDMJH+6IhHD+TADiQE96sHjcfg68vOyYSVhD4z0s
 xxOEaxrH9bCsCQb3ZwQrPf01mEXK5fll2XGLUysUcP+9SuD6i8rvmaCgJ0SDXqX5IQ4J
 mCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mDcBmWouGnqGshBynFnpTf0FCw+Ej8aBvk380H3UuI=;
 b=53mMR7XGT0Ao5E+GDLyDaAbdkyff7hcNkHvVzDddctPt4KFV+9zb598A3RMC7s9oes
 0FAimMgvYiy9YuJ7OS0Hw3wadz/EUuAJdXP67kf6hB5hqE+d2lkPlwx7PvJ3xDY+nu9k
 ZZFR1npOm3+sCbVu948yG1if7dAwSVWbfNDQq5lK5GMxB9p0Oiy8v8ZwZMZ/Hhd/G6u6
 9JRICuBkdTUABl59Wac+uNfTs7DJfopBOs5dczwu/5NWSllXBYwHFS/2aY+x+5zU5uhh
 a6tPr8xbGVCamj5X2WbrtCM/sHply5yrztDlvKQK1vzvoUcp+KNi9240IduOLGTo028b
 L3MQ==
X-Gm-Message-State: AO0yUKWWkE+U4WSGtAwnRCpvhsd2C6DTm98OZiyirsAT8naN4I1EbORt
 n6d3PaqKi9M6vOkkQ/QbigtQSg==
X-Google-Smtp-Source: AK7set9YxIWJrYn/MpIzDLybLevwDttFD09ikLI3/HBK8ztypWUCRjSint/bPii24PauHRFn4AZCgw==
X-Received: by 2002:a05:600c:198e:b0:3eb:6878:5523 with SMTP id
 t14-20020a05600c198e00b003eb68785523mr250882wmq.12.1677784461721; 
 Thu, 02 Mar 2023 11:14:21 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k5-20020adfe8c5000000b002c56179d39esm162354wrn.44.2023.03.02.11.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:14:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A81B1FFBB;
 Thu,  2 Mar 2023 19:08:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 nicolas.eder@lauterbach.com, Ilya Leoshkevich <iii@linux.ibm.com>,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-s390x@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Marek Vasut <marex@denx.de>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 mads@ynddal.dk, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yanan Wang <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 18/26] gdbstub: fix address type of gdb_set_cpu_pc
Date: Thu,  2 Mar 2023 19:08:38 +0000
Message-Id: <20230302190846.2593720-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 gdbstub/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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


