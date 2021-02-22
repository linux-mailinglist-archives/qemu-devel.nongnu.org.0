Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE977321984
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:58:05 +0100 (CET)
Received: from localhost ([::1]:52190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBiu-000279-VY
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBW9-0004dO-5b
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:44:54 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBW7-0004kr-N7
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:44:52 -0500
Received: by mail-ej1-x62c.google.com with SMTP id k13so27580669ejs.10
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wiwJeaOOsxG8kQ0OsjD68nqhR0ywkIxqTOtPU9sjUSs=;
 b=VndRRseJtBgdWXEBUjd9oNrz3VKhcqEunh/MdhY4OqeoWfYLyPh5Z/1ixCDhJz5nPg
 q+mED7HBMADCk4z/ym+N+rq/y7DYh3HYyQ4zbNxeu1J3REh6xW1TqJDJr9ur35B1vFo6
 ALRUZUNRN14za9I4uRM5/UgrBnmhgaD39GX2TAzGp2X7qNV9UMRbs7kXGXtI0VCgPhpp
 bS2LvIBubLglb9yn2E3sV/rdtSDyAHSMPWJnHzNOfPteuXhTSRiqBAg2e7mfJQ3aNdpX
 ZA0HL0ah82231K5mvP+6eoZ+vXZa49+nBdqcDyn8BwyxjGIfaoIKpzTqS7hWg+aob3nH
 CLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wiwJeaOOsxG8kQ0OsjD68nqhR0ywkIxqTOtPU9sjUSs=;
 b=UCEIPaHKW3U4TOFjw6uvF4LlpAka++sHL08KM0FeisYE+XM4PMAQdTfWkZ614uc26R
 v8UJaLRV/9d9y3Rga16B+zVKLvukh/SHtgQWK6ToKbH356P6RJOZbtUbU/I1IUaJgsDH
 RBb7yv7a3JRIZiPvDRxNWHUMmzY+xyOun/DX+yZokU5Shl6BiUFQsZfq+5Sh0v+D1Pcb
 s4m+R1vmGkGf2yWnOLEoOMgar7L6YsZjGvhFAqdn0+MjFhHHFWfrNojI5CdXCNj4A9Yv
 V0SjIEOSFtne2b9NSdbCZxUMZSfwwjZnwEpDgdUjVeMtx0L11eEgrrX+0lCRQz+a2qZG
 r/Aw==
X-Gm-Message-State: AOAM532eXLN4QwL+8USp0YhTt/7TXyuxcKsbtAGsZ/UGS5Vg73JUYo/2
 kD4KYhIRaepHDNu8pwg5BnF/JjPgSiw=
X-Google-Smtp-Source: ABdhPJxhzmPwGxJPKNQn5qgxJkrx+7NVc0PrBSgNJ7IfYsygo9xd7Cx1Hk4ZhgA2RAlBmtzwskTufA==
X-Received: by 2002:a17:906:f119:: with SMTP id
 gv25mr6183358ejb.293.1614001489769; 
 Mon, 22 Feb 2021 05:44:49 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id hc13sm9840668ejc.5.2021.02.22.05.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:44:49 -0800 (PST)
Subject: Re: [PATCH v21 11/17] i386: split misc helper into user and softmmu
 parts
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210222133634.2235-1-cfontana@suse.de>
 <20210222133634.2235-12-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <94f7b333-5718-cadc-1b0b-69b10500f722@amsat.org>
Date: Mon, 22 Feb 2021 14:44:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222133634.2235-12-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

"user" vs "system" in title?

On 2/22/21 2:36 PM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/tcg/misc_helper.c         | 463 --------------------------
>  target/i386/tcg/softmmu/misc_helper.c | 438 ++++++++++++++++++++++++
>  target/i386/tcg/user/misc_helper.c    |  72 ++++
>  target/i386/tcg/softmmu/meson.build   |   1 +
>  target/i386/tcg/user/meson.build      |   1 +
>  5 files changed, 512 insertions(+), 463 deletions(-)
>  create mode 100644 target/i386/tcg/softmmu/misc_helper.c
>  create mode 100644 target/i386/tcg/user/misc_helper.c

