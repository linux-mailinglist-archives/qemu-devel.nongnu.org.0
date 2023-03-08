Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F076B092F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:33:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtrY-0001qm-Mw; Wed, 08 Mar 2023 08:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqx-0001hO-Gb
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:12 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqv-00065Q-KC
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:11 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MIcux-1poWJG0Gaz-00EaXZ; Wed, 08
 Mar 2023 14:29:03 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Mathis Marion <mathis.marion@silabs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 03/28] linux-user: add target to host netlink conversions
Date: Wed,  8 Mar 2023 14:28:32 +0100
Message-Id: <20230308132857.161793-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i5gUJ6oPAGMQEX0gig71wpEiPMxLOQs54tu2Vr7SbCFuEdMv9my
 nApk+dQPn41FFl0hUZ0OZsahpIrpLv8gm9iZq4YML5E63SAEH4jXDIyLNmyrSLOg8uw8T5H
 wVZoxjDyuVuxbQM2JEMPmJyS1DfrBXrpr4hXWGrHbNi626kNAGe2wBJ/8r5TQro1NrzSbxa
 MJQfGHHGd8aR6FMPsxK7w==
UI-OutboundReport: notjunk:1;M01:P0:OARU35/Gy/Y=;9w0J/7QR0spQkli4x6uShH5JE4k
 XFWRRN2fnN2pr0XE/O5zB1xSVDIojqxYWEzt238ovYJpt0cwDPbEyPnWLOx48Z1Of4/40JLrx
 G/12lUGNPXXv/nVHumA7KiDt/35QM6eqdSiB5j4mlzhpF0njUbJZ3PTRGTrIj6KBXLMpk/Vud
 sVlEKLB62v4pO05kWJ5fwlp5zHuzJjIPpoHxvv9SdrkvPV+2dkI6c5cGcWU/3oGlz0b5q6Ilb
 WmC4zFI+CLiz/zG9QvFVQtJpBtwZt3Hj8wbK2gfXplQOaAKY4QmQJPjq9bAsFWjWq+nSC6dHx
 D7rZ5aPbzrauI6VokP0eJdxSRYO2DTBEUdpKtybmwbPbYIBduMwD2cepnZBdIcz3Y57qE07L7
 2AUa3BdeQX5fXRXE0c4isONn/kjeL4auN7H9bUw7rXc3eCvXjhtVRnRxYGO6SYw3BWw/50sxp
 tOHzi3YCpWj7uLPMm6X2rErKa1qlyHaSNBpMnJPIcItnIsQxToYNGbRoo0T4NvaIJQiXEgUP0
 gdXxkGpo6MMyArNLIRjI+gjOgRW1I5GUy5VBPHFAxpYVsEJQwfH8UD4+GXJePvAYYzYMmmF6m
 tXJGkyX6FD8U+oLWHlQYt6pzWYN1tL7lxcOjqa7cw494YslWM9c8YxKv9yyPwHN2nLbrfO9dx
 CYd5Gx6eaj3/ugcBoWiO9/2DlB41XVcMA4Hvc14D/Q==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mathis Marion <mathis.marion@silabs.com>

Added conversions for:
- IFLA_MTU
- IFLA_TXQLEN
- IFLA_AF_SPEC AF_INET6 IFLA_INET6_ADDR_GEN_MODE
These relate to the libnl functions rtnl_link_set_mtu,
rtnl_link_set_txqlen, and rtnl_link_inet6_set_addr_gen_mode.

Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230220085822.626798-4-Mathis.Marion@silabs.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 146aaaafaa13..4852a75d9dcc 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -1284,6 +1284,49 @@ static inline abi_long host_to_target_nlmsg_route(struct nlmsghdr *nlh,
     return host_to_target_for_each_nlmsg(nlh, len, host_to_target_data_route);
 }
 
+static abi_long target_to_host_for_each_nlattr(struct nlattr *nlattr,
+                                               size_t len,
+                                               abi_long (*target_to_host_nlattr)
+                                                        (struct nlattr *))
+{
+    unsigned short aligned_nla_len;
+    abi_long ret;
+
+    while (len > sizeof(struct nlattr)) {
+        if (tswap16(nlattr->nla_len) < sizeof(struct rtattr) ||
+            tswap16(nlattr->nla_len) > len) {
+            break;
+        }
+        nlattr->nla_len = tswap16(nlattr->nla_len);
+        nlattr->nla_type = tswap16(nlattr->nla_type);
+        ret = target_to_host_nlattr(nlattr);
+        if (ret < 0) {
+            return ret;
+        }
+
+        aligned_nla_len = NLA_ALIGN(nlattr->nla_len);
+        if (aligned_nla_len >= len) {
+            break;
+        }
+        len -= aligned_nla_len;
+        nlattr = (struct nlattr *)(((char *)nlattr) + aligned_nla_len);
+    }
+    return 0;
+}
+
+static abi_long target_to_host_data_inet6_nlattr(struct nlattr *nlattr)
+{
+    switch (nlattr->nla_type) {
+    /* uint8_t */
+    case QEMU_IFLA_INET6_ADDR_GEN_MODE:
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "Unknown target AF_INET6 type: %d\n",
+                      nlattr->nla_type);
+    }
+    return 0;
+}
+
 static abi_long target_to_host_for_each_rtattr(struct rtattr *rtattr,
                                                size_t len,
                                                abi_long (*target_to_host_rtattr)
@@ -1314,16 +1357,35 @@ static abi_long target_to_host_for_each_rtattr(struct rtattr *rtattr,
     return 0;
 }
 
+static abi_long target_to_host_data_spec_nlattr(struct nlattr *nlattr)
+{
+    switch (nlattr->nla_type) {
+    case AF_INET6:
+        return target_to_host_for_each_nlattr(NLA_DATA(nlattr), nlattr->nla_len,
+                                              target_to_host_data_inet6_nlattr);
+    default:
+        qemu_log_mask(LOG_UNIMP, "Unknown target AF_SPEC type: %d\n",
+                      nlattr->nla_type);
+        break;
+    }
+    return 0;
+}
+
 static abi_long target_to_host_data_link_rtattr(struct rtattr *rtattr)
 {
     uint32_t *u32;
 
     switch (rtattr->rta_type) {
     /* uint32_t */
+    case QEMU_IFLA_MTU:
+    case QEMU_IFLA_TXQLEN:
     case QEMU_IFLA_EXT_MASK:
         u32 = RTA_DATA(rtattr);
         *u32 = tswap32(*u32);
         break;
+    case QEMU_IFLA_AF_SPEC:
+        return target_to_host_for_each_nlattr(RTA_DATA(rtattr), rtattr->rta_len,
+                                              target_to_host_data_spec_nlattr);
     default:
         qemu_log_mask(LOG_UNIMP, "Unknown target QEMU_IFLA type: %d\n",
                       rtattr->rta_type);
-- 
2.39.2


