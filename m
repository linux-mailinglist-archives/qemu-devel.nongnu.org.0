Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE33C4481FC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:40:24 +0100 (CET)
Received: from localhost ([::1]:36828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5os-0006EE-Qr
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:40:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5lB-0008Cj-KD
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:35 -0500
Received: from [2a00:1450:4864:20::530] (port=35465
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l6-00075V-Tc
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:33 -0500
Received: by mail-ed1-x530.google.com with SMTP id g14so62715793edz.2;
 Mon, 08 Nov 2021 06:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IMrzXvnIk1qR4eTEctQSvN46IKqNzDDs2FkRHvk4hDE=;
 b=fdS6/5x6ivDFv6cxFvBXnHm5qqcSGjHWSzIFfGIZU+/KXgshSdR/ChqSvNgnCnIVlH
 QxIL8dNiaekF74qRPxAYrXUeJgzjMIgklA7EFO2Ag/05x0DZq6+9NWyeahK8Z0FT8tWe
 +EgfN8yiXBIYxLh8wJVKbZIMt19H9/WRGlwGnVnlZz+9x99ckWy02HWA/V8m2glHin7I
 wsnwy6Tun37t3ehMiHeY3wyzr/TWPE3pQeyL7Z5uSwQ2uiaTDbhlu1DwSaAR3nD9S2F0
 sjvzyea3OLg7QOHzeQUamaS3hCn33rl8yaKeiLQWn/VdY2FLMDkkjeb85cSB4v0czg+m
 ZYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IMrzXvnIk1qR4eTEctQSvN46IKqNzDDs2FkRHvk4hDE=;
 b=M8LYlWeFx0PdktK045vpKU7rzEDn1fkKY/E/PoTAWKkiL/rT5a6KUJipvrlOuy09QN
 rplWg46dkjEP52IFtm8YyOAitsHrkIm+PhAMuFTjWJ8SKTZ+OrvkVeXAVW/trSn1P7Ug
 +WEWAtpiUxmS5OOg7abI2aid7C/n+ttvfT/9R3LDNFmEbYIsSz2hXszIeo47GXb5nV+v
 glnIosyEvc9OhvUsKZIuuCwcwXBolaRag7BMn6C3TTUXqA88wCsTxHLdz2XYfhfZpWuo
 1mNQ8zgMQ+SRZJCvpSmFplr1dseVi3GYj9kTnwJhLySn21TI2LM8SIKstfnT/uvrei/f
 Rk/w==
X-Gm-Message-State: AOAM532WRAwgbVWR1wwFAvr4Q3VagFvWDC4STfGn46an0i7vc3cr+onf
 h5OBQttfzY1HWT6/84PzNwXFbMIxgUg=
X-Google-Smtp-Source: ABdhPJy5+dqop0e+hGFQzKmu/ag6wPftxmd/6haBb1JFeL7P3IFUkNzVWIPfczYXcPHiGYqguYDcGg==
X-Received: by 2002:a05:6402:424a:: with SMTP id
 g10mr104128edb.386.1636382180957; 
 Mon, 08 Nov 2021 06:36:20 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hp3sm8366662ejc.61.2021.11.08.06.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:36:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in MODE
 SELECT commands
Date: Mon,  8 Nov 2021 15:36:09 +0100
Message-Id: <20211108143616.660340-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108143616.660340-1-pbonzini@redhat.com>
References: <20211108143616.660340-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-stable@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Matteo Cascella <mcascell@redhat.com>

This avoids an off-by-one read of 'mode_sense_valid' buffer in
hw/scsi/scsi-disk.c:mode_sense_page().

Fixes: CVE-2021-3930
Cc: qemu-stable@nongnu.org
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Fixes: a8f4bbe2900 ("scsi-disk: store valid mode pages in a table")
Fixes: #546
Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index e8a547dbb7..d4914178ea 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1087,6 +1087,7 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
     uint8_t *p = *p_outbuf + 2;
     int length;
 
+    assert(page < ARRAY_SIZE(mode_sense_valid));
     if ((mode_sense_valid[page] & (1 << s->qdev.type)) == 0) {
         return -1;
     }
@@ -1428,6 +1429,11 @@ static int scsi_disk_check_mode_select(SCSIDiskState *s, int page,
         return -1;
     }
 
+    /* MODE_PAGE_ALLS is only valid for MODE SENSE commands */
+    if (page == MODE_PAGE_ALLS) {
+        return -1;
+    }
+
     p = mode_current;
     memset(mode_current, 0, inlen + 2);
     len = mode_sense_page(s, page, &p, 0);
-- 
2.33.1



