Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23DF3249A2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 05:04:08 +0100 (CET)
Received: from localhost ([::1]:33546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF7sl-0004sf-OI
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 23:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF7rI-00047V-FE
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 23:02:36 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF7rG-0006FD-PE
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 23:02:36 -0500
Received: by mail-pf1-x42c.google.com with SMTP id t29so2722698pfg.11
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 20:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b4agXOUGICEZS2ijXmsioE47A1oJPVpYDuba23rFPAY=;
 b=upcCQ4T4/ZyFYw/9O9napPlAFZOb4jfBq8DLFb9de/x99GY6wGOiQ6PiCr2p/Zv6Sn
 vKm7CTAE1S/OTynIH4oOzk8hefb63fl/QTI0/9R+mvpESZxA+3Dmki5Ld9V+LvrYI806
 J6EEG9DYlAOeW9blqLYG/xPLLbWZ0LuukJ8tmsiylKANncTqOLadBT9gnyZ9hDJiAXyC
 mRIRW4NSrKS3Fut4N1IePLs6XPlUirCyoE8/URK+Yyd5B90LTNHgpp8lDL0RcGZzutY0
 Wz8Ehzmq0mqGUIHf0FLRqA5NsblyzpR79Xh/q/Fn0ZqRZmwN8vxad/WpjYrmH0Rufbtr
 d9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b4agXOUGICEZS2ijXmsioE47A1oJPVpYDuba23rFPAY=;
 b=o0SYmGz5lBhLUtuiCbxHtxkLxWWqE0xcpII/2O1bcfZx7qkH+zqSOy4BPNnd7IIftz
 YYdMom+Ds8NhcTO8T25OIaa9JynHtXFv6u8Ufffsa8dNnlIyfi4z+naCnUaG8AZxutz1
 3dTNmstfdTRjlboQ0Rwt9qY9nD5i9aiC/1ceJQF6nJIyXSeX3mrWegfS7H9CpQUELGsD
 1yOFob85pk+MD2EzHDlWr8icJ5S7+ZhlNkkWKsS2H21b3M/OiBa3NOwB5iKq7p603zT8
 WGBoitnby+HWf7tH353ebnjFuE6vqOqRWDRZC2eITB6kHe+bKeB10YjhvblNjB/jW/DR
 IAUQ==
X-Gm-Message-State: AOAM532SmeIZCcqdFnbH4xtZ5DZDp5bobNbjDAbinXqJYb6Xe+WvFF1v
 UMO2MHewe+s+yoQYrub8C2AlHzmctqKQWA==
X-Google-Smtp-Source: ABdhPJyCcqmipXlrRt6K92jVAeB6PrISLLQSUWMxdlMt4nOsA8cHQ1lzaNJpzw4D45voFVkOE2Z6ug==
X-Received: by 2002:a62:b50d:0:b029:1ed:c0d:3778 with SMTP id
 y13-20020a62b50d0000b02901ed0c0d3778mr1295990pfe.72.1614225753042; 
 Wed, 24 Feb 2021 20:02:33 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id e1sm4266045pjm.12.2021.02.24.20.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 20:02:32 -0800 (PST)
Subject: Re: [PATCH v22 15/17] i386: split off sysemu part of cpu.c
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-16-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <162fadb4-74ae-abcc-ffeb-ddd0cc39caa6@linaro.org>
Date: Wed, 24 Feb 2021 20:02:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-16-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:34 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/cpu-internal.h |  70 +++++++
>  target/i386/cpu-softmmu.c  | 352 ++++++++++++++++++++++++++++++++++
>  target/i386/cpu.c          | 383 +------------------------------------
>  target/i386/meson.build    |   1 +
>  4 files changed, 428 insertions(+), 378 deletions(-)
>  create mode 100644 target/i386/cpu-internal.h
>  create mode 100644 target/i386/cpu-softmmu.c

softmmu in the filename still, when

> + * i386 CPU internal definitions to be shared between cpu.c and cpu-sysemu.c

this has been updated.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

