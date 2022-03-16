Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EAB4DB612
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 17:23:54 +0100 (CET)
Received: from localhost ([::1]:37956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUWRF-0000SA-16
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 12:23:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUWQ7-0008C0-HY
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:22:43 -0400
Received: from [2607:f8b0:4864:20::42b] (port=42650
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nUWQ5-00027z-Cs
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:22:43 -0400
Received: by mail-pf1-x42b.google.com with SMTP id g19so4390306pfc.9
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MNdWO1vAY48bRXlO6DSpSf78yjaMicNBNWwlifaES/0=;
 b=Zle+ergKo+qcimV7/rDTcqgaaMGy7UZeaQyPOwxO5yGQetwRgAhSsa8Nmz2lPoWwAM
 l4yew2mzI1RLH4GzfeowjC5GbHNyS7+QzywroQG2bJLe2wNPTMNqNrfKm7S5f8j2oMTP
 dC2o/l9enD0s8XH5BaEEn2c0U1TXOpXi44k5LfQ0QQF9PJrpLBUOvM17v8W8tdHKOby4
 IDmPsQs/WfbylnwJImFzWK1+bIZlUqVPXkS7pnCekLth96OqxVZmTuth2FDe51BNytBM
 GlmZgmRWkpLzodAuR73uuUyLc/YPYoMitog61aF+jCsUPtfgtuu6kwP+7X8YPbSZHiLH
 fAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MNdWO1vAY48bRXlO6DSpSf78yjaMicNBNWwlifaES/0=;
 b=RKvZXuqVRV6T2vjitH9TzBiQ2/N8QBKPUNDypT05Jox8a5fNXo5TxvkU9ohJEvKqlG
 1pFSOBIjTByGSvUiaXbqOFUuzk/67mZWH+1SXGqkexT5DqgpcjeIcj+wXw9ZSrVDo7Ob
 F5kmvwzHiV74fZC03mymMqV1M+HyelzTtRCLjBYLrmn+gRJgv5e1tt4tId9lYShjGnG1
 z2ZQDENDfuKA+39aS3ihZoJOOINvhrM+LeMA4SHigNEyxUqGGw9cbdD0TjnsWMjz24FD
 njQGvoPn8WvooF0jYZPLKpXovcfq2mglSfmSGVPFKkDzTdHdyHvIoM5pnyjKTwyDp+B7
 F9jQ==
X-Gm-Message-State: AOAM533h1Ul0dpj9EALG7EszimAdkf8py765BT1mCTZEmKT9Szg7NWz7
 uhnBQ4aNKBb6h0GuIdjNKZM=
X-Google-Smtp-Source: ABdhPJxRn5W20Wx964vqwffSBvUAW4cmDEem087U61EyM/3L9q0JiEERJGTQGbW2OpA+CgAUc8FaGg==
X-Received: by 2002:a63:fe4c:0:b0:381:c3d5:e318 with SMTP id
 x12-20020a63fe4c000000b00381c3d5e318mr286003pgj.343.1647447759780; 
 Wed, 16 Mar 2022 09:22:39 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a056a00199300b004f7b7bb0733sm3742714pfl.60.2022.03.16.09.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 09:22:39 -0700 (PDT)
Message-ID: <e1a5b41b-708d-ef3b-4c9b-8b2469cf4a92@gmail.com>
Date: Thu, 17 Mar 2022 01:22:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH-for-7.0 v2] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220316160300.85438-1-philippe.mathieu.daude@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220316160300.85438-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/17 1:03, Philippe Mathieu-Daudé wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Simplify the initialization dance by running qemu_init() in the main
> thread before the Cocoa event loop starts.  The cocoa_display_init()
> code that is post-applicationDidFinishLaunching: moves to the
> application delegate itself, and the secondary thread only runs
> the rest of qemu_main(), namely qemu_main_loop() and qemu_cleanup().
> 
> This fixes a case where addRemovableDevicesMenuItems() calls
> qmp_query_block() while expecting the main thread to still hold
> the BQL.  The newly-introduced assertions in the block layer
> complain about this.

I was thinking that it may be better to let softmmu/main.c do the 
details if it involves the internals of qemu_main() like qemu_main_loop().

More concretely, softmmu/main.c would provide a function to register a 
function pointer to take over the main thread. main() implemented in 
softmmu/main.c would call qemu_init(). If a function pointer gets 
registered in qemu_init(), it would create a thread for main loop and 
call the registered function pointer. Otherwise, it would directly call 
qemu_main_loop().

It would be a semantically appropriate division of ui/cocoa.m and 
softmmu/main.c. It would also be beneficial for end-users as it would 
also allow to isolate ui/cocoa.m into a separate module when 
--enable-modules in the future. (With "In the future", I mean sometime 
when we have time to hack Meson build files and some details we cannot 
fill by 7.0.)

Regards,
Akihiko Odaki

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20220307151004.578069-1-pbonzini@redhat.com>
> [PMD: Fixed trivial build failures & rebased]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> v1: https://lore.kernel.org/qemu-devel/20220307151004.578069-1-pbonzini@redhat.com/
> ---
>   softmmu/main.c |  12 ++--
>   ui/cocoa.m     | 153 ++++++++++++++++++++++---------------------------
>   2 files changed, 74 insertions(+), 91 deletions(-)
> 
> diff --git a/softmmu/main.c b/softmmu/main.c
> index 639c67ff48..0c4384e980 100644
> --- a/softmmu/main.c
> +++ b/softmmu/main.c
> @@ -39,16 +39,18 @@ int main(int argc, char **argv)
>   #endif
>   #endif /* CONFIG_SDL */
>   
> -#ifdef CONFIG_COCOA
> -#undef main
> -#define main qemu_main
> -#endif /* CONFIG_COCOA */
> -
> +#ifndef CONFIG_COCOA
>   int main(int argc, char **argv, char **envp)
>   {
> +    /*
> +     * ui/cocoa.m relies on this being the exact content of main(),
> +     * because it has to run everything after qemu_init in a secondary
> +     * thread.
> +     */
>       qemu_init(argc, argv, envp);
>       qemu_main_loop();
>       qemu_cleanup();
>   
>       return 0;
>   }
> +#endif /* CONFIG_COCOA */
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index cb6e7c41dc..e69ce97f44 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -75,6 +75,9 @@ typedef struct {
>       int height;
>   } QEMUScreen;
>   
> +@interface QemuCocoaPasteboardTypeOwner : NSObject<NSPasteboardTypeOwner>
> +@end
> +
>   static void cocoa_update(DisplayChangeListener *dcl,
>                            int x, int y, int w, int h);
>   
> @@ -97,20 +100,23 @@ static int last_buttons;
>   static int cursor_hide = 1;
>   static int left_command_key_enabled = 1;
>   static bool swap_opt_cmd;
> +static bool full_screen;
> +static bool full_grab;
> +static bool have_cocoa_ui;
>   
> -static int gArgc;
> -static char **gArgv;
>   static bool stretch_video;
>   static NSTextField *pauseLabel;
>   
> -static QemuSemaphore display_init_sem;
> -static QemuSemaphore app_started_sem;
>   static bool allow_events;
>   
>   static NSInteger cbchangecount = -1;
>   static QemuClipboardInfo *cbinfo;
>   static QemuEvent cbevent;
>   
> +static QemuCocoaPasteboardTypeOwner *cbowner;
> +static QemuClipboardPeer cbpeer;
> +static QemuThread main_thread;
> +
>   // Utility functions to run specified code block with iothread lock held
>   typedef void (^CodeBlock)(void);
>   typedef bool (^BoolCodeBlock)(void);
> @@ -142,6 +148,33 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
>       return val;
>   }
>   
> +/*
> + * The startup process for the OSX/Cocoa UI is complicated, because
> + * OSX insists that the UI runs on the initial main thread, and so we
> + * need to start a second thread which runs qemu_main_loop():
> + *
> + * Initial thread:                    2nd thread:
> + * in main():
> + *  qemu_init()
> + *  create application, menus, etc
> + *  enter OSX run loop
> + * in applicationDidFinishLaunching:
> + *  fullscreen if needed
> + *  create main loop thread
> + *                                    call qemu_main_loop()
> + */
> +
> +static void *call_qemu_main_loop(void *opaque)
> +{
> +    COCOA_DEBUG("Second thread: calling qemu_main()\n");
> +    qemu_mutex_lock_iothread();
> +    qemu_main_loop();
> +    COCOA_DEBUG("Second thread: qemu_main_loop() returned, exiting\n");
> +    qemu_cleanup();
> +    [cbowner release];
> +    exit(0);
> +}
> +
>   // Mac to QKeyCode conversion
>   static const int mac_to_qkeycode_map[] = {
>       [kVK_ANSI_A] = Q_KEY_CODE_A,
> @@ -780,9 +813,7 @@ static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEven
>           /*
>            * Just let OSX have all events that arrive before
>            * applicationDidFinishLaunching.
> -         * This avoids a deadlock on the iothread lock, which cocoa_display_init()
> -         * will not drop until after the app_started_sem is posted. (In theory
> -         * there should not be any such events, but OSX Catalina now emits some.)
> +         * This may not be needed anymore?
>            */
>           return false;
>       }
> @@ -1280,8 +1311,22 @@ static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEven
>   {
>       COCOA_DEBUG("QemuCocoaAppController: applicationDidFinishLaunching\n");
>       allow_events = true;
> -    /* Tell cocoa_display_init to proceed */
> -    qemu_sem_post(&app_started_sem);
> +
> +    // register vga output callbacks
> +    register_displaychangelistener(&dcl);
> +
> +    qemu_clipboard_peer_register(&cbpeer);
> +    qemu_mutex_unlock_iothread();
> +    qemu_thread_create(&main_thread, "qemu_main_loop", call_qemu_main_loop,
> +                       NULL, QEMU_THREAD_DETACHED);
> +
> +    if (full_screen) {
> +        [NSApp activateIgnoringOtherApps: YES];
> +        [self toggleFullScreen: nil];
> +    }
> +    if (full_grab) {
> +        [self setFullGrab: nil];
> +    }
>   }
>   
>   - (void)applicationWillTerminate:(NSNotification *)aNotification
> @@ -1804,9 +1849,6 @@ static void addRemovableDevicesMenuItems(void)
>       qapi_free_BlockInfoList(pointerToFree);
>   }
>   
> -@interface QemuCocoaPasteboardTypeOwner : NSObject<NSPasteboardTypeOwner>
> -@end
> -
>   @implementation QemuCocoaPasteboardTypeOwner
>   
>   - (void)pasteboard:(NSPasteboard *)sender provideDataForType:(NSPasteboardType)type
> @@ -1841,8 +1883,6 @@ static void addRemovableDevicesMenuItems(void)
>   
>   @end
>   
> -static QemuCocoaPasteboardTypeOwner *cbowner;
> -
>   static void cocoa_clipboard_notify(Notifier *notifier, void *data);
>   static void cocoa_clipboard_request(QemuClipboardInfo *info,
>                                       QemuClipboardType type);
> @@ -1903,60 +1943,18 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
>       }
>   }
>   
> -/*
> - * The startup process for the OSX/Cocoa UI is complicated, because
> - * OSX insists that the UI runs on the initial main thread, and so we
> - * need to start a second thread which runs the vl.c qemu_main():
> - *
> - * Initial thread:                    2nd thread:
> - * in main():
> - *  create qemu-main thread
> - *  wait on display_init semaphore
> - *                                    call qemu_main()
> - *                                    ...
> - *                                    in cocoa_display_init():
> - *                                     post the display_init semaphore
> - *                                     wait on app_started semaphore
> - *  create application, menus, etc
> - *  enter OSX run loop
> - * in applicationDidFinishLaunching:
> - *  post app_started semaphore
> - *                                     tell main thread to fullscreen if needed
> - *                                    [...]
> - *                                    run qemu main-loop
> - *
> - * We do this in two stages so that we don't do the creation of the
> - * GUI application menus and so on for command line options like --help
> - * where we want to just print text to stdout and exit immediately.
> - */
> -
> -static void *call_qemu_main(void *opaque)
> +int main(int argc, char **argv, char **envp)
>   {
> -    int status;
> -
> -    COCOA_DEBUG("Second thread: calling qemu_main()\n");
> -    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
> -    COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
> -    [cbowner release];
> -    exit(status);
> -}
> -
> -int main (int argc, char **argv) {
> -    QemuThread thread;
> -
>       COCOA_DEBUG("Entered main()\n");
> -    gArgc = argc;
> -    gArgv = argv;
> +    qemu_event_init(&cbevent, false);
>   
> -    qemu_sem_init(&display_init_sem, 0);
> -    qemu_sem_init(&app_started_sem, 0);
> -
> -    qemu_thread_create(&thread, "qemu_main", call_qemu_main,
> -                       NULL, QEMU_THREAD_DETACHED);
> -
> -    COCOA_DEBUG("Main thread: waiting for display_init_sem\n");
> -    qemu_sem_wait(&display_init_sem);
> -    COCOA_DEBUG("Main thread: initializing app\n");
> +    /* Takes iothread lock, released in applicationDidFinishLaunching:.  */
> +    qemu_init(argc, argv, envp);
> +    if (!have_cocoa_ui) {
> +         qemu_main_loop();
> +         qemu_cleanup();
> +         return 0;
> +    }
>   
>       NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
>   
> @@ -1978,6 +1976,7 @@ int main (int argc, char **argv) {
>        */
>       add_console_menu_entries();
>       addRemovableDevicesMenuItems();
> +    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
>   
>       // Create an Application controller
>       QemuCocoaAppController *appController = [[QemuCocoaAppController alloc] init];
> @@ -2071,24 +2070,13 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
>   static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>   {
>       COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
> +    have_cocoa_ui = 1;
>   
> -    /* Tell main thread to go ahead and create the app and enter the run loop */
> -    qemu_sem_post(&display_init_sem);
> -    qemu_sem_wait(&app_started_sem);
> -    COCOA_DEBUG("cocoa_display_init: app start completed\n");
> -
> -    QemuCocoaAppController *controller = (QemuCocoaAppController *)[[NSApplication sharedApplication] delegate];
> -    /* if fullscreen mode is to be used */
>       if (opts->has_full_screen && opts->full_screen) {
> -        dispatch_async(dispatch_get_main_queue(), ^{
> -            [NSApp activateIgnoringOtherApps: YES];
> -            [controller toggleFullScreen: nil];
> -        });
> +        full_screen = 1;
>       }
>       if (opts->u.cocoa.has_full_grab && opts->u.cocoa.full_grab) {
> -        dispatch_async(dispatch_get_main_queue(), ^{
> -            [controller setFullGrab: nil];
> -        });
> +        full_grab = 1;
>       }
>   
>       if (opts->has_show_cursor && opts->show_cursor) {
> @@ -2101,13 +2089,6 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>       if (opts->u.cocoa.has_left_command_key && !opts->u.cocoa.left_command_key) {
>           left_command_key_enabled = 0;
>       }
> -
> -    // register vga output callbacks
> -    register_displaychangelistener(&dcl);
> -
> -    qemu_event_init(&cbevent, false);
> -    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
> -    qemu_clipboard_peer_register(&cbpeer);
>   }
>   
>   static QemuDisplay qemu_display_cocoa = {


