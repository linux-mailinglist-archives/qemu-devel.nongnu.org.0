Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148BA36D972
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:20:02 +0200 (CEST)
Received: from localhost ([::1]:44724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbl2n-0001BX-3A
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lbl0s-0007xC-Bs
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:18:02 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:44947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lbl0p-0003qD-Jx
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:18:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so4803756wmb.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=byqEYqc0lky4B7aejV6Whro0wHZWvXK3uxr38noblcw=;
 b=RkHe4jzxLkee0am0biNDPUEovn5FcZmMbDJfAGJnOtz8vsWbLmZABbzsfEFxhqFBsW
 gPUkk9fG89rHBUS/WgKOnbebGzv0RUlezVle2xwhREM24zQX8uI6lnV6TQtWOFUIS4oe
 mAb+6EeX7/V/sFp0rwyHvSsOvTgPt9mKeM3hrVGx49OT8rI3CI4CB3dSb43vqxeYxKUm
 7JkwBnMuj2P5yiAq9Z+ihKD+rT0Fe2Gz3uLXI4uoRt3i5jv34lLgQ2dFC9LHJaUPYKwH
 1RN6K+c9cdleXKTuY7Pssc9Vs1Abf5mbITFnWpFTM+X3hoHOUqfWllIs3UrkYM3PHgRb
 yY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=byqEYqc0lky4B7aejV6Whro0wHZWvXK3uxr38noblcw=;
 b=DF4+JPiygvC6KzgYp/R3OtmOlZ8zJiQNQhXnsJnTBeJK2nOERYMf8uWUcvu8nEHND6
 3pHZcDPaK5idFNUcbavcuMSckarlwDj7d/WeixKuiHabopLAOsKSco7FPabYWp0A2tWx
 qjqEo2Vf7EDdlofkGEWnXZKpqzcfbYBxftYBSoz2H1TsWx1GHow+NzGwAJQakF5l/84j
 1TgOCW79/Tl5sGGQjMr/e6clNoeRIy34UNvrU4Rv1xC0Zr9X/Zyp0/owQb+iUMz6yhzi
 H7ziecWW6NZFMEr+iKPUp4ibWnDhp3cfsd3tcER98xfGVEMuSuhWJu0/2L6e+j2+uPOe
 7q3Q==
X-Gm-Message-State: AOAM530EItK/MQKb4+Dgma+/wGLi+PhHZ+medCj4Rthu2SZw1ev9yXQ8
 QnD2fWAJWn9+pc0YgR+iVOT9TG4A35JWLA==
X-Google-Smtp-Source: ABdhPJyUaTdIrIQftLsyu0y0F6xYRB/2pOOoijhIM7FsTwrjFNFfDIRTV5b/dopqUPrzgdzyD58nAQ==
X-Received: by 2002:a1c:e907:: with SMTP id q7mr4621958wmc.17.1619619478285;
 Wed, 28 Apr 2021 07:17:58 -0700 (PDT)
Received: from localhost.localdomain
 (lfbn-tou-1-1482-80.w90-89.abo.wanadoo.fr. [90.89.5.80])
 by smtp.gmail.com with ESMTPSA id l12sm145611wrq.36.2021.04.28.07.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 07:17:57 -0700 (PDT)
From: Fred Konrad <konrad@adacore.com>
Subject: [RFC] AVR watchdog
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 mrolnik@gmail.com
Message-ID: <20b7f194-066f-c3bf-a830-deb1cde8f1be@adacore.com>
Date: Wed, 28 Apr 2021 16:17:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=konrad@adacore.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I fall on a segfault while running the wdr instruction on AVR:

(gdb) bt
      #0  0x00005555add0b23a in gdb_get_cpu_pid (cpu=0x5555af5a4af0) at
        ../gdbstub.c:718
      #1  0x00005555add0b2dd in gdb_get_cpu_process (cpu=0x5555af5a4af0) at
        ../gdbstub.c:743
      #2  0x00005555add0e477 in gdb_set_stop_cpu (cpu=0x5555af5a4af0) at
        ../gdbstub.c:2742
      #3  0x00005555adc99b96 in cpu_handle_guest_debug (cpu=0x5555af5a4af0) at
        ../softmmu/cpus.c:306
      #4  0x00005555adcc66ab in rr_cpu_thread_fn (arg=0x5555af5a4af0) at
        ../accel/tcg/tcg-accel-ops-rr.c:224
      #5  0x00005555adefaf12 in qemu_thread_start (args=0x5555af5d9870) at
        ../util/qemu-thread-posix.c:521
      #6  0x00007f692d940ea5 in start_thread () from /lib64/libpthread.so.0
      #7  0x00007f692d6699fd in clone () from /lib64/libc.so.6

Wondering if there are some plan/on-going work to implement this watchdog?

---

Also meanwhile I though about a workaround like that:

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 35e1019594..7944ed21f4 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -24,6 +24,7 @@
  #include "exec/exec-all.h"
  #include "exec/address-spaces.h"
  #include "exec/helper-proto.h"
+#include "sysemu/runstate.h"

  bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
  {
@@ -191,7 +192,7 @@ void helper_wdr(CPUAVRState *env)
      CPUState *cs = env_cpu(env);

      /* WD is not implemented yet, placeholder */
-    cs->exception_index = EXCP_DEBUG;
+    qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
      cpu_loop_exit(cs);
  }

In the case the guest wants to reset the board through the watchdog, would that
make sense to swap to that?

Best Regards,
Fred

