Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA245702750
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:34:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTd1-0003kg-8W; Mon, 15 May 2023 04:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc5-0003hm-7e
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:28 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc3-000245-L2
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:24 -0400
Received: from quad ([37.169.188.112]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1McpS0-1qY5Xu3Joo-00Ztzk; Mon, 15
 May 2023 10:31:21 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 7/9] linux-user: Don't require PROT_READ for mincore
Date: Mon, 15 May 2023 10:31:11 +0200
Message-Id: <20230515083113.107056-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515083113.107056-1-laurent@vivier.eu>
References: <20230515083113.107056-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:POYU1FMBrgY1llzvC1Uzovqgy+EWww/hd+9jojtKk5RnZkDzcRc
 EnHaEcXijtwo3ONrI3UnpgHw9S/AhqeLsV/tVFkjhvNIiPVE6ZLtAeSwlICPXB+Fnau/tKt
 y+RJUmQquGJiGKxmD3dXBh2ZoYCmQ/aXoFU7z8iMtpsASWU5OPKqkyOTiPimM7XKrNXIROu
 vyFJYD4Ae5O0oFsIx6s4Q==
UI-OutboundReport: notjunk:1;M01:P0:Qh1NnHwdgXA=;XNPqZh3zcqNsrgxAqTlpOaHeS8G
 aAYFZvFBA3ySwNxfaBf1ABg7vLFG8XyHK4LTsvs9B+m4SNttr6cM5vLzk/mDvg27FlwocDJri
 K50Dspywg0kWGcJyP1OYHrQMAwqLX9eC5ABa7p0iVqE3qIvCCs1/5ynUWnpC7qxz+IK6JuLd7
 FSTWtm1cYzLhc7ukVKOpWwb+uqELLV/5ueqa8+Uv9wT9lhIKpD9ptWIEId3IozfSmZ+juOYX/
 +23bXgx0Xq4L9AdzT5854zblpaHR63PAzEVNxvVgE9wPJNEsl1GHj4xGX8DVMcWozyLpGZMDN
 NrW3wPcMcGDMRqMhaTaxJ8M+k5VfP6MPZMW378yayMnI4IgxX36eMB8UUvafEa3XrsRwVwoZJ
 X4PJWSPqyeYHK29hpwA0n9+6A5HdnNZc2tTRVla8BAyJT0pAmKpW3zumw/z3Rq7ykTHfZXL7W
 xQpRRRDrPOc04VIwqWkoU6pW1epfEmwfAJ79YD7YpzrBuuu9RJOP2sBV5fuIcC1LFMdltxS6d
 ncAOnksdVuvVSWAuKJPn+WEtTBDhzWFPuNFwlAo5qV9mAyQ2ZHj67+qe1So+4f6AVLN04XJl/
 uViNe/BGgro59hQmpuFpW9X6t7RYYKljuCuP3uOoQkMWPIg0COOHnQr+GYgjQeY6Dph0PCIsx
 sFYmxLRGKJY17uPw+97FHZo272wU9OxYhnH+6fKxmA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

From: Thomas Weißschuh <thomas@t-8ch.de>

The kernel does not require PROT_READ for addresses passed to mincore.
For example the fincore(1) tool from util-linux uses PROT_NONE and
currently does not work under qemu-user.

Example (with fincore(1) from util-linux 2.38):

$ fincore /proc/self/exe
RES PAGES  SIZE FILE
24K     6 22.1K /proc/self/exe

$ qemu-x86_64 /usr/bin/fincore /proc/self/exe
fincore: failed to do mincore: /proc/self/exe: Cannot allocate memory

With this patch:

$ ./build/qemu-x86_64 /usr/bin/fincore /proc/self/exe
RES PAGES  SIZE FILE
24K     6 22.1K /proc/self/exe

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230422100314.1650-3-thomas@t-8ch.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 00a779797efb..6655982821ba 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11993,7 +11993,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_mincore
     case TARGET_NR_mincore:
         {
-            void *a = lock_user(VERIFY_READ, arg1, arg2, 0);
+            void *a = lock_user(VERIFY_NONE, arg1, arg2, 0);
             if (!a) {
                 return -TARGET_ENOMEM;
             }
-- 
2.40.1


