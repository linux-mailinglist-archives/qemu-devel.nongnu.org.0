Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B5A6EED7C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 07:19:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prXXn-0004Kz-1Y; Wed, 26 Apr 2023 01:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1prXXk-0004Km-Ev
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:18:16 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1prXXf-0004bQ-NO
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:18:16 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-63b5c4c769aso8603557b3a.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 22:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682486288; x=1685078288;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mLt6368LlbNC33ctNDhSfMJxBPRG7HK298EDl4e0MBU=;
 b=jl+XeYVAWurVn8cfIoA4TV1t+Ql3SIHjmkY+WJlm+Jfy1e4SryCYEPbzAYsNKiJkAE
 JnRisyNZ4BIRRiNtiyw/QXTLLHUWED/+S3komVu9uXt5fPXryjPJMP1yJc/8wvj1XY40
 W2GqXogeyYmTS1KTX9CVt1rE8Zkzt1Hz+ZdBl8rN4exlyGop9NnC5a4IK5yd8oKfPBuH
 2P3mClTMWKuQlMY52TtBHHWtOEGACarg6ed6St0uw0+Qtd+w59QEueFImtQET7AfIEpL
 fYWi4hM0yfDiaHCK2qemHUoTwKBSGVdK69AAr6rZQxfTQ+xfnzCaysyaaiQ8Hfbr0u0J
 rP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682486288; x=1685078288;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mLt6368LlbNC33ctNDhSfMJxBPRG7HK298EDl4e0MBU=;
 b=BgvSwtU+pU7zggT8y/u428CqfHrpo4bXwaZXsKn1r6nT4bYeerw6uCMhY9CXFscIYR
 28B22HhVmt9zLlGzVtQXI6OmKwon7ows2PbHDjwCF69cWT/nzdjukOMCGFKvbIXzB76k
 2TxDz4hmwyC1ilvhWXDomjIeig44RQtMj18+raddNi3U3T+C5aOOWZHqrQYcOHewcExs
 oVUgotqtu+VHX5KQkbmVylfq3Uau5lDYNyMe69KhcGSMg6Ek8YIqXOmQrM6JbDT4S6Da
 UvfjBswF4SGJ3cXjzqmJ/MIVZlnqJ5XxJ/34fzAs18jdeYaYfqhuhSEjizKanyWxcxWe
 pXkA==
X-Gm-Message-State: AAQBX9fiVJqg12mRy59xh1/JuUtbfoEwe6SL0Y5fxLUURokTk8Bk31/R
 8n0WdU/L4P8b0R79fADyt4M=
X-Google-Smtp-Source: AKy350YOa46F+cSqvdCQjcNx2W+TPk3L/ZBflR+9G7ozsE96mQNZW/OsvoD35wK+cqyjR5Ujc5LC0A==
X-Received: by 2002:aa7:8896:0:b0:63c:6485:d5fd with SMTP id
 z22-20020aa78896000000b0063c6485d5fdmr27715628pfe.2.1682486287629; 
 Tue, 25 Apr 2023 22:18:07 -0700 (PDT)
Received: from [10.213.29.157] ([157.82.194.11])
 by smtp.gmail.com with ESMTPSA id
 i23-20020aa796f7000000b0063f0068cf6csm6897626pfq.198.2023.04.25.22.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 22:18:07 -0700 (PDT)
Message-ID: <7cede535-6377-f5da-2302-05e794650ad9@gmail.com>
Date: Wed, 26 Apr 2023 14:18:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] cocoa: Fix warnings about invalid prototype declarations
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
References: <20230425192820.34063-1-philmd@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20230425192820.34063-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/04/26 4:28, Philippe Mathieu-Daudé wrote:
> Fix the following Cocoa trivial warnings:
> 
>    C compiler for the host machine: cc (clang 14.0.0 "Apple clang version 14.0.0 (clang-1400.0.29.202)")
>    Objective-C compiler for the host machine: clang (clang 14.0.0)
> 
>    [100/334] Compiling Objective-C object libcommon.fa.p/net_vmnet-bridged.m.o
>    net/vmnet-bridged.m:40:31: warning: a function declaration without a prototype is deprecated in all versions of C [-Wstrict-prototypes]
>    static char* get_valid_ifnames()
>                                  ^
>                                   void
>    [742/1436] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
>    ui/cocoa.m:1937:22: warning: a function declaration without a prototype is deprecated in all versions of C [-Wstrict-prototypes]
>    static int cocoa_main()
>                         ^
>                          void >
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

