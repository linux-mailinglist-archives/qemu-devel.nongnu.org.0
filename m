Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2F3652338
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:56:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dub-0002pa-Bc; Tue, 20 Dec 2022 09:48:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7duW-0002oL-B0
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:48:04 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7duU-00032s-PB
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:48:04 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 r204-20020a1c44d5000000b003d6b8e8e07fso44072wma.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=RP+9dCjV5toBdJMkTD4UVAsu7B645XYhNcGz0e7jtnk=;
 b=oe9h1CJKfCM54/JdlP/rOXcreCROCevyLmwwllnn2I7MbA0FClHMNvcmCBbo/EzGZJ
 MB36p0dU6+3DOe+bWuiGlpQc4j4BGW9bNp5m2aCAygHDu0NQEchuci7leevm5yIkmetg
 OLWnxRwlYJox4Hkt9T7q458+k7+zkuxhM2Z2ISj0Tv0f7kiePbg5/SSKOJbzMuxslnUi
 sXIOxyzCU/bw0h+wdWSMwncWQnRpXTwBL85vPtHBDwE3o/Y5CgctjlklndCUBuLjQuZ+
 eqqUAz9iPEZ3clicxxrR35WqGpbEkZv0qwb+O1vQYPQ7Va2ysvsYC4y8b4VpkAjDB+Dh
 H8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RP+9dCjV5toBdJMkTD4UVAsu7B645XYhNcGz0e7jtnk=;
 b=YvRyQNCxZ8cq75NwJu5IlgGITLwyvan/IucAbnZgGJmMUpm6CmKkBqXXOU7DW8Cg06
 rUoXhgBVbcv70W9v/YLjUMKdOm2tkVY68CHX8hMnBWC1JBpwXq7xbBpu/Iwv6tlet3vF
 fGJnUGU7j3KV0PctiAENo8+dcRoAxGPuFWFEJBHC+XR621vG0FYvmLvthf6yV7vQMPS4
 /19K45f9wJrNhb9OoLkH1i9WDdrdCx5bVZMg3BicIbcX8D3dFH8Mae3kdNjHzkZ4IS2A
 WPmt3rvf6WG3biWuoeZ+Uk71uSIdOq9DFQFc+ZfshRfscWiW8oZSrt78LOfTj0UJU8iv
 UxDA==
X-Gm-Message-State: ANoB5pkpOPDAjOwlWIQMQ2txr850taDSvRzlaOh6dVuiLjnFxYSf7mF5
 qvi6XSkxGECnA3/fKBQML/M=
X-Google-Smtp-Source: AA0mqf55z3JjqSB9gCgqt+dwHW0tM1XkR4qxtK7hlYJfkzSrADkV0EIGRFOYF8Nnlr7QT57YxY7QHg==
X-Received: by 2002:a05:600c:3512:b0:3d1:fcb4:4074 with SMTP id
 h18-20020a05600c351200b003d1fcb44074mr47297305wmq.22.1671547680641; 
 Tue, 20 Dec 2022 06:48:00 -0800 (PST)
Received: from [192.168.6.89] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a05600c341800b003d1de805de5sm14982078wmp.16.2022.12.20.06.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 06:48:00 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d422ba20-4e30-f678-6738-552f74ebdb2a@xen.org>
Date: Tue, 20 Dec 2022 14:47:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 04/38] i386/kvm: Add xen-version machine property
 and init KVM Xen support
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221216004117.862106-1-dwmw2@infradead.org>
 <20221216004117.862106-5-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221216004117.862106-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.161, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 16/12/2022 00:40, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This just initializes the basic Xen support in KVM for now.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/kvm/kvm-all.c         |  1 +
>   include/sysemu/kvm_int.h    |  1 +
>   target/i386/kvm/kvm.c       | 53 +++++++++++++++++++++++++++++++++++++
>   target/i386/kvm/meson.build |  2 ++
>   target/i386/kvm/xen-emu.c   | 50 ++++++++++++++++++++++++++++++++++
>   target/i386/kvm/xen-emu.h   | 19 +++++++++++++
>   6 files changed, 126 insertions(+)
>   create mode 100644 target/i386/kvm/xen-emu.c
>   create mode 100644 target/i386/kvm/xen-emu.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>


