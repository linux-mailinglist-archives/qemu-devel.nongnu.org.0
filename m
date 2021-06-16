Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3EF3AA587
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:47:16 +0200 (CEST)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcRP-0005D1-RA
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOV-00022S-8n
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOR-0000l9-TS
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J6Nu9xcD/1mLwA45H6T/mwE1HK3rKCkbuT6P4bJEEQ4=;
 b=PiEBC4GUOi6SLPEVzvo5TVG+H3ckOBeh12uJCgP98pZ5mkvOHYm7xSkIzPryIjyOe8SgRh
 qUHGfIEVbvcFM0Sl/PAclefDffn7lz3kreV+O6MzIwRedZ63oD9bNqetJLQoAyDAhBH+M1
 dxuau8KEHT0P6yk5DvJY6oJxyCiuab8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-1CHz4bDwNriLzqAIgVKDfw-1; Wed, 16 Jun 2021 16:44:08 -0400
X-MC-Unique: 1CHz4bDwNriLzqAIgVKDfw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so1861229wrs.3
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J6Nu9xcD/1mLwA45H6T/mwE1HK3rKCkbuT6P4bJEEQ4=;
 b=J4izB9ttN9oobhZsHCp6HV0R+s8kFDJsY3yzwaBYPFXuNXZ6Rwyg8akkuxjQC/fcZi
 eXtOEM58zFIwCzG6jJTxblSuFHf7BTSMcYZOuEF/qD3T+u6eZbRmuy66W3iJgLQ0Mm46
 dhLfQI07WyNlHnNnFFjlATcKvRrlztRM0ECJFtDXjuNtDBohhhejnztoHM9YYzqtHCg6
 Z9f1eFqEREs6miN5C+P8dcJb9l7WnJSxmzyLKEFSnbwwFU5SP5DsEPZQychRmw249iSf
 CIJpOhigmsb86vYwHtzeMvF/owFveV7c/k4TuGVfaNUZn7uD9MYsNN/cW0+Ttxh7WtPT
 i7Hg==
X-Gm-Message-State: AOAM5320prlZKx9iBbW2EVu4mDXEikLz4bPicwbtAo/lxrHEX9y9OpC0
 CA1MHVjCd43+xBnzQTLGEPxq0CNR1rmT/1DmZeTtYVDTKa922Cx7imayG8WdhZrsH+Z7RBW6Wp/
 xKakz00WRyuiHkOnh81SLhKGdc5pS/BY5tXbvB4xytPgL3h7VtotJhwTZ3EzMcZx3
X-Received: by 2002:a5d:64ca:: with SMTP id f10mr1103016wri.331.1623876246980; 
 Wed, 16 Jun 2021 13:44:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytoEdybsfOvsUor5A6euhFwHS4grr/3OauXO6/JvEz13BVI23CIHa2utjR37nfmwhIA0qxfw==
X-Received: by 2002:a5d:64ca:: with SMTP id f10mr1102984wri.331.1623876246785; 
 Wed, 16 Jun 2021 13:44:06 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g10sm3219377wrq.12.2021.06.16.13.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:44:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/23] target/i386/sev_i386.h: Remove unused headers
Date: Wed, 16 Jun 2021 22:43:11 +0200
Message-Id: <20210616204328.2611406-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Declarations don't require these headers, remove them.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h | 4 ----
 target/i386/sev-stub.c | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index ae6d8404787..f4223f1febf 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -14,11 +14,7 @@
 #ifndef QEMU_SEV_I386_H
 #define QEMU_SEV_I386_H
 
-#include "qom/object.h"
-#include "qapi/error.h"
-#include "sysemu/kvm.h"
 #include "sysemu/sev.h"
-#include "qemu/error-report.h"
 #include "qapi/qapi-types-misc-target.h"
 
 #define SEV_POLICY_NODBG        0x1
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 0227cb51778..d91c2ece784 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "sev_i386.h"
 
 SevInfo *sev_get_info(void)
-- 
2.31.1


