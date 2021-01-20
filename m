Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27F22FD44D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:47:05 +0100 (CET)
Received: from localhost ([::1]:58504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FhI-00076M-Na
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FWI-00047P-FD
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:35:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FWG-00051A-Pp
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611156940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jx/Wb4LvZ7AbGBuxHjbFJNJf6s2H1GP3ixoLVOfoyFI=;
 b=WXNx2QY7+RIeTs/Np1XOPn5M7R0XnfidAkH/dOFYW07ST7kpRj09TMvVNhPvy6eendzWAv
 NsVeJMAalw3howuO7hrQaZhI4RoRXxMlWIHLgR9tVuCUqHSqwQuk63yNlL5yFZxPrHKOCn
 A2NuMGVonWaSSUqOJBZmkw/2nLuVwoI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-gx1eWHgVMbC2tQiZyDYJRg-1; Wed, 20 Jan 2021 10:35:38 -0500
X-MC-Unique: gx1eWHgVMbC2tQiZyDYJRg-1
Received: by mail-ed1-f71.google.com with SMTP id w4so7490070edu.0
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 07:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jx/Wb4LvZ7AbGBuxHjbFJNJf6s2H1GP3ixoLVOfoyFI=;
 b=cXp+7f/cW9rtTKDhlsAZPqLgEoJXoHh0aaFiNop9H/fi42CezIeb7+7zLQa3WGdOc2
 K0c0mqFad4dVE199rTAsg6o12JZxKz327Y1AlfNv1SrHQ+s5nMEjul1OKhQjtgPItHK6
 XOoLTq9yKklBrawrCHs3Kjbv0+Kg4U7qQDV8a/1mN6qIt3dgZutd3ViwdHKS+ltzu9kt
 x8pE8gw9qs3cS6ghi0goXs0rXmNgjf21+N1CEcqQhJLIOjpA83HTi0dEyvA+bkA0JHJq
 KGqabB30vrwvvA3CG7BvvDO+QZemmvhx6CvdFBG1SuNNClYaW2/XmjchYw/40EejqOV4
 VIRQ==
X-Gm-Message-State: AOAM533JjyYNufh4aI2+bjn9zrpZF86e9BORkBfbx3Q1HqJ2CHPp7puM
 naKFYT6fNwiME4ON3PIck3462XNm7hVAeLpW1zRKM0V/cJZSpavBCRTRcBku8ZuLmRqSIot7Vxj
 MmfBuokrerCqjo1PHhXn8nV+0ttjwXBw1QKwpDZthP9zCtei2paSilwv29uCkfxxG
X-Received: by 2002:a17:907:175c:: with SMTP id
 lf28mr6573014ejc.110.1611156936053; 
 Wed, 20 Jan 2021 07:35:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCLTSz6/quqU61KEYzXTVpYZnQtczGulvN5JKtqs8lQHq6jImImZzi+AgkIKnuwPOnr6uQVQ==
X-Received: by 2002:a17:907:175c:: with SMTP id
 lf28mr6572991ejc.110.1611156935858; 
 Wed, 20 Jan 2021 07:35:35 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q2sm1289210edn.91.2021.01.20.07.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 07:35:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] scsi/utils: Add INVALID_PARAM_VALUE sense code
 definition
Date: Wed, 20 Jan 2021 16:35:21 +0100
Message-Id: <20210120153522.1173897-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120153522.1173897-1-philmd@redhat.com>
References: <20210120153522.1173897-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/scsi/utils.h | 2 ++
 scsi/utils.c         | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/include/scsi/utils.h b/include/scsi/utils.h
index 725769be3cb..504cde1cc9b 100644
--- a/include/scsi/utils.h
+++ b/include/scsi/utils.h
@@ -57,6 +57,8 @@ extern const struct SCSISense sense_code_LBA_OUT_OF_RANGE;
 extern const struct SCSISense sense_code_INVALID_FIELD;
 /* Invalid request, Invalid field in parameter list */
 extern const struct SCSISense sense_code_INVALID_PARAM;
+/* Invalid request, Invalid value in parameter list */
+extern const struct SCSISense sense_code_INVALID_PARAM_VALUE;
 /* Invalid request, Parameter list length error */
 extern const struct SCSISense sense_code_INVALID_PARAM_LEN;
 /* Invalid request, LUN not supported */
diff --git a/scsi/utils.c b/scsi/utils.c
index 41ad49459ca..e9082da7420 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -197,6 +197,11 @@ const struct SCSISense sense_code_INVALID_PARAM = {
     .key = ILLEGAL_REQUEST, .asc = 0x26, .ascq = 0x00
 };
 
+/* Invalid request, Invalid value in parameter list */
+const struct SCSISense sense_code_INVALID_PARAM_VALUE = {
+    .key = ILLEGAL_REQUEST, .asc = 0x26, .ascq = 0x01
+};
+
 /* Invalid request, Parameter list length error */
 const struct SCSISense sense_code_INVALID_PARAM_LEN = {
     .key = ILLEGAL_REQUEST, .asc = 0x1a, .ascq = 0x00
-- 
2.26.2


