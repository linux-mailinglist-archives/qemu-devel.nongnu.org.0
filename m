Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DFA4D0798
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:23:01 +0100 (CET)
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIwe-0006nK-Ms
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:23:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIq4-0006X2-Oa; Mon, 07 Mar 2022 14:16:12 -0500
Received: from [2607:f8b0:4864:20::c2a] (port=39529
 helo=mail-oo1-xc2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIq3-0005wU-5C; Mon, 07 Mar 2022 14:16:12 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 q1-20020a4a7d41000000b003211b63eb7bso818367ooe.6; 
 Mon, 07 Mar 2022 11:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hg5wMiiCQQI9fvTqpQhv1av6PEraDSZthGbyDg+4i7g=;
 b=pCBQwszgfXP8AuxsdfvwGqMxegu5pxOkGSTWnbu3bXblEuasjqjNJ3ccqT0AB1+usf
 3BSarbA0b8ZSozDSET+bkAtTZfFD6x0y8JoJ6ngzyI+7yG+hq2qOAYWA7bGScw34HHnz
 MLLxcHYJLg3XwTBvdKs7v2V6Cu4YUzz26ZMZPryUB5GoSOL2vxu2TSG8fV+RegzQ3c/T
 lHD5zAoKXEsR0jh1tXCeLUVIaonqUQHwcKqN5M5UnUXnJok0uIQdG5apaxYyznJiLUFi
 OBSfnCHT1u78H3JZmn7mECC8q5rfnaEraqIjjukUdEdlJcE/4Psdzx9MWxKMPnfD7GgT
 X4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hg5wMiiCQQI9fvTqpQhv1av6PEraDSZthGbyDg+4i7g=;
 b=J1b8j14n251Q8UTFddScCPXEm4YLm9AfaJ1czlnw7LpzsgPFtTaPvMGrriJHV8JkxJ
 OyX8fp0IKWDzvIAlX9ZJIyWhKhsbQCywOo+wSwYW4tUQbJMlrlbUWNIPw6eq2IshpzxT
 x29G/b9JeqwuAAUCn8MvGMaKjGOSpTEvI3pGFPH4VgkFSD55VczJBtWbEteIliR7Ufo9
 4WKC1/hzdLd/jEdLfx3/w1wRd5DGQgMcF+IJ2Tl34JUXZ5VlU8oyu6pzn8Ce8uZKj9ea
 st4sdoivamsed5PgauBtx1+FFDUzNwUZSPoI13AUqNYB1Cg2Xkekfs5q9UkKQbrDPRKI
 MVnA==
X-Gm-Message-State: AOAM532K/Ad0xu2cqKL6/lQey0qZv7P5K39CjNiEZceeQjfx0XC2y75B
 ta2IFWWTq7wX57zOR3LQUQeCaoAM9zI=
X-Google-Smtp-Source: ABdhPJyIAKeoVVlwwamcLJdfZfqGD2c4/FmfcglwYUWDSc0JF4SgWicnKN1/gXt+9u4JWdMHEKMlPA==
X-Received: by 2002:a4a:5295:0:b0:2ed:96b4:8efa with SMTP id
 d143-20020a4a5295000000b002ed96b48efamr5307642oob.38.1646680569723; 
 Mon, 07 Mar 2022 11:16:09 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 t40-20020a05680815a800b002d48ffad94bsm7283093oiw.2.2022.03.07.11.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 11:16:09 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] hw/ppc/spapr_hcall.c: log h_invalidate_pid() as
 unsupported
Date: Mon,  7 Mar 2022 16:15:47 -0300
Message-Id: <20220307191553.429236-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307191553.429236-1-danielhb413@gmail.com>
References: <20220307191553.429236-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f6778d6857..5839b6a749 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -873,7 +873,7 @@ static target_ulong h_clean_slb(PowerPCCPU *cpu, SpaprMachineState *spapr,
 static target_ulong h_invalidate_pid(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                      target_ulong opcode, target_ulong *args)
 {
-    qemu_log_mask(LOG_UNIMP, "Unimplemented SPAPR hcall 0x"TARGET_FMT_lx"%s\n",
+    qemu_log_mask(LOG_UNSUPP, "Unsupported SPAPR hcall 0x"TARGET_FMT_lx"%s\n",
                   opcode, " (H_INVALIDATE_PID)");
     return H_FUNCTION;
 }
-- 
2.35.1


