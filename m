Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEC43CECE3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:27:26 +0200 (CEST)
Received: from localhost ([::1]:60628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZrJ-0005Nw-E3
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZG-0003Ca-Bk; Mon, 19 Jul 2021 16:08:46 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZE-00027R-ER; Mon, 19 Jul 2021 16:08:45 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 v18-20020a17090ac912b0290173b9578f1cso611153pjt.0; 
 Mon, 19 Jul 2021 13:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xIbuoN2FUepjNiV0NL9ah+PlC1aFG0Xp8XKvNzH+Amg=;
 b=Lg+SiETK3mdfjIeQRqcDftSpcyQtH3VB56bmQe71NFkmeoAEYE9+NCuAxNtEASE8cZ
 GqGcci3IAVG4NvnblGuFY9ukYVRlj81C6VObOaSmDX5QN7b+wel0kw6++MaxhYSm4eE0
 yPDIS6CaUURwA8oMkexQmK7XjF87acLqSsKIyvT6ZJJY8WBiNUL+Bad1h18V3S2e261+
 MXxwh6W34DsomEVjXzHeX8W//kMod8U83W0IlqVhwfTv+sqCE0An8//OWukyB25SSE24
 WamgXDXhy3X8AD/dzZx+Jx7WWL65KduzFoluLK9aTPn6ZxughPPwD94D/dUtQT/mEFYW
 rs6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xIbuoN2FUepjNiV0NL9ah+PlC1aFG0Xp8XKvNzH+Amg=;
 b=WfdHD2zLL5WEOBkOCUiI2F+pB8stROuOq0NhT1jveSqtjDETcTo73zfPirRDAjjqmq
 Y4mYWjEA5vcgG0L/gNOVVRzkNYoaD+/g7l+tz3rxMdj8zvuW/hGkKiV41LyuJtp4VF8f
 OV7BksRSeV9cmX8dDAnuZRdWGo5x3+kpfMkQViOVI7jlWGcIeJYtGsndHQShrAI11QpP
 XJgdABo+ptakm2zm5pXE2bRE9qLs5nV8TiGG5hMeMKvNpDYdWEt4lKY3S6bRMHfkgiTS
 57Qs1zj2y9bGIyvURCOXOxk6Bf/NPz/m1U7ZnKulhwQBBNIFekfHrtYEeU4HafNqN6ON
 2g3Q==
X-Gm-Message-State: AOAM531G1C8DAhPHBvsw05QejqEoHasUBDVG/Y54kJq4CUBaIYfqFt68
 fGevTTNHMg4GAMkYBmTls82NAlnfGxMw5g==
X-Google-Smtp-Source: ABdhPJxCvknxaSXGwrzmXYAeDSO3ocmiDKjeHI0PhU6+MTy4twK29bVlcpTrDFSvgUJHorkhSW5jvw==
X-Received: by 2002:a17:90a:3d0d:: with SMTP id
 h13mr26776073pjc.20.1626725322796; 
 Mon, 19 Jul 2021 13:08:42 -0700 (PDT)
Received: from rekt.ihost.com ([191.193.148.134])
 by smtp.gmail.com with ESMTPSA id e18sm21048805pfc.85.2021.07.19.13.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:08:42 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v6 3/7] spapr_drc.c: do not error_report() when
 drc->dev->id == NULL
Date: Mon, 19 Jul 2021 17:08:23 -0300
Message-Id: <20210719200827.1507276-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210719200827.1507276-1-danielhb413@gmail.com>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The error_report() call in drc_unisolate_logical() is not considering
that drc->dev->id can be NULL, and the underlying functions error_report()
calls to do its job (vprintf(), g_strdup_printf() ...) has undefined
behavior when trying to handle "%s" with NULL arguments.

Besides, there is no utility into reporting that an unknown device was
rejected by the guest.

Reviewed-by: Greg Kurz <groug@kaod.org>
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


