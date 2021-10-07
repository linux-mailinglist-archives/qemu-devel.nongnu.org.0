Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D874257DC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:24:29 +0200 (CEST)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWC4-0008Dn-RA
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5p-0004HK-K3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5o-0004xT-5U
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGHqQ6nijElfXE8z0EcIVqckplNgbvyU+2uRGsS/qhw=;
 b=M/loBYOIJjEofziqONvIoumgd1LYscMN4vcYHE8p8bRBKwPB8l095/TeHJ2G70u+KT5cVW
 /v0+eTF4l3kkjPcXNZCgoMUa8haE6oolUM3tbLHTDATeuwzfdunaZnRpc4WSjQfTc5jELm
 wlSVyj7pM0bWjQbGb39kH0Dsz2dS5Bo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-xkWvtlZ8PP6ScVx7tjhAcA-1; Thu, 07 Oct 2021 12:17:58 -0400
X-MC-Unique: xkWvtlZ8PP6ScVx7tjhAcA-1
Received: by mail-wr1-f70.google.com with SMTP id
 y12-20020a056000168c00b00160da4de2c7so2032430wrd.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gGHqQ6nijElfXE8z0EcIVqckplNgbvyU+2uRGsS/qhw=;
 b=jSYb5J2O4UTbeu5JBLqF81ddZ/CJe1jPQkamgT/IHd7ecJFFU5sNHcx/sYdtyjoSwr
 0oWgYjw0GKR46jI2mJ6CVb0uj/oYE9cHMeGGpWEwqPeQAzLSG7al7Q6HANdqdg6dqAUg
 lAakXpFNcGDiumK3Em/OWCzF6jJNDW9QppA3YVBW08+ShnAZ8XK5LQyd9pAxIGjYT+PH
 slPXgYy6379OscMBoJJjbBito77QMlnQ7M5z1A7jdVkYUgBgQYKmi/q1j2Xh6IKCU/zc
 enHtDoMcjkltotvExoB53cKBuVgWLHOfERV9RnH/rEhFKsNp+mgIlE227MbWXpUrph5+
 OnDQ==
X-Gm-Message-State: AOAM531fZEK1KlJIRImIQ32fsCJ/Wqul9JOuLLsji91/v/nmQvSBuS5g
 CBU/lp6mQ7rpypD4FawS/k9JpnNLvTCiNLSKqJx1U022OwjbCrYc+m/w08qtmcQZg7PhQX6sUVn
 TwhdJbClgT8BwGR3jH4leXAWV8wu0ngx+3Kce//p81gDAeGDfNfIPJdLUfbp1yGVz
X-Received: by 2002:a7b:cb4f:: with SMTP id v15mr5561603wmj.21.1633623475405; 
 Thu, 07 Oct 2021 09:17:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfpdMNhU4CbAVvUdxNmWaSwoJzzerQY5uah7o9Fgx03HmJkEu8zn8P5fwyEHm478TyAhx7tQ==
X-Received: by 2002:a7b:cb4f:: with SMTP id v15mr5561558wmj.21.1633623475187; 
 Thu, 07 Oct 2021 09:17:55 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z5sm12440932wmp.26.2021.10.07.09.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:17:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/23] target/i386/sev_i386.h: Remove unused headers
Date: Thu,  7 Oct 2021 18:17:01 +0200
Message-Id: <20211007161716.453984-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Connor Kuehl <ckuehl@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Declarations don't require these headers, remove them.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h | 4 ----
 target/i386/sev-stub.c | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 2afe1080690..9bf6cd18789 100644
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
index d8e65831714..408441768dc 100644
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


