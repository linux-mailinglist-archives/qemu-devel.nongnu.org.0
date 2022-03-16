Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FCA4DB72F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 18:32:51 +0100 (CET)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUXVw-0001gO-P6
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 13:32:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUXUW-0000sN-31
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:31:20 -0400
Received: from [2a00:1450:4864:20::533] (port=43921
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUXUU-0005Hx-Fz
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:31:19 -0400
Received: by mail-ed1-x533.google.com with SMTP id b24so3625657edu.10
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 10:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Do4+wqZaOCqJGdy7pxnnjO43ulqBgbU8ltdZse/l8A=;
 b=jabUbMP/PI82TPsSux4DWbh6lKYWcZw3o2Ky8jDlGDwfAYK7bAEdFwi1bjhqriR7oL
 1fIkArzRnhFIp/jfBQ30N/Mf3xwzQXmckhi9j5w6lmo/hb+GR1Enir8g+TqtTqKxZPSO
 csSq8VtTuxKGRIBhbtmXJ+RJuF/pX9bTRwEPs6jNvbt6S9olIXe+eq3InR5VvnPCc3Nf
 tIa1/JIEqhVOmU10KkB1BycpHo0mvRqv/xyXYe1dR49bfMUCDZ3EbNbm8IjR/QvkJGZJ
 gtC8XIvRXp9Qi69kwEM++3/Tqvxhm/1r6/fg2shDuemUIdQO3QTtaIZzw+9yleWx7nZS
 ecTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Do4+wqZaOCqJGdy7pxnnjO43ulqBgbU8ltdZse/l8A=;
 b=LtDMzzdogOIUkvjEZSf3blMYZFVOZqqhUOzdeHs59u7+ASc/rbj5+U2zph2e57MxKF
 aYKDVr6rBJCWAWPlGNQa4Bc79s8KzkBX2MP6uGrac6mbmrKt3ydxA0yyz0Zx2biVn6OX
 3+j0LVrNqzozxMf85p9tZ6v/lLh3rfcHqL1gEsFDWtf7KNDIMr9eu6ADUXor6OwOuutZ
 lBHKMv72aIRLU5zY56lKRYLdm+7ADZyQC2i4IoHDDNuVFgEA0m6rXKX1mDY1HDbUXaiS
 zI1B/I7JtGgVejMioTGRS7eXzmtJH9sJDFxPqgPX28HpQ8htJNxwQOosDLDVtDwTMr5N
 34WQ==
X-Gm-Message-State: AOAM5305ziySivdeU0GCstWFsslPr7kAB+P1QO6YtBZaKw9hbhdAqjgT
 pUpRbTFtMmV7SApq+rP/R3Y=
X-Google-Smtp-Source: ABdhPJx3ywy4+AZMAxVrT2cHL/RgaCONtB2Pk/qpLi3RUKJccFLrUkFymRCZeR52yiGBuRs/KKokOA==
X-Received: by 2002:a05:6402:d5d:b0:415:e9c0:cb63 with SMTP id
 ec29-20020a0564020d5d00b00415e9c0cb63mr589840edb.326.1647451876436; 
 Wed, 16 Mar 2022 10:31:16 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a170906a18400b006db0a78bde8sm1174920ejy.87.2022.03.16.10.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 10:31:15 -0700 (PDT)
Message-ID: <f7fb6c55-60ba-f510-b9cc-8a257859072e@redhat.com>
Date: Wed, 16 Mar 2022 18:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH-for-7.0 v2] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org
References: <20220316160300.85438-1-philippe.mathieu.daude@gmail.com>
 <e1a5b41b-708d-ef3b-4c9b-8b2469cf4a92@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <e1a5b41b-708d-ef3b-4c9b-8b2469cf4a92@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/22 17:22, Akihiko Odaki wrote:
> I was thinking that it may be better to let softmmu/main.c do the 
> details if it involves the internals of qemu_main() like qemu_main_loop().
> 
> More concretely, softmmu/main.c would provide a function to register a 
> function pointer to take over the main thread. main() implemented in 
> softmmu/main.c would call qemu_init(). If a function pointer gets 
> registered in qemu_init(), it would create a thread for main loop and 
> call the registered function pointer. Otherwise, it would directly call 
> qemu_main_loop().
> 
> It would be a semantically appropriate division of ui/cocoa.m and 
> softmmu/main.c. It would also be beneficial for end-users as it would 
> also allow to isolate ui/cocoa.m into a separate module when 
> --enable-modules in the future. (With "In the future", I mean sometime 
> when we have time to hack Meson build files and some details we cannot 
> fill by 7.0.)

I would like this for 7.1.

Basically rename qemu_main_loop to qemu_default_main_loop, and 
cocoa_display_init would do

     qemu_main_loop = qemu_cocoa_main_loop;

qemu_cocoa_main_loop would include the bulk of the current main of 
ui/cocoa.m.  Seems like a good idea.

Paolo

