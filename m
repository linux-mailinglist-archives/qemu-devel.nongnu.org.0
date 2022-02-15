Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26124B7414
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:25:37 +0100 (CET)
Received: from localhost ([::1]:59068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1a5-00033u-4N
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:25:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1Dl-0005Qt-QV
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:02:33 -0500
Received: from [2607:f8b0:4864:20::1035] (port=54127
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1Df-0007dY-E2
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:02:33 -0500
Received: by mail-pj1-x1035.google.com with SMTP id qe15so17868399pjb.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46tJNgDrPM5EFNh7g7s13ib1x2S4JqFzyqo/eqTahYk=;
 b=NBKpSJcvakS+Xq2bqNJdKoAVrDoj3ebC9DmRj7otc2A1h10o78ZdJwz894ScCV3S8A
 Pl4eTw/+PUeRSdptsGwf+LyPNUY12Njmsf8CryyFAH7jie3QV4wmpQHGHbB6YqCEy0mG
 6v4DjlObFF+sCktimZHkuL/ygCe7Q670NguMQTPTw8IrXjHD9woHmLoipBnKwVivjFMd
 k+evUfhikD6bTSgYBDfvoyNQIMh1PodDaRt3ABc9nYSKQy+d6Qk9PfII/pISHIcVPcGI
 EaB2SgEdgmqdAii5pjCUI7dC5OdLf2zIdyG5nlCds0qDqqLCgQRbyuIUeOJerSw0wwE5
 oC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=46tJNgDrPM5EFNh7g7s13ib1x2S4JqFzyqo/eqTahYk=;
 b=lFJwPVSofTTX/FkyKrdmoTjeqs9nbprt0nguw45rxOpugTsc8zaNzxpX9bZ3eWkG5T
 7hYp2masYJPgbOZUa9TX43W4wOavx/vkmklE3A0XRLdD2q/Z3e0nu035JvaEj2CDDuNP
 HRlH2kTPzCcXTZ/g92DfFJMLk8C3ra7bKPYwcLjqZBUYE+aIb1xLD5ONMN2ae/59dbRs
 0oJByYIux8r0KExv7hhekDlbMeHfh23bBJWUKNNwqgVqrkXUE/29v1BvMihb2UUuQrth
 nun1D5xPi062pVLws82cKYO7Sd4bQKy4s/Nx13ZFi8GHWkc0RA8ablTKSBxy+yFjwIoD
 Vr8w==
X-Gm-Message-State: AOAM532/FLBr6gCCW6u20t2hvANsQAF7thDtwP+NxDG5eSDPunw1cEiL
 Don9Qf19O20ME3aGhrQFAS7E2NzazGA=
X-Google-Smtp-Source: ABdhPJxEzOqD45SikyyL8RyRIdW5Icw8vsjy14iQOlar9HOHevn1JXV7mAWWUuPn1mrmxK0KKRXUcw==
X-Received: by 2002:a17:902:7887:: with SMTP id
 q7mr5194741pll.105.1644944530981; 
 Tue, 15 Feb 2022 09:02:10 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id o7sm3179601pfw.114.2022.02.15.09.02.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 09:02:10 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 7/8] audio: Rename coreaudio extension to use Objective-C
 compiler
Date: Tue, 15 Feb 2022 18:01:05 +0100
Message-Id: <20220215170106.95848-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215170106.95848-1-f4bug@amsat.org>
References: <20220215170106.95848-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
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

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
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


