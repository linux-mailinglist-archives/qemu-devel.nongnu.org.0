Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C976C69EA82
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:57:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUbVI-0007YG-Ls; Tue, 21 Feb 2023 17:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbV6-0007OQ-GD
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:52:45 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUw-00046D-2b
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:52:44 -0500
Received: by mail-wr1-x429.google.com with SMTP id 6so5622858wrb.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 14:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mUY4+g/opijKwSa+F/l4rWh/3cE9JUQ/z+LHjWXlOU=;
 b=j93AlVynkig88vm6c4n5Jmn15lyRfnIsr3Wx3S/YdEq4YBon8O97toruA2X3zN+H15
 Ber/+RUafLGZXD1TsLYB6Cm8thNClKO86LwIenPSsKAf/t0YA7RFr/L2PayzM7Z26Nmu
 mPEoLP84Huum+JZZ0sgv1r401WVBxVHoFS69/uh31Ety6x/v381wCgkcfhWfWZ4CmUZY
 qzqOCjrqxamQy+hV3s2P7vXu9GUzt5MN00nk+XrZYbZCSxH+KJsH4WLOjSkqx/fUgoGu
 Ez7jZcdWKneNcLpjkISYSgwlL6NUUEXQYC6IU0UGVlzpdotiKAQoyOR3frCEHh4E3nep
 RPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9mUY4+g/opijKwSa+F/l4rWh/3cE9JUQ/z+LHjWXlOU=;
 b=w92yPjHO50f4SrTvHMemHuo2vwUABXNusO2PKm209pfkKzx5D5ML7JOfacynLwYUTl
 zAJ0bV0AiUu5innR8+8UpUOPt5DfoPEeSxfuplaCEjkLnK+IQ0Y+LvZ2mD4MIKqnI1q4
 F6mlnukyKexLFBTJ61QSNDJNgDSd3xObA/qoAHaXyXZfamRaKl9WAT0TJsntF9Q+/+fm
 ymxverOuOBr32HZnwJZvPe5ewDe/CUGiUSZINpWyyAOQg1r8IIk9Rdj+7v+7/+YI2v84
 4Ann07tWwy9JF6nz1lIikCwsngEGKdj7cVOiLhc0XANnooDvNxZ9c2zl4YGfqKAUK0cp
 /LYw==
X-Gm-Message-State: AO0yUKVpaX4FkFIKzTYbvgyDE2HoZiiQmvvRnQdoid+NghAoBjHawQ1x
 Wbdk0GXG4i3xemvrshm9KY3PIw==
X-Google-Smtp-Source: AK7set/bnIGhCbagiHagOLRfV3Bh3fHLNonBUU//Hl1k++vv8IYX2cFeE31LHz1xz2LL9SHq6/NBEg==
X-Received: by 2002:adf:e584:0:b0:2c7:4ec:8d79 with SMTP id
 l4-20020adfe584000000b002c704ec8d79mr3078591wrm.21.1677019952541; 
 Tue, 21 Feb 2023 14:52:32 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a5d510e000000b002c569acab1esm5965998wrt.73.2023.02.21.14.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:31 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3A1F1FFC1;
 Tue, 21 Feb 2023 22:52:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 11/24] gdbstub: rationalise signal mapping in softmmu
Date: Tue, 21 Feb 2023 22:52:14 +0000
Message-Id: <20230221225227.3735319-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

We don't really need a table for mapping two symbols.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
---
 gdbstub/softmmu.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 864ecee38f..79674b8bea 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -499,21 +499,16 @@ enum {
     TARGET_SIGTRAP = 5
 };
 
-static int gdb_signal_table[] = {
-    -1,
-    -1,
-    TARGET_SIGINT,
-    -1,
-    -1,
-    TARGET_SIGTRAP
-};
-
 int gdb_signal_to_target (int sig)
 {
-    if (sig < ARRAY_SIZE (gdb_signal_table))
-        return gdb_signal_table[sig];
-    else
+    switch (sig) {
+    case 2:
+        return TARGET_SIGINT;
+    case 5:
+        return TARGET_SIGTRAP;
+    default:
         return -1;
+    }
 }
 
 /*
-- 
2.39.1


