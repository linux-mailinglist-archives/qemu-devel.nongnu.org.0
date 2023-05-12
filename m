Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0919E7006AF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:24:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxQrL-00061n-Ce; Fri, 12 May 2023 07:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrI-0005zF-2u
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:48 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrG-0002Oa-K4
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:47 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MTfgb-1plee70rq1-00U4e4; Fri, 12
 May 2023 13:22:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 5/9] linux-user/main: Use list_cpus() instead of cpu_list()
Date: Fri, 12 May 2023 13:22:34 +0200
Message-Id: <20230512112238.85272-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512112238.85272-1-laurent@vivier.eu>
References: <20230512112238.85272-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VTO7fFvcDJnQf1xL20Q6ZxS1TwiZu6aIq588bgnD6Xr2Gf3cp+4
 s7ZL9Pw7bTg1LN7i3UinIIgrKCCeAlnF3ofT50vqcyB+imrXyt9DnJ+SSFngdPT9tVWcKRx
 xf/kDyWbWZgFLeEHQGHmI/XLs8/0vubj1zKk02lLoimnMRVIv83biZcWzxyG/zAUhCDizWL
 35p/LEt7eL9TkD2Cg8vRQ==
UI-OutboundReport: notjunk:1;M01:P0:K3P2rFZUWn4=;t5fxcI8pejON6nUJ/MYnDnCBZEq
 MMT1VL/e/7fzwokwgcKEMJCxdu7KacKTYEdO1eX71C1F7VPfuxuEmFVLoAEPKmbuvntj6Frf/
 YQX9zhf/hEYd8lHAU+xucXIHpCfEvxWdXZuFMXj/Ut2jyERXPK9Jap+4b+Wpmv1RXY3ScZVsL
 Fi3irBDsswQovLH/n5+CYToOlR5zejV+KcGQetvGXN9rZk5bWzbkjlXv/fHgfS6NMrDb0vNl9
 YfhbuiZJAwt3kqnJpsnxiRSSEhf0rK9MHdPaPG+gWT+ES0gSI/iVjYPGKWwM8UKCSlfu4l2cd
 iGID05HVLKVe5/vyGDnkySNXrdv6K72XWBxO5uHahmGPadhB9FxaqntaEWyj+FnfUg2+YG9DZ
 IjjVv322E42bBEoIeyKKDni0+Afqzg4JzYd+0Bta1xclkErWQoqTlLdXCuSdyJkZ+MIrDIJVk
 BZsgSqQvWRxlwoNeen5jPvyGDq2EfCW/xO70IzdlCttJYW1DiPJ1j2s/7gRBN9ffCP7YS82dN
 SoI4dqO9Y/+iJ4LygVessVVPtDtrucixc2tllELjRi96oMf89sOIAf+iVaQ0sLfcFJkD5pVjI
 XBudwj92Qpfo/+ds9oZ9PwlKgErZjo/cGw4Uq3UZVN/6SCS5d8/6QeiRZzRZbO2yK090xkXlc
 vui88d67wIfkyx9cezCfYUFHSlxZpsHm2AlzFX86jQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

This way we can get rid of the if'deffery and the XXX comment
here (it's repeated in the list_cpus() function anyway).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230424122126.236586-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index fe03293516a5..aece4d9e9119 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -359,10 +359,7 @@ static void handle_arg_cpu(const char *arg)
 {
     cpu_model = strdup(arg);
     if (cpu_model == NULL || is_help_option(cpu_model)) {
-        /* XXX: implement xxx_cpu_list for targets that still miss it */
-#if defined(cpu_list)
-        cpu_list();
-#endif
+        list_cpus();
         exit(EXIT_FAILURE);
     }
 }
-- 
2.40.1


