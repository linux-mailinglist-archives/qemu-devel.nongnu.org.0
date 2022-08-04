Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A936F58A131
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 21:26:25 +0200 (CEST)
Received: from localhost ([::1]:47856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJgUC-00039l-H1
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 15:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJgQR-0006RK-8s; Thu, 04 Aug 2022 15:22:31 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJgQM-0002if-7A; Thu, 04 Aug 2022 15:22:31 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPGBR-1o3UzB3UnV-00Pf5Y; Thu, 04
 Aug 2022 21:22:21 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 5/5] include/qemu/host-utils.h: Simplify the compiler check in
 mulu128()
Date: Thu,  4 Aug 2022 21:22:16 +0200
Message-Id: <20220804192216.1958922-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804192216.1958922-1-laurent@vivier.eu>
References: <20220804192216.1958922-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fToQe7giDyBb7KJ3ybR2y5r5tcTHRf7O5dM1W+g4EV+AJ3qwwDg
 7HWiBTTCCsUWlSjIxoWW14fPIXXLFSKOw7CdhnZ8jeLvhR30FKUwq6EThpXrtImSMT2+i+L
 wwEpXJYTudxKHPRWpDZzLyxGdXYrVSMK72Yz+lZ+hDAT0DM2Avn9PdVrgF0mhksw/+8Fkgg
 n2MBXjN9LioFOBRCdM/cQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VRh3Kr4llsE=:V1XJNVRNCn9rbz1vi3EgvC
 KIPq63KUuzeJUliqJxI0HrPN9cjvXqduRi/2Y3xcIPQ0oDyXHzZVk1mvegOA9aRfFdnAUs7zU
 G9BgGImujdmjkZb+Jme/DFXN2SwRK5tqN6Dszpi740TwR41EOL66IxmIlsJMT2aZ4akjmWwCf
 8v+txTL6mdq5u46PFBDy1P1M7vDg6gfdglVTmBg0wzfS+tESbhz0ujwill132tYJqVWp1jPrL
 0ETyiWxwefmkU2e0vV8MUleouSsxZ8E/ACKoOuu9aY5ASeHDyiiE7Tfwt1Hu2TgTPuYZjoxXc
 JS9aEra1Wb9i4zJ19l6HROqzM6bDvcgaKBxin2+DVfUNe9B28Efd32AHM6HVVVo+z/t0zY00i
 9VITZuB+D4nLM0q7gCd8SHpT9EGgySzhoZYgJzKYEPPyHfQ8kUuuAnMurPIwvWXPi6BdL0I6X
 BU+IUsIhCcbx/RtgmZ3yjOzK7YcsdAtTQWxmi4gHzW3xeSSwFdjff5aIe83QTNhHh5tFxsBhI
 RSAdO2GBId8I2Lj7F3J04iPZDjG9YqX+BwQzFYWXhOLkuV+IBgtabm8BbbtPLVDLi2BlTK6E0
 IWgoiFydf07fDhZuGRZ6CrDd7REf/ExIwphbOx9GsPqDaQ8AfzEhh7v6GIl+LJ7GV8RPCUpdX
 HHIJbdEXM4oEAfkRhRKWtUp86Ea7P0WmM/1hyhtuDCpNkKSY0hcmHn+/tS2lIdLJLRdxV/vA8
 96dDDfjz0azJVkDB4xETAeOvRF1fC+aswhshGw==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

We currently require at least GCC 7.4 or Clang 6.0 for compiling QEMU.
GCC has __builtin_mul_overflow since version 5 already, and Clang 6.0
also provides this built-in function (see its documentation on this page:
https://releases.llvm.org/6.0.0/tools/clang/docs/LanguageExtensions.html ).
So we can simplify the #if statement here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220721074809.1513357-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qemu/host-utils.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 29f3a9987880..88d476161ccb 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -533,8 +533,7 @@ static inline bool umul64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
  */
 static inline bool mulu128(uint64_t *plow, uint64_t *phigh, uint64_t factor)
 {
-#if defined(CONFIG_INT128) && \
-    (__has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5)
+#if defined(CONFIG_INT128)
     bool res;
     __uint128_t r;
     __uint128_t f = ((__uint128_t)*phigh << 64) | *plow;
-- 
2.37.1


