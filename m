Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E324BBF7C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 19:29:27 +0100 (CET)
Received: from localhost ([::1]:53768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL80U-0003NI-Gp
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 13:29:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL7zO-0002Qy-1S
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:28:18 -0500
Received: from [2607:f8b0:4864:20::1032] (port=35615
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL7zL-0005c2-Mz
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:28:17 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso13140784pjg.0
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 10:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ExRqwfcxQrathBRDHr0VKDNy6FCpKfhKztvUPshEibM=;
 b=Cza89wOPikEslUebx/tA/OU+YW5ENKjD8b0pT+7DSjqw+UlIuLRNTsNNwTwJBCad29
 zpUDB2QRoDuq9p0HmIfr6KUVzcYWGzmEhM6mWh5BZTIs6mOS2oQ90PEtaOT7UD85ysph
 U9a87IxJ1ueNHPenpCE7y0WE4ZBUvwRtPNl4VHuqiXDbEY6Jv5pKNc+C/u4hNIREozlL
 BKhjIqV9DauegtUVYWGg7VUHxEMCgTolOOhRzqfQoAW75dLRjPOFpoxiFjBjQ0J5Bqhp
 IdOR3DuK2Bp4eLEwOBSYHaBW6FY36665befnMFtucLgFIVSCIODAuRvm4W2ZtqPvEno4
 bKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ExRqwfcxQrathBRDHr0VKDNy6FCpKfhKztvUPshEibM=;
 b=e30SXRQBWde8IbUfy5Oz8FSl0mIxD33p3JGGaoM3Heef7eY9EQ6H1Z7ugMSZQPUQl7
 /teVKS+Wtp526j/Hl4X8j1FA+wR8F5IJ4Osy8PbUuougaK3HcCU+6sXnARoTvnncprvT
 z1kKhOYn3dlmvxuyKNSkdmExh1Qup8LS1MRcIUgM4lkDkfQIBTnJg9t36UsHTS4L0wEB
 31MbeSOuDDB0OzEhygd9XnF2qzEoFT7WjQwhHY9ffPjkH7p+BIO6pktsOiszEoEISmxi
 Lr425HgY+o73hhl34tHTeUTngyXIoQzdYqFC4Z7zrlVW66YHad75E89GfAJQbpUov+IY
 h+1w==
X-Gm-Message-State: AOAM531TLeVsWeMzCu15x0xnLRg82RWhgw4WotNBAkOespBICjfaQ+4M
 Ab5qdI0wJx/ZrpAcF32i41U=
X-Google-Smtp-Source: ABdhPJy5UGy3dp7xJa1EBmr+9aTP/yDOIRdlRJvg3mva0Tl62MGmGdDg/tvgOn1yV0c2uL4oZ29ifQ==
X-Received: by 2002:a17:90a:c68d:b0:1b4:dcfa:7919 with SMTP id
 n13-20020a17090ac68d00b001b4dcfa7919mr9572608pjt.184.1645208894397; 
 Fri, 18 Feb 2022 10:28:14 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a17090a4b4c00b001b8fe81ce8esm58823pjl.50.2022.02.18.10.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 10:28:14 -0800 (PST)
Message-ID: <a7e9cc73-e680-cd87-8396-c6c1c933f53d@gmail.com>
Date: Sat, 19 Feb 2022 03:28:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 10/15] ui/cocoa: Remove allowedFileTypes restriction in
 SavePanel
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220215080307.69550-1-f4bug@amsat.org>
 <20220215080307.69550-11-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220215080307.69550-11-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/02/15 17:03, Philippe Mathieu-Daudé via wrote:
> setAllowedFileTypes is deprecated in macOS 12.
> 
> Per Akihiko Odaki [*]:
> 
>    An image file, which is being chosen by the panel, can be a
>    raw file and have a variety of file extensions and many are not
>    covered by the provided list (e.g. "udf"). Other platforms like
>    GTK can provide an option to open a file with an extension not
>    listed, but Cocoa can't. It forces the user to rename the file
>    to give an extension in the list. Moreover, Cocoa does not tell
>    which extensions are in the list so the user needs to read the
>    source code, which is pretty bad.
> 
> Since this code is harming the usability rather than improving it,
> simply remove the [NSSavePanel allowedFileTypes:] call, fixing:
> 
>    [2789/6622] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
>    ui/cocoa.m:1411:16: error: 'setAllowedFileTypes:' is deprecated: first deprecated in macOS 12.0 - Use -allowedContentTypes instead [-Werror,-Wdeprecated-declarations]
>        [openPanel setAllowedFileTypes: supportedImageFileTypes];
>                   ^
>    /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: property 'allowedFileTypes' is declared deprecated here
>    @property (nullable, copy) NSArray<NSString *> *allowedFileTypes API_DEPRECATED("Use -allowedContentTypes instead", macos(10.3,12.0));
>                                                    ^
>    /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: 'setAllowedFileTypes:' has been explicitly marked deprecated here
>    FAILED: libcommon.fa.p/ui_cocoa.m.o
> 
> [*] https://lore.kernel.org/qemu-devel/4dde2e66-63cb-4390-9538-c032310db3e3@gmail.com/
> 
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed by: Cameron Esfahani <dirty@apple.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   ui/cocoa.m | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index ac18e14ce0..7a1ddd4075 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -100,7 +100,6 @@ static int gArgc;
>   static char **gArgv;
>   static bool stretch_video;
>   static NSTextField *pauseLabel;
> -static NSArray * supportedImageFileTypes;
>   
>   static QemuSemaphore display_init_sem;
>   static QemuSemaphore app_started_sem;
> @@ -1168,10 +1167,6 @@ QemuCocoaView *cocoaView;
>           [pauseLabel setTextColor: [NSColor blackColor]];
>           [pauseLabel sizeToFit];
>   
> -        // set the supported image file types that can be opened
> -        supportedImageFileTypes = [NSArray arrayWithObjects: @"img", @"iso", @"dmg",
> -                                 @"qcow", @"qcow2", @"cloop", @"vmdk", @"cdr",
> -                                  @"toast", nil];
>           [self make_about_window];
>       }
>       return self;
> @@ -1414,7 +1409,6 @@ QemuCocoaView *cocoaView;
>       openPanel = [NSOpenPanel openPanel];
>       [openPanel setCanChooseFiles: YES];
>       [openPanel setAllowsMultipleSelection: NO];
> -    [openPanel setAllowedFileTypes: supportedImageFileTypes];
>       if([openPanel runModal] == NSModalResponseOK) {
>           NSString * file = [[[openPanel URLs] objectAtIndex: 0] path];
>           if(file == nil) {


