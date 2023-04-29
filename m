Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261BA6F248E
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:17:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVS-00068n-Qf; Sat, 29 Apr 2023 08:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVQ-000684-Q8
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVP-0004sm-7P
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F20gxlV9n4yZCSeO59/h7L5GIiTcNexiSlZxndpWyR8=;
 b=QADccZQPPiupUUDbK9zMQkqNtQlCzqvAECdcX49xw8Kchl5tKZ7qrs7B61Ut3HmkjiAkVw
 SAe/ze9KZMzSkDmQwrYY0F5+nd4STwc776csne04k089WlK1rJ+MhYxwQ1Zl7y+YPEhf3i
 XgNg6/TNUQ6r5KU6KSDrAYfyuWcCwaE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-AvTMKYYQMU6t1W8vx_s7wg-1; Sat, 29 Apr 2023 08:16:44 -0400
X-MC-Unique: AvTMKYYQMU6t1W8vx_s7wg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-95f6f291b9aso100082666b.3
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770602; x=1685362602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F20gxlV9n4yZCSeO59/h7L5GIiTcNexiSlZxndpWyR8=;
 b=ScjawUTQEOLnGsG8yw9/dJYaoghSNb9NsbNZGw3NVGoOQOr1g9X0wcml9M/4iZkjtr
 6RJA9WkU8dfGbKL8vNa6M/d7LoTo/NQ91d2wj7x4N5YOUPz9KahJyXrHjVO1sv0C1tsv
 zYZwaz3vX/mNj4b8OTT7FPcxi8lKmiSJkXU6dabsdHAZq9m09c0AFvfgsgsNVYuTjT9O
 O9BDnLAswZjMbRWFqkGv5nnbchneaqvdGNhM7rnZiyhZx/akjqSMcLEJ5aIloCCS8Jof
 xwndzEOmyBvlTnQ//pdKEUGkIrJcrhUnYcBsIjgjCvUkrmw6tUg1wig5QML7MC17f48x
 1RKw==
X-Gm-Message-State: AC+VfDxppbkZCR9lAWio+Hn4v4RspD0DJn83aJxMQyfmr2FvRvBY7Ux+
 9XDVx4DL+23DKDfmQbqnUb+i9U2f0NgdyYCt1p1CYcSw/hkiar6zoRdR4TsrV+ZC0jEVWlC5/7S
 9GgXdjSw773RQ4tXHgV1tAAELVYINFhsBT9saQMmYUlFe8mQTHXClheyDFXVnZ+PptzhmBipbUM
 U=
X-Received: by 2002:a17:906:ef0d:b0:94e:bc04:c6f6 with SMTP id
 f13-20020a170906ef0d00b0094ebc04c6f6mr8653998ejs.9.1682770602542; 
 Sat, 29 Apr 2023 05:16:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4/f7boLVsnp6/WNktXUliYzHkxp124VwegmfTr0phXcQD6PV/2dWMUMZKBWhxFnYcTAwkJRw==
X-Received: by 2002:a17:906:ef0d:b0:94e:bc04:c6f6 with SMTP id
 f13-20020a170906ef0d00b0094ebc04c6f6mr8653974ejs.9.1682770602181; 
 Sat, 29 Apr 2023 05:16:42 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 h6-20020aa7c606000000b005068ea7f54dsm10205239edq.96.2023.04.29.05.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:16:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 02/17] qemu-options.hx: Update the reduced-phys-bits
 documentation
Date: Sat, 29 Apr 2023 14:16:21 +0200
Message-Id: <20230429121636.230934-3-pbonzini@redhat.com>
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

From: Tom Lendacky <thomas.lendacky@amd.com>

A guest only ever experiences, at most, 1 bit of reduced physical
addressing. Update the documentation to reflect this as well as change
the example value on the reduced-phys-bits option.

Fixes: a9b4942f48 ("target/i386: add Secure Encrypted Virtualization (SEV) object")
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <13a62ced1808546c1d398e2025cf85f4c94ae123.1664550870.git.thomas.lendacky@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index b5efa648bad1..42fc90aae473 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -5438,7 +5438,7 @@ SRST
         physical address space. The ``reduced-phys-bits`` is used to
         provide the number of bits we loose in physical address space.
         Similar to C-bit, the value is Host family dependent. On EPYC,
-        the value should be 5.
+        a guest will lose a maximum of 1 bit, so the value should be 1.
 
         The ``sev-device`` provides the device file to use for
         communicating with the SEV firmware running inside AMD Secure
@@ -5473,7 +5473,7 @@ SRST
 
              # |qemu_system_x86| \\
                  ...... \\
-                 -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=5 \\
+                 -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1 \\
                  -machine ...,memory-encryption=sev0 \\
                  .....
 
-- 
2.40.0


