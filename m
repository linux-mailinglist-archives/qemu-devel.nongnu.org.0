Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130CB5EE7B1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:07:06 +0200 (CEST)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeGn-0000Wz-6H
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf4-0000bT-OO
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:06 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:36759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf3-0006Y0-20
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:06 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N8oOk-1pGatp07OA-015mlY; Wed, 28
 Sep 2022 22:28:03 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 33/37] linux-user: Convert signal number for FUTEX_FD
Date: Wed, 28 Sep 2022 22:27:33 +0200
Message-Id: <20220928202737.793171-34-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LrQ/4Fa8vgjiL1wbQ8E31IiRFOIh714S5n80a490IYN/Q9sVr0w
 8SGRYi+XxfzOZTCwN3D5/+Nh6MT/9isFyCDIivTTwSuJ8CjLV0CqBIlW40gvhV46jlEzaG9
 dJ4lAdxLrSUpiIA7DMNsYm6hNZ4HiZk9LqittnjmgMvKcdjR6aIzEWl94z+URvtae3kty27
 j2VIvRGEXwINQGMuYGFIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wz9bXzUcxwc=:asapbxYxPYATZTBfRa6har
 6SWslz4A70lnp3BemVDIHfK57UfDIGLSrz/po6cLi9h+Eh1nFTotezUxuOYG6ehOdVMdYLzVL
 FiRyFlzOJ4amrrI/b1WX6adJIn+JURLIOk/2EAZP0CsAtv/vL7BzfTwnxt2t5sM77smadCSS6
 YIpDTeDkk61QSDOg+6pkvH92dzjE3OR46EGj3siezpx0QrZPMa/OWbyt5miVRsDxjS3Bc6ZDp
 VQFWOvXWZWXUFmMkxbFk8nCE3m6aqgUatgciDYQ7sIoJOFG8lBOfvima+9PNR6PwMebZ6ZtX8
 8y/5L/aUAtY+zFJEtJ6SAyaMNZwVpKy652pt3Lic+w+JU4MdoOded0p0z/H67Y7wSJiy/c9Y4
 DpTEfZHHGfhiGjs65D6NefMwhIOmP0D+XsLE6y77rkU3mgUud+F22DaJXAz4ZbTCuCQ/Bzwnw
 yYMN6bBSxcXj5SmrenplZev/ioeHakA8WzuXmuDI07GPxZHmgKIao1IozrLpO0DQSer8MZVc/
 BkD4zRfYYS9OtiwcnRELlAm6BbEM52CKQBumM6KGnaDdUheYoX2Y7MGZvS+xjT64qxUK1uQmF
 T5uZCOh3GAoTpu+EDxWEWZL3IhQQ+13mv4acBR98O5c0LE0FthXnUtSFj7vChUfUt28zgROfK
 K9ZfPcvoJcOxKGJ1IMpCqxrVWAjo7brdMXoJ+FrEnT9Zeuz0/OggXZE9RdQ74a8zPtgwR7Gvz
 PB5s0HJ3REATScO5ylmNRknsBrtOYecYySkVwVilnAlgJs/CremLXd8c3QEdK2MOGNjL/K9Is
 VRhSVL+
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The val argument to FUTEX_FD is a signal number.  Convert to match
the host, as it will be converted back when the signal is delivered.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220829021006.67305-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e2b6b564e6cb..3f144e3c1f5d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7793,6 +7793,7 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
         timeout = 0;
         break;
     case FUTEX_FD:
+        val = target_to_host_signal(val);
         timeout = 0;
         break;
     case FUTEX_CMP_REQUEUE:
-- 
2.37.3


