Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904B54079CC
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:15:48 +0200 (CEST)
Received: from localhost ([::1]:55780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6bT-0003Qa-Mt
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6UG-0007rO-6h
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 13:08:20 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6UE-0002nc-In
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 13:08:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id n5so7492105wro.12
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 10:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HW7LjfgW7U1BD5KFLk5y6g99LyLhiM0DaLznBTDSPPs=;
 b=MTgFA+VT0jO+eORCb/scJz/5PnsfAvx/6y9RufKIc5DVjUViJ5cjG67LcOl0IWEuur
 gSw0y58UbZawb5fCiwN6doESBORsQH7Lzvnqtr2EfN5RaiMKoApEjHRaZyT+wyP/wAak
 VAnOqIcmDGPGeGIdOu/98hmWWXP3XSUPpUeYbwVfJQnVkDBl6rJUpTOAv/UTLLlyeUYx
 Ok9UnM+uEtaVrMyRcl4cq6Co0NeMqLbalvHjCD7XMmw1aE7tlXrJONQNo+ZooQ5N77DC
 FgOKITKcXe3org0sCqb/gJfXdTOb1uWJo81kcM8m1XNES6ElKHCNPcB49ouOtLEhgGZz
 vYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HW7LjfgW7U1BD5KFLk5y6g99LyLhiM0DaLznBTDSPPs=;
 b=27osMre1arnO7gQdSQMUjMbICnutc8UDJxq80YQcGxS23S/VOvrCNlAbMn+rID/vq3
 6B2lRNQV+Btq5gsxOHvr9vhE6tGdFDHqXMTJTzTc1c0bzJKcLW5e5mMo01LAwxRgs91m
 U8JLXSTiN47WFxnIyKTiBFB904p7vZ9A3w8H9w0HmegNfVbvCCfTU5c2lXUPNPPqA+Z1
 w+SqkcDoDQ5wHrQhJiH29+oO8ChyECKD4w9HEIaxaUfl3AeqhCyib1+EvT0JdWCIwpDY
 g34++yA1wYXJ80VumBGY5XDTU//HSJNoJkLsE81FUxiycL6H3CIwoPN6qmDq1C586Yz7
 VTeg==
X-Gm-Message-State: AOAM531PLR14b9rLmwRALUZDW5tNi6ZKnZnaEVzHWHeA746wprE+i0eu
 smdG1P8VIUt9sTyv69mrpWq+yIvUpiA=
X-Google-Smtp-Source: ABdhPJz01Dhf/qyoko7azla67YT2wBSrhy94GgJgsNUVgqw8KbOidwweEfcooxc2SV1tKrDyXTCF0g==
X-Received: by 2002:adf:9e4d:: with SMTP id v13mr3912307wre.26.1631380096910; 
 Sat, 11 Sep 2021 10:08:16 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id i5sm2167594wrc.86.2021.09.11.10.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 10:08:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Correct host errno for IP[V6]_RECVERR socket
 options
Date: Sat, 11 Sep 2021 19:08:14 +0200
Message-Id: <20210911170814.537351-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Host errno must be converted to target errno in IP_RECVERR
and IPV6_RECVERR socket options.

Fixes: ee1ac3a1822 ("linux-user: Add sockopts for IPv6")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/602
Reported-by: Conrad Meyer <cem@FreeBSD.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Corrected patch description
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


