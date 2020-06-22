Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD49202F8B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 07:36:48 +0200 (CEST)
Received: from localhost ([::1]:49182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnF8R-00026Q-Gf
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 01:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1jnF7Z-00017E-Bn
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 01:35:53 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:33850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1jnF7X-00006q-UQ
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 01:35:53 -0400
Received: by mail-pl1-x642.google.com with SMTP id d12so1114743ply.1
 for <qemu-devel@nongnu.org>; Sun, 21 Jun 2020 22:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wqn23dWLQBVrm3Ttu4og8XpwbXOSCRZTvr72KoqoT+4=;
 b=JX1AoW6oiFbWqjH+KqqMsxKBgHkXFvAGDxOsqVuIuae/xbTC39nkSE9yAjklNnswnU
 MzzoTgP6FcnfGo3YX4JlD/ghS7WiAAhsPaRZ6oRvH9p2kgdSebzdlIuFjgcUlCRs1mFF
 8BE4kwwCvU/AGKvI7DwC5msfAkRfWY3U6S+NvpiUMWZan+YNkQwE1AE2/2QVy/WQazNu
 zphy6jQy02ZX6H/EJh8bQM0BEqHek6DoPI0Gyp/iIo/SbqM1LzRqIGHbS2Oh6Pc9rHlO
 RrjU7u6EnA9ko+jVaaWk7pGaykFBXa55Z33WQWaFqn5GUP3KmxkdDMb1kGvsUX8qwdIP
 Q9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wqn23dWLQBVrm3Ttu4og8XpwbXOSCRZTvr72KoqoT+4=;
 b=uComfl9ON1en7QLpoqoEfSTWtmFBsg/FpYmxvSj6HfnKiQLzIQiWUpO/SUUGkDVftm
 zg6zUks5ky1mP2fpMme2JEfgPyQ1C6Dv8Uda0wWDxUwAYTMf3qfB4wpmCOy0FSCNZwRy
 4WRi1pIeWZt8s44qvhcgQkjjk7cLNV4veKwK5jiZA30WxsLkpzIjf+Il9F6xHOEDfebR
 yRwZpw4RgZELmEKOvgxIaEagtnx2gtZysogh8X/axip4/56aeym6DH0hJ9tMnD3ZNuNE
 LW+CkjEBLGosSihjTgO7gimjtUuxpbPY5NWDBouOFxRYILjTDFKde2xWdsx82enpVpyj
 syAw==
X-Gm-Message-State: AOAM531+hVNZzb0Sm2kdEqacOXmLUpNNaWUrV0lbOjxD6lnga7FOT17D
 zfZsd1HNWL+MBknyXi25LKaoV3yF
X-Google-Smtp-Source: ABdhPJxMIipFXtrye+VIpPS87VIRhtt4VPdpHEZG6H5fDTdV6IzGr5fjcNY8gRI9ic1CeeVqz8gklg==
X-Received: by 2002:a17:90b:4c0b:: with SMTP id
 na11mr16363830pjb.176.1592804150417; 
 Sun, 21 Jun 2020 22:35:50 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:dc59:7b7e:f4cf:4ab8])
 by smtp.gmail.com with ESMTPSA id f205sm12378740pfa.218.2020.06.21.22.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2020 22:35:50 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/xtensa: drop gen_io_end call
Date: Sun, 21 Jun 2020 22:35:37 -0700
Message-Id: <20200622053537.25245-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit
ba3e7926691e ("icount: clean up cpu_can_io at the entry to the block")
it has been unnecessary for target code to call gen_io_end() after an IO
instruction in icount mode; it is sufficient to call gen_io_start()
before it and to force the end of the TB.
Remaining call in xtensa target translator is for the opcodes that may
change IRQ state. All of them end current TB, so gen_io_end is not
needed. Drop gen_io_end call from the xtensa target translator.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 4bc15252c8a5..6346b2eef014 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -595,9 +595,6 @@ static int gen_postprocess(DisasContext *dc, int slot)
             gen_io_start();
         }
         gen_helper_check_interrupts(cpu_env);
-        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-            gen_io_end();
-        }
     }
 #endif
     if (op_flags & XTENSA_OP_SYNC_REGISTER_WINDOW) {
-- 
2.20.1


