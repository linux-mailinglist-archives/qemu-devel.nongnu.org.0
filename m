Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D944027A4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:14:30 +0200 (CEST)
Received: from localhost ([::1]:43094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNZ3c-0004iX-O3
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNZ2V-0003ng-VN
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:13:19 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNZ2T-0003gS-9S
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:13:19 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so1588194wmh.1
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Is/Luwq1bm4CYoIG+CPIF8a0JGHwBGSHyAB59kNeOMM=;
 b=ksSb7jUP6CdFVpfXMu+ahuOIGjkiRict74wzsLnyxUPaF1XamcFrwc1CORwrsqpmAb
 RJpsQL/Pm0wlZrtUVAk4APmGDAMXKhc6s44gIp60ST+ZAx79Fg7IdsSOijAlQJ+5awZ/
 tAHV3JSpyYDs6jFkGpN3LzCM9F3jnaoTIZwR51kXpRfW0D1/ZIBN/Z3mKXzQNSp2J6o3
 EGGt4e+6qxZQ0N1iFIuGz3BCgic0dgM/IKy97NsJKEU5pt4REFjQRFK+sAhH4FeTehAd
 Ub6T6GPycUEWE3tk88j+ILwqjvng65rEpr9DScLDQ+MavTqlxk4S8pr42DDso+idyKYR
 Pk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Is/Luwq1bm4CYoIG+CPIF8a0JGHwBGSHyAB59kNeOMM=;
 b=IAZB0Z69/F8aVe2s+2cub5ztGO6XH7RYI4KxjqYVuchvsxwWwtEZB9IE9nKuMgNTkd
 NfMTeC3BKalDxU1In4pO6BvNTX76H/uNMRRVZ2bqHz4NDSC81KnFx4WrzdsnysbQr2fp
 5y2euvNN5hwgNZ5LGWMWiMf9/FNaRadTe4KDGmsBYe28ddLxOKpepcpF3aVb+3MzVXmr
 c4Hdcns5l2Ucgr26QSrHQzSb6ct0sZxZ49FPru7uDprQAejUrpN9sfjfK8SL9Z/9Rin+
 NxUz1GZEP30Km622USl/md4k+VfQ4V49Vn0m888CML8BRWhG91C3WVxn1E33CLhzX4vj
 hgFQ==
X-Gm-Message-State: AOAM531lAnW/SYiXHzxmzQD8GUZosRt3uCYhnYNVQMJeZpStIT04xyoK
 PiiDheZDRoHa+m2z/KSToQpz/BSl694=
X-Google-Smtp-Source: ABdhPJxrJgKVFdoROVpEgyAtIYNRmO6r2E67tqc0ozzvAfDKukCOiLpT/+lznaMkyUrNvG3a3sAnfQ==
X-Received: by 2002:a7b:c389:: with SMTP id s9mr3420198wmj.129.1631013195538; 
 Tue, 07 Sep 2021 04:13:15 -0700 (PDT)
Received: from x1w.redhat.com (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z19sm2533029wma.0.2021.09.07.04.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 04:13:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Correct host errno for IP[V6]_RECVERR socket
 options
Date: Tue,  7 Sep 2021 13:13:13 +0200
Message-Id: <20210907111313.1880866-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>, Conrad Meyer <cem@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Target errno should be converted to host errno in IP_RECVERR
and IPV6_RECVERR socket options.

Fixes: ee1ac3a1822 ("linux-user: Add sockopts for IPv6")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/602
Reported-by: Conrad Meyer <cem@FreeBSD.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ccd3892b2df..edc9d6b5ba2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1967,7 +1967,8 @@ static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
                     tgt_len != sizeof(struct errhdr_t)) {
                     goto unimplemented;
                 }
-                __put_user(errh->ee.ee_errno, &target_errh->ee.ee_errno);
+                __put_user(get_errno(errh->ee.ee_errno),
+                           &target_errh->ee.ee_errno);
                 __put_user(errh->ee.ee_origin, &target_errh->ee.ee_origin);
                 __put_user(errh->ee.ee_type,  &target_errh->ee.ee_type);
                 __put_user(errh->ee.ee_code, &target_errh->ee.ee_code);
@@ -2011,7 +2012,8 @@ static inline abi_long host_to_target_cmsg(struct target_msghdr *target_msgh,
                     tgt_len != sizeof(struct errhdr6_t)) {
                     goto unimplemented;
                 }
-                __put_user(errh->ee.ee_errno, &target_errh->ee.ee_errno);
+                __put_user(get_errno(errh->ee.ee_errno),
+                           &target_errh->ee.ee_errno);
                 __put_user(errh->ee.ee_origin, &target_errh->ee.ee_origin);
                 __put_user(errh->ee.ee_type,  &target_errh->ee.ee_type);
                 __put_user(errh->ee.ee_code, &target_errh->ee.ee_code);
-- 
2.31.1


