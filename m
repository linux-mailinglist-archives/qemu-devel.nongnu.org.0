Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D5651DD50
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 18:13:45 +0200 (CEST)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn0aN-0003ek-No
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 12:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nn0Wz-0002SP-PG
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:10:14 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nn0Wx-0003N7-Uy
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:10:13 -0400
Received: by mail-ej1-x62f.google.com with SMTP id dk23so15348383ejb.8
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 09:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s5W/YkqXX+/eG4fp8Wo3NOOi3A9f/Q3PrFXhLSAJSTQ=;
 b=aK4LVphySqvuFj1jm/txcFSJSGa8Iub54gJSJ4Sz8K8zGGw2JJe1aEen0XT1M+psO9
 1mo9J7BT3rBxADI4UEMxSW6gkWYy5c9QBC80ruLvgC16pDc841WTBI7TAh/XWauTVth/
 5jpf/zFulh+P+dJ+b5sQpAMe9oMgvyEHYvSE6pfnp5OXeg1SuAmaRFZhIsDkyjNb25sX
 Gq1L1CWpNAdyQS1EH+qX9INC5E1UFj49XkWg8BUfocUNSKyb+h0KGtpfbzsErFBS2xLB
 vq5WL2RH8pcJxtU8ljinP1igcExhkP/2Tqobqdsa7G4HB7xYvmCB8tLsarNxEyPSAwLf
 GcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s5W/YkqXX+/eG4fp8Wo3NOOi3A9f/Q3PrFXhLSAJSTQ=;
 b=X/ypFinQsaMV4H1fo2lycvxqgwJuo/6HbJ3ukscObBTnzO5+dAnWXKVPA3a0Z4WnkC
 TQfda3hJrEK5ET46d0pyJMS5fmbz/BrXZ7we8qyJeQ2vLG5QbmQy9gQ5Kirq1UO1J/Vq
 ykoQMGy1E7Slxzw7vZqmTvgRU94eYuuc0anWeSrndbeCooIlaxsBzuO84QPQnHKJktPO
 nH7vId0uUjWEObIWYLHMM0EHydPyOb0gI5XwJh35OyDEKydGhRO2eklzFKR82Prhai9Y
 hsFLRMLy0K4UqVC+H2Gt765ZFa3Zja/aRsy0PQN3cv0sPjEzGKfCi/uemq2BqgCgQw+n
 WdKQ==
X-Gm-Message-State: AOAM530klRUN2+5kj4n/Osn+nw2fO1nXM2Y9sjfNe1MuU4aWqsO55a+Q
 tLjC/0zGqe7RxKmPAV49+mo=
X-Google-Smtp-Source: ABdhPJybLMp8DVOBb+sTkkjA/dKrmjHG7sVQD3fYuC9FIwiPkXsEoII9dFGybndomEPjR8kK4PJeWw==
X-Received: by 2002:a17:907:2394:b0:6f5:108c:a43 with SMTP id
 vf20-20020a170907239400b006f5108c0a43mr3617640ejb.28.1651853409642; 
 Fri, 06 May 2022 09:10:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 d2-20020a170907272200b006f3ef214e21sm2062361ejl.135.2022.05.06.09.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 09:10:08 -0700 (PDT)
Message-ID: <b754d9a3-1762-71d2-417a-3c61ae87f3de@redhat.com>
Date: Fri, 6 May 2022 18:10:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] Warn user if the vga flag is passed but no vga device
 is created
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, kraxel@redhat.com,
 qemu-devel@nongnu.org, Gautam Agrawal <gutamnagrawal@gmail.com>
References: <20220501122505.29202-1-gautamnagrawal@gmail.com>
 <YnUvpsaM0hwUSZvM@stefanha-x1.localdomain>
 <b16d2b2d-f086-636b-4da5-79d3134a4482@redhat.com>
 <CAFEAcA9rK6T03mkUrojf+Wz=UCiakibXtj56W0F=uuEjeqoZig@mail.gmail.com>
 <7551dedd-7417-6292-907b-28ff8304cd83@redhat.com>
 <CAFEAcA8i5t0i61HT0NEV5BHYEkK_ipSAeNGuc+3Zg3uqTGkzYQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA8i5t0i61HT0NEV5BHYEkK_ipSAeNGuc+3Zg3uqTGkzYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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

On 5/6/22 17:47, Peter Maydell wrote:
>>        if (!vga_model && !default_vga) {
>>            vga_interface_type = VGA_DEVICE;
>> +          vga_interface_created = true;
>>        }
>>        if (!has_defaults || machine_class->no_serial) {
>>            default_serial = 0;
>
> Can you explain why that's right? qemu_disable_default_devices()
> isn't creating any devices at all, so it's not clear to me
> (a) why it's setting vga_interface_type or (b) why setting
> vga_interface_created to true is OK.

VGA_DEVICE means the device has been specified on the command line, but 
the board should otherwise behave as if "-vga something" was there.

While the device has not been created yet, it will be in 
qemu_create_cli_devices(), and that's what !default_vga means at this 
point of the function.

This in fact means that almost all three occurrences of 
"vga_interface_type != VGA_NONE" are wrong. :(

Paolo

