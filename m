Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B426B53F4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:12:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvl-0008DC-1T; Fri, 10 Mar 2023 17:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvi-0008Bh-Kh
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:38 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvg-00030y-P9
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:38 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MPXQi-1pwHwu3HsI-00MYZ7; Fri, 10
 Mar 2023 23:09:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mathis Marion <mathis.marion@silabs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 03/28] linux-user: add target to host netlink conversions
Date: Fri, 10 Mar 2023 23:09:02 +0100
Message-Id: <20230310220927.326606-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7u9fPsOHMczQ1uHtUIC1c6eobBN3i240rVKUv0g31zfib4OKhsQ
 EHunIvbGGEI0JF6/iVW6HZBQAlQx5ioGdnfVOHIkhFabLgzehkDv4Ib0bu3CQJvMTNkG+dF
 UJBkvwb6PCWg/eSwOjkJsQtaxOIAFTYzeGRqE3rBDzGsvWHXtTy/5Ed/7pxPQn10XdTBWNU
 83K4LsCP3dtoUAL8BPLGA==
UI-OutboundReport: notjunk:1;M01:P0:gldgVdujYKk=;xJXCfLfZLrexAAmW2OS+lB7u4Ez
 El01VXUTaslnAM2ae60Rn14m/qbX2Y4fAvGaarYT1G5ns4hqGBZhhhv/Vs7qAp+k6W7u8Y1/A
 hdkT1awe8lXW/aN1L44q8scEwpCY2Fwyt+EezXRnBngCLn6R2MOtdFsDFmQ+F5fn2uo08+Icc
 QPcv014etowqZiZi/remXaDGMDqgEXuSBISQ9zXUlz7xOfuxeDXDvjQSyXcsO/IS/6CzdeXIG
 0SdWzQGHhB8f7PvYi/00P4qFeAeqJ5QZXT9+HrJQ0WRk4eYv8q7XLQKLuiNb7VsaGREVqQEHO
 hUV8SvqUwA9IT2D+Rro6UFcKKwnh93DHkpN2ajryWyDk3ft9KeCHZHhi1zH49MT3ScVY/ZB2K
 ZP0chUN7GT/Q5zfK4ArQ/+J0N9WBqYBJ+ZpMEX6CvecwFKfxmKDcH7oip6wMDL8SJGYNQoG6F
 rPiWGM4OVu+pIbrgV9pPZV32InN+g8UjQWfJHCq3mkfti3PLPeid4wvsREB3Y1MBYgdQhevBA
 Ys0e/SemyovuP6HPR57zv7AjdDRKj3zPbi8nrG/GKUzB/sPSyXefTjd99wb7AdtOraeixKqGL
 CLFXwrZ7JgpKjvP/7xjCof/4kj+YhMFsVP8vSMETk28QCR6Ke47dYwrirKwNl7Q9jCxQwYEcE
 xyP6SMsM+4gq/uwkVqa3Q/ebFaicAqiRay1egPFaUA==
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


