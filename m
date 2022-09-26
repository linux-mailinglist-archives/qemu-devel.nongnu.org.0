Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A1E5EAF08
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:04:51 +0200 (CEST)
Received: from localhost ([::1]:49306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsTK-0000Ot-Q0
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4p-0008FR-Ti
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:39 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:39520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4o-00029s-Cw
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:31 -0400
Received: by mail-oi1-x235.google.com with SMTP id m130so9126653oif.6
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Y9RLBDU0dSHl/m1njOcZ6g2cHHBmVgAY9ga7gdHAKyc=;
 b=kghyHO/Ymm/R4DnF/cadb+r29wzXjPm8993cRBZxBkagTnCkPaAZSdeuj8+sHMwNQq
 yX1TfvICgwW3CGFROzGqmSK2kD5fNBeCMetiHOfs/hK0yyXKpUe3SJjKA9WIalPexZQ4
 EGRUxA4L7w7wfFfC9K0BR9qnm4w6+UvdttrrvopTvbsswqZcRWgI/qelsRBcjCb8ZJR4
 WxKD9bZmQJUMI6ova47We2Pl6z2KTyRc273gSHDZfJ8vQusAKyecOi27it6KZQEsR8Vy
 op9ln4ojPpIBvWR5hRxj4s78V4T2U4W+VATDjdUOSqJZb+wDee8+oXrZWYQ8o9OAb7Ea
 tl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Y9RLBDU0dSHl/m1njOcZ6g2cHHBmVgAY9ga7gdHAKyc=;
 b=u0S5lYXk6wAlolrJpw+3xoBfzzquDbKl317BzyDfBYcqG3HIfvaGV5/PetVzc3Cbxt
 Q92JAao9MayQowxzPF8kWmliInVjXutW3sJSzef3QN1zDK3RZK63+7YDyX8MS5hSzayr
 zPDfgssORidJlppMRgFAjIh6zYVncFgTAyFdZw4gH+hqJNpE/heN/kGinYwHPxjKWywc
 zX8ztKu7Ts6DKMvCUIKfD9cYi+pv5wdUuvxatggr+B7LwzBb0iMQ0T1KYwz9ddfB+plS
 e1y7dA8E/IDON9d9KmkaHhpX84j6+i9H+JUK16pKpJRBPx1G3Hdb7R40fLKgA6R7GNwc
 /YQw==
X-Gm-Message-State: ACrzQf2rQm6awlfo3sHpdcs45drDZxi8dNlaEFsXg22G0VErizxtDQ1S
 UfrLj9J/co7IYpKxlWORE4Q9TBPX7fs=
X-Google-Smtp-Source: AMsMyM4cD7o6ZVaRUUTxaiP0WXOcKrE0ZIiTNw5OZUbJN2+W8+sdnXINiQOEXZGaGo0KzcboclHQ0Q==
X-Received: by 2002:a05:6808:6ce:b0:34f:e70a:c8e9 with SMTP id
 m14-20020a05680806ce00b0034fe70ac8e9mr15444890oih.99.1664213968394; 
 Mon, 26 Sep 2022 10:39:28 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 13/16] hw/ppc: set machine->fdt in spapr machine
Date: Mon, 26 Sep 2022 14:38:52 -0300
Message-Id: <20220926173855.1159396-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pSeries machine never bothered with the common machine->fdt
attribute. We do all the FDT related work using spapr->fdt_blob.

We're going to introduce a QMP/HMP command to dump the FDT, which will
rely on setting machine->fdt properly to work across all machine
archs/types.

Let's set machine->fdt in two places where we manipulate the FDT:
spapr_machine_reset() and CAS. There are other places where the FDT is
manipulated in the pSeries machines, most notably the hotplug/unplug
path. For now we'll acknowledge that we won't have the most accurate
representation of the FDT, depending on the current machine state, when
using this QMP/HMP fdt command. Making the internal FDT representation
always match the actual FDT representation that the guest is using is a
problem for another day.

spapr->fdt_blob is left untouched for now. To replace it with
machine->fdt, since we're migrating spapr->fdt_blob, we would need to
migrate machine->fdt as well. This is something that we would like to to
do keep our code simpler but it's also a work we'll leave for later.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c       | 3 +++
 hw/ppc/spapr_hcall.c | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index cc1adc23fa..d988e59983 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1713,6 +1713,9 @@ static void spapr_machine_reset(MachineState *machine)
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     /* Set up the entry state */
     first_ppc_cpu->env.gpr[5] = 0;
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index a8d4a6bcf0..891206e893 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1256,6 +1256,14 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    /*
+     * Set the machine->fdt pointer again since we just freed
+     * it above (by freeing spapr->fdt_blob). We set this
+     * pointer to enable support for the 'dumpdtb' QMP/HMP
+     * command.
+     */
+    MACHINE(spapr)->fdt = fdt;
+
     return H_SUCCESS;
 }
 
-- 
2.37.3


