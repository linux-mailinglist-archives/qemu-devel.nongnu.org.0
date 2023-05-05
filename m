Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3936F7AA6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujty-0005pD-If; Thu, 04 May 2023 21:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtu-00055c-7c
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:22 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtr-0007hY-9F
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:21 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-52867360efcso750932a12.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248778; x=1685840778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nGEnLprJBACbjqSpRTZ1KffttqllnbujSuQyuZ/EBCA=;
 b=QAj6yw0zuWVDsd8HTqSaYqjpDP1fYsRCAB/trSd3nNyRb+ou6HlRHXoPJhTz9s3pMu
 wFQ6OynUYDNrohBeKcNHqc8dypcEIn5Y19bieFZjdDTuaUPqk7el3rJxItPXsjIxTDiV
 xG6WZNl4GYwqprTsljClq1lXnQIHzXHhOYyXGVC7mcKiUZGZV/CoAon9kBPsp9UPRtcq
 SXitMor4wK2JkXcD3lri/4VTNo2wJPpc548OR3k0Q17XwAVgSc2RqpuqmNp7TOPwEFzI
 klIgUwQG/PNGBwHER2lzouhfusCtPjt3ezVCmys3fH1X/PbE7L7vbU2eib5Dka/tjT/m
 DAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248778; x=1685840778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nGEnLprJBACbjqSpRTZ1KffttqllnbujSuQyuZ/EBCA=;
 b=gxBef2IujZAE6VAg0CAyxctcaw+DF8ByGZu+y5e7cHIcswn8gNR9H4gWkLh3FVOFrT
 dPjz5qHI1MNS2ypUUo6kmgjNFNrFBCIatCNMFt7e6CczKNevxcTfFD+YTLjbMejn1Fl1
 wGfsUmP+BVhJKNWJSytbNDV9Ejz/oxiFY5xPLomtJbg/JsHYk7z7i2rz6tsdqDsyPPFG
 3fhJ5tQXEhGzFpKzUq+yZQ25u/keCTw2RxmKHTpu6/u5y14/jH88ATJFwnw7XGsqsJmH
 RSXoqtg8xMTshpIDA7OD5hKOu6Eqqjce/KhN9GgXLMXlble8+ZBJjM+43B2pPnME5Fkg
 YBow==
X-Gm-Message-State: AC+VfDyMjr5CiZWqmRrWpd9KR48QaZUhac/OY/gMLb+icHDFMA+ejWA0
 2zq8drMY/I1VFeovMptgND2E+gejPpkDnQ==
X-Google-Smtp-Source: ACHHUZ7k5ofpdPr0lZs+ogP9BYIo2Ktyc2lTvkSwe4XvMkJirc+v/MIRhLKswAhg+Za2HNQwlg6vnA==
X-Received: by 2002:a17:902:e5c8:b0:1a9:465c:6800 with SMTP id
 u8-20020a170902e5c800b001a9465c6800mr6670392plf.12.1683248777743; 
 Thu, 04 May 2023 18:06:17 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:17 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 53/89] target/riscv: Fix the mstatus.MPP value after executing
 MRET
Date: Fri,  5 May 2023 11:02:05 +1000
Message-Id: <20230505010241.21812-54-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

The MPP will be set to the least-privileged supported mode (U if
U-mode is implemented, else M).

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230407014743.18779-2-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index ec9a384772..b8a03afebb 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -338,7 +338,8 @@ target_ulong helper_mret(CPURISCVState *env)
     mstatus = set_field(mstatus, MSTATUS_MIE,
                         get_field(mstatus, MSTATUS_MPIE));
     mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
-    mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
+    mstatus = set_field(mstatus, MSTATUS_MPP,
+                        riscv_has_ext(env, RVU) ? PRV_U : PRV_M);
     mstatus = set_field(mstatus, MSTATUS_MPV, 0);
     if ((env->priv_ver >= PRIV_VERSION_1_12_0) && (prev_priv != PRV_M)) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
-- 
2.40.0


