Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBBE6B5401
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:13:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvs-0008IG-G3; Fri, 10 Mar 2023 17:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvk-0008Dk-Tl
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:40 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvj-00032C-36
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:40 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MLQgv-1prb7l0wcd-00IRxY; Fri, 10
 Mar 2023 23:09:34 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PULL 11/28] linux-user: handle netlink flag NLA_F_NESTED
Date: Fri, 10 Mar 2023 23:09:10 +0100
Message-Id: <20230310220927.326606-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CRvJM6iFhsc9wQqUF8EMgLJGVTPuGWpYGWi2cg81Vs4hSu5RyTk
 5wJprq4pAkFXWGpB5SJECcZjh91OLgqGrZV2k3SDenY4LLfJ8KTQmyCQWG5mKIzmiOChjxK
 wosgBl79UwKmW2/LPzy0EGpMLGpzKtkNJd5esy70bcyWIsh7/5DUPju2deqbJIcdNQVkSB6
 eTQ73yX/TzM3NktigibPA==
UI-OutboundReport: notjunk:1;M01:P0:tQjUsDQc4SE=;n0AiKdjPWNQuRAuoWAiDsPNb1K2
 NoPpqf54AoaTU+SFi7b+S6fOBNeMnvgYLeJA62qx+H+0vi+hemJkkjtMKzlAOw+nAF80Hte5b
 AM0EDsm3YLgbMM63poCQ3nrWHUGdIJE+d09OhmotFfiypeGwFC7BaC/R/RuptnRe3bu0fgd76
 WQU0dc++nDpMUsxTi8TYnXoC0Ax/wPInXVmvqz419Tz3XHvXIGdWW/zHxolsCfj+on33niZvf
 dFUHyLcqDBfRl0lD5NMpHnwRf2dPE5SJITcZ5VNGHfkUjp9sdNUjHVhZ7Z23wIsjua2eg9D2W
 /JdYxXnlNM3vxAWPBD2ndf336p13qzkM1E7bkYsxeJCDYWVva6uTvBWgZ6vxYV2agQU/cld5i
 Lo5SOSVuRPOsV1Hza8YMuL144Tnx4GK0lklnzPdnGjq0ciQK0WOM/fAa5SXCgQMXbrhsnfpnC
 +w8Oiy9nyog6WHsa1YH3HZwrSGE3Rzvr54nYsv+Y6IjAtI3sJLp6Vlv/jgO0/ipHXAAKGMXpj
 FWTeFiAYW0JqqaeCZgAPZcpjWu+kSh7voYvazcvPQj+/cloMcR49k7eS6/aUOTI4GyBrQNbCs
 C4oLlImTyFHywZUVVRe4arqGV+cTLZzm2zQZRWYBwlvoAppj0HzWzjPXN9+BiH3DJQDVu5gbU
 Q+N4ToVKKXPEIgsH4RSQRjXC8GTeXlJkxOuqK/MgrQ==
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

Newer kernel versions require this flag to be present contrary to older
ones. Depending on the libnl version it is added or not.

Typically when using rtnl_link_inet6_set_addr_gen_mode, the netlink
packet generated may contain the following attribute:

with libnl 3.4

  {nla_len=16, nla_type=IFLA_AF_SPEC},
  [
    {nla_len=12, nla_type=AF_INET6},
    [{nla_len=5, nla_type=IFLA_INET6_ADDR_GEN_MODE}, IN6_ADDR_GEN_MODE_NONE]
  ]

with libnl 3.7

  {nla_len=16, nla_type=NLA_F_NESTED|IFLA_AF_SPEC},
  [
    {nla_len=12, nla_type=NLA_F_NESTED|AF_INET6},
    [{nla_len=5, nla_type=IFLA_INET6_ADDR_GEN_MODE}, IN6_ADDR_GEN_MODE_NONE]]
  ]

Masking the type is likely needed in other places. Only the above cases
are implemented in this patch.

Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230307154256.101528-3-Mathis.Marion@silabs.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 4852a75d9dcc..c04a97c73a31 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -1359,7 +1359,7 @@ static abi_long target_to_host_for_each_rtattr(struct rtattr *rtattr,
 
 static abi_long target_to_host_data_spec_nlattr(struct nlattr *nlattr)
 {
-    switch (nlattr->nla_type) {
+    switch (nlattr->nla_type & NLA_TYPE_MASK) {
     case AF_INET6:
         return target_to_host_for_each_nlattr(NLA_DATA(nlattr), nlattr->nla_len,
                                               target_to_host_data_inet6_nlattr);
@@ -1375,7 +1375,7 @@ static abi_long target_to_host_data_link_rtattr(struct rtattr *rtattr)
 {
     uint32_t *u32;
 
-    switch (rtattr->rta_type) {
+    switch (rtattr->rta_type & NLA_TYPE_MASK) {
     /* uint32_t */
     case QEMU_IFLA_MTU:
     case QEMU_IFLA_TXQLEN:
-- 
2.39.2


