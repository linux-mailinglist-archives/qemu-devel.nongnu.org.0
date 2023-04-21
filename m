Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86886EA732
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:38:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9R-0008VM-JM; Fri, 21 Apr 2023 05:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9I-0008I6-6N
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9G-00034H-RE
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3okjpQrzd2vKlmxaZaYJ75/Yj5JiTgNQDSKdkZNOneI=;
 b=Gy+D0vK2pmQZXpVoUEd8ObPptApj9R9flV1oUb6NHlWbtiYYyYn4NH+prAKpcSoUrtP8j7
 33QqfFbcNLxL7PwqfDtKoxTCGQE5lZBwnIxDu8SkeyTsM6poygZQrhm+6ZcK0/oxJUl2aE
 3tN9iCMFMTcKQsCks+yXbKSaSXCh/AY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-X2caud0zMd2ltzxFFVj2_g-1; Fri, 21 Apr 2023 05:33:44 -0400
X-MC-Unique: X2caud0zMd2ltzxFFVj2_g-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50692ecb46fso1627238a12.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069623; x=1684661623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3okjpQrzd2vKlmxaZaYJ75/Yj5JiTgNQDSKdkZNOneI=;
 b=d1ZyKNQ4cvfT+OiQQg3Bpc6q5EIvDXlLu8ClINYv2YvalOb8GVFyR27msXuaDL3f+t
 Uvkg33qojHqrLl2+vP0aFsW96mNjBv0D9ADbfULsrvPlvgJAZrJhd0YPNY/I/S8Y4UMG
 7rFu37JsJju12bMnQfBRWbIiZHT6nzE8Ij9A5EHKYxOKZ46rnQr9xb6W/GBdPcMl0K7V
 v7CzIRMmreret/QkcFsFnGZfCuXtVk8xzwPYC3o4oQSDMzlNyuMJmps6Px9cKcr8yM3C
 e3Ov0n1rB3h5YPozSioUgcXwUEHK5IE0cb0UwGUbr/FysQtl1sEHWKFBD4oIit0dZ/E5
 37Ng==
X-Gm-Message-State: AAQBX9d3yTR6Jns3C3z4HJLQpcMygLtPuZ5u+8f/+URODHK7WZCcAyVx
 U6A2r5HOi7JjlcbfUApSyd6JVIX9dtQQpkZFzCXAo5idpeb70Y00C4n/9QPhYaO1EH0UfIhbzgL
 C3/u1lWBlsVQxEPzC0rneXcE+AEd1zTZ7Vo3hQLiofDvZM+40xvIUglQ2u5yR3GFtTdQa0fGvSV
 Ppkg==
X-Received: by 2002:aa7:da93:0:b0:508:3ff5:a306 with SMTP id
 q19-20020aa7da93000000b005083ff5a306mr3627482eds.37.1682069623065; 
 Fri, 21 Apr 2023 02:33:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZiVLPTUW+GEAyFcMCPUKNAst015tVhsGH7ajewHag/qevn/bEZQ5L8aCFluYaIdnJd8gxHjQ==
X-Received: by 2002:aa7:da93:0:b0:508:3ff5:a306 with SMTP id
 q19-20020aa7da93000000b005083ff5a306mr3627467eds.37.1682069622683; 
 Fri, 21 Apr 2023 02:33:42 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 j15-20020aa7c40f000000b0050488d1d376sm1709175edq.0.2023.04.21.02.33.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/25] postcopy-ram: do not use qatomic_mb_read
Date: Fri, 21 Apr 2023 11:33:09 +0200
Message-Id: <20230421093316.17941-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

It does not even pair with a qatomic_mb_set(), so it is clearer to use
load-acquire in this case; they are synonyms.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/postcopy-ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 93f39f8e06b8..7d24dac39728 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1500,7 +1500,7 @@ static PostcopyState incoming_postcopy_state;
 
 PostcopyState  postcopy_state_get(void)
 {
-    return qatomic_mb_read(&incoming_postcopy_state);
+    return qatomic_load_acquire(&incoming_postcopy_state);
 }
 
 /* Set the state and return the old state */
-- 
2.40.0


