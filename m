Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43116B0933
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:33:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtsT-000360-UH; Wed, 08 Mar 2023 08:30:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr4-0001kh-Pr
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:19 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqz-00066Y-QT
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:17 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Miqvq-1qETKw3dCe-00eswy; Wed, 08
 Mar 2023 14:29:07 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Mathis Marion <mathis.marion@silabs.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 11/28] linux-user: handle netlink flag NLA_F_NESTED
Date: Wed,  8 Mar 2023 14:28:40 +0100
Message-Id: <20230308132857.161793-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:myyzQBA3S51OUodtii+2y2SRMVuCdOotEcp2Tvo+JQcolIFsSkY
 lsxRgw1AM7gnNZEa/6Au2clwn4SAqNeN+zVq/8wLudn02p1qjVy/Ex+Ru9xXRCpMRXj/p4e
 PEEezG7vKa52gA7l9KY4hlAFBgPNnXnIugZI6AowjhTBmhKMn38ZVyLsVhuHzGERPVxi/iu
 IKtIsHKiYaKmFm22V8NRw==
UI-OutboundReport: notjunk:1;M01:P0:Otmvlndgk9c=;u96K7ceLKm/rbpWmydHntfJAIDz
 XpM/2VVSajR85DA1hVB/t/agV+ZirCeV1eGWFCUubCtTumUxzDb1TMVlGP1ZyQ0XGJKuuBKy2
 EVF0cyA3oCGzQ5ZcNiVYkRsncFTh0h6XqfgyaDUOIiZ8wJJp434DOakFQkX8UgJx1HxZAuy7i
 3B4nckJuRDBvWvvcuhabuhhJGgM4rKjdlv9LEY7m2/nXxEmIwAgRnepyfgC1eBfmHeGRKem1x
 OuH3VO7XMWfyrH2BcEzDGGExkuYg5T5m9lkUkI6vSRX+rMg80byrKBSlRmxX+8sbpYbaioQKo
 UAd227FJ8DBvRO2E/GgcmpoXr0rW1k2cj+2911PwgLnhoAno0tWDcsf0+0Z+1+NDjOLVseBxH
 oXwI+M1RO5EvVKZqDQ2lkTsOBaF3DYs0Ht69KLiKMshEjZ6iKzcqb4NJzvXX3+/rf5RAES8xC
 eETQMm1UEiKhboeSWyeNV3PSh7keOCcntpn5koLoQpm2qy2v86yG17lVR6esqEqKcz3hD0pQC
 yKQLKOuE9A6iBWTcUq1qp1K6/2CEehi+vgSDASCyUej5no4ZCiik8D5iKS/sZm6STXuRDMnN2
 HUqBRIDJGXzu2/F5y70m8OoYKWQ2ibrFeeG8KmyUK08uYE+M0cYoijW42mpF5Oe/OIrTjnA07
 OYEftS6G1CqAUJh8qZWaPFWzDKDd8lo3nxBbflJpww==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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


