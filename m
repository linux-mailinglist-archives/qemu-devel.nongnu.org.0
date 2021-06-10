Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A744D3A24C8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:52:05 +0200 (CEST)
Received: from localhost ([::1]:40412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEXs-0007em-Oa
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESZ-0007wY-8e
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESW-0005QA-Ko
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XX5j3UbRtfmHxe3V1ph1hTBGyFJAYSVF+9Z2vcsOdo=;
 b=I9TZd+e+a4bSwGF0ZcuCiaMF+9xkcouezRePDdDhdiYHES4rGp+B92fxYi7tzICQ8w7fle
 EkEejveND3XASqIPW2GrTFNXk0cJNbXUF/CtzmMItrS72evP9jA8msKJA8L2iqpAU6shdI
 Vgq8cd1ATC4suOZoxIHPh/DNXujD094=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-icv1Fz37NRadHe2wG9rcTQ-1; Thu, 10 Jun 2021 02:46:30 -0400
X-MC-Unique: icv1Fz37NRadHe2wG9rcTQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 w3-20020a1cf6030000b0290195fd5fd0f2so2678206wmc.4
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6XX5j3UbRtfmHxe3V1ph1hTBGyFJAYSVF+9Z2vcsOdo=;
 b=gQn02sXqI1fBN0NRGZEwtRWTQma/u6B7LlUm0dJUypwBv9NZ3Xffze1JvDECcUx+96
 KYlyEZmflyddEOLdArMTq7wV3xCkagFFzDNXc84hP69z9D4UR4mn2W8EzuxOuoQ7QrFj
 H/8H1EpYrpRB2xCGbOgOECLDlUBKqo176ZveqUqHJCH6eaMMTUNERQY02QGiE73nmaAZ
 sMr+FAh/K7qxz8TRWj6Q8MmPiKPdXqQSSBwJPfqOZqQo3/He3/uKFrg+EcLqhWuMBGH2
 +J2o7IywTFYX4aITSpiurNTqPsNrgoXbsU/MJdsmoYBnJRLDYAEbJToMwhtrlCF/Ixqf
 1HAQ==
X-Gm-Message-State: AOAM530QU1+JU1KEw/OQpSzd0uCg+OrirUuWJtP2XaIXNymJSVVOPu+I
 AgwR5UQzNpFJpgllpCsNp931hyWWzuKKrG6+bYypO1U6xyIMROsawZrxWqNK+IvvdJ6hNiaZu0i
 9eXtEv7IqoNRDlahvZvug6oZAfbrlTk3Vu+UnmlUBsp+qElGzEcQ6ztC/z+gGDnUZ
X-Received: by 2002:a5d:59af:: with SMTP id p15mr3613317wrr.292.1623307588960; 
 Wed, 09 Jun 2021 23:46:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRbDkQkHoVvh05WdUyTY3UiGUarqHqJGvkE3/nADrw0FfjHi0DsxfVZd0wbOGhUwO0kH48pg==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr3613289wrr.292.1623307588768; 
 Wed, 09 Jun 2021 23:46:28 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id c7sm2565263wrc.42.2021.06.09.23.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 23:46:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] target/i386/sev: Mark unreachable code with
 g_assert_not_reached()
Date: Thu, 10 Jun 2021 08:45:52 +0200
Message-Id: <20210610064556.1421620-8-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610064556.1421620-1-philmd@redhat.com>
References: <20210610064556.1421620-1-philmd@redhat.com>
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The unique sev_encrypt_flash() invocation (in pc_system_flash_map)
is protected by the "if (sev_enabled())" check, so is not
reacheable.
Replace the abort() call in sev_es_save_reset_vector() by
g_assert_not_reached() which meaning is clearer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev-stub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index eb0c89bf2be..4668365fd3e 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -54,7 +54,7 @@ int sev_inject_launch_secret(const char *hdr, const char *secret,
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
 {
-    return 0;
+    g_assert_not_reached();
 }
 
 bool sev_es_enabled(void)
@@ -68,7 +68,7 @@ void sev_es_set_reset_vector(CPUState *cpu)
 
 int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
 {
-    abort();
+    g_assert_not_reached();
 }
 
 SevAttestationReport *
-- 
2.31.1


