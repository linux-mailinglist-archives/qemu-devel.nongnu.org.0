Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14BE6645F4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:25:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6W-0003JN-Ed; Tue, 10 Jan 2023 11:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5m-00033B-NC
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5j-00051Y-Lc
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBgkZzjzAEb+D7EykMmybI26MmcaMg0LTD9LL3+JAWE=;
 b=M1yF7XNlJi7hPBfUA+rQX/L9xO9IefQ41ZwEq/V9URpT8lPzMTktbu0fTA6Zycd1nqh+Vn
 sv9zlbw8gVuxaDz4qYRm96bDOzoqyxAz3RqQJtbRculDX1WeHOcVGMWJZnPH1gUSbxuI+F
 VF925mOvv7pJbjiIy8vJ7Gs7qiCyNU4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-hLq6F2mnPjmVdHdpzDMRxQ-1; Tue, 10 Jan 2023 11:03:02 -0500
X-MC-Unique: hLq6F2mnPjmVdHdpzDMRxQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 n13-20020adfc60d000000b0029bdfcf52eeso2106127wrg.8
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QBgkZzjzAEb+D7EykMmybI26MmcaMg0LTD9LL3+JAWE=;
 b=enZkkowyiDC0DkwUQ79Q5RBGxfhpuXgI64BM1eHp0KRFkPWhAWBlu5MpvV8tu2otq4
 R3F3M+XprP6M3Uz9qXd3pR5QGfY2gC1JyNDzZi4yMJJmmZkqpsLCFjeeN1t4aIVB38Ab
 JKFIBxcTCJrMiQbsGPiBRoeNsEkYgpvG9pyHsjLwCU3ga/uxKJIPR9g2rdYYjAYL+NLW
 9LYZuVHjOqNyuRvjOfzR8ptV5Ngjdh065ubizwHfw5lK+Xqa909aqBu2gRoWIkOo2RhT
 Pt71I2sWwwFMV+jc0g/h0sjB3lL/ij7BgJUAfL4kWREgnjXu7sikLmG+yUwqLR4+9lOU
 8YMQ==
X-Gm-Message-State: AFqh2kpSxvm/IQjJejr+cNOzAnSpem44ay4+TA79YGNENlogEce4JlfW
 ZocHooPxAvqT1IHBRMYASKNs50kPkpC0pRxlef6uzRXCl35rsqVDJpyBdVbklrPc87kXsVhgHRS
 Xjgvh8K+U51dv4hbaq6SucDcq7AUSpTEr83uKYtCSqb2eYav+iylM9KvIZk7woWuPUFU=
X-Received: by 2002:a05:6000:10f:b0:286:ad19:731f with SMTP id
 o15-20020a056000010f00b00286ad19731fmr29822339wrx.19.1673366579788; 
 Tue, 10 Jan 2023 08:02:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv8qLNLe53sDM3mEqYVh+Z1Zo5s1ehVS9zCM3H2hOVz+tv1qauMSrv9sB8uo31I1Uzm3avzhA==
X-Received: by 2002:a05:6000:10f:b0:286:ad19:731f with SMTP id
 o15-20020a056000010f00b00286ad19731fmr29822318wrx.19.1673366579469; 
 Tue, 10 Jan 2023 08:02:59 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a5d5390000000b00281b594c725sm11467478wrv.38.2023.01.10.08.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:02:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 09/29] disas: add G_GNUC_PRINTF to gstring_printf
Date: Tue, 10 Jan 2023 17:02:13 +0100
Message-Id: <20230110160233.339771-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221219130205.687815-2-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 disas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/disas.c b/disas.c
index 94d3b4504260..3b31315f4038 100644
--- a/disas.c
+++ b/disas.c
@@ -239,7 +239,8 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     }
 }
 
-static int gstring_printf(FILE *stream, const char *fmt, ...)
+static int G_GNUC_PRINTF(2, 3)
+gstring_printf(FILE *stream, const char *fmt, ...)
 {
     /* We abuse the FILE parameter to pass a GString. */
     GString *s = (GString *)stream;
-- 
2.38.1


