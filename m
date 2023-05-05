Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E596F86D9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:36:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puyOg-0000XB-2V; Fri, 05 May 2023 12:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOe-0000Vk-Ex; Fri, 05 May 2023 12:35:04 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOc-0004uG-NY; Fri, 05 May 2023 12:35:04 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6a606135408so1791681a34.0; 
 Fri, 05 May 2023 09:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683304501; x=1685896501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jbx/0so/ks6rJVukEiTYoE7hqjtEvDeuQ+ZtkpBDRKw=;
 b=c3aLmMLutOoFSznxpEj2InimHOcUSz5Te+9SfeOJWpuI3o5sIU8HDoKcbYLHmKnvfx
 ifs+s+TVuruB2sXfVpsK05ymVDGbXKO19dXzuckS9PtE38FC1TFWBoIpQ69+UQ+jDBly
 oeHfuX756ZaiouRuwWDAe6vDjnHiHuDzijbWqUUya5gL7Guh/5bGJp9drQXy50qyr2rL
 7QC0SPggBnPLWr9/U4h6f4glb7arYOsuc4IsUkPVYov+8Ejk8fJ7i/rfDCSRSFhGno5V
 ghn+i99LFZokDDCjUIDxuV/lBI7uV2FNQ9LgaYGZ8BqQRPyQzqiTpvodZ71B5rVT91OA
 fWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683304501; x=1685896501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jbx/0so/ks6rJVukEiTYoE7hqjtEvDeuQ+ZtkpBDRKw=;
 b=HfIkImO6dVBgHR67JpwRMc/aGcHR8m/UhcCdAaKBCEJ7dw3qrprvS3kbPggLOXr6aa
 DOBS9s+a5MJfZzMcISn1ru5ICdmUmEZjSvM3/7yvMWBLR5nsLLGWqcylqw6yGTDah9/F
 nUJwhA4kGmwmveNXFECg3o9kgXufEIsJ1Wym8yAbtX12Y6tUsWYD09N3K9IE8qxk0J3e
 YSBAKIRTA85h9t8b2yQBALP3LM9W4GrwlrF1/vG2GDX4eilxe/ltpOguHjEjzCUUNvsG
 +50OkVUsz93V3g4CkKGtzrpUO4D7i7+TW3wqhBdXT5HRHdFKVaMGwnyr+Y/OoqbGbPVz
 qkyg==
X-Gm-Message-State: AC+VfDwqC9LUBez7iD+ETY4PsuM6R6ByZ3bFukcuNZ+4zTWp/wUJgdeG
 rwT15l9x4uMLoQfDGajqb7zWT1cpyX4=
X-Google-Smtp-Source: ACHHUZ6B0Kc+KaB7yntZ8GdzGyD0r5QMkyxAVAqoEOfAgoJIU/yLlap1z9Mh2Awf11PXGVupQlxdcQ==
X-Received: by 2002:a05:6830:208b:b0:69f:165b:1509 with SMTP id
 y11-20020a056830208b00b0069f165b1509mr952287otq.35.1683304500956; 
 Fri, 05 May 2023 09:35:00 -0700 (PDT)
Received: from grind.. (189-46-207-53.dsl.telesp.net.br. [189.46.207.53])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a9d62c3000000b006a43519523fsm1033475otk.1.2023.05.05.09.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 09:35:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 4/6] tcg: ppc64: Fix mask generation for vextractdm
Date: Fri,  5 May 2023 13:34:42 -0300
Message-Id: <20230505163444.347006-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505163444.347006-1-danielhb413@gmail.com>
References: <20230505163444.347006-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
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

From: Shivaprasad G Bhat <sbhat@linux.ibm.com>

In function do_extractm() the mask is calculated as
dup_const(1 << (element_width - 1)). '1' being signed int
works fine for MO_8,16,32. For MO_64, on PPC64 host
this ends up becoming 0 on compilation. The vextractdm
uses MO_64, and it ends up having mask as 0.

Explicitly use 1ULL instead of signed int 1 like its
used everywhere else.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1536
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Message-Id: <168319292809.1159309.5817546227121323288.stgit@ltc-boston1.aus.stglabs.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate/vmx-impl.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 112233b541..c8712dd7d8 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2058,7 +2058,7 @@ static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
 static bool do_vextractm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
 {
     const uint64_t elem_width = 8 << vece, elem_count_half = 8 >> vece,
-                   mask = dup_const(vece, 1 << (elem_width - 1));
+                   mask = dup_const(vece, 1ULL << (elem_width - 1));
     uint64_t i, j;
     TCGv_i64 lo, hi, t0, t1;
 
-- 
2.40.1


