Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AFE4D0450
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:41:01 +0100 (CET)
Received: from localhost ([::1]:50408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGPs-0002YX-Fm
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRGOZ-00019J-69
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:39:39 -0500
Received: from [2a00:1450:4864:20::532] (port=37887
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRGOX-0006K9-Ab
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:39:38 -0500
Received: by mail-ed1-x532.google.com with SMTP id q17so20773457edd.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yo+4hSbkaq6P/VKKm+BuiQEn0O1WUyqaX4A/7q67KrQ=;
 b=bMQm5NEn3Sr/QmkNEiNJGvHpWgPAyehc/+/kfHZmpVze5aNFhUcnJ+2+XnZF8Elghq
 tRl9HNi/O3oAvwnaQ1uWlgNK8JIPataFCri4mQtECKbURbHxogFh/rB5A+hMqOQyFEvQ
 C77qaxjDj5PsjuEibWrVc/GhCM/ltNCkn3RfcO3Nl6qHrYfug2QCLHAAWjVThEcxdCxl
 xqP8c1Kd8+1bZz9CDn6z1l6o5ZyfGdvtWKQibA3imAeyICoa1V14Zj/x3XgMmZZdx+WG
 TxpZqKmByuWYmviQ+IQQHUEtDcVgle6KwsvFWPKVTtpDjI5HJwpvKnrehEusspjihAQU
 6QPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yo+4hSbkaq6P/VKKm+BuiQEn0O1WUyqaX4A/7q67KrQ=;
 b=esXDApsDuWV9ajmxXEVbBlwOyHi7te3e7OzViBfxwbF5OCSObOyXv7gmeivEa3ItEO
 Q1FTgoeh/Fe3nvLB0Bz/S0Y1tiX0hu7sIZpnixVOmbuPmcies+Kw1X8Qr2sq82u1HVIB
 iQTxqHbmy2HgLqQ2AhMrUg40PrfJ3CfIzD8zHCzLGIHB+ah62NBAJG9lxaGTtYFEzo5C
 gwuuW/JwZw40QaTIEXuMJdedxvJoX9rmsSkNowXgW7MD0VKWImDiGcXU/9XYubu1yEoj
 IAmJbJlKi3LmWbhYju0oYa5Dh/QrTiadcEf5K1Y8TFPtrZy5+pk4XL52znoyvgZyLqfx
 CCGw==
X-Gm-Message-State: AOAM532u0ahKs9Yd3GGoyzvbwLsYGx2CIaFBpni1MKPEP09E5YwYqfQQ
 2kAzJ7rwyeWMZr8VOTrBdFQ=
X-Google-Smtp-Source: ABdhPJxbspJKDiSg3ZzD4ipUQcoG5/Z5StbEkqETGRdBts1EPCs73+QZrP0ffXiAY6wvJSsULwXJBA==
X-Received: by 2002:a50:f1c9:0:b0:415:a0f6:147d with SMTP id
 y9-20020a50f1c9000000b00415a0f6147dmr11930973edl.247.1646671172954; 
 Mon, 07 Mar 2022 08:39:32 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 v2-20020a509d02000000b00412d53177a6sm6486378ede.20.2022.03.07.08.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 08:39:32 -0800 (PST)
Message-ID: <f306bf54-e1bf-8ad6-a041-b6793bcf085f@redhat.com>
Date: Mon, 7 Mar 2022 17:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC uncompiled PATCH] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
References: <20220307151004.578069-1-pbonzini@redhat.com>
 <59f773ed-9a1f-10ff-637e-b41848aa534d@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <59f773ed-9a1f-10ff-637e-b41848aa534d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 16:34, Akihiko Odaki wrote:
> Thanks for this interesting suggestion. However I don't think this 
> improves the situation much. The main contribution of this change is 
> that elimination of display_init_sem but it is still necessary for 
> command line usage of the executable.
> 
> display_init_sem is kind of overloaded has two roles. One is to tell 
> that the QEMU is ready to initialize the display. The other is to tell 
> if it is going to initialize the display, which would not happen when it 
> is used entirely in the command line. The former role can be eliminated 
> by waiting for qemu_init, but the latter cannot be.

This is easy to account for.  On top of this patch:

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 44d8ea7a39..3903fa4b9b 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -96,6 +96,7 @@ static DisplayChangeListener dcl = {
  static int last_buttons;
  static int cursor_hide = 1;
  static bool full_screen;
+static bool have_cocoa_ui;
  
  static bool stretch_video;
  static NSTextField *pauseLabel;
@@ -1899,6 +1900,11 @@ int main (int argc, char **argv) {
  
      /* Takes iothread lock, released in applicationDidFinishLaunching:.  */
      qemu_init(argc, argv);
+    if (!have_cocoa_ui) {
+         qemu_main_loop();
+         qemu_cleanup();
+         return 0;
+    }
  
      NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
@@ -2021,6 +2027,7 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
  static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
  {
      COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
+    have_cocoa_ui = 1;
      if (opts->has_full_screen && opts->full_screen) {
          full_screen = 1;
      }

Paolo

