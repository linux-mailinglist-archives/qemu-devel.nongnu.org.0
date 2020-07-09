Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1366E2199B0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 09:26:01 +0200 (CEST)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtQwS-0003sE-5B
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 03:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jtQuH-0001O2-0G
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 03:23:45 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jtQuE-0007Sb-CF
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 03:23:44 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MpDeD-1kgZcL3IEh-00qfyM; Thu, 09 Jul 2020 09:23:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] linux-user: add netlink RTM_SETLINK command
Date: Thu,  9 Jul 2020 09:23:32 +0200
Message-Id: <20200709072332.890440-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709072332.890440-1-laurent@vivier.eu>
References: <20200709072332.890440-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qOB31VRaLnwEruVW8Ul/85VH1ppc07o7n8m9A/smcZkFZxtwpeB
 2tJpU1VGPObsx7Xlk/yarj6uqahxvEBOlKwUZhLHPHVh7eMpdMJQKoJc9CoUebNxBVv46wN
 IuXGEX2G3wM+ifE28Ava+OmM2sdoYWeKw2XMCptAURWnLDewUxlIm/ljFHJKEfDELiBq5+O
 q63HuFcjjMeyImTStR4Ig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3XwvyZxmtbw=:5jtDbwHjk44ClR6VJ9YMj4
 Mod3qXDqhKNtvV4ghWyUDBvk0CZtB5kpJtO3uTqjtaGr07DMuRQwQbzqTsmwE5A3gd3uIdqCG
 IbyyG5BhF2QgOwX6gRLw6svzHYaTeLCpcVBu80Ov2YKo9BLr1F+C+rZukbNvFlWGkuYf/3fqL
 dQP6AsW95LDwTngZwMt/yJrAkDIyvxRwnYa02NpGrgsfyQg0stw6W5bbZv90Mmhw/VS3JF9s6
 RM4VGO3MmQoANN1qc0fHBpjMlynIvKZcFmLyv6sxbqxQ6c8x2+QDu8BE/AhwPwwj8oZiN5+7I
 cGKfBGH+9RVA9WwOCDmFcki0oDz6lPMZbarevIujOdPielxjm31QV0nv3M5hIEmD/njfVO3X/
 TA+iUhmRLpgfVdgPI1ZGllpkrTe67+2bKdT0vN99VaP6CBdEmxRK4BiTIkx56+Fm1nQzZ1IWI
 NRS8tQm9GZfXw5KIuQCkWwULKZ0v88815OPbgsEXVYW0odK/jLiim0vRLxi6oNQO2uTD3AlBM
 CYclJaSE86BP6nqW4rOAKjHJuzXB8ZyKv9vU7QMx/zhQkjjf0lEyK/Rg5rUVFYrUqnbPRXHjH
 WiPatKd99I7mtD8keAKSU0OStz1t4QlC3MxZJOCr9eDfmLzB9aqCTDnZY5sdryK2eyDzsuTKT
 heYE0ZfwQRoE7Y6QzaPvYhdOAHqTqi/83s3Xu4vdkmdwSr+n0UfRKHNLEjhvXNIqo6kScXXTk
 TAnYKNTHy1+fPsrwUJdK7M9eeZqcb81zmlFmuIo8L1g3c6TwZ7ITQz1HfHB/QU6XnZKcHx7HX
 jzYwMYMhiw0yInasMIspXSwRXIWdZzBGn6ntJTCV+Id02YxAHV1IPkwHpip1Huks6w0fq3N
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 03:23:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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

This command is needed to be able to boot systemd in a container.

  $ sudo systemd-nspawn -D /chroot/armhf/sid/ -b
  Spawning container sid on /chroot/armhf/sid.
  Press ^] three times within 1s to kill container.
  systemd 245.6-2 running in system mode.
  Detected virtualization systemd-nspawn.
  Detected architecture arm.

  Welcome to Debian GNU/Linux bullseye/sid!

  Set hostname to <virt-arm>.
  Failed to enqueue loopback interface start request: Operation not supported
  Caught <SEGV>, dumped core as pid 3.
  Exiting PID 1...
  Container sid failed with error code 255.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 5d49a53552b2..1486c81aaa27 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -1204,6 +1204,7 @@ static abi_long target_to_host_data_route(struct nlmsghdr *nlh)
         break;
     case RTM_NEWLINK:
     case RTM_DELLINK:
+    case RTM_SETLINK:
         if (nlh->nlmsg_len >= NLMSG_LENGTH(sizeof(*ifi))) {
             ifi = NLMSG_DATA(nlh);
             ifi->ifi_type = tswap16(ifi->ifi_type);
-- 
2.26.2


