Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A646F545D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:17:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Xm-0004Ee-Lv; Wed, 03 May 2023 05:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xh-0003qY-An
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:57 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8XZ-0005rN-UZ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:57 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f315735514so14865255e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105167; x=1685697167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C3lCzFefD4c64bE6al6V8o2voUIucp9QMyCoP1My2wo=;
 b=m7P95diAKx3RwvY3MuY2qjVhwOX2cjDmTCnpmWwXekQzMWds6JYZ/sJ5aWh90KS48t
 /VtT4T/Iq4b0F6IzXrQJlYMjoY7EvtHoNd6NggvNAxiQ44Ebz96ZzeglRiermpLjiC0/
 G6E2gD8yjBItzgBph8q7RMgT1nEFn6mRzTY4a1pREC/6nW8V/Gz6/QnvqSkxGMxMXT/K
 LQIGKpyhoyKpW8Vmfg2xH9wSnBqC15Xg0AXEmhrQPqlawu2avVsj7+PTazwFu+6E2mqR
 97L67oP1eAnbseDrn0hre7hu/wiashOtWi4DWrogwMOlZMQPzAs2FbD7vRfxxrBKSu/5
 v3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105167; x=1685697167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C3lCzFefD4c64bE6al6V8o2voUIucp9QMyCoP1My2wo=;
 b=es+BCUb1Na6lPwJyGDCOPpDkRNIk8kBX9MCi69iFBFb5LV/bMSif+axK5qmNAVFYte
 CYy+FgnXmUSGLfzFvGNbWuV0h9qWjNptIbFzB7WVxJJvZ2t43NE5rbMsMhtei4d0PrRg
 kHdHJGchifVo0goYtnyQE+OEyIBarNk1zI5uTzjIpMXD29ESc+ltC4jyrPMlps9fGP2u
 vRL+gpwD8EhmF5bs1I2nzmDOoKE/7fs4JCZTcvJJPItBJK4IKhTSLLwZHPBh0kyyt8VA
 Isv4XquTor/N+qyDznNBXE5Io1uw9/ohn2TvsMw5P+ufQJ1L+1y0DkVgERr5hOclD5tC
 2x5Q==
X-Gm-Message-State: AC+VfDzwl8EmzIGVAa9pnzCwuC0NGjPY1zssO7XFtpmSXE7n9GCPYJ8+
 /Yl8EF+pzpXm4Z6NBXUEbR3d/g==
X-Google-Smtp-Source: ACHHUZ72bqVLp/pk0XQ+2u8vFz9zKhcNYWfQgzNYkagXKxWa+INexrxTEG0y8GItt14E5AtLeNlu8A==
X-Received: by 2002:a5d:570d:0:b0:2f0:583:44be with SMTP id
 a13-20020a5d570d000000b002f0058344bemr1019811wrv.0.1683105167267; 
 Wed, 03 May 2023 02:12:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a5d6e89000000b0030629536e64sm9382356wrz.30.2023.05.03.02.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5784A1FFBD;
 Wed,  3 May 2023 10:12:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/22] docs: document breakpoint and watchpoint support
Date: Wed,  3 May 2023 10:12:25 +0100
Message-Id: <20230503091244.1450613-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This varies by accelerator. Also mention the modern bear trap that is
ASLR.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/gdb.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 453eb73f6c..7d3718deef 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -46,6 +46,28 @@ Here are some useful tips in order to use gdb on system code:
 3. Use ``set architecture i8086`` to dump 16 bit code. Then use
    ``x/10i $cs*16+$eip`` to dump the code at the PC position.
 
+Breakpoint and Watchpoint support
+=================================
+
+While GDB can always fall back to inserting breakpoints into memory
+(if writable) other features are very much dependent on support of the
+accelerator. For TCG system emulation we advertise an infinite number
+of hardware assisted breakpoints and watchpoints. For other
+accelerators it will depend on if support has been added (see
+supports_guest_debug and related hooks in AccelOpsClass).
+
+As TCG cannot track all memory accesses in user-mode there is no
+support for watchpoints.
+
+Relocating code
+---------------
+
+On modern kernels confusion can be caused by code being relocated by
+features such as address space layout randomisation. To avoid
+confusion when debugging such things you either need to update gdb's
+view of where things are in memory or perhaps more trivially disable
+ASLR when booting the system.
+
 Debugging multicore machines
 ============================
 
-- 
2.39.2


