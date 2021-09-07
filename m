Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F894021B8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:58:29 +0200 (CEST)
Received: from localhost ([::1]:44602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPRU-0006pa-I5
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHd-0002aT-Jc; Mon, 06 Sep 2021 20:48:19 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:33790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHb-0003oB-A6; Mon, 06 Sep 2021 20:48:17 -0400
Received: by mail-qv1-xf34.google.com with SMTP id a5so4887495qvq.0;
 Mon, 06 Sep 2021 17:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+wjngqjFqlhlbd6FoQ4dC7BVGynMzSjL+ChAIa/+iuA=;
 b=j9ZeiK03vZfAxMz1E2QsEU6kZ2CDHdk4CqbKKUM0eq3TahxmPx3YKheqUR6RG1lz7/
 WifiaGIH51lhTj5sD9ecsTACx53YeHUjsHqaVH0mdaGEuuxLvH5iNCCqgCAoDjGMXKFc
 5afCRjQAjxV5xrbB94AmPqgfiTWlNL4mr8GDqTedd+twce+OBE1IBQeIsCj7Fx4Q4Wz8
 QtD8hLCcCXJ0mkYlImgQnMH9r90d3SyEt4BtcRjhKCGOQqDmMRSy5491Lumfp9OVR1JP
 oi/wft/b+PmFDKWU4IItNK7Hm8+a6cI94OZG1cjTzSenol/Hbyb9+b3LHDMTAWNYa9jz
 OGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+wjngqjFqlhlbd6FoQ4dC7BVGynMzSjL+ChAIa/+iuA=;
 b=AE5sfyFEStoVNqnhnHP50A4jmYOndfOK4/XO+POJj/E28PngD31KHAcVuEJPdI92qI
 kwbccSvAKQxBJCc9Ur0SZHipsDK5GgVewEPk55XJFZEsg8uB8Sxyi7cvznwfSKdoYY9i
 oogcHxpE1RnC46x+r7y4agniM89mI80PwuOsSvYgMN6CLwb3WvRFcIGz73JCTvJBPVy+
 BQ1ig7F8ez6nCAd1kQrrPWQFRocYpWhCY1x9aRr+ySF9cRIFAn3c+Y8xDJy63k/HMl/f
 ufbqTNU2uQZaMmKnAIBd7xKKCLRw+rzuDHyKUPslRi2dTMJhsNN4oWjdYT6HoFqllVK/
 XBqA==
X-Gm-Message-State: AOAM5313OSbJvNv87WlrW7QNgrm4BKDKFCiwCB2gdWYdDWlqsHs522rk
 eZaMCH2IP/Ov6nC9fGuGKUGgAcXSseE=
X-Google-Smtp-Source: ABdhPJxZbGi53s/2QdJ2nkoCWX7FKfX8cFvtOWB1Pe16sIyK/oyvobQG3jhay2WuRrrQEVdhCl5Csw==
X-Received: by 2002:a05:6214:12b1:: with SMTP id
 w17mr4358648qvu.3.1630975693514; 
 Mon, 06 Sep 2021 17:48:13 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id x83sm7799538qkb.118.2021.09.06.17.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:48:13 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 2/7] spapr.c: handle dev->id in
 spapr_memory_unplug_rollback()
Date: Mon,  6 Sep 2021 21:47:50 -0300
Message-Id: <20210907004755.424931-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907004755.424931-1-danielhb413@gmail.com>
References: <20210907004755.424931-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf34.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As done in hw/acpi/memory_hotplug.c, pass an empty string if dev->id
is NULL to qapi_event_send_mem_unplug_error() to avoid relying on
a behavior that can be changed in the future.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 81699d4f8b..4f1ee90e9e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3690,7 +3690,7 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
      */
     qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
                                  "for device %s", dev->id);
-    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
+    qapi_event_send_mem_unplug_error(dev->id ? : "", qapi_error);
 }
 
 /* Callback to be called during DRC release. */
-- 
2.31.1


