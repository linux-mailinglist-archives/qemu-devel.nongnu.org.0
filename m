Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290A533AF6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 12:52:07 +0200 (CEST)
Received: from localhost ([::1]:40298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntocY-0005fT-8Q
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 06:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoS0-0005p6-QT
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:12 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:49399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRy-0002G9-U3
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:12 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N9d4t-1noq8g2YhJ-015XfF; Wed, 25
 May 2022 12:41:03 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 8/8] linux-user/host/s390: Treat EX and EXRL as writes
Date: Wed, 25 May 2022 12:40:57 +0200
Message-Id: <20220525104057.543354-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525104057.543354-1-laurent@vivier.eu>
References: <20220525104057.543354-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:E7uktIn8xEbiP07ChoUZHCqQF6p6COz+l7TMfJ5Aq9qqJ9mV3d+
 texx2foWmpKZvOj4Z/XJCHEDG4pu0K8OSa0SSKPF+PNmfXp5sYv8yTr6s+aaLaKoHtxYZ9x
 REpQ7/bcUS7eUFvV4YO/DD0sdkbF6NbymP0cJTm0nQuMLWhvgjDgEgrO4Cgf68bv7pX7uYQ
 8nqq6f55EeyFOUzAsyDkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2M9bJnVpquw=:+9QfgQ1VKXdfICrh2v7KSc
 SWHxmMsf/1JoA0N7lVtc2O5/5tOH4AAte6gC9Km8KSa18kCtKvJnOmNR5RTrk8KGWtx0KeaEh
 6Iop4DXTnwPMBS8aGXUN+GSGrl76sYQPDbJge/ZrZK031hEbuDKJRDUzM+wR7y/6Dm0KNge5D
 9Hf/IULpuPPsw6n03vuzbDP+nyudzc6JqCulMKOVPZ2gTE4qxaGTWIvK9nCzxTUgY08ipGzif
 yaypeAa1jIKh83VEsukwRMiBbcuX/58wk9ZIJ8K+6jwqJ7FOOLgQeTcHQC6600mDBdYCPJHbs
 uKRrMMUZrcp8K+NNmsOS9Qbr3uZNavSL6kfPUs4qtJXEZqRkF3ogxpIz1istWJ6o4pFs0WBdb
 dD4jpGdqv8puIWtxbci0vjXmvrVI/kWAqL/AzyJaxS3jKLdf8+eCvgOarJLYGpldlw3/iJ5EY
 hib8Tb3K/TckpaABKl4jTV97Hxj4++ttqJafbfv0N9c0TIFOKSzIcdqM2kYHY69Pv8B2pvtrh
 BR1gMs4jXZ0+aXOZsQStHvI5XA2gA3+YZYh6goha3qNHF8/+GweMXZB7BtI+azc+lAFgWgS2K
 jTD45ZTJPo/A2L0iYVhEArh3N3wlXjMYosZp6ZfC/F8jzHkh3l041Sx31gya9A/TuVYERqz+f
 0jsovVCEErE+Ye9xnNjf2suQNu/DcM8YirGEmGvY1j41dueTW4WhRzeBB56T8YRUgxxxMunfj
 1pnkRguDVxpBlnT7Ui2Ofdv2fSZ6QiFN5BopAw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

clang-built s390x branch-relative-long test fails on clang-built s390x
QEMU due to the following sequence of events:

- The test zeroes out a code page, clang generates exrl+xc for this.

- do_helper_xc() is called. Clang generates exrl+xc there as well.

- Since there already exists a TB for the code in question, its page is
  read-only and SIGSEGV is raised.

- host_signal_handler() calls host_signal_write() and the latter does
  not recognize exrl as a write. Therefore page_unprotect() is not
  called and the signal is forwarded to the test.

Fix by treating EXRL (and EX, just in case) as writes. There may be
false positives, but they will lead only to an extra page_unprotect()
call.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504114819.1729737-1-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/include/host/s390/host-signal.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux-user/include/host/s390/host-signal.h b/linux-user/include/host/s390/host-signal.h
index 6f191e64d7b5..25fefa00bd48 100644
--- a/linux-user/include/host/s390/host-signal.h
+++ b/linux-user/include/host/s390/host-signal.h
@@ -50,6 +50,7 @@ static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
     case 0x50: /* ST */
     case 0x42: /* STC */
     case 0x40: /* STH */
+    case 0x44: /* EX */
     case 0xba: /* CS */
     case 0xbb: /* CDS */
         return true;
@@ -61,6 +62,12 @@ static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
             return true;
         }
         break;
+    case 0xc6: /* RIL-b format insns */
+        switch (pinsn[0] & 0xf) {
+        case 0x0: /* EXRL */
+            return true;
+        }
+        break;
     case 0xc8: /* SSF format insns */
         switch (pinsn[0] & 0xf) {
         case 0x2: /* CSST */
-- 
2.36.1


