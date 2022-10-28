Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199B86117EC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:47:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSS6-00035Y-V1; Fri, 28 Oct 2022 12:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRO-000513-Ho; Fri, 28 Oct 2022 12:42:42 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRD-0000QM-Bv; Fri, 28 Oct 2022 12:42:42 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1322d768ba7so6893470fac.5; 
 Fri, 28 Oct 2022 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IjgKbF/AAa+fbA/vhvUHtv60RHCTsR4Z7Jy9oe4Llcc=;
 b=R8CImn88tY/WsTJ8tYjO1TDJuHeDJRLRyPt1V3Zr4A3O5oSaqf34u3aNUQ77PAn2p1
 X5o7L0A9CtUlWJOV9SdfWAOSpv2M+oac0UzN6XHIfwCFjnLhu0clGddCzS1luPxr6+7Q
 plPpxdq7EYAbSZkdXHI5GHSMlAg+XBijwKQMW0qAjS/6lmC8OqnY0eNIBCHULlTZPqLs
 hFfl6qmbFhrpv+f8JTpKIF9cbkL6zhu2sfZWGOlM6Vyufa2yXx/m9j6KPkhurDQnRxmv
 eCRg8YoER/eLEbQGAWUBQ9LOtA8Nj0lIXytzzXBqJ8DNzApvGP7N5EajO1wsfmFkaD0l
 NVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IjgKbF/AAa+fbA/vhvUHtv60RHCTsR4Z7Jy9oe4Llcc=;
 b=HHie6a+LtcZxZjauN/E2Yb3qm1jSL0TbW52qPltN5I//oHnT4XgDvI3f6myjUR0MIe
 /mkE0Zyb6CuToYLHyWRMPmtpy1WRDpcR81I3wt8FtrP6QjJUXsv/eCLfJii0Zyr0eyR0
 og2l0n9cTbXXECyAfrAZQ77fMj1FUZS8j7b44quifNTqtGaaPiiBEAGC2SkdXqluoWAp
 yRCynZzoVSAfdgE8szUtduAGOvSKwnWeC85s/2zUxGnG33sw+/1up3BAnlhdlguUI3Je
 0RojiqAIT1aYgLkWce/eK12hP8A8NL5b34S7XKe3TKygbheJ/W3UHi2YNmG6MjM9USNF
 BQnQ==
X-Gm-Message-State: ACrzQf1kOQjGhbo4xEAf4+Pfa9WkWkgIEO9Gp2cGa0yTzLYHMXadiCLf
 nNc3niY6NPbOGxjyIt+6Ez8Wbe8DiB50gQ==
X-Google-Smtp-Source: AMsMyM5GO9nwupxS1B1757tZPJrL2rrSVpF95kukJoX0bVLCBFdxPPh7qM1LbrbDt6A2THV6puOWzA==
X-Received: by 2002:a05:6870:390b:b0:13b:f4f1:7d7e with SMTP id
 b11-20020a056870390b00b0013bf4f17d7emr9619371oap.285.1666975349500; 
 Fri, 28 Oct 2022 09:42:29 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 34/62] target/ppc: remove generic architecture checks from
 p8_deliver_interrupt
Date: Fri, 28 Oct 2022 13:39:23 -0300
Message-Id: <20221028163951.810456-35-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-17-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 21cd8d02af..b4afdc81ca 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2010,9 +2010,6 @@ static void p8_deliver_interrupt(CPUPPCState *env, int interrupt)
         break;
 
     case PPC_INTERRUPT_DECR: /* Decrementer exception */
-        if (ppc_decr_clear_on_delivery(env)) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
-        }
         powerpc_excp(cpu, POWERPC_EXCP_DECR);
         break;
     case PPC_INTERRUPT_DOORBELL:
-- 
2.37.3


