Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF214C753C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:53:17 +0100 (CET)
Received: from localhost ([::1]:36364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkCy-00066r-3i
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:53:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAU-0002kg-9b; Mon, 28 Feb 2022 12:50:42 -0500
Received: from [2607:f8b0:4864:20::22d] (port=42649
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAS-0007yL-QN; Mon, 28 Feb 2022 12:50:41 -0500
Received: by mail-oi1-x22d.google.com with SMTP id a6so13891253oid.9;
 Mon, 28 Feb 2022 09:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i8RO+JATm4l+COyg80pLCIUyiGIxBD1Ri+dzPXkEvEM=;
 b=FLOsrujslmy6o5A/AGtWgPHumFYzQjZwip47n1V85yIxYdoJk/rtUkrVBMCPrwUUFs
 bN4sYYDJ6q9DBxOLuofxOMeRkGg5SVwAbDpV7uvAUyHnSJa1go1ETnNw4v7EejFJy5oV
 MCaJJ3t+ODOnVgOeD7MOPTBh1vQcsVLLi76ABLsMnkLKt2zMeJ82YHEpLmzFXWETTH+V
 HEs4Kv6ZoSaltGd6UmWOhzkFEtwueV+06m4lOENU3X8gDNQFBLs/6awjN2aCEFTtgTVR
 zbWavGUPYLpLxkSsFgH5l+IBkR/3ZqityvCONYljeO4NIa1hzrCIzDNZKENBbiU4uUBr
 efjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i8RO+JATm4l+COyg80pLCIUyiGIxBD1Ri+dzPXkEvEM=;
 b=MXNKlk6NDhkCweWr/4pJ5YWskcAvKmUPAKqUxvEM8Av0H9BUv+Vk12ACvDKxkX2nUw
 EH3SaRxkF/GN5xbdfhpkfAuuIhC/E80m5U27QeyazcRmYrTNX25nka2DYp78IL+UOT6L
 AtPqxw3LdnVVvqn7JLK7t3BeeoQep9Cc1UIwd3FTKplGambtoSg+i6mE1eKibijJ6xx3
 C71mQUeqrMtvdDcK3jMzrEkr4anbAXTxqzzECKZ92Yzt5Se7iVrM5oivDu/EI8Ww3W+P
 /l6dBTHcoTVakmmL0NLIgkTQB6W6tHXlTVgXcMfjYHWlgdGogAfI9/ZlXc5MzqOZ2JGn
 ADvg==
X-Gm-Message-State: AOAM530SAGqWGYyZHMwBnGHVEJSupKViE4DpI4yUXnHvOa5nRvxiqRKf
 mWdzEvTFuqzMi0Td83sioRTLkBeLzp0=
X-Google-Smtp-Source: ABdhPJzwbFV7Iyn0RAc6pQPqnAsvJLjgvi0R/frYqCP23pEZl0tYLBXiZM/TAeIt/gN+CC8Yd2q42g==
X-Received: by 2002:a05:6808:309e:b0:2d5:35e5:e1ac with SMTP id
 bl30-20020a056808309e00b002d535e5e1acmr9826573oib.86.1646070639370; 
 Mon, 28 Feb 2022 09:50:39 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:39 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/14] hw/ppc/spapr_drc.c: use g_autofree in
 spapr_drc_by_index()
Date: Mon, 28 Feb 2022 14:50:00 -0300
Message-Id: <20220228175004.8862-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
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
 hw/ppc/spapr_drc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index ac4067625e..76bc5d42a0 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -798,11 +798,9 @@ static const TypeInfo spapr_drc_pmem_info = {
 SpaprDrc *spapr_drc_by_index(uint32_t index)
 {
     Object *obj;
-    gchar *name;
-
-    name = g_strdup_printf("%s/%x", DRC_CONTAINER_PATH, index);
+    g_autofree gchar *name = g_strdup_printf("%s/%x", DRC_CONTAINER_PATH,
+                                             index);
     obj = object_resolve_path(name, NULL);
-    g_free(name);
 
     return !obj ? NULL : SPAPR_DR_CONNECTOR(obj);
 }
-- 
2.35.1


