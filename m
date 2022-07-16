Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A39576D80
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 13:33:13 +0200 (CEST)
Received: from localhost ([::1]:51506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCg2p-0003vY-Sl
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 07:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCg0L-0001js-VW
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:30:38 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:33574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCg0K-0006YW-8l
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 07:30:37 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 j1-20020a17090aeb0100b001ef777a7befso9846572pjz.0
 for <qemu-devel@nongnu.org>; Sat, 16 Jul 2022 04:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qeRLWE2lp3TFDPGvXakuuNSdG/2fbYtyhsuKcJo8pd8=;
 b=axNSqTMQsLOVdPg88D+HJg3V5oQBfCHHdiC9BDigco2z+ZpYBLsEPEgRKCqZnL9Qdj
 jQC+Qod4yHYHtCVu1Kk8Sg8TVNSFeIKGz5KG94NfGo45NJszUviCr5lO3xfplJMFJ3T/
 ti9z5Read1QPSLNWzpo5e0viHxvuc3tSqogtCM/dLQz9mYPUlxe1lznm0lILatntyu0u
 fQM9r1OQRdKAUvTgmQTeucSZ7n/VYcsZ1OYqc/pi42v2DwBLCmI//bvabpcRNUY6bjI0
 dUR+ayEqvMBfwZPPIwaAPNxjTNl4ufYObz04/uHRpfgrX8dA06I+sAMxzStuP8oe0/Ld
 fqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qeRLWE2lp3TFDPGvXakuuNSdG/2fbYtyhsuKcJo8pd8=;
 b=2iYflSqaZR8WuvlfEuQ5SPtiQXpEx1lRtEL+WuaG0mDX9MGFdJCMyfWAoNSBjU58bP
 zk+J9DH2eq5VsjtMSbJqKXJg+FjN58fjf3cGxegEzGYwHKby5S2irWT1pM02Z9jgGSo5
 xz26ktfk1eChx9ga2m2eC54y6V6sAIyemwIl1bEsuvwgeJlk9o7bxcO0XGY9tVpnglb3
 Q8/sljsCY2HNooVYowb92qHO0Mhomr20bsxAO0+qocqhnIYELuHGKOqk+eXifiA6ytG9
 QBzYOUW/USYyw1QXXcaeYb9CN5FDR0EJ9DMAuAgOwYDbpnvAgC2pZSPBuCGXEgwHkvOd
 sVfg==
X-Gm-Message-State: AJIora/V0Y/ewPgnOh4dHacZKIoJ+fDz3y3lQl8Kciy+SCw+wHG4Tg1n
 gK+Y5uYs0oaadZKFxvWCtnw=
X-Google-Smtp-Source: AGRyM1t2dkNiOlCLFMdjyGNrTtfxkmrRPCju6PJ31zrD7qYXJWaXG67KaaH5Nt6l8YxZo7M5ULNNPg==
X-Received: by 2002:a17:90a:8b8d:b0:1f0:4366:6158 with SMTP id
 z13-20020a17090a8b8d00b001f043666158mr27621262pjn.167.1657971034962; 
 Sat, 16 Jul 2022 04:30:34 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a170902e54100b0015e8d4eb219sm5383662plf.99.2022.07.16.04.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jul 2022 04:30:33 -0700 (PDT)
Message-ID: <2704624f-6e89-1938-e54f-f5ddcb0daf6e@gmail.com>
Date: Sat, 16 Jul 2022 20:30:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/3] ui/cocoa: Run qemu_init in the main thread
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220715134750.63090-1-akihiko.odaki@gmail.com>
 <20220715134750.63090-2-akihiko.odaki@gmail.com>
 <675d98f9-9045-5bf9-27c7-c2d5cb0b088d@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <675d98f9-9045-5bf9-27c7-c2d5cb0b088d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1029.google.com
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

On 2022/07/16 19:16, Paolo Bonzini wrote:
> On 7/15/22 15:47, Akihiko Odaki wrote:
>>   static void *call_qemu_main(void *opaque)
>>   {
>>      ...
>> +    [NSApp terminate:nil];
> Is this thread-safe?  I think it should be something like:

Yes, -[NSApplication terminate:] is thread-safe. Methods of 
NSApplication handle dispatches to the main thread by themselves.

Regards,
Akihiko Odaki

> 
> - here:
> 
>      /*
>       * Nothing more to do in the QEMU thread, ask the application
>       * to exit.
>       */
>      dispatch_async(dispatch_get_main_queue(), ^{
>          [NSApp terminate: nil];
>      });
> 
> - in verifyQuit:
> 
>      if([alert runModal] == NSAlertSecondButtonReturn) {
>          with_iothread_lock(^{
>              shutdown_action = SHUTDOWN_ACTION_POWEROFF;
>              qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
>          });
>      }
>      /* and just return void */
> 
> - applicationShouldTerminate: should be just
> 
>      if (qatomic_read(&qemu_main_terminating)) {
>          return NSTerminateNow;
>      } else {
>          dispatch_async(dispatch_get_main_queue(), ^{
>              [self verifyQuit];
>          });
>      }
>      return NSTerminateCancel;
> 
> - applicationWillTerminate: can be just the qemu_thread_join
> 
> Paolo


