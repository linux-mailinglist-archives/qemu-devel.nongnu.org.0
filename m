Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C7D4C608C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 02:03:10 +0100 (CET)
Received: from localhost ([::1]:57000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOURR-0005Ci-KZ
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 20:03:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOUPZ-0002yb-I7
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 20:01:15 -0500
Received: from [2607:f8b0:4864:20::102b] (port=39621
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOUPX-0005HP-B4
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 20:01:13 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso13351244pju.4
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 17:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:cc
 :references:from:in-reply-to:content-transfer-encoding;
 bh=7qG1BDzNcaoi1gJ8HBHK/dyDlHvrkMRkPD40R6K/dqs=;
 b=YbsZY6vY27mbOU/OXgIbGqVtySB30L/8yQ3gKjEiKyatLW2b0xCkW5+W92tT7Dh7qt
 TgIvhe3gbFGrC1Wp+a7C2jt1EM/oIjR8BixL+bmiEObDHJJXym5Hil76cIVi7isLHP7l
 BxQYfCAstMGlnHzKfXIiS6r6ZhBdi6gzokZ38D7X+iqdVy4WsQWcQw+amjIFnYBrRoSv
 RyLpFEmqsTOlFlVsV5WoNvTiA16COFlky8qDIe3iYkOEJrIeVj2vq2zZTEYKJHomrRiK
 xQwooLqEvyDGztwOqgxjRZlCuy4RS8dmrJ3x9XVpOPSU7LZoCyqmMkjk/9/J4Vz9MWvc
 mz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7qG1BDzNcaoi1gJ8HBHK/dyDlHvrkMRkPD40R6K/dqs=;
 b=d9TwCm0ELOJao+LIulGOJXdAo1RaTlbCImE4HVEmt6DUNZddU1z/R7KPlrWAc7p40K
 yuJeoEcMbiqE9PSU/7uec2RReNg4Uyib2l7ZmYC0nMHqgeKWZ4ZvJEMiOQGYeTVASl5F
 8H91EgN3SFtWahvOA/PQDRq2l8pvBnNT/msN3qqI81ZvUIO/Y+DfxFlfNklYhE71I5AJ
 kxiS2snHArWDnd1U6cxWA7fSV93FPowTfr6m/z0G/eIiXjzD9uWDct6PmU8kRZvyd+r3
 PRE0QINAJDRCcQVl9zET26Ui81XCt571g+nG0Aq9yDFq7oL9isy4DlXL3M0IAR05UuSi
 /yig==
X-Gm-Message-State: AOAM533uINm98cDcGoGGUylTXZJB6povtg1BJ9hbB6agprM/IaT8WF71
 32/2L4NppnijBTIpiRQvIiwcVJd3gPE=
X-Google-Smtp-Source: ABdhPJxmMFZJpb2GhnKCRM+hKqqwxoqJ+XhPSy9Ol4zM4uO0spvLoKnf/HGuWb4chUTvam99Vx1kaQ==
X-Received: by 2002:a17:902:e745:b0:151:5474:d3ed with SMTP id
 p5-20020a170902e74500b001515474d3edmr6853934plf.106.1646010068404; 
 Sun, 27 Feb 2022 17:01:08 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a056a0016d100b004c34686e322sm11496325pfc.182.2022.02.27.17.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 17:01:08 -0800 (PST)
Message-ID: <adfe9f81-1d32-4ffd-0bbd-1c24495bd13c@gmail.com>
Date: Mon, 28 Feb 2022 10:01:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ui/cocoa: Use the standard about panel
Content-Language: en-US
References: <20220228005710.10442-1-akihiko.odaki@gmail.com>
 <20220228005710.10442-3-akihiko.odaki@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220228005710.10442-3-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MISSING_HEADERS=1.021, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please ignore this. I mistakenly sent a stale patch in my outbox 
directory. Sorry for bothering,
Akihiko Odaki

On 2022/02/28 9:57, Akihiko Odaki wrote:
> This provides standard look and feel for the about panel and reduces
> code.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   ui/cocoa.m | 112 +++++++++++------------------------------------------
>   1 file changed, 23 insertions(+), 89 deletions(-)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index a8f1cdaf926..59672fee775 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -83,7 +83,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
>   
>   static void cocoa_refresh(DisplayChangeListener *dcl);
>   
> -static NSWindow *normalWindow, *about_window;
> +static NSWindow *normalWindow;
>   static const DisplayChangeListenerOps dcl_ops = {
>       .dpy_name          = "cocoa",
>       .dpy_gfx_update = cocoa_update,
> @@ -1120,7 +1120,6 @@ - (void)changeDeviceMedia:(id)sender;
>   - (BOOL)verifyQuit;
>   - (void)openDocumentation:(NSString *)filename;
>   - (IBAction) do_about_menu_item: (id) sender;
> -- (void)make_about_window;
>   - (void)adjustSpeed:(id)sender;
>   @end
>   
> @@ -1166,8 +1165,6 @@ - (id) init
>           [pauseLabel setFont: [NSFont fontWithName: @"Helvetica" size: 90]];
>           [pauseLabel setTextColor: [NSColor blackColor]];
>           [pauseLabel sizeToFit];
> -
> -        [self make_about_window];
>       }
>       return self;
>   }
> @@ -1451,92 +1448,29 @@ - (BOOL)verifyQuit
>   /* The action method for the About menu item */
>   - (IBAction) do_about_menu_item: (id) sender
>   {
> -    [about_window makeKeyAndOrderFront: nil];
> -}
> -
> -/* Create and display the about dialog */
> -- (void)make_about_window
> -{
> -    /* Make the window */
> -    int x = 0, y = 0, about_width = 400, about_height = 200;
> -    NSRect window_rect = NSMakeRect(x, y, about_width, about_height);
> -    about_window = [[NSWindow alloc] initWithContentRect:window_rect
> -                    styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |
> -                    NSWindowStyleMaskMiniaturizable
> -                    backing:NSBackingStoreBuffered
> -                    defer:NO];
> -    [about_window setTitle: @"About"];
> -    [about_window setReleasedWhenClosed: NO];
> -    [about_window center];
> -    NSView *superView = [about_window contentView];
> -
> -    /* Create the dimensions of the picture */
> -    int picture_width = 80, picture_height = 80;
> -    x = (about_width - picture_width)/2;
> -    y = about_height - picture_height - 10;
> -    NSRect picture_rect = NSMakeRect(x, y, picture_width, picture_height);
> -
> -    /* Make the picture of QEMU */
> -    NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
> -                                                     picture_rect];
> -    char *qemu_image_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
> -    NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
> -    g_free(qemu_image_path_c);
> -    NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
> -    [picture_view setImage: qemu_image];
> -    [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
> -    [superView addSubview: picture_view];
> -
> -    /* Make the name label */
> -    NSBundle *bundle = [NSBundle mainBundle];
> -    if (bundle) {
> -        x = 0;
> -        y = y - 25;
> -        int name_width = about_width, name_height = 20;
> -        NSRect name_rect = NSMakeRect(x, y, name_width, name_height);
> -        NSTextField *name_label = [[NSTextField alloc] initWithFrame: name_rect];
> -        [name_label setEditable: NO];
> -        [name_label setBezeled: NO];
> -        [name_label setDrawsBackground: NO];
> -        [name_label setAlignment: NSTextAlignmentCenter];
> -        NSString *qemu_name = [[bundle executablePath] lastPathComponent];
> -        [name_label setStringValue: qemu_name];
> -        [superView addSubview: name_label];
> +    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
> +    char *icon_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
> +    NSString *icon_path = [NSString stringWithUTF8String:icon_path_c];
> +    g_free(icon_path_c);
> +    NSImage *icon = [[NSImage alloc] initWithContentsOfFile:icon_path];
> +    NSString *version = @"QEMU emulator version " QEMU_FULL_VERSION;
> +    NSString *copyright = @QEMU_COPYRIGHT;
> +    NSDictionary *options;
> +    if (icon) {
> +        options = @{
> +            NSAboutPanelOptionApplicationIcon : icon,
> +            NSAboutPanelOptionApplicationVersion : version,
> +            @"Copyright" : copyright,
> +        };
> +        [icon release];
> +    } else {
> +        options = @{
> +            NSAboutPanelOptionApplicationVersion : version,
> +            @"Copyright" : copyright,
> +        };
>       }
> -
> -    /* Set the version label's attributes */
> -    x = 0;
> -    y = 50;
> -    int version_width = about_width, version_height = 20;
> -    NSRect version_rect = NSMakeRect(x, y, version_width, version_height);
> -    NSTextField *version_label = [[NSTextField alloc] initWithFrame:
> -                                                      version_rect];
> -    [version_label setEditable: NO];
> -    [version_label setBezeled: NO];
> -    [version_label setAlignment: NSTextAlignmentCenter];
> -    [version_label setDrawsBackground: NO];
> -
> -    /* Create the version string*/
> -    NSString *version_string;
> -    version_string = [[NSString alloc] initWithFormat:
> -    @"QEMU emulator version %s", QEMU_FULL_VERSION];
> -    [version_label setStringValue: version_string];
> -    [superView addSubview: version_label];
> -
> -    /* Make copyright label */
> -    x = 0;
> -    y = 35;
> -    int copyright_width = about_width, copyright_height = 20;
> -    NSRect copyright_rect = NSMakeRect(x, y, copyright_width, copyright_height);
> -    NSTextField *copyright_label = [[NSTextField alloc] initWithFrame:
> -                                                        copyright_rect];
> -    [copyright_label setEditable: NO];
> -    [copyright_label setBezeled: NO];
> -    [copyright_label setDrawsBackground: NO];
> -    [copyright_label setAlignment: NSTextAlignmentCenter];
> -    [copyright_label setStringValue: [NSString stringWithFormat: @"%s",
> -                                     QEMU_COPYRIGHT]];
> -    [superView addSubview: copyright_label];
> +    [NSApp orderFrontStandardAboutPanelWithOptions:options];
> +    [pool release];
>   }
>   
>   /* Used by the Speed menu items */


