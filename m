Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954F257870B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:11:29 +0200 (CEST)
Received: from localhost ([::1]:44710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTLE-0004fm-HM
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDTJP-0002Oo-Ij
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:09:35 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDTJN-00078t-EE
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:09:35 -0400
Received: by mail-ej1-x632.google.com with SMTP id sz17so22113801ejc.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 09:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5cQo3KSs75TrmVPLaDFYxrgxajK45PCpg7/Vc6a584c=;
 b=APn30bbfXsew1bCOGpw+XqbGlbrwlpeF4pTuv58bokdZn0VtFymE017dGiBntBKLAF
 hcJ3+QJ9E0YOiHEHKbh0oa4PopCpOpUtWj3OidIIpL2Vnt42r3vaM2lgHDM3RrhjAphr
 M7QUjpQ7v6mL74tkemElqG3/toLvQJ8yH36lsiuT1rO7FhgZCGBRpQePDL1XZq/m7488
 qyWx5VJtKl36g9l6IOvwr1OagppAqYYDEAs5/a4eqsZTDItdKpItyCvDcQxAL3NgT5FX
 hBH6MXxp6WCFhi9cmmzP+7tjnH7IEXXxMFDR2Qi3I279TvJ+4kgYWRgnOclcl3k4cZXl
 jyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5cQo3KSs75TrmVPLaDFYxrgxajK45PCpg7/Vc6a584c=;
 b=f4XU0dwgDd4JhhywIyca41tx5vOeh3ZscbV/SAQNF9RDcSnG1xpgovfOT3k+y4QpMn
 eTFSatcERbZmbz2aiCLSWtOu/+wpUbdwEh8bI2wze2kPM4Rt1cnhRd1foTsmy/MyzBTU
 S+v0xxqy/KzTuz3+54BtP/5AqCkvq492mE+skqN0p9cX9Cur70m5UGXmWppy5nBe14qB
 8CwpsQAwEcdUOeApjrv2thPxParmPJBL19Vh1ZgS/sIGHd6s+tz41MGc7xoOI92qFFyp
 EGDrVKrtsYInkfucw2bw91KL2rSxfkmjJyrBMsxcGPWAzKiohRrnkIMkA9mh56fqX0Yz
 fFQQ==
X-Gm-Message-State: AJIora9RD4x/rzDP+XjHTcMAGtRgJysIU93w7yCU41CvW1WMIuiUhyW5
 tRNwV27nCLd1KNh+W0KruJY=
X-Google-Smtp-Source: AGRyM1s4TK858WF9S2x5mEpo/gdgx71nIkdjiaWNcC6fdR7RYNbXoHOj1G63O2RHf1cvvt/NG7C/lg==
X-Received: by 2002:a17:907:7615:b0:72b:35a6:5992 with SMTP id
 jx21-20020a170907761500b0072b35a65992mr26051252ejc.97.1658160571598; 
 Mon, 18 Jul 2022 09:09:31 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 g12-20020a056402114c00b0043a71775903sm8843003edw.39.2022.07.18.09.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 09:09:30 -0700 (PDT)
Message-ID: <2a1c39eb-a9fe-c9c0-3f77-4b490e1197e9@redhat.com>
Date: Mon, 18 Jul 2022 18:09:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/3] ui/cocoa: Run qemu_init in the main thread
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220717073340.25830-1-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220717073340.25830-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
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

On 7/17/22 09:33, Akihiko Odaki wrote:
> This work is based on:
> https://patchew.org/QEMU/20220317125534.38706-1-philippe.mathieu.daude@gmail.com/
> 
> Simplify the initialization dance by running qemu_init() in the main
> thread before the Cocoa event loop starts. The secondary thread only
> runs only qemu_main_loop() and qemu_cleanup().
> 
> This fixes a case where addRemovableDevicesMenuItems() calls
> qmp_query_block() while expecting the main thread to still hold
> the BQL.
> 
> Overriding the code after calling qemu_init() is done by dynamically
> replacing a function pointer variable, qemu_main when initializing
> ui/cocoa, which unifies the static implementation of main() for
> builds with ui/cocoa and ones without ui/cocoa.
> 
> v4: Asynchronously call -[NSApplication terminate:] to avoid potential
>      deadlock with qemu_thread_join(). (Paolo Bonzini)
> 
> v3: Document functions involved in startup. (Peter Maydell)
> 
> v2: Restore allow_events flag to fix the crash reported by
>      Philippe Mathieu-Daudé.
> 
> Akihiko Odaki (3):
>    ui/cocoa: Run qemu_init in the main thread
>    Revert "main-loop: Disable block backend global state assertion on
>      Cocoa"
>    meson: Allow to enable gtk and sdl while cocoa is enabled
> 
>   docs/devel/fuzzing.rst   |   4 +-
>   include/qemu-main.h      |   3 +-
>   include/qemu/main-loop.h |  13 ---
>   include/sysemu/sysemu.h  |   2 +-
>   meson.build              |  10 +--
>   softmmu/main.c           |  14 ++--
>   softmmu/vl.c             |   2 +-
>   tests/qtest/fuzz/fuzz.c  |   2 +-
>   ui/cocoa.m               | 168 ++++++++++++++-------------------------
>   9 files changed, 76 insertions(+), 142 deletions(-)
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks for continuing this work!

Paolo

