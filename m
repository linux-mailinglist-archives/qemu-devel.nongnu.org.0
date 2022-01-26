Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CAE49CBB1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:58:16 +0100 (CET)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCioR-0005uk-F4
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:58:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCiYe-00059w-2Q; Wed, 26 Jan 2022 08:41:59 -0500
Received: from [2607:f8b0:4864:20::232] (port=42880
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nCiYc-0007y3-I3; Wed, 26 Jan 2022 08:41:55 -0500
Received: by mail-oi1-x232.google.com with SMTP id v67so19336453oie.9;
 Wed, 26 Jan 2022 05:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q7gqFnH0RC4hawL8hXauc3KbAUc4zFlmemecZBtAioA=;
 b=h6WtIsRD6Df6Xy9Alr77vrxnXgFSXiZFUdUr8/ZfC5Dy25Rsi53O8TfnVDQM9Q2omh
 psGSoTUYYTD8J1kXxw2W0zKKHhshjtfg2gORcTNMXdvnGZrR1fGQ7kKplgnMiOD5z7td
 2zcheeNyTKs1v6BOYZ8mdKFRepuq97JRWpcs3CsRuCCIDeUnAnFVFAMbu97qC+wpDScD
 QgFBM8dMBzFhBrgI+ER9b1Oxc1rSpmLOAxWrmIUbQs9OW8tH+USad9RqfSHgtamU3/jq
 GqOOvFvvQEkJTBmTQw7+crwQjNcNKxHAsoZEXqkV+25io98QldoSx+TTdokmcH9BqFs1
 S/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q7gqFnH0RC4hawL8hXauc3KbAUc4zFlmemecZBtAioA=;
 b=idh4Ofzrm8n2eHtgSXU8ejdRXNxwOA/ohA4IqPPEx+udhwz4DDGtWvRVCWyRTE21wG
 2oHxFAFb7Sh3NFNhB4ANmpk5ftHkXXSWE16PWYbLhTT2irMDeeKpIb72F6QUzJ8UVBWC
 A1F+FgYxgJ5xu+bhhd+IUlYOOhJHHhQlPJC0hFeuu/1nKdW+Bycg9cfw0eEXoV5OBOVS
 RCco7ORTjNSAXV2s0JXwvJM5aauRrwigQL2FiMrT+Os1AyeRA+8QkYbEMKB3AHfEIi4r
 darHqQxBI1S4yVGZZMxbM5jVYfJRcBwIfQLlgaAw4YqnWbC08S8JkBfX53v11Z4OhEjG
 davA==
X-Gm-Message-State: AOAM5319FizGhpe9V8QqsNIqevI5QYm77IOTBGRlJIoVY+Xlnuv05K4o
 VM0bv7vB/Pj2Rv0ufYLhDgWhM3mIRw0=
X-Google-Smtp-Source: ABdhPJxYpe1Bu0QcSVZn4KgdaMx/QOIvLkSNCYh4d/vyy1yian+QEGs6Ct1aPrlSzkVXAxcTOAovdQ==
X-Received: by 2002:a05:6808:1b0c:: with SMTP id
 bx12mr3595321oib.174.1643204513094; 
 Wed, 26 Jan 2022 05:41:53 -0800 (PST)
Received: from rekt.COMFAST (189-68-153-170.dsl.telesp.net.br.
 [189.68.153.170])
 by smtp.gmail.com with ESMTPSA id v26sm4939342ooq.20.2022.01.26.05.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 05:41:52 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] ppc/pnv: initialize 'taddr' in pnv_phb4_translate_tve()
Date: Wed, 26 Jan 2022 10:41:37 -0300
Message-Id: <20220126134137.791968-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126134137.791968-1-danielhb413@gmail.com>
References: <20220126134137.791968-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

pnv_phb4_translate_tve() is quite similar to pnv_phb3_translate_tve(),
and that includes the fact that 'taddr' can be considered uninitialized
when throwing the "TCE access fault" error because, in theory, the loop
that sets 'taddr' can be skippable due to 'lev' being an signed int.

No one complained about this specific case yet, but since we took the
time to handle the same situtation in pnv_phb3_translate_tve(), let's
replicate it here as well.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index a78add75b0..f5e32e856b 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1261,6 +1261,14 @@ static void pnv_phb4_translate_tve(PnvPhb4DMASpace *ds, hwaddr addr,
         /* Top level table base address */
         base = tta << 12;
 
+        /*
+         * There were reports of compilers complaining about 'taddr'
+         * being used uninitialized in pnv_phb3_translate_tve(), and
+         * the same scenario is happening here. Initialize 'taddr'
+         * just in case.
+         */
+        taddr = base;
+
         /* Total shift to first level */
         sh = tbl_shift * lev + tce_shift;
 
-- 
2.34.1


