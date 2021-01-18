Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756292FA7B6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:41:49 +0100 (CET)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YXE-0004rB-EM
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Xw3-0006bU-Ui
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:03:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Xw2-0007W7-84
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610989401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9vxH12UtT37TvoTk3+m2cGKS39O2xLX/8NiKGvhU6w=;
 b=V/S40OIs5ZpG8ckNHvQchTIvE/3BsuKCMDwtSfF1qDx1Bxx9K8Sms1orf+3J5aqngnBoVN
 1A7f5SO7AXkD4QI+MXJ5M3UyDbRx05/5vxD7+b8ZooUwZFl+0fH30tgY+FSMT7/b3BQ5yF
 qL1nfcBqYvTisIHeoaobUfrA3ahxzpU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-fWmNkwliNHGcH9ruXFQBRA-1; Mon, 18 Jan 2021 12:03:17 -0500
X-MC-Unique: fWmNkwliNHGcH9ruXFQBRA-1
Received: by mail-ed1-f70.google.com with SMTP id n18so8094064eds.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 09:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r9vxH12UtT37TvoTk3+m2cGKS39O2xLX/8NiKGvhU6w=;
 b=kr/xexW6hhPBlYBWrDwtwK42pf8k7A6iuADU8kX4Ni2169+dS0SCat5bu4UfoBlqcf
 P4M0PHyY6s5YuDU5KZnOvKZFlg5DtY5KTu6jxJy3TU14s0M8oy9253115cYItvHn18RI
 uFPw66kF44e4dffIzcQZBINXFqbGK3EyS798GygmWV8Pf8jN7aSsVrpSNdU4kPYZe3fa
 FqN1sGOnko/bdp9jTsjymJt7u4Twr1daFDGpYjoOmT+jM0vXtdGaIgi871JgAT5EvSLe
 vQXvPMa196dgl4bFVmskTSNZQpAzDZK+x6+pvzFM3V6yFwcTbpwRExWpI6epR64vC5ZG
 nvMg==
X-Gm-Message-State: AOAM530QfxW9kg88EVaRlPjFqu0uO4WIxB+y605l6zuAFG1A/HnkBvoQ
 gQZ0bMmDb4yqFN6g2o4z+bUlD5yF0O1mOgh1b/37UCsVDKoRHJ0dIbYuVMalt7geLekGBllfgky
 rFPN5kpSjEexdscEMtYJh78340LyPpi3pHhpEDx6XQIM3vMahPEWVPsfIobzTLsRE
X-Received: by 2002:a05:6402:d05:: with SMTP id
 eb5mr307992edb.143.1610989396410; 
 Mon, 18 Jan 2021 09:03:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMZc2WZRI+2D8TyJbL4IdGeO7PKWQq+ko1kE/C+yj9wp7isYgNp85lrU60/P+diS0Zuuz1FQ==
X-Received: by 2002:a05:6402:d05:: with SMTP id
 eb5mr307974edb.143.1610989396257; 
 Mon, 18 Jan 2021 09:03:16 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u17sm11044509edr.0.2021.01.18.09.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 09:03:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/2] scsi/utils: Add INVALID_PARAM_VALUE sense code
 definition
Date: Mon, 18 Jan 2021 18:03:07 +0100
Message-Id: <20210118170308.282442-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118170308.282442-1-philmd@redhat.com>
References: <20210118170308.282442-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/scsi/utils.h | 2 ++
 scsi/utils.c         | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/include/scsi/utils.h b/include/scsi/utils.h
index fbc55882799..096489c6cd1 100644
--- a/include/scsi/utils.h
+++ b/include/scsi/utils.h
@@ -57,6 +57,8 @@ extern const struct SCSISense sense_code_LBA_OUT_OF_RANGE;
 extern const struct SCSISense sense_code_INVALID_FIELD;
 /* Illegal request, Invalid field in parameter list */
 extern const struct SCSISense sense_code_INVALID_PARAM;
+/* Illegal request, Invalid value in parameter list */
+extern const struct SCSISense sense_code_INVALID_PARAM_VALUE;
 /* Illegal request, Parameter list length error */
 extern const struct SCSISense sense_code_INVALID_PARAM_LEN;
 /* Illegal request, LUN not supported */
diff --git a/scsi/utils.c b/scsi/utils.c
index b37c2830148..793c3a6b9c9 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -197,6 +197,11 @@ const struct SCSISense sense_code_INVALID_PARAM = {
     .key = ILLEGAL_REQUEST, .asc = 0x26, .ascq = 0x00
 };
 
+/* Illegal request, Invalid value in parameter list */
+const struct SCSISense sense_code_INVALID_PARAM_VALUE = {
+    .key = ILLEGAL_REQUEST, .asc = 0x26, .ascq = 0x01
+};
+
 /* Illegal request, Parameter list length error */
 const struct SCSISense sense_code_INVALID_PARAM_LEN = {
     .key = ILLEGAL_REQUEST, .asc = 0x1a, .ascq = 0x00
-- 
2.26.2


