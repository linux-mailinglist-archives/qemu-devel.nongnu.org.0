Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D6A2FD448
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:44:12 +0100 (CET)
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FeV-0004wi-VU
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FWE-00040a-CU
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:35:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FWC-000502-JD
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611156935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRuJ+Yxjk+hGk6Df5FDgfFqIR+ImclUGnmgOl1AbDwU=;
 b=TpVf6uDPYB1dNd75kMWP2B1vunEneCMwrCB7k7HP98KIuahXYiGmMZFsjEVh3U8Wua4nLi
 uarDXs1OuuhsHlxMIcnjxiFjBEFf4hVSseAx8r9EDpfMLZefrkgWAUkS2BO2+PtHpvdMTP
 EbhEdTO92I/cE3sd9hhYme2T9SkLO4A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-jcDxkLovMSyzfxlTRObmtA-1; Wed, 20 Jan 2021 10:35:32 -0500
X-MC-Unique: jcDxkLovMSyzfxlTRObmtA-1
Received: by mail-ed1-f70.google.com with SMTP id g14so11297112edt.12
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 07:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dRuJ+Yxjk+hGk6Df5FDgfFqIR+ImclUGnmgOl1AbDwU=;
 b=R0rv1pGOg1pkM7CLUVUL+B4b3cVu2Kt72dhUWHX6rZC3B5dROx2rA2GBTEJ+chWITa
 hcMnHlZtCXlJTQEYLZSTFsd6X8Mp0i+s01yy8mOLNh6DJ9TFwJKZ+uL2f/juKczctQ65
 yHWAw3LyPDR3h7kdxMt9QPVgECc7Efs6GnWiLQu1c68o4atl6if9GKq+w0InmJaExS65
 1aaGeBcDhzPOC2SW7fO/NlTuQsoP9bGgmI/MHM4dvj9lL/mu/TTYGuAaS8tvvVXpHN+g
 BxRfscnC6hw+utJyBfAr4YCYalhv28vqUmONc/iBZ+LD+UzAVAIGKcGEdKesv7cO7Ffm
 3KPA==
X-Gm-Message-State: AOAM532PvtymmyRkOc2XoGUd+NpIzwh4lbAWW8AQRoqDdRcJI+a4gfc2
 QrLR1Np7TahK+wZwpNRz740DymQYODa+5UVLH3A9+jimwditMyhDLXAVfRyr83LdrtUIY8MgdqO
 KJ8aEpgEZ3g2t2l1lkMNh3QvSZ1mqQUz/WzmJcfHmQmbQVJt7Y4H20vtjLJ1BzzxI
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr7515836edk.201.1611156930732; 
 Wed, 20 Jan 2021 07:35:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEgla3aopU7yGXjeZs79Hl+QjCx8YyP67pPdLnAeI0O64hSvaDc8FX/YGP1MVCh+XWfuX8eA==
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr7515810edk.201.1611156930494; 
 Wed, 20 Jan 2021 07:35:30 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g25sm1254975edw.92.2021.01.20.07.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 07:35:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] scsi/utils: Rename 'illegal request' -> 'invalid
 request'
Date: Wed, 20 Jan 2021 16:35:20 +0100
Message-Id: <20210120153522.1173897-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While these requests are invalid, they are not breaking any laws :)
Rename 'illegal request' as 'invalid request'.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/scsi/utils.h | 20 ++++++++++----------
 scsi/utils.c         | 20 ++++++++++----------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/include/scsi/utils.h b/include/scsi/utils.h
index fbc55882799..725769be3cb 100644
--- a/include/scsi/utils.h
+++ b/include/scsi/utils.h
@@ -49,25 +49,25 @@ extern const struct SCSISense sense_code_NO_MEDIUM;
 extern const struct SCSISense sense_code_NOT_READY_REMOVAL_PREVENTED;
 /* Hardware error, internal target failure */
 extern const struct SCSISense sense_code_TARGET_FAILURE;
-/* Illegal request, invalid command operation code */
+/* Invalid request, invalid command operation code */
 extern const struct SCSISense sense_code_INVALID_OPCODE;
-/* Illegal request, LBA out of range */
+/* Invalid request, LBA out of range */
 extern const struct SCSISense sense_code_LBA_OUT_OF_RANGE;
-/* Illegal request, Invalid field in CDB */
+/* Invalid request, Invalid field in CDB */
 extern const struct SCSISense sense_code_INVALID_FIELD;
-/* Illegal request, Invalid field in parameter list */
+/* Invalid request, Invalid field in parameter list */
 extern const struct SCSISense sense_code_INVALID_PARAM;
-/* Illegal request, Parameter list length error */
+/* Invalid request, Parameter list length error */
 extern const struct SCSISense sense_code_INVALID_PARAM_LEN;
-/* Illegal request, LUN not supported */
+/* Invalid request, LUN not supported */
 extern const struct SCSISense sense_code_LUN_NOT_SUPPORTED;
-/* Illegal request, Saving parameters not supported */
+/* Invalid request, Saving parameters not supported */
 extern const struct SCSISense sense_code_SAVING_PARAMS_NOT_SUPPORTED;
-/* Illegal request, Incompatible format */
+/* Invalid request, Incompatible format */
 extern const struct SCSISense sense_code_INCOMPATIBLE_FORMAT;
-/* Illegal request, medium removal prevented */
+/* Invalid request, medium removal prevented */
 extern const struct SCSISense sense_code_ILLEGAL_REQ_REMOVAL_PREVENTED;
-/* Illegal request, Invalid Transfer Tag */
+/* Invalid request, Invalid Transfer Tag */
 extern const struct SCSISense sense_code_INVALID_TAG;
 /* Command aborted, I/O process terminated */
 extern const struct SCSISense sense_code_IO_ERROR;
diff --git a/scsi/utils.c b/scsi/utils.c
index b37c2830148..41ad49459ca 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -177,52 +177,52 @@ const struct SCSISense sense_code_TARGET_FAILURE = {
     .key = HARDWARE_ERROR, .asc = 0x44, .ascq = 0x00
 };
 
-/* Illegal request, invalid command operation code */
+/* Invalid request, invalid command operation code */
 const struct SCSISense sense_code_INVALID_OPCODE = {
     .key = ILLEGAL_REQUEST, .asc = 0x20, .ascq = 0x00
 };
 
-/* Illegal request, LBA out of range */
+/* Invalid request, LBA out of range */
 const struct SCSISense sense_code_LBA_OUT_OF_RANGE = {
     .key = ILLEGAL_REQUEST, .asc = 0x21, .ascq = 0x00
 };
 
-/* Illegal request, Invalid field in CDB */
+/* Invalid request, Invalid field in CDB */
 const struct SCSISense sense_code_INVALID_FIELD = {
     .key = ILLEGAL_REQUEST, .asc = 0x24, .ascq = 0x00
 };
 
-/* Illegal request, Invalid field in parameter list */
+/* Invalid request, Invalid field in parameter list */
 const struct SCSISense sense_code_INVALID_PARAM = {
     .key = ILLEGAL_REQUEST, .asc = 0x26, .ascq = 0x00
 };
 
-/* Illegal request, Parameter list length error */
+/* Invalid request, Parameter list length error */
 const struct SCSISense sense_code_INVALID_PARAM_LEN = {
     .key = ILLEGAL_REQUEST, .asc = 0x1a, .ascq = 0x00
 };
 
-/* Illegal request, LUN not supported */
+/* Invalid request, LUN not supported */
 const struct SCSISense sense_code_LUN_NOT_SUPPORTED = {
     .key = ILLEGAL_REQUEST, .asc = 0x25, .ascq = 0x00
 };
 
-/* Illegal request, Saving parameters not supported */
+/* Invalid request, Saving parameters not supported */
 const struct SCSISense sense_code_SAVING_PARAMS_NOT_SUPPORTED = {
     .key = ILLEGAL_REQUEST, .asc = 0x39, .ascq = 0x00
 };
 
-/* Illegal request, Incompatible medium installed */
+/* Invalid request, Incompatible medium installed */
 const struct SCSISense sense_code_INCOMPATIBLE_FORMAT = {
     .key = ILLEGAL_REQUEST, .asc = 0x30, .ascq = 0x00
 };
 
-/* Illegal request, medium removal prevented */
+/* Invalid request, medium removal prevented */
 const struct SCSISense sense_code_ILLEGAL_REQ_REMOVAL_PREVENTED = {
     .key = ILLEGAL_REQUEST, .asc = 0x53, .ascq = 0x02
 };
 
-/* Illegal request, Invalid Transfer Tag */
+/* Invalid request, Invalid Transfer Tag */
 const struct SCSISense sense_code_INVALID_TAG = {
     .key = ILLEGAL_REQUEST, .asc = 0x4b, .ascq = 0x01
 };
-- 
2.26.2


