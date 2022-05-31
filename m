Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C22253993E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 00:01:17 +0200 (CEST)
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9vQ-0000ui-FJ
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 18:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kd-0002Cd-9l; Tue, 31 May 2022 17:50:07 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:35679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kb-0003cS-N1; Tue, 31 May 2022 17:50:07 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 l10-20020a9d7a8a000000b0060b151de434so10518076otn.2; 
 Tue, 31 May 2022 14:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6MgX6+9CuhGwOjr81lW7312NPWPPk/rouG+yP3Odce4=;
 b=IHsjxB3sok8c0Lmq2tLbdVaSBCrP6iYdTmX9EIc30XgrXvKANnwu4JQ+jf+/TRfr14
 yByLuqB67TsdNWpxnUFpLvS4DSfLfM3v/++lk8VsuhEWFS5uyiM7NPk1BCkhP1Hp45Nz
 h8BD5G2Re1XObvXgycHL2AXvqP6/LqVET5vEH4P6DGdN+j4zNRmj+j821HIZydHuydRH
 SvXxnJcJL+2kjeWEpj4dMbChRERf5pj/PoRQNmllSDTgYTJu+sqAhKlsmccGtAKE1LnS
 0Shqv2lZJygCl8HtEPA0PAZrt1xjfLQekI/C4oZcOlbUxNJjjtmuClhYauOT6hz1JgRl
 dmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6MgX6+9CuhGwOjr81lW7312NPWPPk/rouG+yP3Odce4=;
 b=8Bo0TkGxWVtkjZPN1hQY/gTsSFWUvHPPn0EuHOFiPDsK33a3i8HrBQDOa92FnwUyaj
 pgAl5C2//LCEqN7AmIHp4khrJPvooiAB2r42s30YbkRhedKUpMZhSzYTwA/CKa3imXKK
 sUMIF7O1a8SGfmdsmdi2/cSnYwLGE/eBhiQ6wfACratJiDV7PFfzU8wvKurzt9H6qWY+
 NN+NBzNOLco7iZf4E6PKoTdxC3xHHxZF5kgly4QMwnuXss8QT8m0CDZqCrwLT79wRTL1
 8WWKIoogMrsS/0Usuc8EjMK6wgoSS6hKcRqmrRH5pUrBKJPGVKf85PZ/Z+fYiu8wlgMb
 IODQ==
X-Gm-Message-State: AOAM531oABL0ZEVjNjlQBRUl8CoZUiL70a2G+/nr+xfTWkKN1W+w5Zq/
 a5dem5s2Atptd26YIxe9me6V8Ifyqaa1Ig==
X-Google-Smtp-Source: ABdhPJxwxIIjGAKoTklQBVdNli8pg/66RpD6M2LEbSd2wqJhAWC2F1CbKXbuxZ75v7XbICJ+jtODTg==
X-Received: by 2002:a9d:6045:0:b0:60b:10fd:f3e3 with SMTP id
 v5-20020a9d6045000000b0060b10fdf3e3mr17424518otj.51.1654033804112; 
 Tue, 31 May 2022 14:50:04 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:50:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 16/16] ppc/pnv: remove PnvPHB4.version
Date: Tue, 31 May 2022 18:49:17 -0300
Message-Id: <20220531214917.31668-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's unused.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb4.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 61a0cb9989..20aa4819d3 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -77,8 +77,6 @@ struct PnvPHB4 {
     uint32_t chip_id;
     uint32_t phb_id;
 
-    uint64_t version;
-
     /* The owner PEC */
     PnvPhb4PecState *pec;
 
-- 
2.36.1


