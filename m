Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9593C2C7D0B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 03:57:23 +0100 (CET)
Received: from localhost ([::1]:53704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjZNS-0004Y1-Ix
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 21:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kjZGZ-00040K-6P; Sun, 29 Nov 2020 21:50:15 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:39723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kjZGX-000192-Gq; Sun, 29 Nov 2020 21:50:14 -0500
Received: by mail-pj1-x1042.google.com with SMTP id hk16so439575pjb.4;
 Sun, 29 Nov 2020 18:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4RnVTKUr/bdZNmu7Zu6LkRiMBh1GyYpc2I0/1ObsHRE=;
 b=jwwkBSv/5ah4QeuuV1sPTNL+/doH4lHR3Zl99J//QAjc6RBSGMAnXuFoY8VF8srBnC
 AwQQKZBaAO2H8AbF0RB26D34RMNd9O+milZjtnHkYLbKP/Vl0ZUi1I9Rvnk1KxAzDkRT
 +UMNG8ZKeIoGPI9Wlt+jYA4AkxPQMlB8EX0ZCJNZyIusdc8ZUVTZT0dUpaFbdkHHNWdp
 dIdvDc1iE6IT46+bhigKUXohqIFosbvb/x8LogQgZrmit89hb7pFO1BnOcR3khiiW+bq
 +ADhDhcWt9Hrz4wBqExqckpf2zXLNKbK5eGOPcfFPQHbfmk12r5p3xl6e+mjE5cMhsbj
 JYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4RnVTKUr/bdZNmu7Zu6LkRiMBh1GyYpc2I0/1ObsHRE=;
 b=MpLTi6Yn8fgqXTP98lHMdHIOJZ0jhqy6bXu55N9gZsQq4bclw3HOIKcwx2z3m85Lom
 T64mC4XBDW+BWAPxQ+DYltIBoN5vFsi9VJD8wGgi5pip2bG8qr7Tz+l3zXPZ7/sSEThj
 8G/Fyv2GVvP8JOG561DbTyH9E1ATkQWb24uWzhSFe70vvy8T5WXV6tCyzB6agw6WAoKD
 KS2xBO1n2udSrm4kATbwLg2cqDuoTX4fxrj9Ovh65GRzHDzRXNdiEEG70i0fXlwfIv9L
 fTi+w9uP937xOxrYj+pmp9a4Z16DDcmcT1BGx5ceQlBnRLN/bLf8Y5KnWYu5ZnbQjhqm
 SIHQ==
X-Gm-Message-State: AOAM532vri1NVDQ+5Twm04cWq6DLzxEgPn71bmIkbrNH2x5mWfCv8yJ4
 5iTFgWZ7WgQo/mgL/j61mzI=
X-Google-Smtp-Source: ABdhPJwIaIDMTxp+NGx7jVvXaUNHN54OTVC8mxlC2hiHD8vUg0DSMHgfBaEXYaxsDug4XzYJMd7pEg==
X-Received: by 2002:a17:902:c3d2:b029:da:73c5:c589 with SMTP id
 j18-20020a170902c3d2b02900da73c5c589mr3670986plj.71.1606704611321; 
 Sun, 29 Nov 2020 18:50:11 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id e18sm14033640pgr.71.2020.11.29.18.50.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Nov 2020 18:50:10 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
Date: Mon, 30 Nov 2020 10:50:02 +0800
Message-Id: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1042.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

SST flashes require a dummy byte after the address bits.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/block/m25p80.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 483925f..9b36762 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
     s->needed_bytes = get_addr_length(s);
     switch (get_man(s)) {
     /* Dummy cycles - modeled with bytes writes instead of bits */
+    case MAN_SST:
+        s->needed_bytes += 1;
+        break;
     case MAN_WINBOND:
         s->needed_bytes += 8;
         break;
-- 
2.7.4


