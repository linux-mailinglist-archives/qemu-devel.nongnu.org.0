Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274994B5A81
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:21:17 +0100 (CET)
Received: from localhost ([::1]:33886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJguR-000678-L4
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:21:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgYA-0003J9-T2; Mon, 14 Feb 2022 13:58:14 -0500
Received: from [2607:f8b0:4864:20::42c] (port=42606
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgY8-0006Vi-OL; Mon, 14 Feb 2022 13:58:14 -0500
Received: by mail-pf1-x42c.google.com with SMTP id i6so28924629pfc.9;
 Mon, 14 Feb 2022 10:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VfGP9v+SJGC5s5c3YVjK2aTHozdvRpFoivfAAZxpXGU=;
 b=CGhcAiTXV4EJLWRNqc11R451OExvwrlGgW9WvD/ViCArCSbxR2Suhrd7aO31lwZ3qC
 nBajM4n/XMOTVe6ebtSEJ04QI3AXYmDGY+fnvvlRNp95zMifuSQENdYNWe8Fl27U97pN
 y3y/s9JxkVsfQgHeokykPn5TPs6hbGzpJ8AnD4yPLaVCI0Fh4OMvuFX49buOsUJeRa5/
 rTKf2aomaNAvWxH4SiBY0fnBs4AfImAnV7XpfUWjp8+H09Ucm45oVK4UgsgN0DgAPlpw
 yXRDLep2PUR2TDUij3+F9IVNKorZzFUdn5KsG5LsuYkpDLPLVJWhyf66Jvgg20en2qe1
 pHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VfGP9v+SJGC5s5c3YVjK2aTHozdvRpFoivfAAZxpXGU=;
 b=1+HAKM0SUFSCwViE9th9SEc4veTR36xTTDqc/lDqE0iD24e1Sc8Dm6ZUgyezyBd5iI
 T9NrqyBkUs1WUlpLqDS8XeCA2TE97nMxxjEQa4CaxwY7RymkUBDZsucM9GLUQshPHRCP
 RCGH6loSZjPqzoPbRHfwleQCYHvFgbuigNXrdxiDJ3lashX9pIvlbU+tyO9/tdLnRCCx
 ciGFbtWR9p0mUUiXAqMbwu/qNKXRUg4veK7joRhhh4CUz41tGxuz+zuifZcI5SMEkgVx
 iaU2q6hweH605qadVGRZW0jfA+8baijKfGb2yEr+vb2y4ijed53bap7HQc3rU2tZRGdr
 Sc8Q==
X-Gm-Message-State: AOAM533jVQVT9ltMLw1rMdibrvcqFUTARuIv3EdeaKnpTPdK1X9WJNna
 criCsn/NCaN2rsul5004kbDkguNPX/w=
X-Google-Smtp-Source: ABdhPJyet0V11fEBcQlc/YZMJoAegv2KYZMIRtBqWwEte5hityoa947aiirDwXh00kwIugNncCe6aA==
X-Received: by 2002:a63:2d6:: with SMTP id 205mr355358pgc.93.1644865090963;
 Mon, 14 Feb 2022 10:58:10 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id ng16sm15369818pjb.12.2022.02.14.10.58.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:58:10 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 12/16] ui/cocoa: Remove allowedFileTypes restriction in
 SavePanel
Date: Mon, 14 Feb 2022 19:56:01 +0100
Message-Id: <20220214185605.28087-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.635,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TVD_SUBJ_WIPE_DEBT=1.004,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

setAllowedFileTypes is deprecated in macOS 12.

Per Akihiko Odaki [*]:

  An image file, which is being chosen by the panel, can be a
  raw file and have a variety of file extensions and many are not
  covered by the provided list (e.g. "udf"). Other platforms like
  GTK can provide an option to open a file with an extension not
  listed, but Cocoa can't. It forces the user to rename the file
  to give an extension in the list. Moreover, Cocoa does not tell
  which extensions are in the list so the user needs to read the
  source code, which is pretty bad.

Since this code is harming the usability rather than improving it,
simply remove the [NSSavePanel allowedFileTypes:] call, fixing:

  [2789/6622] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
  ui/cocoa.m:1411:16: error: 'setAllowedFileTypes:' is deprecated: first deprecated in macOS 12.0 - Use -allowedContentTypes instead [-Werror,-Wdeprecated-declarations]
      [openPanel setAllowedFileTypes: supportedImageFileTypes];
                 ^
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: property 'allowedFileTypes' is declared deprecated here
  @property (nullable, copy) NSArray<NSString *> *allowedFileTypes API_DEPRECATED("Use -allowedContentTypes instead", macos(10.3,12.0));
                                                  ^
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: 'setAllowedFileTypes:' has been explicitly marked deprecated here
  FAILED: libcommon.fa.p/ui_cocoa.m.o

[*] https://lore.kernel.org/qemu-devel/4dde2e66-63cb-4390-9538-c032310db3e3@gmail.com/

Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed by: Cameron Esfahani <dirty@apple.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index ac18e14ce0..7a1ddd4075 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -100,7 +100,6 @@ static int gArgc;
 static char **gArgv;
 static bool stretch_video;
 static NSTextField *pauseLabel;
-static NSArray * supportedImageFileTypes;
 
 static QemuSemaphore display_init_sem;
 static QemuSemaphore app_started_sem;
@@ -1168,10 +1167,6 @@ QemuCocoaView *cocoaView;
         [pauseLabel setTextColor: [NSColor blackColor]];
         [pauseLabel sizeToFit];
 
-        // set the supported image file types that can be opened
-        supportedImageFileTypes = [NSArray arrayWithObjects: @"img", @"iso", @"dmg",
-                                 @"qcow", @"qcow2", @"cloop", @"vmdk", @"cdr",
-                                  @"toast", nil];
         [self make_about_window];
     }
     return self;
@@ -1414,7 +1409,6 @@ QemuCocoaView *cocoaView;
     openPanel = [NSOpenPanel openPanel];
     [openPanel setCanChooseFiles: YES];
     [openPanel setAllowsMultipleSelection: NO];
-    [openPanel setAllowedFileTypes: supportedImageFileTypes];
     if([openPanel runModal] == NSModalResponseOK) {
         NSString * file = [[[openPanel URLs] objectAtIndex: 0] path];
         if(file == nil) {
-- 
2.34.1


