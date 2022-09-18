Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A0E5BBFA7
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:53:33 +0200 (CEST)
Received: from localhost ([::1]:40194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0M8-0001u3-LC
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Ew-00071h-Pz
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:13 -0400
Received: from mout.gmx.net ([212.227.17.20]:35765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Eq-0007ar-9n
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663530358;
 bh=Ch0VD1RjoPxJVBQy7NTTlp4njBGwmtHPyvXwy03EIcQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Gj/bFJpsMPKIhglrfsNlDvwilZpNOi9mP7ShSvNBYJncFtyH60DQ6e934noLEQ8M3
 rDbK8NgJ3V8uSr5zvyRrHRhj0HPQLg2/zV2IaqidD4p+S6F4mHxQ7uAiXMBDCp5+N5
 MN6jeTpvZo1F0kEOEpp20dNRKI0qzAnsS+n58kRE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.224]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzuB-1p9cRG3zFH-00dV4y; Sun, 18
 Sep 2022 21:45:58 +0200
From: Helge Deller <deller@gmx.de>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH v3 10/12] linux-user: Show timespec on strace for futex()
Date: Sun, 18 Sep 2022 21:45:53 +0200
Message-Id: <20220918194555.83535-11-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220918194555.83535-1-deller@gmx.de>
References: <20220918194555.83535-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ujeb0BtHIk85RstnTuKJelaPLSzzEmNh7DjK6kqFuLx7SH5g3Dh
 9Pns6ZntvnpiMv+SR0y/vkw8lc6FAWPBfgok8LKl/Lyhur0eeFsBJVO66sQTrO/F07sSjwf
 DiZMihl9QeLZ3Zyk9KAJiFdhrm0zN7ru6R8gyu0saHIZ3nPgz6TqdD72YtWCHwOLpgVUfPO
 5vlagqbncLcbHxiZlRunw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GdzLI8O2Xg8=:YHFQhCSZLj+ea6d6SsQVzS
 vmRkbiNouoggj2PPZ0k+RZWbv6NkADM7a1JC5AnHTC4X6y2hBVAeKnhW2yTZhCrSxsQbJ+kWT
 CoyU2ylYkM+kBjKU47L4yJfHSCtVqQjg+wXzhKWadf8cYxdkG3OCy9RkQ1fP/mmIdsS8irg16
 4rm5PNahT0x/Wdv4ZeSoAny9DeSlRedfaWExASxjNodkRqlohaLyYcFJ/wOygsQ3fg/oGVirI
 HvCN6ZvIem34POhpWS6Hry3PTDDmVWY58fEN7K6xQHg1gtusCnwOzJXp6Xtlank86ytpupaST
 lp7/LLGQdE1Ko0OKWkMZcje9UHw2m81Ea6/iB0UPyTNjbYDSPX9rYawU+zhkvc35tUWQTdx+J
 TgcxP/188F3swS6pgGwqkOBx+BMAVt8dNlo2PHCq7aCJ3L2ZcrXJMVXB6tq9YM8RRMx41xLy8
 qUyVJmzLLYHZuwbxXrVFZ27R7PkRXZYAyJx7Su3OhrB6Z7ECzf+0jpTvkFj9WxxCsn1PdhMqh
 bOu6a0ikRPLe3yxwT+mIUm19ZzpEkzRvBikdRm9AxnSlUOQi++0SoAHAQEX0qFgywuPwXNVic
 HM6RMNOlxoDmyxu3M4W7/VLclZ3TQCT+tuVgZuyXGLnfk/J5xpOlTD2nWnYCMRz1JePEuTx/F
 kQ788MDl7HZ8bILWw/WJiSx86qUgkMA8PfRhHR8a/wI6Do4yHL6N9nYX4vgxPiamXiIZ5GC7y
 jy2KcuvIPdgEy/9OfPQt9JhRdTunyA6RcPFCA3z8U98+2hfoUVQ9f6H5De1sBx3r8f/phTUoj
 j0gGCJ05cDA1WhhkRuSXzfjKvOFbRdtemnSfX7TKhbOe/pyCGClIMuUvxgGtNmCtGiwTvHuhu
 bocKbGkFASmYs5Df7dBkfuO6weF9eJcFsUR/3jiz0s+VE7CpgejT6zNQCqkHKrGaDo7mssnpy
 UFnVlnWseKEowULp3qA/1hvkyQWpiKONyX9Wcbnb1qKWnIppAFMOa/oZ6gv1QjKMKnoaMaVVW
 yiShYg9FY4pPge81GtJMiym1dgIQ1NnFor6jRrfOJqEPUjv0/9UiS0mgQuQLmoGhFADg32DQ+
 ANHx/6azdjiyhhQIwpQwS/PE1SEEvIJOWm03DD4jFxG365vttoFQXQIwBnKRs2WiLPXf4OLJV
 OEhut0JvPpDHabBDoilt8+Zg4H
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 6f818212d5..b6b9abaea4 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3714,11 +3714,20 @@ print_futex(CPUArchState *cpu_env, const struct sy=
scallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
+    abi_long op =3D arg1 & FUTEX_CMD_MASK;
     print_syscall_prologue(name);
     print_pointer(arg0, 0);
     print_futex_op(arg1, 0);
     print_raw_param(",%d", arg2, 0);
-    print_pointer(arg3, 0); /* struct timespec */
+    switch (op) {
+        case FUTEX_WAIT:
+        case FUTEX_WAIT_BITSET:
+            print_timespec(arg3, 0);
+            break;
+        default:
+            print_pointer(arg3, 0);
+            break;
+    }
     print_pointer(arg4, 0);
     print_raw_param("%d", arg4, 1);
     print_syscall_epilogue(name);
=2D-
2.37.3


