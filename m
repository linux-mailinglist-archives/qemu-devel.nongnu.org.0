Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3546EB9E6
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:10:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEq1-0001o4-ET; Sat, 22 Apr 2023 11:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEpy-0001ne-VW; Sat, 22 Apr 2023 11:07:42 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEpx-00059E-Bm; Sat, 22 Apr 2023 11:07:42 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-957dbae98b4so123333266b.1; 
 Sat, 22 Apr 2023 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176059; x=1684768059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y5KQCp/5S6bG8HuqSoXNMyefxOh4ZmcnY6S7bVkojOk=;
 b=DANVOjAQ6zaxqKMNMStDBHLoh6aRnolZOomGZzRruNv6d3TFD+cdw920iu8VBzteWl
 sh+kDYHBgAu4I1es3oWiq4Z394+rlWwDXG5AUasKZ06RQ1U7ndvh5b/pNVetQ+8krk0g
 hSo29aaX6kLWN+BrQZ6q4Mv8v0j0nYYhzWv+e4RPr52S1JwUIPVqGgreay+aEh1NfWYA
 Bu5rC9mYJftUQ66ElCji0kpPlxMJ0mbwg1WDP26JLhv1r72gUqwCQ2LVyVfGPUEQN2gE
 9lZBQ+uOTP+i+oiDwPuACpahSJKk+Eb+SiuUEMNvPti2O3rqSJXhFNq1pegmpsuo2qkK
 qO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176059; x=1684768059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5KQCp/5S6bG8HuqSoXNMyefxOh4ZmcnY6S7bVkojOk=;
 b=akgtuDEbx7p7E3mvCDrn2uMPPP6IeTqlC7ixsTg3K4CuQJ2z5emrkQssQXZ1uD6Zus
 yh47eyXwnoMtvelIkU2KhP3MNA0E+PqIN0Mhlalp1X6EDAOFHBGy5ZfyK6DqtC3+NoXV
 gMvY5AZRzBVIsym/DzOm+qRoTGKLghOO9oxNUv1N7SuQax0CSQAQJVnhfuGrsUZfytlO
 6wrdfa3MFCOWeeyY+Lm/wKbMHlh7OWH3Deivl+AZwGxTPKGL7D2qH+pCbcZ/P/DDr1Mi
 vAozHudqRTx6+i13M7bntZXck5NujIW6fm23QK7KGAIkC7/GLdti+b/E+p+WDnF44mFO
 WRCA==
X-Gm-Message-State: AAQBX9drqZ4NkcYteWlVbSC+lFKPfvTqloeJBH8VoNUbAp/jbDbs+c9t
 8mfulrsWtbmfalPyCUFbAYh4ro3WnKY=
X-Google-Smtp-Source: AKy350YKaOyRQ1rFHPX/YeJ4FEnFh9MDhA7iflmixJ6GyUboOKfb9i05BLL7+fLr/F7xEEYS6yFlnA==
X-Received: by 2002:a17:906:1290:b0:94b:ffe9:37fd with SMTP id
 k16-20020a170906129000b0094bffe937fdmr5466125ejb.5.1682176059078; 
 Sat, 22 Apr 2023 08:07:39 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:38 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 03/13] hw/isa/vt82c686: Remove via_isa_set_irq()
Date: Sat, 22 Apr 2023 17:07:18 +0200
Message-Id: <20230422150728.176512-4-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422150728.176512-1-shentey@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Now that via_isa_set_irq() is unused it can be removed.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/isa/vt82c686.h | 2 --
 hw/isa/vt82c686.c         | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index da1722daf2..b6e95b2851 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -34,6 +34,4 @@ struct ViaAC97State {
     uint32_t ac97_cmd;
 };
 
-void via_isa_set_irq(PCIDevice *d, int n, int level);
-
 #endif
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index c7e29bb46a..a69888a396 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -604,12 +604,6 @@ static const TypeInfo via_isa_info = {
     },
 };
 
-void via_isa_set_irq(PCIDevice *d, int n, int level)
-{
-    ViaISAState *s = VIA_ISA(d);
-    qemu_set_irq(s->isa_irqs_in[n], level);
-}
-
 static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
 {
     ViaISAState *s = opaque;
-- 
2.40.0


