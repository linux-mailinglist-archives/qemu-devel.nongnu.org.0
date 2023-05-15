Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348A570274B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:34:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTd1-0004Ec-Pt; Mon, 15 May 2023 04:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc6-0003i2-2l
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:28 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc4-00024p-4U
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:25 -0400
Received: from quad ([37.169.188.112]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MF35K-1pwFd11y9Y-00FRXG; Mon, 15
 May 2023 10:31:19 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 5/9] linux-user/main: Use list_cpus() instead of cpu_list()
Date: Mon, 15 May 2023 10:31:09 +0200
Message-Id: <20230515083113.107056-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515083113.107056-1-laurent@vivier.eu>
References: <20230515083113.107056-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5seb2bR3HmVylpNwNFNlpL8pQMCZZFvbQMl7NUujwjbdTpK6H7x
 jl0P6QTqrZiqaM6gHaAbZtf7vKbtu97fO/Zhum/Qf/Q0J/xEcrQiowGztGfG09WjfDh/doc
 O08Lc5i9Njry8vcFBQ/J8qfdaRkpNwbtoIB32ZimWNpeYLCPQtahQlvpPPpdNss1SVQVgjp
 pt2fwtAnA3cw55lGb3s5w==
UI-OutboundReport: notjunk:1;M01:P0:XD+nFWB5Wcw=;fapg9rV/QaLPBJbODCRndZEYHXD
 TJ0mzjmZI8l4hr51SZikRGEr4MVnlKS+yr2/AiLhUWDafUx48QbW9u+4gv0yUVBCzJcI/S7RA
 g6XO9trveo9LRTOCA6Y/RJBGg3DF8i5AAnfvT4hwzyiz7eFcAye/95i/Jzky0jxaqgo55u6rz
 Z+d+KdOiyVnTblivzfa3euFX5bQq5KjUpkuMmFQxBQnxEET0PRAYlA1gzp8EZqdHKC/ISazZk
 0ZjjH5WFn8D+Dpv5bHqpC1MCP73BGX+OgrJ9BxqJb8D7lFPr/QgrB/+2M/tr95xf+X7dCmlh7
 Zosd9uHJz1nNqZq+TZM+z9k7FUpneGDEk72phpx+hRx4GR5Y6WFR0WGA+mj7rGTrigb3giWE1
 5aCBCcrHBynNo2I0WtuY3Tha9bO4MV11sErL2HefkDS62q1rHNwx+RnTVZd6QA/Pp4TDMvAGT
 LVk06h6hVYZ/8qKFOmJ7d09hNwWqmPknvLKWARh4xx0Ez2dJo8goee07RZxjbyVYDqiEhOK95
 5dIMPkoi2H2DLCXibH13yEaslKVkHnYtN9iHvkilCYct3VQxunEYbVwmQnm8OSluh5kHlua7W
 hxukXJaLTIshCqqPfFDtZs8G+kaPEcOyzQO4m2j5L29RQpsl8hZejlaZeHF07GEGpXIgIH/mU
 y+6BhgTlXuqjySWlLiqFC6cnnV+ICXHoybngQoQDdg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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


