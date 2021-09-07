Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7D14021B6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:56:14 +0200 (CEST)
Received: from localhost ([::1]:38762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPPK-0002nT-2H
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHe-0002aX-Px; Mon, 06 Sep 2021 20:48:20 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:45055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHd-0003pg-4l; Mon, 06 Sep 2021 20:48:18 -0400
Received: by mail-qt1-x832.google.com with SMTP id r21so6646075qtw.11;
 Mon, 06 Sep 2021 17:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0JMFEc3ZUKi2sqwCszx5LDecveexk0t++Hz8mUxJXlc=;
 b=izaYpZXOjtTKFWqfPZusQuQeYOjYdZGjL/vQMuNSyJS4h01jzVpTi5MCYVZ6vKTgt/
 MVKkjxra7xPR30tW2RzjwlrmfAb/8SSvGG/QFA5EYgcruoaNlTQO+422DV7qXC+Ioc1p
 jQVoVjKygzdwCGeSPstZWamrhT+/1G+70ulUQJLK2ItpwsRiwkg1vomo6dFVMWkjfDFL
 GjhgduGiEX4zzSZZeJrG/K6AelNcyTX60G75Oqwi+aLC2KeAKvNcPp6FCvkUMXW9jl/a
 9cKBUDWGa39iOVSbVlVT2/AzSjPC1A394XMIl48+uHyMRUqbBU/koQcg9f5P+/u4jbQg
 UUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0JMFEc3ZUKi2sqwCszx5LDecveexk0t++Hz8mUxJXlc=;
 b=gTU4UYbrL+NPBWVBcDGTGgiDlHmD79E1Qg9mLacKGG08YwN7kXz23qLr9sey+Apny0
 UF3cCxOfJVYUSpQI8IXIqBrun3DG8xd5XZOVDXrCyD1kKoLT1NxE9W6+XQaVYHiA4V62
 02w3GHeZgvfL+p96jjzNlg1BRFfioLV48fGku7PiJtcvQFy7wvM3gmHaKnmWoxewcY/h
 tMRtqwvBSAmQ8N6R8rQP6kv/YLP9dVQZnmWnFvBQxLmVdMWQpCRW8eB3539GyZTOaiog
 FYuT8bdAw5pwPRwCooD26D1GODl00+Nyp8y48NRQ/8kygPYJLxPNtCj3uazJWDd8RtvU
 btcA==
X-Gm-Message-State: AOAM530avuCW6o/yotOtV17JR9JdzjiOl6MM9kuHzSI2ryv3uQ4zJvST
 jXEy05yMuJwExrC63U0uEdukUQRHxAg=
X-Google-Smtp-Source: ABdhPJxnebxLwp2rvM/xRCQNpbfmSEwIpMr9wOLQQn8yML2zSHsLFfoSCB2buVAheqQ3uyhBNFo3XQ==
X-Received: by 2002:ac8:4d4e:: with SMTP id x14mr13510570qtv.347.1630975695769; 
 Mon, 06 Sep 2021 17:48:15 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id x83sm7799538qkb.118.2021.09.06.17.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:48:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 3/7] spapr_drc.c: do not error_report() when drc->dev->id
 == NULL
Date: Mon,  6 Sep 2021 21:47:51 -0300
Message-Id: <20210907004755.424931-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907004755.424931-1-danielhb413@gmail.com>
References: <20210907004755.424931-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x832.google.com
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

The error_report() call in drc_unisolate_logical() is not considering
that drc->dev->id can be NULL, and the underlying functions error_report()
calls to do its job (vprintf(), g_strdup_printf() ...) has undefined
behavior when trying to handle "%s" with NULL arguments.

Besides, there is no utility into reporting that an unknown device was
rejected by the guest.

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
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


