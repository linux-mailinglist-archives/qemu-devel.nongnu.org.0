Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83C42B6881
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:19:51 +0100 (CET)
Received: from localhost ([::1]:59514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2lq-0004ZM-Qy
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kf2j8-0001zP-Qe
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:17:02 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:43287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kf2j3-0007ZT-3m
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:17:02 -0500
Received: from localhost.localdomain ([82.252.130.226]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MODeL-1ku6bn2KPB-00ObUa; Tue, 17 Nov 2020 16:16:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] linux-user,
 netlink: fix message translation with ip command
Date: Tue, 17 Nov 2020 16:16:49 +0100
Message-Id: <20201117151650.867836-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117151650.867836-1-laurent@vivier.eu>
References: <20201117151650.867836-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Wm4qTgjFtLerns3oucEypn99wNOAhakzrHK6/UlahNhi8d/Hfy6
 UkrN49r3ZnqVzNOVIQJAsmeQk0IS80HQZhrmQbaq9jnPSuhaVWC7V3dteKl9ti1NE7Bm8X+
 NoPi92ptf7Zg0AbVr0eNEvvloucJZ4nfVB2I3xCqOVpgFT+0NmPIE2YLPG9O+wAoHFkPAJ/
 Ds/2p5ZAsBwUXgccZ0J9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A+ovUduV6Tg=:biuRMXa+b8CM+E8+W8VQQP
 lfqDF5lP+SfMicU9apDtLXRwIJ9XUpuy2E29G8M307Il8b8p9ijRkWojHhe/8dxxHLrm4mnzr
 NTM1mANtHBfoHynrCIugSj4546LRN530DqTNugBRSGnZ6Y5mkQwbX1TPvEg5dUIDfq+r8zuh0
 mVJUlEmf3FIOPptV9L0GstlOjoRyfGJOdg9r7kkYp/GXug1U/H6Gogtpz2ek/WMjxsQl9mfCe
 Ym6BzWFJwrbGyeEabOUrZ/pSZdzEBjASqtE+6tqCxTkxbvo9AF0ya4M1ppKnEbqYu7sCO94DV
 VKUglLG0vI11lqT6aHoVdTIhnDE2Z6pslimjvWwnliEKRu3YXh7kfESUPX/EDMFqDfYoyWnjw
 mJJK+xPguVUNkvmiIUcYtlaX1nC1NPk00mB6kbbl2KNUlVaaW9NCNbbFCN2O8
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 10:16:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With iproute2-5.8.0, the route, link and addr show commands fail:

  root@sid:~# ip addr show
  RTNETLINK answers: Unknown error 352321537
  Dump terminated
  root@sid:~# ip link show
  RTNETLINK answers: Unknown error 352321537
  Dump terminated
  root@sid:~# ip route show
  RTNETLINK answers: Unknown error 352321537
  Dump terminated

This patch correctly decodes the GETROUTE and GETLINK commands and adds
the RTA_TABLE message.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201116163622.791442-1-laurent@vivier.eu>
---
 linux-user/fd-trans.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 1486c81aaa27..7551c883304a 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -1160,6 +1160,7 @@ static abi_long target_to_host_data_route_rtattr(struct rtattr *rtattr)
         break;
     /* u32 */
     case QEMU_RTA_PRIORITY:
+    case QEMU_RTA_TABLE:
     case QEMU_RTA_OIF:
         u32 = RTA_DATA(rtattr);
         *u32 = tswap32(*u32);
@@ -1200,11 +1201,10 @@ static abi_long target_to_host_data_route(struct nlmsghdr *nlh)
     struct rtmsg *rtm;
 
     switch (nlh->nlmsg_type) {
-    case RTM_GETLINK:
-        break;
     case RTM_NEWLINK:
     case RTM_DELLINK:
     case RTM_SETLINK:
+    case RTM_GETLINK:
         if (nlh->nlmsg_len >= NLMSG_LENGTH(sizeof(*ifi))) {
             ifi = NLMSG_DATA(nlh);
             ifi->ifi_type = tswap16(ifi->ifi_type);
@@ -1225,10 +1225,9 @@ static abi_long target_to_host_data_route(struct nlmsghdr *nlh)
                                        NLMSG_LENGTH(sizeof(*ifa)));
         }
         break;
-    case RTM_GETROUTE:
-        break;
     case RTM_NEWROUTE:
     case RTM_DELROUTE:
+    case RTM_GETROUTE:
         if (nlh->nlmsg_len >= NLMSG_LENGTH(sizeof(*rtm))) {
             rtm = NLMSG_DATA(nlh);
             rtm->rtm_flags = tswap32(rtm->rtm_flags);
-- 
2.28.0


