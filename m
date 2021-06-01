Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BEA397A19
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:28:38 +0200 (CEST)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo981-0004Wh-Ux
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qn-0002lU-Cz
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qf-0005oj-T8
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+CN1V9BVnInryiuSkiDBV3eMijkf3HB7B66SuXqlEI=;
 b=gTftjpWlM8EHhh2ENfLEJDWPLTlTpy3mIBOd9ETDlXkjE6iR73Sh7P6ib0VjLc9c/dz6va
 amXwmKcc5OxWNGJcFV9KPJ30a1JzFPNX8113Zwk75EoV2GxmN19QZ1QhpAqRcnTM0lEznq
 nPkj2hKFheOFipdjiDPPMQoQ5AlO2do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-Hmpc5r0INTisgW-MVIlwvA-1; Tue, 01 Jun 2021 14:10:39 -0400
X-MC-Unique: Hmpc5r0INTisgW-MVIlwvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E2C679EC0;
 Tue,  1 Jun 2021 18:10:38 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D1FE5D9D5;
 Tue,  1 Jun 2021 18:10:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 24/24] sev: add missing firmware error conditions
Date: Tue,  1 Jun 2021 14:10:14 -0400
Message-Id: <20210601181014.2568861-25-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
References: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Connor Kuehl <ckuehl@redhat.com>

The SEV userspace header[1] exports a couple of other error conditions that
aren't listed in QEMU's SEV implementation, so let's just round out the
list.

[1] linux-headers/linux/psp-sev.h

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210430134830.254741-3-ckuehl@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/sev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 5467407ee1d..83df8c09f6a 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -110,6 +110,8 @@ static const char *const sev_fw_errlist[] = {
     [SEV_RET_HWSEV_RET_UNSAFE]       = "Hardware unsafe",
     [SEV_RET_UNSUPPORTED]            = "Feature not supported",
     [SEV_RET_INVALID_PARAM]          = "Invalid parameter",
+    [SEV_RET_RESOURCE_LIMIT]         = "Required firmware resource depleted",
+    [SEV_RET_SECURE_DATA_INVALID]    = "Part-specific integrity check failure",
 };
 
 #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
-- 
2.30.2


