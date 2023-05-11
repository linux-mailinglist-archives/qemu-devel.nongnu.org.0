Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8FA6FEF37
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:51:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2wX-0000Al-9g; Thu, 11 May 2023 05:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wV-0000AP-8Z
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wT-0006e3-07
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XVk0NqT/ewc/FqSjZkNf/ebir55QGmplAT0hcOp8nM0=;
 b=PUlKvmTpJWwRYdaaXzs5prMkQy9kNedqg4KuOkfJDQOsTysuP7/+2jHz14V/R+HO6fb/Pa
 QhmcLlMT4W5cxO7AMXnWYOY9A3vO1u1ZBfzV+Ah27QIITqoFR9NILE7dE6JvjUpy19+r0Y
 bmQVUbkb9wyiPIFwQxaNbDsmO93Cr8w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-bryISF0DMQO0b7n5AHmGmQ-1; Thu, 11 May 2023 05:50:29 -0400
X-MC-Unique: bryISF0DMQO0b7n5AHmGmQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50d88a986afso7264414a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798628; x=1686390628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVk0NqT/ewc/FqSjZkNf/ebir55QGmplAT0hcOp8nM0=;
 b=gpEersNN7meGFnL8qdGM+1E8gspQ+8Gr1UUWEqLmWZ7Rf75P3oOF9VPInI/Vr3yi7R
 i/loxjK1bSt1cAY9/Z5o7ypjQf/hvt1vGsHf70jnobHIoPuasGj9hI4Sd4wmo5nPZIfp
 McWtqDnnVWsK9FIOrI4dbL5qif8CcpkiDEq1r3zsqtp7pRZXmSmcaKKu7QWAsjAVzWsI
 RpNZtwKWmHxkPo0kATrzG0iTqjiblnpnEMtQQbTf+bMSf3kdyYzAwxx1hPJzlMmGHW4n
 VaRL1I9j82d77PFL9HfNe5l2ErSycuAdQcPc/C3mpunclfRqrvBx5ajaSWmrEt1Wb6nF
 J79g==
X-Gm-Message-State: AC+VfDzNEjwnLZDtNrr1UT9/YzD0osQz/lFr1KPavvKiUUlqn4HAmCjs
 6WvG3SaibKQdTMi9etnSwaTmEd6SZtTwmZ5BFRSHrYpIBj6U29pjhW6P4qpBbj7REvxxA1XtlPN
 US1SUroLH/yeMJXrWEMn/xAwxtbNP+V2WUp3r1fDTiskG0IDQVsg7TADhlLrp3sJKjiMIlcZ43y
 I=
X-Received: by 2002:a17:907:3207:b0:94f:5b91:7952 with SMTP id
 xg7-20020a170907320700b0094f5b917952mr17626483ejb.21.1683798628040; 
 Thu, 11 May 2023 02:50:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7QNcmrnDb3AiRqzgSC0/o+sfyV54ym8X5EF5lX6/XuDriKHVJFZqY2ofO/R7QdGrhT5HYJqw==
X-Received: by 2002:a17:907:3207:b0:94f:5b91:7952 with SMTP id
 xg7-20020a170907320700b0094f5b917952mr17626377ejb.21.1683798624998; 
 Thu, 11 May 2023 02:50:24 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 hy25-20020a1709068a7900b0096607baaf19sm3783144ejc.101.2023.05.11.02.50.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:50:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/24] meson: regenerate meson-buildoptions.sh
Date: Thu, 11 May 2023 11:49:58 +0200
Message-Id: <20230511095021.1397802-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/meson-buildoptions.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 753dbb095a4b..52e59d25b8fa 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -1,8 +1,8 @@
 # This file is generated by meson-buildoptions.py, do not edit!
 meson_options_help() {
-  printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list [default] (choices: al'
-  printf "%s\n" '                           sa/coreaudio/default/dsound/jack/oss/pa/'
-  printf "%s\n" '                           pipewire/sdl/sndio)'
+  printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list [default] (choices: alsa/co'
+  printf "%s\n" '                           reaudio/default/dsound/jack/oss/pa/pipewire/sdl/s'
+  printf "%s\n" '                           ndio)'
   printf "%s\n" '  --block-drv-ro-whitelist=VALUE'
   printf "%s\n" '                           set block driver read-only whitelist (by default'
   printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
-- 
2.40.1


