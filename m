Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42303460DEE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 05:05:19 +0100 (CET)
Received: from localhost ([::1]:45612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXuo-0000kn-DP
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 23:05:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3l-0006q8-PI
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:10:29 -0500
Received: from [2607:f8b0:4864:20::1029] (port=54096
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX3j-00012D-Pg
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:10:29 -0500
Received: by mail-pj1-x1029.google.com with SMTP id iq11so11510774pjb.3
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EoS3RxKtxYn80WKvuq4uHEnitPsEPyYOQSmow+3YimM=;
 b=gvJ+r/4fKzAZy/gGfM4u/ZABr6TcUdE3tI0tKBIlKvhtuzIRYllFehG2VxK9hoA9e7
 7ojXQgbdL14ANyd2d9xIvJYqkMYKfORoU94KNl84zrbE8BM6y63FfR12n1qq4BLZxKvh
 2tq70a4bilBNcgCenSigj4u7RsaSXKwvTGRgoOBLKJELCjcH1MxXh+nINubm6BCW65U8
 B7J4rmUrvN4AjKL8hKJqxMl0sluBTcOaMavFl15qGsc9geJeceKpzjpiBZHqktg5/3aO
 Fga4fv2hjGb2nhte8dl8jjDcOEPS0B4IA8SyzeyBmtvmw+e/Xrloy99s6BgeIi8lVDs0
 Y6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EoS3RxKtxYn80WKvuq4uHEnitPsEPyYOQSmow+3YimM=;
 b=co8Toiy9A+NApuRHloamLUPvALUBTjPJWpiyC5cXmKD/Oc+iXEwQzexl+e62Mu+6mU
 YjAT2KZrOKqMDTxZLtemZr7XTgupFv0c61yMTTw/hmSyZgIL7mSCnf5rFRmG1h+W80xN
 1DULGHiDI33oicO3IC+Tygrs43DGNfrUj52pMda+pbkHqBZeuC3qOoYiPyOUwER7g4Nv
 WCzbPBhzh3H4IRGYCspPQO09GILaIarv+gK7U9Rpok65XqNj24pDZ6ZMHN87sxu2QWk3
 pIpXj6eMHUYlLa/10CwDYvTQr5HGczcqsruOLps9Gk6LdJwRZBwW9H00He2Qo5r2snd2
 a7Eg==
X-Gm-Message-State: AOAM531H7dprZMdhPZvcmARAXU4Erq1tnJ1EPg/8HlNQd7/WukUu03tr
 ZNw+IX8aiI8K6jWr5LEY7Ci2Zo8A27AFZDD+
X-Google-Smtp-Source: ABdhPJyiJw/dwqjpdU5QmJeTyu9XKlZHCRZv1HxQ/bkM8OlmlREGrFeJWZLP/19pKwAlC2am5q8VpA==
X-Received: by 2002:a17:903:249:b0:143:c077:59d3 with SMTP id
 j9-20020a170903024900b00143c07759d3mr56124104plh.26.1638155425361; 
 Sun, 28 Nov 2021 19:10:25 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:10:25 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 76/77] target/riscv: rvv-1.0: update opivv_vadc_check()
 comment
Date: Mon, 29 Nov 2021 11:03:36 +0800
Message-Id: <20211129030340.429689-77-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions is
moved to Section 11.4 in RVV v1.0 spec. Update the comment, no
functional changes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 33ef7926e64..47eb3119cbe 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1613,7 +1613,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
 
 /*
  * For vadc and vsbc, an illegal instruction exception is raised if the
- * destination vector register is v0 and LMUL > 1. (Section 12.4)
+ * destination vector register is v0 and LMUL > 1. (Section 11.4)
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
-- 
2.25.1


