Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EAA2D6A7A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 23:38:07 +0100 (CET)
Received: from localhost ([::1]:38762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knUZZ-0006if-JY
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 17:38:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knUWr-000690-Qp
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 17:35:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knUWo-0007xn-4Y
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 17:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607639712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+KwTndPVgNd8JvS7s43DTp85DD35WUPGDIJytpQmrGU=;
 b=b4zey+ZsCcGQo7mr7hu3jC/ZLGv8KZUMNT0mrOH+JDrk3t3Mh5WgZWUbN9vaWcXgKjsfAI
 H9QmIXwnhHX8y46sy1wbiPp2oGGHjuj1JrmYEdUCFvv5PCRWMSoMjFwdCH0aLpazNpI5Kr
 i8DZsEXY0bJolXJvKySW3mJXHSyEfL0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177--4dp-gu_O4a63mv9GOVwYg-1; Thu, 10 Dec 2020 17:35:10 -0500
X-MC-Unique: -4dp-gu_O4a63mv9GOVwYg-1
Received: by mail-ed1-f70.google.com with SMTP id e12so3050345eds.19
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 14:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+KwTndPVgNd8JvS7s43DTp85DD35WUPGDIJytpQmrGU=;
 b=aiR2Yh7YWAYu0P0SQ61fRNyxDtHUjA6NFdSIDqOJrEFQ66KNcIHdhA3ndUetizN5ZO
 FQqjZ571Ax2uzsccZbYsOApXVLpRFP2/7qlUIs4u/wsL2dZQpfcBPgQtJN5PBM5qW0Lk
 yHR3/jf9ZIxUcBhiQ0xioOiy+05tP3D3khPT2wg+OunDxoVH6Zn18bJMAsCuObAwUQZr
 74u3zRHtfCez9K4SzrhOmM6+Bja8ZHoY4md0KGnN8KWMTMf4niOSsKS8cgONBWGBtDgq
 HaulyUITB10iBNH2VMttLCRmJTbRzaFFY6lYtSerwU0AYv0AyTSv+rSEG1DhPWnV858Z
 Pt7Q==
X-Gm-Message-State: AOAM531NWynHkeejnI5xyWypZPsHxHgpfGinidX6MFIfVsOJVtsEfsqD
 YcT3Nl1XsWeJIehLTJl8UTOg3cvDhT38C/bVAu0NvcxZ4Pj2k1SmaGF7+NvcxXWhJ7izNHcUL6q
 /eY+4WcfxtbdypyZS47Ki5txY/ZwBZUTOWR8lxGITnJLPyGCAq9hA/aCt2DDDkguG
X-Received: by 2002:aa7:d459:: with SMTP id q25mr8938611edr.279.1607639709516; 
 Thu, 10 Dec 2020 14:35:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1n/3Ha74wxqWt2er5TcOrJXbepmYGGh8CAvZShcy7kW/NaAKcgXNTViZyWQ0wDEa5jMU/bw==
X-Received: by 2002:aa7:d459:: with SMTP id q25mr8938593edr.279.1607639709230; 
 Thu, 10 Dec 2020 14:35:09 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id rl7sm5310282ejb.107.2020.12.10.14.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 14:35:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] audio: Simplify audio_bug() removing old code
Date: Thu, 10 Dec 2020 23:35:06 +0100
Message-Id: <20201210223506.263709-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Gerd Hoffmann <gerd@kraxel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code (introduced in commit 1d14ffa97ea, Oct 2005)
is likely unused since years. Time to remove it.  If
the condition is true, simply call abort().

Suggested-by: Gerd Hoffmann <gerd@kraxel.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 audio/audio.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 46578e4a583..b71ab8912c5 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -104,9 +104,6 @@ const struct mixeng_volume nominal_volume = {
 
 static bool legacy_config = true;
 
-#ifdef AUDIO_IS_FLAWLESS_AND_NO_CHECKS_ARE_REQURIED
-#error No its not
-#else
 int audio_bug (const char *funcname, int cond)
 {
     if (cond) {
@@ -119,25 +116,11 @@ int audio_bug (const char *funcname, int cond)
             AUD_log (NULL, "I am sorry\n");
         }
         AUD_log (NULL, "Context:\n");
-
-#if defined AUDIO_BREAKPOINT_ON_BUG
-#  if defined HOST_I386
-#    if defined __GNUC__
-        __asm__ ("int3");
-#    elif defined _MSC_VER
-        _asm _emit 0xcc;
-#    else
-        abort ();
-#    endif
-#  else
-        abort ();
-#  endif
-#endif
+        abort();
     }
 
     return cond;
 }
-#endif
 
 static inline int audio_bits_to_index (int bits)
 {
-- 
2.26.2


