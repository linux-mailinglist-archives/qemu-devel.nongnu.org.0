Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493DD1B5343
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 05:57:53 +0200 (CEST)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRSzn-00047N-S4
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 23:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44270)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zxq_yx_007@163.com>) id 1jRSyz-0003hM-MB
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 23:57:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zxq_yx_007@163.com>) id 1jRSyx-0004Vj-2s
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 23:57:00 -0400
Received: from m12-16.163.com ([220.181.12.16]:60863)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1jRSyv-000430-An
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 23:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=9E1CZNuQPYygQrIA1a
 vG1Yp40aB8mphAlO4WROTSJ7o=; b=L8k6Jw4cS9NvON57jhu+q7d1iugOwIAwTE
 vcXeM2plKwFKVmieVw1qukAxACvB42JFeldyqGQ1MdK/y7mGa/IJx1F2vAO5uSXy
 t/OIUcgdYCh9Kg2j8AFQ6Gs+zNQNHSsrLlnbTtMYMoMI+y/PQbQsHrYyz1Xp0CLN
 jzrhgIFTI=
Received: from localhost.localdomain (unknown [39.155.168.46])
 by smtp12 (Coremail) with SMTP id EMCowAAXMv77EaFe2rWwBA--.44287S2;
 Thu, 23 Apr 2020 11:56:44 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qemu-sockets: add abstract UNIX domain socket support
Date: Thu, 23 Apr 2020 11:56:40 +0800
Message-Id: <20200423035640.29202-1-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EMCowAAXMv77EaFe2rWwBA--.44287S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryrXFyDGw18ZF1DJr1fZwb_yoW8GrW7pr
 W5tws3GrW5Ar4rurs5Jay8Ar1aya1kG34UW34kJw1F9a98WF18ZFWvkr1UKryUJrWrWrW7
 Cr1YgFsIyFZ8tw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR3ku-UUUUU=
X-Originating-IP: [39.155.168.46]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEAsPxlUMQk1T0AAAsH
Received-SPF: pass client-ip=220.181.12.16; envelope-from=zxq_yx_007@163.com;
 helo=m12-16.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 22:32:19
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Received-From: 220.181.12.16
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
Cc: xiaoqiang zhao <zxq_yx_007@163.com>, berrange@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

unix_connect_saddr now support abstract address type

By default qemu does not support abstract UNIX domain
socket address. Add this ability to make qemu handy
when abstract address is needed.
Abstract address is marked by prefixing the address name with a '@'.

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
---
 util/qemu-sockets.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index bcc06d0e01..7ba9c497ab 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -939,6 +939,7 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
     struct sockaddr_un un;
     int sock, rc;
     size_t pathlen;
+    socklen_t serverlen;
 
     if (saddr->path == NULL) {
         error_setg(errp, "unix connect: no path specified");
@@ -963,10 +964,17 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
     un.sun_family = AF_UNIX;
     memcpy(un.sun_path, saddr->path, pathlen);
 
+    if (saddr->path[0] == '@') {
+        un.sun_path[0] = '\0';
+        serverlen = pathlen + offsetof(struct sockaddr_un, sun_path);
+    } else {
+        serverlen = sizeof(un);
+    }
+
     /* connect to peer */
     do {
         rc = 0;
-        if (connect(sock, (struct sockaddr *) &un, sizeof(un)) < 0) {
+        if (connect(sock, (struct sockaddr *) &un, serverlen) < 0) {
             rc = -errno;
         }
     } while (rc == -EINTR);
-- 
2.17.1



