Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC67231B9E3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:59:44 +0100 (CET)
Received: from localhost ([::1]:53670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdTb-0001lt-Pb
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFw-00047l-Oy
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:37 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:55601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFt-0000hZ-Eo
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:36 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N2E5Q-1ls0C1003q-013h5C; Mon, 15 Feb 2021 13:45:27 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/13] linux-user/syscall: Fix do_ioctl_ifconf() for 64 bit
 targets.
Date: Mon, 15 Feb 2021 13:45:15 +0100
Message-Id: <20210215124519.720265-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:s5wCz8lgPDtujfRo8saj+r5HMMpfiynPGa7ljIKaWYUwwC4PMMw
 YwwxzbekKSHcIIRSrkHbCbHpRXxJg5I9DeVfP6xMQPeXN+lo/xNFUzdFx7jOA7YcQl9jKAX
 VzyDKAimf9G+a0xGhJJxDzZovzp+W8neyyaHaO4v81Atdy/LN+CaKV2nlkyD9iOV5ox7COm
 P7W+AdQinD6GxOlTVw+EQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GpZC7dElTV4=:j6YoJe0oSFPnyAjFW8h3LT
 +4CrWD/DgDl1mp/sCQWmmvunquMmEK4cohArFGBMtK5Q2KUmdyS1pIkJjIi9J3uZL2z8IWEbS
 UnLaDk8p3nVSJcXWESNIcOQVhTuQ5A8kSGBwYsO6LzNHRlEulDLOCMKK5MbYTNofKjBCsNIM8
 gXXTXkKZkhfwLuZLTq++rN64IeoROfEKeAODuhlbsCM7RQTVyATYd1cJX5aoB2H49I55qYhWL
 ZWe2CcyvIoCwpqZHpgyCVXPLRYB0NlUxNgL6dm76yxIZEJ3qPQfBhQbt1E+i+4ntoMtwlfAN5
 NpeeWDr3k5gTOmrDn90X1BWPbb29w133rQOfw+QGdZPwuwOThUzrhyXAfnePFC0l/Q2RrWRJ1
 8Z8X88vf6o3XdXGdGswJuanMQE5B9La03sLb5fkXJA0Rbb33ZPGjPliTlRtelLsOKepZSxRYe
 pg4GNjJRWg==
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
Cc: Stefan <stefan-guix@vodafonemail.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan <stefan-guix@vodafonemail.de>

The sizeof(struct ifreq) is 40 for 64 bit and 32 for 32 bit architectures.
This structure contains a union of other structures, of which struct ifmap
is the biggest for 64 bit architectures. Calling ioclt(…, SIOCGIFCONF, …)
fills a struct sockaddr of that union, and do_ioctl_ifconf() only considered
that struct sockaddr for the size of the union, which has the same size as
struct ifmap on 32 bit architectures. So do_ioctl_ifconf() assumed a wrong
size of 32 for struct ifreq instead of the correct size of 40 on 64 bit
architectures.

The fix makes do_ioctl_ifconf() handle struct ifmap as the biggest part of
the union, treating struct ifreq with the correct size.

Signed-off-by: Stefan <stefan-guix@vodafonemail.de>
Message-Id: <60AA0765-53DD-43D1-A3D2-75F1778526F6@vodafonemail.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index dcb4009e2f17..6fea00869e6b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4914,6 +4914,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
     struct ifconf *host_ifconf;
     uint32_t outbufsz;
     const argtype ifreq_arg_type[] = { MK_STRUCT(STRUCT_sockaddr_ifreq) };
+    const argtype ifreq_max_type[] = { MK_STRUCT(STRUCT_ifmap_ifreq) };
     int target_ifreq_size;
     int nb_ifreq;
     int free_buf = 0;
@@ -4937,7 +4938,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
 
     host_ifconf = (struct ifconf *)(unsigned long)buf_temp;
     target_ifc_buf = (abi_long)(unsigned long)host_ifconf->ifc_buf;
-    target_ifreq_size = thunk_type_size(ifreq_arg_type, 0);
+    target_ifreq_size = thunk_type_size(ifreq_max_type, 0);
 
     if (target_ifc_buf != 0) {
         target_ifc_len = host_ifconf->ifc_len;
-- 
2.29.2


