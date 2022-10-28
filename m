Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9433A610BF8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 10:13:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooKU9-0006Sl-Bq; Fri, 28 Oct 2022 04:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>) id 1ooKTs-0006O5-0x
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 04:12:49 -0400
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>) id 1ooKTn-0003cf-D8
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 04:12:43 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1666944753; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iohIokE+SsiBWTk+v18179SCqL5eFJ021FLTtp+tr+oq6SpicbIyguStuE3UeJPJDJglsO5jBBU0cmnCtcRPNNYmJ9IsVN9T42gIqQX2YIpi9etO9B8QTk//TPOKV+ehcOq2R+cflCGbBbVdzsOwA8r+zfTD7Mlh2V8zrS1mZV4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1666944753;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=9X5VW/nE2d8PpcwWVGulBYzeAlxy1f0oAlCeLMUToYw=; 
 b=QBit8salSmprMZtFuCCn6kAr4csD6UahtN1Ox4UFCui2BXFfxHfDhk/TanYW+8yE4EdaO+6nuPs/yCpV1zGKAx/gS0yl4xsDYueRi1Dw94M5LSGuGloiB89o2Gjaq8pfFkTt6OD3HouTlqw/ZkiqZC7LOk+uFTzRR7iarK+SxM0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666944753; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=9X5VW/nE2d8PpcwWVGulBYzeAlxy1f0oAlCeLMUToYw=;
 b=F2eIDPhz/XaL0cYzt623Rr8VSPjKijviH8JNPmsCdBq9gdW/92DVj4t4jekt7zI5
 2nRpkFwmKC8LaMGohyWmrpEoNobp6ouOW2N/ilwuqoaFpzstA/+Uk6YYg1gZRJZF5iV
 IIihMS2H4tg7SN3S8mE8kQJUgYptPQxgEdVIZiJQ=
Received: from edelgard.fodlan.icenowy.me (112.94.102.53 [112.94.102.53]) by
 mx.zohomail.com with SMTPS id 1666944751714986.2019188069779;
 Fri, 28 Oct 2022 01:12:31 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] linux-user: always translate cmsg when recvmsg
Date: Fri, 28 Oct 2022 16:12:20 +0800
Message-Id: <20221028081220.1604244-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.18; envelope-from=uwu@icenowy.me;
 helo=sender4-op-o18.zoho.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It's possible that a message contains both normal payload and ancillary
data in the same message, and even if no ancillary data is available
this information should be passed to the target, otherwise the target
cmsghdr will be left uninitialized and the target is going to access
uninitialized memory if it expects cmsg.

Always call the function that translate cmsg when recvmsg, because that
function should be empty-cmsg-safe (it creates an empty cmsg in the
target).

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8402c1399d..029a4e8b42 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3346,7 +3346,8 @@ static abi_long do_sendrecvmsg_locked(int fd, struct target_msghdr *msgp,
             if (fd_trans_host_to_target_data(fd)) {
                 ret = fd_trans_host_to_target_data(fd)(msg.msg_iov->iov_base,
                                                MIN(msg.msg_iov->iov_len, len));
-            } else {
+            }
+            if (!is_error(ret)) {
                 ret = host_to_target_cmsg(msgp, &msg);
             }
             if (!is_error(ret)) {
-- 
2.37.1


