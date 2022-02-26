Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C64C5718
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:19:44 +0100 (CET)
Received: from localhost ([::1]:34458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0jP-0005GA-6U
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:19:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nO0i6-0003G0-N1
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:18:22 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:36119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nO0i3-00026g-AS
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:18:22 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1A8AE745958;
 Sat, 26 Feb 2022 18:18:15 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D675D745708; Sat, 26 Feb 2022 18:18:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D49BB7456FE;
 Sat, 26 Feb 2022 18:18:14 +0100 (CET)
Date: Sat, 26 Feb 2022 18:18:14 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Use the standard about panel
In-Reply-To: <20220226125630.92909-1-akihiko.odaki@gmail.com>
Message-ID: <15732fa4-8db3-bcc5-10a2-82c6d2e035e3@eik.bme.hu>
References: <20220226125630.92909-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 26 Feb 2022, Akihiko Odaki wrote:
> This provides standard look and feel for the about panel and reduces
> code.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
> ui/cocoa.m | 112 +++++++++++------------------------------------------
> 1 file changed, 23 insertions(+), 89 deletions(-)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index a8f1cdaf926..9c27b9f5aa7 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -83,7 +83,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
>
> static void cocoa_refresh(DisplayChangeListener *dcl);
>
> -static NSWindow *normalWindow, *about_window;
> +static NSWindow *normalWindow;
> static const DisplayChangeListenerOps dcl_ops = {
>     .dpy_name          = "cocoa",
>     .dpy_gfx_update = cocoa_update,
> @@ -1120,7 +1120,6 @@ - (void)changeDeviceMedia:(id)sender;
> - (BOOL)verifyQuit;
> - (void)openDocumentation:(NSString *)filename;
> - (IBAction) do_about_menu_item: (id) sender;
> -- (void)make_about_window;
> - (void)adjustSpeed:(id)sender;
> @end
>
> @@ -1166,8 +1165,6 @@ - (id) init
>         [pauseLabel setFont: [NSFont fontWithName: @"Helvetica" size: 90]];
>         [pauseLabel setTextColor: [NSColor blackColor]];
>         [pauseLabel sizeToFit];
> -
> -        [self make_about_window];
>     }
>     return self;
> }
> @@ -1451,92 +1448,29 @@ - (BOOL)verifyQuit
> /* The action method for the About menu item */
> - (IBAction) do_about_menu_item: (id) sender
> {
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
> +    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

Extra space between * and pool?

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

It may be less redundant to init the oprions dict only with version and 
copyright first then have an if adding the icon key if exists but for that 
an NSMutableDictionary may be needed so not sure about that. It might 
still have less duplication that way.

Regards,
BALATON Zoltan

>     }
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
> }
>
> /* Used by the Speed menu items */
>

