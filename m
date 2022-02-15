Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7717E4B6BD6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 13:16:25 +0100 (CET)
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJwkq-0008Sk-KR
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 07:16:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJwbs-00019s-9B
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 07:07:10 -0500
Received: from [2607:f8b0:4864:20::42f] (port=39934
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJwbp-0001YF-Mo
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 07:07:07 -0500
Received: by mail-pf1-x42f.google.com with SMTP id m22so15307770pfk.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 04:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RNomxsOaTbrDgUf1dgePEps7teU/595zSAXkTRYLDj8=;
 b=ckvNCcK6aCdtc4YTe4N/Yw/fCMcfNIlFDbSyY2HZp3qXUe68lC1ZlHBQImo8aafPqh
 9TmlHQkzUik54gkO3PfkDLvxiLNW3/Lbr3FqTBt3RqWWMgu+5avotutH8dbQCdy1/2JR
 QAXiUEj7rxCj5xH07kphzGiS/iPECrhmSOTrWOKCYJsmUVUlqdUYql/43z4PCSRLZS4L
 IDjGdkLi4QHXKio/dfnyaX9eLuA5PqEoZI3VOZTndQxBANd86Atdn9bXNjF9eCGwhPKD
 PUYV8dlfHl1KFM8cGreibwVg8eQBRAUcC6GbKt6853V9N1BaxDvY31VMbUaFkPcR4/3V
 6dMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RNomxsOaTbrDgUf1dgePEps7teU/595zSAXkTRYLDj8=;
 b=nAh5qW3GhHowU7zbetf+SJWCNRiLFREvbGL1zOLvR9IF1Aujs9YE9XTMKAAxXZCS5e
 8DRQJNQT4gGuQScfSro+CWvodMRkSJtnWn4nzl4Ec4mOB7OpTtlEMELK7Ub1cfIcSZ9u
 oyuwycm/q9xJKuVXAYuRpJ7kb15tiKwje5qK3bzIPKYCKHS7Ttj6OQda3UT+sTvJWdAI
 SiEnlYYANhVcW7SV74B2MXbO2cH0VwflklVHwL878l8H1VaEsAZPK+XrRvELlB6QM6tP
 6/VPa41UaeSIYYMvCJlnkWnSlKiAfmxkdMUjq9sEHUXqDjcL/L/SiJIztNFcNeiyG5EB
 FMgQ==
X-Gm-Message-State: AOAM530pylzRQIGwcabeiM8+A8QtS3XVkkqDYSCOLVC9ejO4lmqmoPYP
 afVQaSMjeZkinGfpD36Xa9FwiaXvrq4=
X-Google-Smtp-Source: ABdhPJxcZg8ui/9+OuIRnnkYYpkpTtoYrHw+tBy7fPjO0BA8X+kBOfijrTdAHFMLdCEjlgfpWeMJ2Q==
X-Received: by 2002:a63:5662:: with SMTP id g34mr3152051pgm.569.1644926815368; 
 Tue, 15 Feb 2022 04:06:55 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id ot10sm14776256pjb.3.2022.02.15.04.06.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 04:06:55 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 3/4] audio: Rename coreaudio extension to use Objective-C
 compiler
Date: Tue, 15 Feb 2022 13:06:24 +0100
Message-Id: <20220215120625.64711-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215120625.64711-1-f4bug@amsat.org>
References: <20220215120625.64711-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

The coreaudio library includes Objective-C declarations (using the
caret '^' symbol to declare block references [*]). When building
with a C compiler we get:

  [175/839] Compiling C object libcommon.fa.p/audio_coreaudio.c.o
    In file included from /Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/CoreAudio.h:18,
                     from ../../audio/coreaudio.c:26:
    /Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardware.h:162:2: error: expected identifier or '(' before '^' token
      162 | (^AudioObjectPropertyListenerBlock)(    UInt32                              inNumberAddresses,
          |  ^
    FAILED: libcommon.fa.p/audio_coreaudio.c.o

Rename the file to use the Objective-C default extension (.m) so
meson calls the correct compiler.

[*] https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/WorkingwithBlocks/WorkingwithBlocks.html

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 audio/{coreaudio.c => coreaudio.m} | 0
 audio/meson.build                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename audio/{coreaudio.c => coreaudio.m} (100%)

diff --git a/audio/coreaudio.c b/audio/coreaudio.m
similarity index 100%
rename from audio/coreaudio.c
rename to audio/coreaudio.m
diff --git a/audio/meson.build b/audio/meson.build
index d9b295514f..94dab16891 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -7,7 +7,7 @@ softmmu_ss.add(files(
   'wavcapture.c',
 ))
 
-softmmu_ss.add(when: coreaudio, if_true: files('coreaudio.c'))
+softmmu_ss.add(when: coreaudio, if_true: files('coreaudio.m'))
 softmmu_ss.add(when: dsound, if_true: files('dsoundaudio.c', 'audio_win_int.c'))
 
 audio_modules = {}
-- 
2.34.1


