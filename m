Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A33576D48
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 12:17:43 +0200 (CEST)
Received: from localhost ([::1]:46256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCerl-0000Yr-SO
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 06:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oCeqK-0007Zy-J2
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 06:16:12 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:45692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oCeqI-0005XO-2T
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 06:16:11 -0400
Received: by mail-ej1-x62e.google.com with SMTP id fy29so11757482ejc.12
 for <qemu-devel@nongnu.org>; Sat, 16 Jul 2022 03:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O+ThbjmzwJvb3OwXb5xPXcMlugYZJxRUhr6crAozHoM=;
 b=ZplrCS+tex2xdctWzO91T/4yLkLmip4ICO+txTQHXUyv7p1jBe42ZMBSudDoSi2ovw
 1APY92wh3tMIiq8X9IfhZH1OQFzNhe8+muxudAY7uATYv/I3K/VVRFr4fJFPwTlrv3X8
 7YJa/6sRMr7TtBBi9UC/KeLHJRMfXn8Jepn6nx5nhN4bvSjBP4xM/gzF/ppu33YL7zUs
 tFHfCfA3/LyjQXheCocKuXYPVEuJDwEjJCk/YsBccTpLXOaz8e2jlZmhWewUKglSSFq8
 1nvzHeGPIq28lX42YRkmb3OoRjGOVZbrSkfSkQZIswJm+4cMzUREnAJBl2PNp5b8Pw/H
 1ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O+ThbjmzwJvb3OwXb5xPXcMlugYZJxRUhr6crAozHoM=;
 b=o3YLZ5LHvqcfkpCsgJxrvXU6oDXPtIquITc7rSndBiBQkrOHLs92mstQFgGb0eWR5x
 NjexxIUzabbJQyeC3xzo4ZYGeZcPd6eNO7Qua1S4UVam4E6jLSCVzpjsn1OO5YZFwsmT
 Yt/dySgz4wztmpI8lb7tS73pPAs5ODQDMXqXKq1MUTHgvlA3n045nUBZXtad/CX40brS
 gy1jgaUEXqm8YeHnkyYabh2foQBUseCffuDnyGOpvpWl53EEaORKmDvNws3JrSCbae/K
 De0aYo9Z2cI7ZrBQVKca/PdLG7GGyWORVdLp6d+wsLFNXu4XNTLe4kp2XiMbwVck09tZ
 L4/g==
X-Gm-Message-State: AJIora9lTGlDZtsqnWbYOCRXbFeJZUVaPx9AKcNbv26ySAvIwPD2mWW+
 YqYKQXJBI/T7P8cHNSmzyug=
X-Google-Smtp-Source: AGRyM1tEDuOMEoXrT2tL4sQik5BV3ar96ursBwh2DFvsSKGS8xdXMi5Cr45aHGjjVko6ZAr0FZQaUQ==
X-Received: by 2002:a17:906:9bd1:b0:72b:302:2b88 with SMTP id
 de17-20020a1709069bd100b0072b03022b88mr17756165ejc.250.1657966568093; 
 Sat, 16 Jul 2022 03:16:08 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 k8-20020a056402048800b00435a08a3557sm4398520edv.27.2022.07.16.03.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jul 2022 03:16:06 -0700 (PDT)
Message-ID: <675d98f9-9045-5bf9-27c7-c2d5cb0b088d@redhat.com>
Date: Sat, 16 Jul 2022 12:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/3] ui/cocoa: Run qemu_init in the main thread
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220715134750.63090-1-akihiko.odaki@gmail.com>
 <20220715134750.63090-2-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220715134750.63090-2-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/15/22 15:47, Akihiko Odaki wrote:
>   static void *call_qemu_main(void *opaque)
>   {
>      ...
> +    [NSApp terminate:nil];
>   
Is this thread-safe?  I think it should be something like:

- here:

     /*
      * Nothing more to do in the QEMU thread, ask the application
      * to exit.
      */
     dispatch_async(dispatch_get_main_queue(), ^{
         [NSApp terminate: nil];
     });

- in verifyQuit:

     if([alert runModal] == NSAlertSecondButtonReturn) {
         with_iothread_lock(^{
             shutdown_action = SHUTDOWN_ACTION_POWEROFF;
             qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
         });
     }
     /* and just return void */

- applicationShouldTerminate: should be just

     if (qatomic_read(&qemu_main_terminating)) {
         return NSTerminateNow;
     } else {
         dispatch_async(dispatch_get_main_queue(), ^{
             [self verifyQuit];
         });
     }
     return NSTerminateCancel;

- applicationWillTerminate: can be just the qemu_thread_join

Paolo

