Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C133C640E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:47:15 +0200 (CEST)
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31ta-0003su-6O
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qZ-0001aO-Ah; Mon, 12 Jul 2021 15:44:07 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qW-0002g3-59; Mon, 12 Jul 2021 15:44:07 -0400
Received: by mail-pf1-x429.google.com with SMTP id 21so17421498pfp.3;
 Mon, 12 Jul 2021 12:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VLA0QX060RDws9FZs/ls+ZYReQcTzyt4lON8NJNw2CA=;
 b=GOq6qHBWjG/CUp9JV3tut5LwZOg5bTPEGFPSFaql4nc12Hw9CG5H//xCMFedtdMyJG
 +XcdCT4qUryS35cGCUVbSPi181FG8yO4SP4BrjudTgf4IcYFlkiPwK418GWLq/6L9Ss6
 gcfg1zsJ8Jt4xTfuqCEE4ohADNRuIwXzpLiXYaNKLX/RRpHOtTOGThTU8JtH5Tc+7TXo
 rC/zTeL69hcSVQLtEkgLEyj7C2OBOPCG19ABkwRjQ8FVkKS0ixuDGLsfhNoOll9kg9VC
 8JORH5CRJTYmh7fu4+XL06j4D/y+95zn/c5hBSuYxt0XUBdDs0IMmD0FnAbCOzckGj6q
 cC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VLA0QX060RDws9FZs/ls+ZYReQcTzyt4lON8NJNw2CA=;
 b=YusikFK8esyTtAagn4Vu061SLZkeuoKYcpAXDN9UrAeC7OuvQR816WwvObxXVY2644
 x4btbV92LNYJc7AbjcQScN1fEWTJ7Ex4563/aB2y4ngpsqarIK0T2q5y2vfOeOMQ2bxv
 CaZxVRr0fQgeWbsMWESPTW5nknfPRjBcjllaRQlSEteQH1JDeY5WjHuJ2/kD/L7hmaEF
 NoYppKvhJNex71ymfN1vA2tZrLikzHPy62jHg36sJBUWWd4Kg2ne/2+E3AacigJTA8Cl
 dKrvavX+k6yHzYfUeuK6MFoxT27eXHrbzZvSO/ChpQP6v5uNKTogQ2rWP1fKCQfQAtyU
 5S1w==
X-Gm-Message-State: AOAM532wtMbmn54CkBP9037BmKi4Z796SR7L+9j4Cqre302PXcI/1tlK
 LLEw3oRYKyrurSffTPD2SuS89D+rxQ8=
X-Google-Smtp-Source: ABdhPJw8AiElCW/ouhIetOdrUtlB073agg0gyBsdbXhASCXX7K92t3EeMrcIFWhfB1qLqZWJpd+D9A==
X-Received: by 2002:a63:f64d:: with SMTP id u13mr717515pgj.156.1626119042177; 
 Mon, 12 Jul 2021 12:44:02 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a7d9:90df:d3f0:78a8:2eb9])
 by smtp.gmail.com with ESMTPSA id e21sm17075088pfc.172.2021.07.12.12.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:44:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/7] spapr_drc.c: do not error_report() when drc->dev->id
 == NULL
Date: Mon, 12 Jul 2021 16:43:35 -0300
Message-Id: <20210712194339.813152-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712194339.813152-1-danielhb413@gmail.com>
References: <20210712194339.813152-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=danielhb413@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, armbru@redhat.com,
 groug@kaod.org, qemu-ppc@nongnu.org, eblake@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The error_report() call in drc_unisolate_logical() is not considering
that drc->dev->id can be NULL, and the underlying functions error_report()
calls to do its job (vprintf(), g_strdup_printf() ...) has undefined
behavior when trying to handle "%s" with NULL arguments.

Besides, there is no utility into reporting that an unknown device was
rejected by the guest.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index a2f2634601..a4d9496f76 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -167,8 +167,11 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
             }
 
             drc->unplug_requested = false;
-            error_report("Device hotunplug rejected by the guest "
-                         "for device %s", drc->dev->id);
+
+            if (drc->dev->id) {
+                error_report("Device hotunplug rejected by the guest "
+                             "for device %s", drc->dev->id);
+            }
 
             /*
              * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
-- 
2.31.1


