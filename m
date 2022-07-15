Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D4A5762AE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:21:30 +0200 (CEST)
Received: from localhost ([::1]:41170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCLG5-0007x5-Gi
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCLEX-0006RV-6K
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:19:53 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCLEV-00028E-AG
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:19:52 -0400
Received: by mail-pf1-x435.google.com with SMTP id w185so4656855pfb.4
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PQG8an8NpnvNuzOKk+Wwj7CyyHhGBLeRn+6kqJ0OePA=;
 b=HeR5ir9+UUEglyab+o2sx00vw/4vJnx/fjpasCJe5SxNh5FuOIvBTev9v++xXJ2zN6
 8nwKC5/XOoXoQa4Wqmp2rukGroUAA20OF/WqeidPBzvBcz6ikv7q3CDv/yBERE6PzZXe
 AHwgA1Jz3GjuoskbiqxfU0VuvPupOJmOd9ByEX1VTMv9c6yI/HWsrKHyQcAo6VCro7sw
 WYMWupGwZjP2yuc8efdhOyWRJR5eK1kUAvAOJrGeEfFs/AY3mkuDvenQC39Nn6x/5/Ot
 DfRNk/fB6tZ+Xg5YUx4XDZgAIEL7Z4rzncj1/jR7hIt5LiQQGQ1rBBtHajTNVLBKK8h6
 x8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PQG8an8NpnvNuzOKk+Wwj7CyyHhGBLeRn+6kqJ0OePA=;
 b=fdHiWwsQ/4YT/mnVBXWtCp/OLcOpZugiukh8pkUBocu1iLplZkiZqtOJwFEw59a6zm
 t56lBKqya0kIdcIpETQnwUv1NmgX2e4jWj0EMWncFW13PWlxG/U5sLNSAiSbSL3gJrOW
 nGv4z4Z0kS6NY5/CWv3WI2Cx2WFoB6fs+wpSdZ9rDYWEBKgBb7BsuG3pmwIRTLRtnLKx
 MDtsAtN3GHVmdJZoMY8VQZQSNY5Gts580jvfn1J0TaQu0+5XTsIjOOJh+mny7iRC6d41
 qwLbXYNmGNd4r0r7dP38QKCS6EqDGQ06D6fxIw6/3MmEFMaYSgF0G/LtWCZAISQX/qI2
 mwqw==
X-Gm-Message-State: AJIora+UxTmyJrvgTDTNsa2ksCl1W0stswj0MaPNrV/ZkrdD4Ss0HJ6n
 l7O4Pq5HXskuGgxDA4j0xl4=
X-Google-Smtp-Source: AGRyM1tJDgkwvE4a1s/3E5Tq851e94tXU2T0NGHidrzqUQFKk5KKrdXKr/ShpBzt0zq9oa+zDUHzSA==
X-Received: by 2002:a63:2051:0:b0:412:6d61:ab0a with SMTP id
 r17-20020a632051000000b004126d61ab0amr12621446pgm.52.1657891189727; 
 Fri, 15 Jul 2022 06:19:49 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170903124a00b0016bf01394e1sm3549902plh.124.2022.07.15.06.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 06:19:48 -0700 (PDT)
Message-ID: <d6f14a76-d0c6-f5b9-93bd-2235b3a5383c@gmail.com>
Date: Fri, 15 Jul 2022 22:19:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] ui/cocoa: Run qemu_init in the main thread
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220715114039.59790-1-akihiko.odaki@gmail.com>
 <20220715114039.59790-2-akihiko.odaki@gmail.com>
 <CAFEAcA96_AX=UDrY=69kaSLvh+8DsEjzpkt=maL5r-O4e1wH5g@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAFEAcA96_AX=UDrY=69kaSLvh+8DsEjzpkt=maL5r-O4e1wH5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2022/07/15 22:10, Peter Maydell wrote:
> On Fri, 15 Jul 2022 at 12:40, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
>> This work is based on:
>> https://patchew.org/QEMU/20220317125534.38706-1-philippe.mathieu.daude@gmail.com/
>>
>> Simplify the initialization dance by running qemu_init() in the main
>> thread before the Cocoa event loop starts. The secondary thread only
>> runs only qemu_main_loop() and qemu_cleanup().
>>
>> This fixes a case where addRemovableDevicesMenuItems() calls
>> qmp_query_block() while expecting the main thread to still hold
>> the BQL.
>>
>> Overriding the code after calling qemu_init() is done by dynamically
>> replacing a function pointer variable, qemu_main when initializing
>> ui/cocoa, which unifies the static implementation of main() for
>> builds with ui/cocoa and ones without ui/cocoa.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> 
>> @@ -585,7 +583,7 @@ - (void) updateUIInfo
>>           /*
>>            * Don't try to tell QEMU about UI information in the application
>>            * startup phase -- we haven't yet registered dcl with the QEMU UI
>> -         * layer, and also trying to take the iothread lock would deadlock.
>> +         * layer.
>>            * When cocoa_display_init() does register the dcl, the UI layer
>>            * will call cocoa_switch(), which will call updateUIInfo, so
>>            * we don't lose any information here.
> 
> This comment says that we can't use the dcl while allow_events is false...
> 
>> @@ -778,16 +776,6 @@ - (void) handleMonitorInput:(NSEvent *)event
>>
>>   - (bool) handleEvent:(NSEvent *)event
>>   {
>> -    if(!allow_events) {
>> -        /*
>> -         * Just let OSX have all events that arrive before
>> -         * applicationDidFinishLaunching.
>> -         * This avoids a deadlock on the iothread lock, which cocoa_display_init()
>> -         * will not drop until after the app_started_sem is posted. (In theory
>> -         * there should not be any such events, but OSX Catalina now emits some.)
>> -         */
>> -        return false;
>> -    }
> 
> ...so don't we want to also retain this check of allow_events ?
> Much of the code in handleEventLocked assumes the dcl has been registered.
> 
>>       return bool_with_iothread_lock(^{
>>           return [self handleEventLocked:event];
>>       });
> 
>> @@ -1915,92 +1898,35 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
>>   /*
>>    * The startup process for the OSX/Cocoa UI is complicated, because
>>    * OSX insists that the UI runs on the initial main thread, and so we
>> - * need to start a second thread which runs the vl.c qemu_main():
>> - *
>> - * Initial thread:                    2nd thread:
>> - * in main():
>> - *  create qemu-main thread
>> - *  wait on display_init semaphore
>> - *                                    call qemu_main()
>> - *                                    ...
>> - *                                    in cocoa_display_init():
>> - *                                     post the display_init semaphore
>> - *                                     wait on app_started semaphore
>> - *  create application, menus, etc
>> - *  enter OSX run loop
>> - * in applicationDidFinishLaunching:
>> - *  post app_started semaphore
>> - *                                     tell main thread to fullscreen if needed
>> - *                                    [...]
>> - *                                    run qemu main-loop
>> - *
>> - * We do this in two stages so that we don't do the creation of the
>> - * GUI application menus and so on for command line options like --help
>> - * where we want to just print text to stdout and exit immediately.
> 
> Could we have an updated version of this diagram that explains the
> new startup process, please ?

I don't think the diagram is appropriate anymore. It was necessary to 
describe the synchronization between the initial thread and the second 
thread, but they do no longer synchronize at all.

Regards,
Akihiko Odaki

> 
>> + * need to start a second thread which runs the qemu_default_main().
>>    */
> 
> Otherwise this looks good, and it's nice to get rid of that redefine-main
> hack.
> 
> thanks
> -- PMM


