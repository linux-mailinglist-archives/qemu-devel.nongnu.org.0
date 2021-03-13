Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D37D339D76
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 10:53:24 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL0xX-0005CP-82
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 04:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lL0sQ-0007A4-1s
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:48:07 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:58929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lL0sG-00075z-CK
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:48:05 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MJW18-1l1H4B1zce-00JsC6; Sat, 13 Mar 2021 10:47:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] linux-user: Fix executable page of /proc/self/maps
Date: Sat, 13 Mar 2021 10:47:43 +0100
Message-Id: <20210313094747.2966948-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210313094747.2966948-1-laurent@vivier.eu>
References: <20210313094747.2966948-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:58f61JmWhBGlKAKy+RjXaa97JGJB9HibKxZ2CCi0B/msB295f0z
 BjiLQRjYiVaYDHRFiZDtNJ7OJKn3SrWsX09Hmv+3xz5BFhRTvmMYbSNmZSNtVDueUvMkd3U
 DL0Evc1sD33ypugZkEbUhVkJSUshwQUo274bm87wRvdqa0qoHLsD0B1FOnhIozIEM31pr2i
 f4w7W4IDAxb/Yuwjnj5sA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T93sL277CIg=:xpoCgX1RB8wm31btYbwGc3
 /m9GXHtXd40EkxErUtK/upAAtK9V4B6awuLlj0sWYVpJc7dUQmytqQMq5Vmr2/q2n0fvHPvHr
 zIx/CkpRh2TPrWtojfbf1J+X7fhAqsEYhw56WVuLd6iHfivvcWuQQxcP4cZO9dNx13K6Anb6Z
 mm1V/yqmOpafySz832MrqWWLmKXiHNnCVLN+mBGWHRpVdB8dK3XRaI7Hsco8fgCV27QTFLgU1
 r5N6KItNWUbONYeheYpPzXi+eCy7loC2I1mtDYDEjJlM0aG2tWSr0cYym+mJyfUnT++QLd/aN
 IKzCrGZ22wIVL5HnKnPt2Qh9ny+WW2CZdFJhVOOxeKpN1emsLShiOYuVLouhqypBsnsddkRMF
 uzO3u95DYPh59sgA01FFpa5hMgaGZ3KH5/wp8XNMBGGRKYXLc9TJWmARKZD6TPJIHWLjhW5ug
 JvtZ/saWHw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicolas Surbayrole <nsurbayrole@quarkslab.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicolas Surbayrole <nsurbayrole@quarkslab.com>

The guest binary and libraries are not always map with the
executable bit in the host process. The guest may read a
/proc/self/maps with no executable address range. The
perm fields should be based on the guest permission inside
Qemu.

Signed-off-by: Nicolas Surbayrole <nsurbayrole@quarkslab.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210308091959.986540-1-nsurbayrole@quarkslab.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9522f603aad6..1e508576c73e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7890,9 +7890,9 @@ static int open_self_maps(void *cpu_env, int fd)
             count = dprintf(fd, TARGET_ABI_FMT_ptr "-" TARGET_ABI_FMT_ptr
                             " %c%c%c%c %08" PRIx64 " %s %"PRId64,
                             h2g(min), h2g(max - 1) + 1,
-                            e->is_read ? 'r' : '-',
-                            e->is_write ? 'w' : '-',
-                            e->is_exec ? 'x' : '-',
+                            (flags & PAGE_READ) ? 'r' : '-',
+                            (flags & PAGE_WRITE_ORG) ? 'w' : '-',
+                            (flags & PAGE_EXEC) ? 'x' : '-',
                             e->is_priv ? 'p' : '-',
                             (uint64_t) e->offset, e->dev, e->inode);
             if (path) {
-- 
2.29.2


