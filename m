Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7916332A35E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:11:02 +0100 (CET)
Received: from localhost ([::1]:36342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH6ft-00029u-EU
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6Vv-0000Yx-SA; Tue, 02 Mar 2021 10:00:43 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6Vt-0005X7-0z; Tue, 02 Mar 2021 10:00:42 -0500
Received: by mail-ej1-x635.google.com with SMTP id do6so35842463ejc.3;
 Tue, 02 Mar 2021 07:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BKerV/D4yrodfK5Y4jXpbSJ4FniyHeyLnN3PSysyF8Y=;
 b=kMJ4BRTh216WsJvtpwLF9Q/JYYJMAxN/RnMYJEB28v42yYEMfCi1+F73iF0EulNk10
 7/byMCvtfp4uKTVybvY+WVO3cJ8+l5e9oij5b2MTY1Cmatr0y6Mg9c4usGvYlQibo/w5
 rncAxPnVMgL2/Fpfh1YbjDD2CSQxsfsPR5ZICmMI0227Q8Ssh91RmolTEMZOEvANYbnV
 ER1tqcNI2xm9Fgz/l+E0YxZbq5idig9AFmzulLjyFJJHq7DbwrCy1iHDKJXF6WAFe1tI
 9wCjPXmWtO9lkKCGYITJuZfHvEaP/MaykF1l7qjgrIuBbF7AbgsMDhPWixuKqXVuxkQj
 SgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BKerV/D4yrodfK5Y4jXpbSJ4FniyHeyLnN3PSysyF8Y=;
 b=dDRmIxsIybNwPKQ70gzPwCU/3vib3/BvnjzRhdXx9E9xW6ZDzwSn9QWvV+xORore5t
 ciuatM7nT0wLSeMLyjIeetYrQNs/y+IP/+v6uDRjmn4s30SlwvUX1KUv3x+yINXd9X6j
 PWUJigD3+ynjGSzzYIGvvtHdEHWVbhBJNgGyGWUoPHcjousJ34z/l/TV6K+/NZEcgN5x
 iHa1b5efEnfN2c9cTwLEJpxojB+V2GRW5egAvW0PN9Xv8f9JfWdq2ojBfCLxY0xwQjDO
 0EKrfLZy7IyWprusEO/EwP8E2DVl7XONUdgXl/b+UuMhdlBkFilfS6SeS5I/vyj9H8W1
 7/aA==
X-Gm-Message-State: AOAM533xX+OyFL5y5MV2B/kcMvLY/BwtDUM+1zTOBitq5QBX4cWTkmBp
 R1L1ah4V8Ev2ythNiR0yLwYLUelpgmE=
X-Google-Smtp-Source: ABdhPJxxzAVZkhW4qSE2UIDQzizpVfmV8D6N4Y9vZCqMDEoygSHGBL6xNtZfG8RqIeFMECe388OMLg==
X-Received: by 2002:a17:906:503:: with SMTP id
 j3mr20942376eja.172.1614697233003; 
 Tue, 02 Mar 2021 07:00:33 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i2sm19546374edy.72.2021.03.02.07.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 07:00:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/27] gdbstub: Remove watchpoint dead code in
 gdbserver_fork()
Date: Tue,  2 Mar 2021 15:58:09 +0100
Message-Id: <20210302145818.1161461-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gdbserver_fork() is only used in user emulation where we can not
use watchpoints because we need the softmmu slow path to detect
accesses to watchpointed memory. This code doesn't do anything as
declared as stubs in "hw/core/cpu.h". Drop it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 gdbstub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index 759bb00bcf0..eee4301b5e6 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3349,7 +3349,6 @@ void gdbserver_fork(CPUState *cpu)
     close(gdbserver_state.fd);
     gdbserver_state.fd = -1;
     cpu_breakpoint_remove_all(cpu, BP_GDB);
-    cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
 #else
 static int gdb_chr_can_receive(void *opaque)
-- 
2.26.2


