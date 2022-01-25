Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E32549A780
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:49:07 +0100 (CET)
Received: from localhost ([::1]:60698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBtJ-0006WG-VM
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nCBra-0005lg-VF
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 21:47:20 -0500
Received: from ma1-aaemail-dr-lapp02.apple.com ([17.171.2.68]:58876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nCBrY-0004BK-Px
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 21:47:18 -0500
Received: from pps.filterd (ma1-aaemail-dr-lapp02.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp02.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 20P2iapP038738; Mon, 24 Jan 2022 18:47:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=20180706; bh=S8GJWADO7DVo4QZTMYQgKLbQ2KKsqaK4FbgoC8TKYlU=;
 b=DerDsD+CYUPPJB/Opn7Lz8QLmh9j1m3z2ibfLYog4vnkUD6RsaoFlbW6OJaea5BHD7MP
 8Wzc85HThxIvPYrLY7DbCCEhkmn+DHf1aqwDi0eojmRWNslY6RXHflgbWo2pHKeixm74
 AbuZ5RFYmwkNfCuadfHrNBX28b0I3d+nGtPe7KKaHX2zylO5Y/KsCATJK3z9WtjkGvIv
 uf5W2YS7v812Y73YrGedsfXCr1sMnc64UTrwCBVp7NcpaQ+IgRzjBnTK9UYVKAf5hzMk
 qwAm3SGODGOG354KRYwUF/WihEANuZPFFX19x/Mm8tXBhZaPR7HPnzNIfdXAQ8ofxgo9 1A== 
Received: from rn-mailsvcp-mta-lapp01.rno.apple.com
 (rn-mailsvcp-mta-lapp01.rno.apple.com [10.225.203.149])
 by ma1-aaemail-dr-lapp02.apple.com with ESMTP id 3drffx60u3-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Mon, 24 Jan 2022 18:47:14 -0800
Received: from rn-mailsvcp-mmp-lapp02.rno.apple.com
 (rn-mailsvcp-mmp-lapp02.rno.apple.com [17.179.253.15])
 by rn-mailsvcp-mta-lapp01.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R6800RCRVQP19F0@rn-mailsvcp-mta-lapp01.rno.apple.com>; 
 Mon, 24 Jan 2022 18:47:13 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp02.rno.apple.com by
 rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R6800T00VO5JQ00@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Mon,
 24 Jan 2022 18:47:13 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-Va-E-CD: 33d0965ff2f0ae46b52d7322939e5982
X-Va-R-CD: 3ed7ece4d00319db8f6ff8287aa9295b
X-Va-CD: 0
X-Va-ID: af431c7d-2a38-4773-96cf-c46b4b561aef
X-V-A: 
X-V-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-V-E-CD: 33d0965ff2f0ae46b52d7322939e5982
X-V-R-CD: 3ed7ece4d00319db8f6ff8287aa9295b
X-V-CD: 0
X-V-ID: 6c25381a-a98d-4a38-8291-ca9e98a746fa
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-01-24_08:2022-01-24,
 2022-01-24 signatures=0
Received: from rn-mailsvcp-relay-lapp02.rno.apple.com (unknown [17.149.232.8])
 by rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R6800DB6VQOV000@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Mon,
 24 Jan 2022 18:47:13 -0800 (PST)
From: Cameron Esfahani <dirty@apple.com>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH] linux-user: Implement starttime field in self stat emulation
Date: Mon, 24 Jan 2022 18:47:12 -0800
Message-id: <20220125024712.6626-1-dirty@apple.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-131)
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-01-24_08:2022-01-24,
 2022-01-24 signatures=0
Received-SPF: pass client-ip=17.171.2.68; envelope-from=dirty@apple.com;
 helo=ma1-aaemail-dr-lapp02.apple.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of always returning 0, return actual starttime.

Signed-off-by: Cameron Esfahani <dirty@apple.com>
---
 linux-user/syscall.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5950222a77..59265ab986 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8107,6 +8107,34 @@ static int open_self_stat(void *cpu_env, int fd)
         } else if (i == 3) {
             /* ppid */
             g_string_printf(buf, FMT_pid " ", getppid());
+        } else if (i == 21) {
+            /* starttime */
+            FILE *fp = NULL;
+            char *line = NULL;
+            char *skipped_comm = NULL;
+            size_t n = 0;
+            unsigned long long starttime = 0;
+
+            fp = fopen("/proc/self/stat", "r");
+            if (fp) {
+                if (getdelim(&line, &n, '\0', fp) != -1) {
+                    /* Find end of comm field */
+                    skipped_comm = strrchr(line, ')');
+                    if (skipped_comm != NULL) {
+                        /* Skip over parenthesis and space */
+                        skipped_comm += 2;
+                        /* Scan starttime (field 20 after pid and comm) */
+                        (void) sscanf(skipped_comm, "%*c %*d %*d %*d %*d %*d "
+                                            "%*u %*u %*u %*u %*u %*u %*u %*d "
+                                            "%*d %*d %*d %*d %*d %llu",
+                                            &starttime);
+                    }
+                    free(line);
+                }
+                fclose(fp);
+            }
+
+            g_string_printf(buf, "%llu ", starttime);
         } else if (i == 27) {
             /* stack bottom */
             g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);
-- 
2.32.0 (Apple Git-131)


