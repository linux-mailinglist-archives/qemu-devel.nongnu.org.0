Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF47E4B2A9E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:42:09 +0100 (CET)
Received: from localhost ([::1]:49052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYzo-0000Fm-WF
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:42:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYuV-0000uA-CI
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:39 -0500
Received: from [2607:f8b0:4864:20::1034] (port=41643
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYuT-0002Qi-6z
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:39 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso9392120pjg.0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5meONCJA88T2HCBkWl8xSWMkPThyazVBGVtF6HQab3o=;
 b=Ym3fIpb1vi4BIzQgkWZLK4YstYkv3teclK2xGQBI29N4JrmTuJcwfXEX0pNnJuMQFw
 nt87DtsXg3Sr53OFEHXuEaL/gojqEbhMitJDPbKi7DL4jDJzVl1FVpVsLahiFYEq1fvP
 VgIdJ7e4lB1j/5OFlSH0/Px8AczBXOpFKI8VZIpZMaOMV8xfnZN2l1c4OYS6ZHnEdwLM
 6I5gQ7hnTye5VLmxJ4QZk3Wo8xYKNQFTLBDui9u/jZYFYgl/uqJulFCxySSjKoV24mwu
 y8fTPhy6vaPVTBXAD4bQrjP0adMaVX15n65ETjFMKGlKRD0TJgCQM2fkCkmB6jZ4IbV8
 c2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5meONCJA88T2HCBkWl8xSWMkPThyazVBGVtF6HQab3o=;
 b=uJHvaxQL4uBzOXxv+2pkhY7NJJX1/I0ObSERbbie7wF69+Uyx7x0tATdTzNibafMDL
 4l3XnBG+Mv1S7wNXpYF0XjBHByezSKeJkeqqlaT5Of7TnfY7W/nMTjpzYjOQkeu0Pu+n
 VLVUKZYPG4BNynnZePJAakjbbKSoJz0fJxwbBhxjm+TVUzDuHse3AXt0L60wwb0D+BKC
 VYHC0b9FV4hVmNnGYXsUSCZmZr03OXzvs8ue0dKcU47fTzmYI8poaF3DZZPsLjuBQ6h2
 /iJwNpgzp+m56AoAbuF+ImpXkJLb1nrbQNp3LKgC4xt7UrM0MuWftNCf1RqXpuiTga86
 FftQ==
X-Gm-Message-State: AOAM532lzRgjp/rdfU6FJVkV5coXR44QdjBjXni78Udaha4JpC0YhaL4
 /ZRqsQuc2ycFboaV9joqsF9X+r5j3rY=
X-Google-Smtp-Source: ABdhPJxwH17twSjz5ByR+Qs1BqXMN8NlnLaaKtrrm6WodLtxYfjJUihZJID/m2yF1bKf4GDVPs/yng==
X-Received: by 2002:a17:90a:1a54:: with SMTP id
 20mr1222012pjl.232.1644597394986; 
 Fri, 11 Feb 2022 08:36:34 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id nl12sm6614403pjb.1.2022.02.11.08.36.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:36:34 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 12/13] ui/cocoa: Remove allowedFileTypes restriction in
 SavePanel
Date: Fri, 11 Feb 2022 17:34:33 +0100
Message-Id: <20220211163434.58423-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211163434.58423-1-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PDS_HP_HELO_NORDNS=0.001,
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


