Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABE169DDD3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:27:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPr1-0001fY-Iu; Tue, 21 Feb 2023 05:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPqy-0001fC-KM
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:26:32 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPqw-0005Tq-T7
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:26:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id l25so3437385wrb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CX9a4RZh8erykIci3+PM39q9KbF4F9o4p9k5tZ3f4js=;
 b=C1ZjXe4RQDjrsbYvFx2MJQu5k9ZXErq3oJH8bWo0WP8e5e2JB05eXwQV21ooSehbIw
 flIQm34KtOjJtQnRJIhrPiKmjvcSTt4oBerhaFi+EEA+IrOClh3m1mBoyarfGMjMuqBb
 Wyn5QNfvp4lb1lzj424z5AYtqL5VRpgMGOcBuH0sE9WHAzxIFndFR14OzZOCqpmakv7t
 DTOXSGD+hRDNfRJDYBOOYBsiDx8gNhIB5QMYf+zTykzzcH3gj68ixhDxCw+3MQyTRPBQ
 MBBzhUmE6EH/foVN3DmyzqTRWeGK91QV2kpOWQcffBGj6ZcQF74zfyGtB+wXqwLR72wb
 dAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CX9a4RZh8erykIci3+PM39q9KbF4F9o4p9k5tZ3f4js=;
 b=CVdMbl2/EEMP8Xpdyhq/95xe+qmccGEEOOvCW89cMUh8CDU9De508Hpw2T84PH9X0Q
 71t/PRK76REP/JV5IxmXqNDG9fJrhMGzpFsn+tea0iaq0RgegXeb328e7/1MZDV8qmZg
 XKJc+MzTJho16a0MfgbeJwoE+g5MmUDVNAga3Kbs2oJ18oFd6C+mSxhDqjJeo7u2oCU2
 VpsnHrYfjxVlVuDlN9RCLHvM/pEH2alLvnkq4LL12F9qg2eu5b7dV+fqesvBdzldHcK3
 Vm6ezLukLkBI63/g2GQ3wfOQ2XpXHu7SjqUdahs+PJ6HIidDzhtdjGicdLOwvl1Iw/4B
 WNcQ==
X-Gm-Message-State: AO0yUKXmj/syT89Icmz9MdsGXdq7+Ca+Ox304H4xLC+y3WyjfpN3Z2yH
 aD8KQEMXLpkin/4zZPAfpeTJOw==
X-Google-Smtp-Source: AK7set+KNpoC5RPaWUsi94YmpCCfyD/eZBqtQc7BYKrJ1PRcCkCsgw86ag4Q0a/g/p80hHObIuQQpg==
X-Received: by 2002:adf:f68d:0:b0:2c5:8d4a:3695 with SMTP id
 v13-20020adff68d000000b002c58d4a3695mr2753119wrp.59.1676975189182; 
 Tue, 21 Feb 2023 02:26:29 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a5d4890000000b002c56a991971sm7539413wrq.76.2023.02.21.02.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 02:26:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 65E3F1FFB7;
 Tue, 21 Feb 2023 10:26:28 +0000 (GMT)
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-7-alex.bennee@linaro.org>
 <0daeb57d-28ec-4595-8b2e-32e4e01348d8@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 06/21] gdbstub: move GDBState to shared internals header
Date: Tue, 21 Feb 2023 10:24:44 +0000
In-reply-to: <0daeb57d-28ec-4595-8b2e-32e4e01348d8@linaro.org>
Message-ID: <87v8jvqppn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/5/23 08:43, Alex Benn=C3=A9e wrote:
>> We are about to split softmmu and user mode helpers into different
>> files. To facilitate this we will need to share access to the GDBState
>> between those files.
>> To keep building we have to temporarily define CONFIG_USER_ONLY just
>> before we include internals.h for the user-mode side of things. This
>> will get removed once the state is fully moved.
>
> You don't have to have this hack if you don't ...
>
>> +typedef struct GDBState {
>> +    bool init;       /* have we been initialised? */
>> +    CPUState *c_cpu; /* current CPU for step/continue ops */
>> +    CPUState *g_cpu; /* current CPU for other ops */
>> +    CPUState *query_cpu; /* for q{f|s}ThreadInfo */
>> +    enum RSState state; /* parsing state */
>> +    char line_buf[MAX_PACKET_LENGTH];
>> +    int line_buf_index;
>> +    int line_sum; /* running checksum */
>> +    int line_csum; /* checksum at the end of the packet */
>> +    GByteArray *last_packet;
>> +    int signal;
>> +#ifdef CONFIG_USER_ONLY
>> +    GDBUserState user;
>> +#else
>> +    GDBSystemState system;
>> +#endif
>
> ... nest these.  What's the point?

Well you end up having to ensure the chardev definitions are then
available in all files that include internals.h and I'm not sure that is
better:

--8<---------------cut here---------------start------------->8---
modified   gdbstub/internals.h
@@ -33,18 +33,16 @@ enum RSState {
 };
=20
 /* Temporary home */
-#ifdef CONFIG_USER_ONLY
 typedef struct {
     int fd;
     char *socket_path;
     int running_state;
 } GDBUserState;
-#else
+
 typedef struct {
     CharBackend chr;
     Chardev *mon_chr;
 } GDBSystemState;
-#endif
=20
 typedef struct GDBState {
     bool init;       /* have we been initialised? */
@@ -58,11 +56,8 @@ typedef struct GDBState {
     int line_csum; /* checksum at the end of the packet */
     GByteArray *last_packet;
     int signal;
-#ifdef CONFIG_USER_ONLY
     GDBUserState user;
-#else
     GDBSystemState system;
-#endif
     bool multiprocess;
     GDBProcess *processes;
     int process_num;
modified   gdbstub/gdbstub.c
@@ -48,6 +48,8 @@
 #include "exec/exec-all.h"
 #include "exec/hwaddr.h"
 #include "sysemu/replay.h"
+#include "chardev/char.h"
+#include "chardev/char-fe.h"
=20
 #include "internals.h"
=20
modified   gdbstub/user.c
@@ -13,8 +13,8 @@
 #include "exec/hwaddr.h"
 #include "exec/gdbstub.h"
 #include "hw/core/cpu.h"
-/* temp hack */
-#define CONFIG_USER_ONLY 1
+#include "chardev/char.h"
+#include "chardev/char-fe.h"
 #include "internals.h"
=20
 bool gdb_supports_guest_debug(void)
--8<---------------cut here---------------end--------------->8---


>
>
> r~


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

