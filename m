Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C17C2B4B73
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:41:16 +0100 (CET)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehZ5-0000Cv-C8
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kehUY-0003Ko-FS
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:36:34 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:41137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kehUU-0000B9-98
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:36:34 -0500
Received: from localhost.localdomain ([82.252.130.226]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MpUQm-1jvRaf0tOG-00ptPw; Mon, 16 Nov 2020 17:36:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user,netlink: fix message translation with ip command
Date: Mon, 16 Nov 2020 17:36:22 +0100
Message-Id: <20201116163622.791442-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9v2BGnJssJVI/mDdbuUo5vXHFucjRyAA4BlW4D/WU5zDybzK7uE
 WOG3XuzSG8N/MNi4wGJDveZgQDXC5DojxFS7pIwmorxbT2JXIp9C+R2SBVD51Hvh7BoMOFT
 rUJL1JWjnVF9XeYbBb87g1GhxnZTVMk0GDbl2g1d8Cpxav2alTHDb6CmCjHjUhs5iEHmlyx
 8Z8t3NqTo/EzePl8SJ0Xg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uQTl5TL1zQU=:puaPLIJfL0nk+b/XSb3H46
 k30qUkb6gNRgoRtgt1W8jxF6SJY1gtH77gGa1rw3MuJbcP6m6j+x2jFRCTuz9XNxXRSWoqqAA
 hZ4Q4dsECtDen8LKcxFGa8su3bOgnwg+CsJPD0HLK8Kfc/MT28Wi4RAOWp08HWdBJ8Hd90Ezr
 IbTzlDsBJ+1s0o+7jCcLyhgIMhOP2WEJwVhewJgoe0bqn9g2R3ld0Y8yHsMEDbAxkW8yNFEJh
 NphShp7SXulbDNX4EwPAvZriQGxvVywYnnkTSbAH+rtxfd+4ZDBLkqJDhk5kJKeRTJ9D2ECaK
 f4Lq6SHuUH2ElQDYtU8WB2usjeo+kk4jFlm4npi8O492mnE2ccYs7XSYYKTiQ13Ws8nXxEDYL
 od48ZIqst15CpFCl0O/AbkVOWAutnqj29SRPW9JjeuaMVGbYhLUkBBxd9CVpWWS5DBz7+kmeO
 JkK4AacRkg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 11:36:25
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


