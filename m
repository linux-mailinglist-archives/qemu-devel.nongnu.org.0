Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AA165F165
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:47:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTL0-0006su-5G; Thu, 05 Jan 2023 11:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTKy-0006rs-FX
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:43:28 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTKt-0006vk-GA
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:43:28 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so1728533wmk.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JPkl1ua/jXIj//qrN71d3DFOxM8PoMBDQnDzXwdNRYQ=;
 b=EIE/DgcCLUkfzhMtyivozCdgrPG/pDKtQ+peiYZgWjE+DQqx9+bXf06ohG8KvhQp/T
 /JJm82kOcW0Suj8d1CwAFM3mX6oLBHEc7fXVXZvi2ks5dh5V6JUetaBKWFNQT1Xp14DA
 z84saW4tJTKyGNSfG8gvw6vznrjgi8KRizrjw0fuVcQlnIpT5hczwQvro19wN3AYcJzr
 gmenat8rlvcEHEEKwG++ETz/Va4awjHkhPojqmLIgAuZzzO6ymLmkTrx5zq0eeN/vmP8
 LPk+70K4UNtyuGTa7lO5W6SGnf2K8oER8ogfYGZkGunRfABcsfE6hGDHnW4F9zx3XuA9
 gSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JPkl1ua/jXIj//qrN71d3DFOxM8PoMBDQnDzXwdNRYQ=;
 b=u/Fom+xVId9/8S32Te9Uf0TSkiMiAAur/g0JkJh8Ycgu+t+NnP1DRTqJgfFY9vlQ6z
 j2r0MuYq3vXyyRcl1+zKAuKtBYk41jMUf90SGL2BO3fHZZIlNW63GtG4lcng7UPPu3Kn
 5sPcEBRWLe9EB6qxcJAcwC4psbViuiBgWdsX5K9JCuNagHRygDmNWBQW2Yrw/fcprE9q
 FDVHqSd19iQhK6SrnFL8rKX3Yk2i1e2OqwVJQev9mF++UwZYyL7HjxZSFeYjZyhv8Jsu
 0/jLfpdWnp/D9NT0s/fJ4wcVMfqBy/tcLHEuxfcZPVvGuVwJRqcNN5ZxUcItX6mUfQyw
 Ft4A==
X-Gm-Message-State: AFqh2kozQT14pw6JcgOxdzi/gcPdBqT0CKCN3q0NydDIR57M7C5YwYal
 sgC9oUuiKzRjwPCguvDM9dtrWA==
X-Google-Smtp-Source: AMrXdXsgJgdyAayDcGuvCHfEMZCmIa9JozZ1tiQzcgqolYH3JUV2+BpcTL3c89a/vQxklPJXrJjk5Q==
X-Received: by 2002:a05:600c:34ce:b0:3cf:614e:b587 with SMTP id
 d14-20020a05600c34ce00b003cf614eb587mr40207474wmq.26.1672937001167; 
 Thu, 05 Jan 2023 08:43:21 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c1c0100b003cfaae07f68sm3417832wms.17.2023.01.05.08.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:43:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C4301FFB8;
 Thu,  5 Jan 2023 16:43:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH v2 01/21] gdbstub/internals.h: clean up include guard
Date: Thu,  5 Jan 2023 16:43:00 +0000
Message-Id: <20230105164320.2164095-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use something more specific to avoid name clashes.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index eabb0341d1..b444f24ef5 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -6,12 +6,12 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _INTERNALS_H_
-#define _INTERNALS_H_
+#ifndef GDBSTUB_INTERNALS_H
+#define GDBSTUB_INTERNALS_H
 
 bool gdb_supports_guest_debug(void);
 int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
 
-#endif /* _INTERNALS_H_ */
+#endif /* GDBSTUB_INTERNALS_H */
-- 
2.34.1


