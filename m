Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61884310F73
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:06:54 +0100 (CET)
Received: from localhost ([::1]:35058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85VN-0003Rk-E0
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84lA-00012W-JK
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:19:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84l9-0003YH-0U
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612545546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zv/BwC5POPyWjWYZMgFmMVd8R/Xa4KoRgVF20B1JO98=;
 b=AigrJplYuY6zFut5HbiagMJzsUUqhPcoMMjHcerePbxK4CAjqjzcc0A4eFPhMKZNNxl+Fa
 GreuOPEu9QA7yTkqPVYWc18zAfpoY7Iee9AiKH20CMgkg07JSISCAKZzDjNo4Y3IqFfOEe
 SXaBXsqMhxfMzTvVS+lQPG7Q6JaULBA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-ToHCrR5bMNmOOu2m0Vh1Tg-1; Fri, 05 Feb 2021 12:19:04 -0500
X-MC-Unique: ToHCrR5bMNmOOu2m0Vh1Tg-1
Received: by mail-ed1-f72.google.com with SMTP id f4so7222064eds.5
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zv/BwC5POPyWjWYZMgFmMVd8R/Xa4KoRgVF20B1JO98=;
 b=fSoOU0R2dcu0dDIMjbXREvifd05c9DmQZEO8ejF0gDBfl1bJoy7/9CkApqZAs6fRQq
 l7GOtWRzf922YF8qt8PHN5NKXl3RVx3Owra7LFAxPTlwVYytK6wdEyOHsDDH568wO/jt
 VCVogNymNosHy6TLNw0MDGQGeczrAfG0bZLNRGs3EfBvlSuBMT8ygN1skSXuo1cuZjj5
 AWglRZA0UekepdOsortwP+B/B/87PiscMbEw1FrjEDZYOtch0z/e6OZyIAProdzzpv7K
 IfvCB0VG/40feBlGc/i16BXwCQiWcSPJ6wk/fBUnP/OAoVWWakS6ezxIKhh/mHghQqOv
 FIJw==
X-Gm-Message-State: AOAM533IM+1Y0xWsV1ZX/8b9jAYvu8HbyPQqvy3cxu/vcLZvLDwUGYpW
 2eugrxdEG6vqmeOztdiDXsKV6/JnvtrF7Tc/wZElq4AUMYTV4xJpJz2U3sJT5+6tUCGqAD/4Kn6
 SZFPB7jk72t3bqWkLfomn/kNJwOStzl576J7Xb5LSRPNJ/jUfoo72Ndi9TWPt+iyV
X-Received: by 2002:a17:906:4a8b:: with SMTP id
 x11mr4807099eju.195.1612545543219; 
 Fri, 05 Feb 2021 09:19:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4AESYMU1owVRhV9m92wtbzGYJ8Gn9txipWIFeVvltbcAMh1VARjUR13pA6qTP5yK+Gb16GA==
X-Received: by 2002:a17:906:4a8b:: with SMTP id
 x11mr4807070eju.195.1612545543029; 
 Fri, 05 Feb 2021 09:19:03 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w3sm4185595eja.52.2021.02.05.09.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:19:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] tests/fp/fp-test: Replace the word 'blacklist'
Date: Fri,  5 Feb 2021 18:18:16 +0100
Message-Id: <20210205171817.2108907-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205171817.2108907-1-philmd@redhat.com>
References: <20210205171817.2108907-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Acked-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/fp/fp-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 06ffebd6db1..5a4cad8c8b2 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -123,7 +123,7 @@ static void not_implemented(void)
     fprintf(stderr, "Not implemented.\n");
 }
 
-static bool blacklisted(unsigned op, int rmode)
+static bool is_allowed(unsigned op, int rmode)
 {
     /* odd has not been implemented for any 80-bit ops */
     if (rmode == softfloat_round_odd) {
@@ -161,10 +161,10 @@ static bool blacklisted(unsigned op, int rmode)
         case F32_TO_EXTF80:
         case F64_TO_EXTF80:
         case F128_TO_EXTF80:
-            return true;
+            return false;
         }
     }
-    return false;
+    return true;
 }
 
 static void do_testfloat(int op, int rmode, bool exact)
@@ -194,7 +194,7 @@ static void do_testfloat(int op, int rmode, bool exact)
     verCases_writeFunctionName(stderr);
     fputs("\n", stderr);
 
-    if (blacklisted(op, rmode)) {
+    if (!is_allowed(op, rmode)) {
         not_implemented();
         return;
     }
-- 
2.26.2


