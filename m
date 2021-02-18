Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD131EB6B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 16:20:09 +0100 (CET)
Received: from localhost ([::1]:51698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCl68-0000tu-3h
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 10:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lCl2s-00069b-HD
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:16:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lCl2m-00087h-GM
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 10:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613661399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCNOGinASz/2sD0UTET/R9UvyLzESuoVoDx4ZcDxF/Q=;
 b=P6Eeqrg7yT3LNTU22rVGbQcxFwOGovGDnuMbQmTh+yPCdSEtF80RM3NC07XIb8S9yP3mIP
 quDdgxzVnFw/zXZBLbXZqAe+OKEX2egHV5D1kf+44EJJmQ0T67TCUDQdUucwIl5wZ97aDN
 E/2iSVIbjl9daks+7kxBCZbncuSuGjk=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-a--XCiHgPmuH4pwlpeFI2A-1; Thu, 18 Feb 2021 10:16:38 -0500
X-MC-Unique: a--XCiHgPmuH4pwlpeFI2A-1
Received: by mail-oo1-f70.google.com with SMTP id g190so1282873oob.13
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 07:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dCNOGinASz/2sD0UTET/R9UvyLzESuoVoDx4ZcDxF/Q=;
 b=A/T+YGe+TRbFg1BWtAI4tg5eQDAL9tarCpkVySTh25i8hzxVufcEcmPg3x2yYeal4v
 q23Mbu+IuO75RBC9WtiURCZvcvwYoqSDLvn11Jp4kY4etOG3BDwupdfSP2YvRE1ZNJiJ
 X6pqbBGPELkby4aVIhirtNwEbFgQZn+gEhF9Y7ookEICe2BkcNkz9Q5JXb/zxXUeM7Ba
 nznb9GALDNbGrRs6omIiz6Xw9kf6caw1puCf2Yd3EqlFk9az6XEQiKiRdMhSwbi8bI14
 r0BPQzFTwA0rfkvxsnOsNp5N8jh2j3oOje7QfBCdzic+uhHK3+Zri7eibKsA3I7lzT2b
 QtDg==
X-Gm-Message-State: AOAM5318cAgo27xY2iU8f8p4Jlzhk3BPC14Bfz/GerJ7ZsoKj+OfCM+L
 1Q/412GeGLFn8Jr0o86Gphxx4ziABNOo96vC5ctXc/oQ35/7EZbEwYUb8VnptESHHq/zCWaAFXZ
 xHqMmuLBUYa8F34lkV3wWZuCLUyYuSr8QcF55n+NGCgvJ+CXqExdDxEOT3zOKsc+0
X-Received: by 2002:a05:6830:1146:: with SMTP id
 x6mr3254895otq.120.1613661397332; 
 Thu, 18 Feb 2021 07:16:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQF56lGik+iPqsdEOMo5Z2daQpBP6Agwx++080y2CiM6xJxX4pqXLi62QzhAGwMFkRkGlwMA==
X-Received: by 2002:a05:6830:1146:: with SMTP id
 x6mr3254874otq.120.1613661397136; 
 Thu, 18 Feb 2021 07:16:37 -0800 (PST)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id w134sm1212136oia.56.2021.02.18.07.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 07:16:36 -0800 (PST)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] sev: add missing firmware error conditions
Date: Thu, 18 Feb 2021 09:16:33 -0600
Message-Id: <20210218151633.215374-3-ckuehl@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218151633.215374-1-ckuehl@redhat.com>
References: <20210218151633.215374-1-ckuehl@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 brijesh.singh@amd.com, thomas.lendacky@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SEV userspace header[1] exports a couple of other error conditions that
aren't listed in QEMU's SEV implementation, so let's just round out the
list.

[1] linux-headers/linux/psp-sev.h

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
 target/i386/sev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 0de690058e..37690ae809 100644
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
2.29.2


