Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C6B6117B2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:41:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSPL-0004kf-NV; Fri, 28 Oct 2022 12:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSOy-0002ps-Ld; Fri, 28 Oct 2022 12:40:16 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSOw-0007iN-Ux; Fri, 28 Oct 2022 12:40:12 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-13b6c1c89bdso6831072fac.13; 
 Fri, 28 Oct 2022 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fdJRlWYTcqL6ucLnfTqsjUj0hGbhOme3aoszJHaNXTA=;
 b=LJ0EtsospRFlV+Xh5w3BPAs9svbkF9GJJxOjQk/vnx9PsjOSfzOJgK0rFqhHO7gTgI
 epp6QCg4hzS/rKeBkdMdgOlUipUO6uDdUvVnecZVC/uoLZG5PLWnjiaIIPHxX1ihje6u
 Rnz+3FYN1+zIlfyFkZ61umKRDw7nTvXU++SbxL14qBFrOKTIIs+fPM95n1ldxDUP93e4
 WOVjcby5jlnZYNeB03/RBYIBFyzQshq7TpjHeIJdTXdyh5UegRUol8oU+FLf8LmrG11q
 FI4FKlzsxkdKFxPv0/26hbaLK/fR9MpeFGPMdJIzbD3+4vTfFXxEhX/gxVFGCwlg69Yz
 hg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fdJRlWYTcqL6ucLnfTqsjUj0hGbhOme3aoszJHaNXTA=;
 b=VzR148N51j4JofrJKV+Wtclwz0IZbzOXIwvJ0T6mB8Nr6MUbFDyU+m9K8KKpEyEmCk
 DwlXvTmgCGkJdaXQf7jynp6jXcAqs0e76hsPvabJretVJxzC6LRmydVUlMSkpHPYRkhx
 Ymq96/Q4RZzKBP7j4pKpucO1DYVa6BR0wo9mJ8fHpUrd1Vr2axZ9nh1D4EvdWx/HeXLK
 ud4Dyk0tHEB2EgkKB8C/o41gUJ2lnn/MKtjD3jiE1uR1W6y+9Ju6vrHtCmN9m94Gjniz
 2RlgMQZvguA3WGiXcBNNLkP0z5zddmoZPRoVh9JqidwCWdbF6ephYeWCVyfPXuyT9hk1
 WgUA==
X-Gm-Message-State: ACrzQf3PGJB9wAbIdwOmZJ07Vjf17qXcgMFS52mdNSpOr/Gf/eZUJlNX
 ZjiwgFXaAVPtrNpyCC5fXIHwihsldVAbcw==
X-Google-Smtp-Source: AMsMyM5e/7f8qTdzJc9clEnswd/yt32hPitWWOTu8+3OSxVE1hDLwUzeIKTLqDHeHBKD6+mOswXkzw==
X-Received: by 2002:a05:6870:612c:b0:132:a4d3:e0d8 with SMTP id
 s44-20020a056870612c00b00132a4d3e0d8mr10329oae.95.1666975208910; 
 Fri, 28 Oct 2022 09:40:08 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:40:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 02/62] target/ppc: fix msgsync insns flags
Date: Fri, 28 Oct 2022 13:38:51 -0300
Message-Id: <20221028163951.810456-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

This instruction was added by Power ISA 3.0, using PPC2_PRCNTL makes it
available for older processors, like de e5500 and e6500.

Fixes: 7af1e7b02264 ("target/ppc: add support for hypervisor doorbells on book3s CPUs")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221006200654.725390-3-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b5d80fd13d..ccf2ffd567 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6906,7 +6906,7 @@ GEN_HANDLER2_E(msgsnd, "msgsnd", 0x1F, 0x0E, 0x06, 0x03ff0001,
 GEN_HANDLER2_E(msgclr, "msgclr", 0x1F, 0x0E, 0x07, 0x03ff0001,
                PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
 GEN_HANDLER2_E(msgsync, "msgsync", 0x1F, 0x16, 0x1B, 0x00000000,
-               PPC_NONE, PPC2_PRCNTL),
+               PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(wrtee, 0x1F, 0x03, 0x04, 0x000FFC01, PPC_WRTEE),
 GEN_HANDLER(wrteei, 0x1F, 0x03, 0x05, 0x000E7C01, PPC_WRTEE),
 GEN_HANDLER(dlmzb, 0x1F, 0x0E, 0x02, 0x00000000, PPC_440_SPEC),
-- 
2.37.3


