Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081D06F2496
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:18:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjW1-0007E2-1J; Sat, 29 Apr 2023 08:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVo-0006MY-4Y
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVl-0004xR-PB
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2i11gauYtKzpujwiNKXwlF+ueCGrE+rc0CkTsdy1xxk=;
 b=A9bS1zp5v+nLq51YMtRo10UpFKnIAlW7/19gKF6Nmg73vCTpgzYp5Jcc/XQR9KAfa9efYU
 1o3W3b77boaaCpEh2vPqzsAxMxNTxvL8Q4E8i3DoKI8Rye9Ir1bULG45m1MMRDgWX+NIa8
 Af0IQYJTxG20W19puGRwENn5c3HOT8Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-zUqzw4K4OG69TxYBbU4G1A-1; Sat, 29 Apr 2023 08:17:05 -0400
X-MC-Unique: zUqzw4K4OG69TxYBbU4G1A-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50684e6414aso655419a12.1
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770624; x=1685362624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2i11gauYtKzpujwiNKXwlF+ueCGrE+rc0CkTsdy1xxk=;
 b=hfdvbzzIfOycb0YaTf4+pqYFdjzML9mbNIZJDxuwGF4HHQV4hFYNLO/RhVLpdvpATs
 uvZJ6pZbkFy4a+HNZ6puHFK6slwLH2jqUkm7i/FujxhWvfp2mV8Q2DhEkz2cAgGhbaPK
 GpTsK0tL1S8+/wC4ruoPn75T4reH9gh743dWMD+LdGaCLKoN1iS/RmzGSY3XCoLabY6m
 zTVoFIJzDgZIkHwowjDSDZ+oY4489o9EJk0U+v6MJGnf0yfC5xg4NiwUe07EB9kKX0Qm
 fUdWC7LuwBTxH0OjGwph+Rr/YIzaEeNV5G/ZE2sP9eTEwbOFj5++7p1UHousmF4m0HWW
 Ce5g==
X-Gm-Message-State: AC+VfDzFYX6G2/nIL4hLPKF4zC6AOC/eUqGyfLKM2QvuUVU6zdOB2qeY
 IUC5arX4s1VIVuz7ISgBEwmh4vy2zczLVkC09Rec2nR3qvjurhWZGUukcs2k9FWgqt5lnZyc8Zr
 PtF9m7A3K8eeYEM+iNn6D67pWtL/Ozc1nAIdFnri96JjtjYKPetKp4BxHWI43V8/bSwIgeDQOhV
 k=
X-Received: by 2002:aa7:de09:0:b0:504:af14:132d with SMTP id
 h9-20020aa7de09000000b00504af14132dmr1193743edv.13.1682770624199; 
 Sat, 29 Apr 2023 05:17:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6z/ABdVlDoK99N+60SkJnEMnQ5mKj9zp6yT7W6oS9XP7DzFoeFex4JkVT1XkUT4KiA9SDKFA==
X-Received: by 2002:aa7:de09:0:b0:504:af14:132d with SMTP id
 h9-20020aa7de09000000b00504af14132dmr1193734edv.13.1682770623977; 
 Sat, 29 Apr 2023 05:17:03 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 y10-20020aa7d50a000000b00506a5606343sm10095591edq.14.2023.04.29.05.17.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:17:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/17] tests: vhost-user-test: release mutex on protocol
 violation
Date: Sat, 29 Apr 2023 14:16:33 +0200
Message-Id: <20230429121636.230934-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429121636.230934-1-pbonzini@redhat.com>
References: <20230429121636.230934-1-pbonzini@redhat.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


