Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A26166B93
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 01:27:18 +0100 (CET)
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4wA0-0004z1-S8
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 19:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34157)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changbin.du@gmail.com>) id 1j4w92-0004Ws-CU
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 19:26:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <changbin.du@gmail.com>) id 1j4w91-0006zU-Bs
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 19:26:16 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:37584)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <changbin.du@gmail.com>)
 id 1j4w91-0006z8-6L
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 19:26:15 -0500
Received: by mail-pl1-x644.google.com with SMTP id c23so111734plz.4
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 16:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2RsVayiSQuQhZNhepkVxMmWRfo73hY+d4lGJZW6mBLA=;
 b=BkKwg1c1x436ItoanfTrT3GXebMLlDzFczhOAn5w3QD14V/M/RveURxG7LKEZgVAMb
 k8DVu+9s2oEIHAPaRowLoU0KQjo2ZNS6G7SiwWyFYn+DjZ2arZrsZhcQ1fIJsfl94RNS
 3sh+wggcbeKPM7kE1dDAQ6mjkzXGJ5dVcRrxRUTW51/MQ51jwoRYPH0+ZS0XBv2O0qxU
 EiNQ3oY43MysHNgGrDarjShsB4DZ1PAuJFUrtyjNq4RkE25jGOYrQ6YpssdmZUoQ0/qM
 NtPcUOJXQnZ2HMd9v4xjK7GzIXldDPvT6UpYHjie1yS4a4PrwqMP1vpSHGUODW/NyjWl
 Jgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2RsVayiSQuQhZNhepkVxMmWRfo73hY+d4lGJZW6mBLA=;
 b=UxJgCK1ftaRFbnI3TcvELppBzPM4tUtGD3hGzdv7VcpAvaWVn5RqeVcpeokE5vubHM
 vWmdnlV5HCn8ht5tiiEo97KJmlECnghQzuqRPk7q0HUKCxe1MWIihLzVbFq2Emo83YEv
 GFO+aO07cp9WrNiIrb1c2T9WVTh4fIYdHucHDdVH9nYmpirdyDwt5j2SprX3OPsGbM0l
 UltXIzBQ2/kWm6T8QVyH8/YQY1ES441fp6hT9hAes/ga2lYFGeirnQGvUd1gankpbMvz
 hi6oWjsRfbYmMwcgqdo1ijzi/0Kh8n9SDYE3Lk0Ibxhdi6XP2Fix//XsWoAbHOc54O8k
 aUqw==
X-Gm-Message-State: APjAAAXq0CIWW+xOH/4YiOwgG1g/Ngjz7ldvzlsMhX6HBreBrtNQUtSm
 S+3UuC+20aaPkY+F57+lCsw=
X-Google-Smtp-Source: APXvYqwlF5QLObK7IJ6YVc7SlXFaYZnN+60iFXfHa668hwz4D34nU6bSvVeS+Ydt6i0eDrFvi74E5A==
X-Received: by 2002:a17:90a:f84:: with SMTP id 4mr6748701pjz.74.1582244773951; 
 Thu, 20 Feb 2020 16:26:13 -0800 (PST)
Received: from vultr.guest ([149.248.10.52])
 by smtp.gmail.com with ESMTPSA id i3sm717181pfg.94.2020.02.20.16.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 16:26:13 -0800 (PST)
From: Changbin Du <changbin.du@gmail.com>
To: alex.bennee@linaro.org,
	philmd@redhat.com
Subject: [PATCH v2] gdbstub: Fix single-step issue by confirming
 'vContSupported+' feature to gdb
Date: Fri, 21 Feb 2020 08:25:59 +0800
Message-Id: <20200221002559.6768-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: qemu-devel@nongnu.org, Changbin Du <changbin.du@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recently when debugging an arm32 system on qemu, I found sometimes the
single-step command (stepi) is not working. This can be reproduced by
below steps:
 1) start qemu-system-arm -s -S .. and wait for gdb connection.
 2) start gdb and connect to qemu. In my case, gdb gets a wrong value
    (0x60) for PC, which is an another bug.
 3) After connected, type 'stepi' and expect it will stop at next ins.

But, it has never stopped. This because:
 1) We doesn't report ‘vContSupported’ feature to gdb explicitly and gdb
    think we do not support it. In this case, gdb use a software breakpoint
    to emulate single-step.
 2) Since gdb gets a wrong initial value of PC, then gdb inserts a
    breakpoint to wrong place (PC+4).

Not only for the arm target, Philippe has also encountered this on MIPS.
Probably gdb has different assumption for different architectures.

Since we do support ‘vContSupported’ query command, so let's tell gdb that
we support it.

Before this change, gdb send below 'Z0' packet to implement single-step:
gdb_handle_packet: Z0,4,4

After this change, gdb send "vCont;s.." which is expected:
gdb_handle_packet: vCont?
put_packet: vCont;c;C;s;S
gdb_handle_packet: vCont;s:p1.1;c:p1.-1

Signed-off-by: Changbin Du <changbin.du@gmail.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

---
v2: polish commit message.
---
 gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index ce304ff482..adccd938e2 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2111,7 +2111,7 @@ static void handle_query_supported(GdbCmdContext *gdb_ctx, void *user_ctx)
         gdb_ctx->s->multiprocess = true;
     }
 
-    pstrcat(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), ";multiprocess+");
+    pstrcat(gdb_ctx->str_buf, sizeof(gdb_ctx->str_buf), ";vContSupported+;multiprocess+");
     put_packet(gdb_ctx->s, gdb_ctx->str_buf);
 }
 
-- 
2.25.0


