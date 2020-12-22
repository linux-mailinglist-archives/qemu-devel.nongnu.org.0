Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDEA2E0B34
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 14:57:56 +0100 (CET)
Received: from localhost ([::1]:59412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kriAl-0002Ww-ED
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 08:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBV-0001ie-8y; Tue, 22 Dec 2020 03:38:21 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBS-0002cV-Kj; Tue, 22 Dec 2020 03:38:21 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D0V7y6D8zz7Jcj;
 Tue, 22 Dec 2020 16:37:18 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 16:37:53 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <jasowang@redhat.com>
Subject: [PATCH 5/9] net: Fix lines over 90 characters
Date: Tue, 22 Dec 2020 16:23:36 +0800
Message-ID: <20201222082340.67405-6-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20201222082340.67405-1-zhanghan64@huawei.com>
References: <20201222082340.67405-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhanghan64@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Dec 2020 08:55:42 -0500
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 hang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the line width of code.

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 net/socket.c    | 11 +++++++----
 net/tap-win32.c | 39 ++++++++++++++++++++++++++-------------
 2 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index 61671e41e3..0093ed2794 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -113,7 +113,9 @@ static ssize_t net_socket_receive(NetClientState *nc, const uint8_t *buf, size_t
     return size;
 }
 
-static ssize_t net_socket_receive_dgram(NetClientState *nc, const uint8_t *buf, size_t size)
+static ssize_t net_socket_receive_dgram(NetClientState *nc,
+                                        const uint8_t *buf,
+                                        size_t size)
 {
     NetSocketState *s = DO_UPCAST(NetSocketState, nc, nc);
     ssize_t ret;
@@ -353,9 +355,10 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
     sa_type = sa->type;
     qapi_free_SocketAddress(sa);
 
-    /* fd passed: multicast: "learn" dgram_dst address from bound address and save it
-     * Because this may be "shared" socket from a "master" process, datagrams would be recv()
-     * by ONLY ONE process: we must "clone" this dgram socket --jjo
+    /* fd passed: multicast: "learn" dgram_dst address from bound address
+     * and save it. Because this may be "shared" socket from a "master" process,
+     * datagrams would be recv() by ONLY ONE process: we must "clone"
+     * this dgram socket --jjo
      */
 
     if (is_connected && mcast != NULL) {
diff --git a/net/tap-win32.c b/net/tap-win32.c
index ac139e9ec9..107027aa24 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -63,9 +63,11 @@
  * =================
  */
 
-#define ADAPTER_KEY "SYSTEM\\CurrentControlSet\\Control\\Class\\{4D36E972-E325-11CE-BFC1-08002BE10318}"
+#define ADAPTER_KEY \
+    "SYSTEM\\CurrentControlSet\\Control\\Class\\{4D36E972-E325-11CE-BFC1-08002BE10318}"
 
-#define NETWORK_CONNECTIONS_KEY "SYSTEM\\CurrentControlSet\\Control\\Network\\{4D36E972-E325-11CE-BFC1-08002BE10318}"
+#define NETWORK_CONNECTIONS_KEY \
+    "SYSTEM\\CurrentControlSet\\Control\\Network\\{4D36E972-E325-11CE-BFC1-08002BE10318}"
 
 /*
  * ======================
@@ -136,7 +138,8 @@ static tun_buffer_t *get_buffer_from_free_list(tap_win32_overlapped_t *const ove
     return buffer;
 }
 
-static void put_buffer_on_free_list(tap_win32_overlapped_t *const overlapped, tun_buffer_t *const buffer)
+static void put_buffer_on_free_list(tap_win32_overlapped_t *const overlapped,
+                                    tun_buffer_t *const buffer)
 {
     EnterCriticalSection(&overlapped->free_list_cs);
     buffer->next = overlapped->free_list;
@@ -145,7 +148,8 @@ static void put_buffer_on_free_list(tap_win32_overlapped_t *const overlapped, tu
     ReleaseSemaphore(overlapped->free_list_semaphore, 1, NULL);
 }
 
-static tun_buffer_t *get_buffer_from_output_queue(tap_win32_overlapped_t *const overlapped, const int block)
+static tun_buffer_t *get_buffer_from_output_queue(tap_win32_overlapped_t *const overlapped,
+                                                    const int block)
 {
     tun_buffer_t *buffer = NULL;
     DWORD result, timeout = block ? INFINITE : 0L;
@@ -182,7 +186,8 @@ static tun_buffer_t *get_buffer_from_output_queue_immediate(tap_win32_overlapped
     return get_buffer_from_output_queue(overlapped, 0);
 }
 
-static void put_buffer_on_output_queue(tap_win32_overlapped_t *const overlapped, tun_buffer_t *const buffer)
+static void put_buffer_on_output_queue(tap_win32_overlapped_t *const overlapped,
+                                        tun_buffer_t *const buffer)
 {
     EnterCriticalSection(&overlapped->output_queue_cs);
 
@@ -194,7 +199,7 @@ static void put_buffer_on_output_queue(tap_win32_overlapped_t *const overlapped,
         overlapped->output_queue_back = buffer;
     }
 
-    LeaveCriticalSection(&overlapped->output_queue_cs);
+    LeaveCriticalSection(&overlapped->ou412tput_queue_cs);
 
     ReleaseSemaphore(overlapped->output_queue_semaphore, 1, NULL);
 }
@@ -409,7 +414,8 @@ static int tap_win32_set_status(HANDLE handle, int status)
                 &status, sizeof(status), &len, NULL);
 }
 
-static void tap_win32_overlapped_init(tap_win32_overlapped_t *const overlapped, const HANDLE handle)
+static void tap_win32_overlapped_init(tap_win32_overlapped_t *const overlapped,
+                                        const HANDLE handle)
 {
     overlapped->handle = handle;
 
@@ -447,7 +453,9 @@ static void tap_win32_overlapped_init(tap_win32_overlapped_t *const overlapped,
         fprintf(stderr, "error creating free list semaphore!\n");
     }
 
-    overlapped->free_list = overlapped->output_queue_front = overlapped->output_queue_back = NULL;
+    overlapped->free_list = overlapped->output_queue_front =
+                            overlapped->output_queue_back =
+                            NULL;
 
     {
         unsigned index;
@@ -537,16 +545,20 @@ static DWORD WINAPI tap_win32_thread_entry(LPVOID param)
             dwError = GetLastError();
             if (dwError == ERROR_IO_PENDING) {
                 WaitForSingleObject(overlapped->read_event, INFINITE);
-                result = GetOverlappedResult(overlapped->handle, &overlapped->read_overlapped,
+                result = GetOverlappedResult(overlapped->handle,
+                                              &overlapped->read_overlapped,
                                               &read_size, FALSE);
                 if (!result) {
 #ifdef DEBUG_TAP_WIN32
                     LPVOID lpBuffer;
                     dwError = GetLastError();
-                    FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
-                                   NULL, dwError, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
+                    FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER |
+                                   FORMAT_MESSAGE_FROM_SYSTEM,
+                                   NULL, dwError,
+                                   MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
                                    (LPTSTR) &lpBuffer, 0, NULL);
-                    fprintf(stderr, "Tap-Win32: Error GetOverlappedResult %d - %s\n", dwError, lpBuffer);
+                    fprintf(stderr, "Tap-Win32: Error GetOverlappedResult %d - %s\n",
+                            dwError, lpBuffer);
                     LocalFree(lpBuffer);
 #endif
                 }
@@ -619,7 +631,8 @@ static int tap_win32_open(tap_win32_overlapped_t **phandle,
         snprintf(name_buffer, sizeof(name_buffer), "%s", preferred_name);
     }
 
-    rc = get_device_guid(device_guid, sizeof(device_guid), name_buffer, sizeof(name_buffer));
+    rc = get_device_guid(device_guid, sizeof(device_guid),
+                         name_buffer, sizeof(name_buffer));
     if (rc) {
         return -1;
     }
-- 
2.29.1.59.gf9b6481aed


