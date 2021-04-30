Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0066436FBC4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:51:08 +0200 (CEST)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTXu-0005ud-VY
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lcTVX-0004GZ-TK
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lcTVV-0007NK-7V
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619790516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFI189G+ERaYcl1gELpXtjCqfkKrblNOG0vuU6aoJJ4=;
 b=KY3WglKvPmm4C/zLVTbn99op5UMx5av1gXuDtwNl2dyynfJKOtVGvUmGKgsmLSv2JUjXvf
 MaKaa8YpUw1ed5vDdGHAtAngwRSfE08JjdCv31Y1ry+KNY2HSDsJlBOrO0Lhd6cMv6rD0g
 5DqidHbFzfZzkH1HfRGyJQ7dfqfoJXg=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-rHahWC6HPxSSvsEDu6vxuQ-1; Fri, 30 Apr 2021 09:48:35 -0400
X-MC-Unique: rHahWC6HPxSSvsEDu6vxuQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 f89-20020a9d2c620000b0290280d753a255so30027047otb.2
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFI189G+ERaYcl1gELpXtjCqfkKrblNOG0vuU6aoJJ4=;
 b=lSDsmYqrl52TUBJVsjycbaT30zF1CZFeDbkJO5NJuEkfq34rpsTsd4bO0F1h2cczpD
 bd213s3vGX6infPMB1FvQy+v3ow6aMo54b7uY9vwQzqP/D6TzDc7mVQeYTn+p17xJ89d
 M5fLyxq+fJbAh8VTDk2dzr6gUVmAwd6R7hN4Myvp2g01SxfF+dDML0gL4R9sl4cuAn/T
 OJQWfgoUefhTzvsA9dSjHGwj1wVqRf2h9XGELB+5InM32w8JB2jy4GVy2dk3e2RIKG7Y
 N2M3UBVnmgo5Ayr7pnKf44NAeaAbmzIWZ1iyLofrk4Rwlxw986BMw1IG6eq5kuCAo6gG
 OSDw==
X-Gm-Message-State: AOAM532SpwiOuohChdvFyVkl15cUeu9i8LSPxaCyLHyzk0G6viKt4ADq
 W1EKaOkEY5LmH4DX37hG47Iy/sNpihN2VmMIdO0xXyjlgI8KZKSEdxfqxpXXsa8G4WYeixyewTe
 WSWOzQi0EgHrUwT8mYcRX1gnG+0raOIzsA7UmBzgo44J3qqzDYWIMQI6Qdcw5WM7s
X-Received: by 2002:aca:5c44:: with SMTP id q65mr3964166oib.12.1619790514239; 
 Fri, 30 Apr 2021 06:48:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhwHEDN4WonWcs7ed8XmlzJkmYknfOhUyw08LfGfQcYhEM4I13oFORltyiVRq1Ud20VfuyjA==
X-Received: by 2002:aca:5c44:: with SMTP id q65mr3964151oib.12.1619790514081; 
 Fri, 30 Apr 2021 06:48:34 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id p127sm799072oig.16.2021.04.30.06.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:48:33 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] [RESEND] sev: add missing firmware error conditions
Date: Fri, 30 Apr 2021 08:48:30 -0500
Message-Id: <20210430134830.254741-3-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210430134830.254741-1-ckuehl@redhat.com>
References: <20210430134830.254741-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SEV userspace header[1] exports a couple of other error conditions that
aren't listed in QEMU's SEV implementation, so let's just round out the
list.

[1] linux-headers/linux/psp-sev.h

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 9e2e47012f..dfafd3b543 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -111,6 +111,8 @@ static const char *const sev_fw_errlist[] = {
     [SEV_RET_HWSEV_RET_UNSAFE]       = "Hardware unsafe",
     [SEV_RET_UNSUPPORTED]            = "Feature not supported",
     [SEV_RET_INVALID_PARAM]          = "Invalid parameter",
+    [SEV_RET_RESOURCE_LIMIT]         = "Required firmware resource depleted",
+    [SEV_RET_SECURE_DATA_INVALID]    = "Part-specific integrity check failure",
 };
 
 #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
-- 
2.30.2


