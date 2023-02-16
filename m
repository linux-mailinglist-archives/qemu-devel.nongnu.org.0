Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FEA69944A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:26:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdKl-0002mh-Bw; Thu, 16 Feb 2023 07:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdKY-0002eq-Rc
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:25:46 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdKV-00086W-P1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:25:41 -0500
Received: by mail-wr1-x434.google.com with SMTP id m14so1637035wrg.13
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=azFU279GWo7BPVVCK+2+IWX9+aBI1DPIFAzGgVCRi9Y=;
 b=Vd5N9rIFTUN4lL7afOng9/FS9+bWJw/PpNzRDG9GM5kG4frg9CMFwswubzn/qPQBWX
 /Jce+/tOVDUKMzyQKUEo/t5oEUWJJSOdORmIIAd4BGENn8cqeDQPQARLZIJfl/5kk0yA
 9hr8HLxyeg1+ZnQUH1h5J3p67kE0alQjq9Ok++bwG8hZoI1+WSSwBgLRBMQfmfFXZQeI
 kEZYSrV4HvEZJmclq03wEb9SHccU/Dhaik0HkVs1iRoKCLE+dhhKcBFch9+785vG6TIA
 JOYNErdVF69kM3pypOZUAtW4wRNwokMjXKg6qm/KFyFisTt3a+MSMjr4HsdIEN34hHf5
 W7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azFU279GWo7BPVVCK+2+IWX9+aBI1DPIFAzGgVCRi9Y=;
 b=7hEjq1qzhwklJ7YqS6cvwdFNBib8IxBnaQwZIGqFDFcQdVuqYJ2SjK60z6Ei+IVvTs
 7bSBk+cmigVBB1qEdTP9a+4Zkq6VqvGeuya2AhQhEV7XpCDrFNffaZdOAB47bs1EscDa
 bPYQ05tsEKZWnof7uhUe+0jOeZKQqr3fRF5vxdA5j1YF7XNlt1Sxdl0ido7t/OWVvepT
 xQs6ZTRYJMAkUk9fuRYfnv257pfAW4rszARWKpuK/qT49SDoNzYZDA8oY9yXj+mst62q
 gtxzOS4Px6E3/ABhFJdVSUpk/xNmWw2MSYSiwDtQfovRSlmBL97xksRsXhr+zvvV6cfb
 DCNw==
X-Gm-Message-State: AO0yUKWYy1IeWyJckIzCKuafr0e8J9XIG3B5d2s5mlpjDWEqujwJ9N4e
 uW3/5zAv2JqRnhISEooDlGSPkFidJ36SJVSD
X-Google-Smtp-Source: AK7set+AAcWY+NmIevEMlK91nS7jQUFIzxu1bDTrFjHufDKwMMuw9GX12JihTNmcwAjmqJoQyfVbGw==
X-Received: by 2002:adf:f54e:0:b0:2c5:8613:8b41 with SMTP id
 j14-20020adff54e000000b002c586138b41mr1316511wrp.42.1676550337510; 
 Thu, 16 Feb 2023 04:25:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a5d5709000000b002c59e001631sm206448wrv.77.2023.02.16.04.25.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 04:25:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 2/5] spapr/ddw: Remove confuse return value in
 spapr_phb_get_free_liobn()
Date: Thu, 16 Feb 2023 13:25:21 +0100
Message-Id: <20230216122524.67212-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216122524.67212-1-philmd@linaro.org>
References: <20230216122524.67212-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

The '1' returned value isn't used because
spapr_phb_get_free_liobn_cb() isn't called recursively
(it is only called once in spapr_phb_get_free_liobn()).

The next commit will convert object_child_foreach()
handlers to return a boolean indicating error.
Remove this value to avoid confusion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr_rtas_ddw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
index 7ba11382bc..98f1310c6e 100644
--- a/hw/ppc/spapr_rtas_ddw.c
+++ b/hw/ppc/spapr_rtas_ddw.c
@@ -51,7 +51,6 @@ static int spapr_phb_get_free_liobn_cb(Object *child, void *opaque)
     tcet = (SpaprTceTable *) object_dynamic_cast(child, TYPE_SPAPR_TCE_TABLE);
     if (tcet && !tcet->nb_table) {
         *(uint32_t *)opaque = tcet->liobn;
-        return 1;
     }
     return 0;
 }
-- 
2.38.1


