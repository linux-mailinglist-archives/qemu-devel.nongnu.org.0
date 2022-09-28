Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AF65EE6A3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:31:32 +0200 (CEST)
Received: from localhost ([::1]:48314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddiN-0005Uv-Rg
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odden-000843-KI
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:49 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:50529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddel-0006Os-4v
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:49 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mf0FY-1pB3WX0hC6-00gXZa; Wed, 28
 Sep 2022 22:27:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 09/37] linux-user: Fix strace of chmod() if mode == 0
Date: Wed, 28 Sep 2022 22:27:09 +0200
Message-Id: <20220928202737.793171-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:e5bRlx8cncNGHpvCdrDtM95Fynmc9/5QCWFaTr+tmRn4+vqvvcu
 mbyUHnH1yvu9AImxDeg/dmlmv+f/E4E8zusAqvlcs60RfTz5Rlul2/Z6U14SKYIZcLCen/M
 QwFFrdX8X0pdS5d6L2qtgjLLiUdQaOutqiNEMVKxcLhfhw4apZU6C0FEp36RuVimgPzBZqi
 Uj4TkY4vHcSAO72TZPr8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CMoZQqLatBI=:Oc5s0/qlk1osiy7LpG6hs5
 sFoBx0U6b+cjfpjTijJ15ISCbBRH6ARrXctEWcSC1gmtE+/ttcpLVzA7mWQmQZwRfUmHKAZje
 /iuoThEB4GGykzAAGBAGYA1DxwxzbGJ5iKc7s68lOscXvfeEqnZ9IsilAMdP9WIFgFvOJbc8D
 espnjAsIo1pOk+DdvrqE+fmTKOTGFiZvJ8uQEe8P0ndLpaPzzvikuHzt4EDuhhqLjYHkJuczq
 uJcex2FO6BWYdNa9++QOt9okAZnE3ldjvrq/mFnIDzk+rTQV4LDb4U2Kna8//lW1YGN/af558
 BkeqwQNEM3Y136Qv+XqWed5ykn67cfH1W+6fJJS3mIkAzMlaff04adfTn0I9uHOdxAsuIrlUo
 1qC1Vy6oZlP8EBD2nkFCtUzUkqF+ipCakhyKGk0y8liG/lbnyvPE61Yo4a/abtFrRIK9zTVUt
 GsF+43wQPogZWjYjxIvLK9EGpukrkpi8X+K0+7E4BQKxbIica0m/goNjRPZBBlR9sQ0EpfDxR
 5oRJjUA9FXndzHgsBvgyN3bCvXPVVAOF799kQmAyiZiUZG9kqKKY71FJJ0L6e7NX97ufSAzM3
 uTyv3ExV9gd+TDwr5g0MswmoZZtvJMFN0LEEUS5KvNA9V+KZYhSII1GpO22wXyxq7ae3Hhcbr
 2PvDxYt+5hX3hBQEPALKXujaYmNjDlK1WZcLTt+CtV2BhqAExFVDjdXj/vaDmZg3BUJB+9F+J
 oSV+r5UY7AhUZo5PhDtBsbf71WkJ6u6KC4Iy3s6+6LQKzby5Ou4epDzqv4G6gEjyq9hs9sPzy
 Sa0iOvr
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Helge Deller <deller@gmx.de>

If the mode parameter of chmod() is zero, this value isn't shown
when stracing a program:
    chmod("filename",)
This patch fixes it up to show the zero-value as well:
    chmod("filename",000)

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220918194555.83535-8-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 5ac64df02b85..2f539845bb90 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1505,6 +1505,11 @@ print_file_mode(abi_long mode, int last)
     const char *sep = "";
     const struct flags *m;
 
+    if (mode == 0) {
+        qemu_log("000%s", get_comma(last));
+        return;
+    }
+
     for (m = &mode_flags[0]; m->f_string != NULL; m++) {
         if ((m->f_value & mode) == m->f_value) {
             qemu_log("%s%s", m->f_string, sep);
-- 
2.37.3


