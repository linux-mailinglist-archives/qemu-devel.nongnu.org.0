Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CD26F063D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:56:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1AU-00040k-IX; Thu, 27 Apr 2023 08:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ps1AS-0003yG-9u
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:56:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ps1AQ-0004aZ-Sv
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682600170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2i11gauYtKzpujwiNKXwlF+ueCGrE+rc0CkTsdy1xxk=;
 b=LPoUVxZ7gJ33bysp2BRox0Wa7XR0csl73r+oMwKd0h6qfma1H36nnyoxoWeSNDtZ7jYLAO
 IIhFFwTrvWfuzWuVtWeGHmPHcm1dtTMTvZ+yeJ/v3p3t/HxBLUSalcNGFAm193VT//40xs
 OojTX7WK8woCFO3LJtbL2SHvlInoXRQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-yqey5ybBNEuMUF4tFq2Hlg-1; Thu, 27 Apr 2023 08:55:19 -0400
X-MC-Unique: yqey5ybBNEuMUF4tFq2Hlg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94f0dd11762so961534066b.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 05:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682600065; x=1685192065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2i11gauYtKzpujwiNKXwlF+ueCGrE+rc0CkTsdy1xxk=;
 b=h8pGUZq5J4T8OwStFXuYlzW9HbwvLiMwiTZ6hW9pkNVKBSI3nrDf9HsbWb/S8dkhCP
 oiaum61hIeRYKUuOfGqNgpuJQbmhRjFaUEQoVYnJZtoPT7s0xQ2c8RZNqGjm25ZAgF70
 gKuHmLUQfHe/vV+dyUC7wMbjgPMzkvtICIQGFIRyCzX+UR7OIqoqhewAYH7h4G3QWwgD
 JOYa1uNHz8p97i+V/v+GD+Wl8Nh5TuBTE0w69SyRZtQ0mZnZtF0bNlVAtSKajn+uF3eN
 Pfx01RFFBMFNE34ewnYMY6aDXIxF74TBvwEO94l3HrSRi7G1BXRfgkoTepsGBZqfAiNV
 esUA==
X-Gm-Message-State: AC+VfDyxfMlygPGXpWErOuPv/thLwpDmAkOD1ehx2yF7WoeIXEPdwiPD
 AVb0dmm4melUpzyIDUcQ5xF5xJIoVlCC0Gi4mgSztwIaq6fSzWJfNEfDAk5iNbNokaKI+fHCHl7
 46bRlcIrs7t0PdQ8fimlfLqLi61hg+J9tYtUp6Ii97DDIAZwlvRBnF9vI6fcNq9UnsQHy10wv/q
 GHpQ==
X-Received: by 2002:a17:907:36c4:b0:94a:35d1:59a with SMTP id
 bj4-20020a17090736c400b0094a35d1059amr1612034ejc.14.1682600065391; 
 Thu, 27 Apr 2023 05:54:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Fzs7lzxX5DTDNR6YolN401XOqKxQvgkCGK75jHRfRBxcJ1TqzeUdW/aAs4znGBh9Y9bHXvw==
X-Received: by 2002:a17:907:36c4:b0:94a:35d1:59a with SMTP id
 bj4-20020a17090736c400b0094a35d1059amr1612016ejc.14.1682600065038; 
 Thu, 27 Apr 2023 05:54:25 -0700 (PDT)
Received: from [10.168.80.215] ([131.175.147.17])
 by smtp.gmail.com with ESMTPSA id
 qb25-20020a1709077e9900b00959b810efcbsm4832766ejc.36.2023.04.27.05.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 05:54:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	mst@redhat.com,
	qemu-trivial@nongnu.org
Subject: [PATCH] tests: vhost-user-test: release mutex on protocol violation
Date: Thu, 27 Apr 2023 14:54:23 +0200
Message-Id: <20230427125423.103536-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

chr_read() is printing an error message and returning with s->data_mutex taken.
This can potentially cause a hang.  Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/vhost-user-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index bf9f7c4248ca..e4f95b2858f0 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -351,7 +351,7 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         if (size != msg.size) {
             qos_printf("%s: Wrong message size received %d != %d\n",
                        __func__, size, msg.size);
-            return;
+            goto out;
         }
     }
 
@@ -509,6 +509,7 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         break;
     }
 
+out:
     g_mutex_unlock(&s->data_mutex);
 }
 
-- 
2.40.0


