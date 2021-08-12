Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA93EA5FD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 15:50:30 +0200 (CEST)
Received: from localhost ([::1]:43358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEB6K-0002n0-QW
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 09:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEB5Z-00027U-Mn
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:49:41 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEB5X-0003fs-UJ
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:49:41 -0400
Received: by mail-wm1-x32a.google.com with SMTP id f10so1429063wml.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 06:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=siHd3qM8/U83WUctBB2UuY1tdemTjtQDrSikf1joCOs=;
 b=qguMM2SlhKxjj/RWynk1dCVuq/jtu+oLjge5lu3uHiW+4cY9IXOrdUMsXt6ov7j3pC
 LxASdB0jxfR1Inf+mgULkwk1x58mdAWZGaVb5azUuOnwz+kwY9b/ag8LETZtRGe6wJeJ
 7u2aZgeotJz1IIghXGJpl6QdQSoy76kLYQiy2kBfYdbHoFlLWw660UTyPRg566XIQGOd
 VMQb/u12XOtJtzHjLc6C2pxS2m0t7/7y5EaDjVhQ9nzpqbLmAPumlrgXP2yf7scjWLuW
 bT+gr9qG6mwgDqNrWyJLLurdJh55qfQInRaOz8NaG667jw8/R5jCr5sxxRJJ+gfgCMRo
 uxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=siHd3qM8/U83WUctBB2UuY1tdemTjtQDrSikf1joCOs=;
 b=F+lj2eUywG0tLeLZO3YBGxBTmOVhdapqjEjfROq/gR7vmP8YhQspNk2mQTeqAy0pjg
 LuhKWyUPNvgL8fBcNUfzUEbMXoESSIE6iMtjPUs3NAYYPWv8WliiMhqZ7K5BHuGVwAmZ
 ML3sbCm+2Wgj+pUIwSk1M/TT+V2TrVKas3Tf6DBd3BCAFg/DvO7eHnNvWUCccL99oba5
 X5RncBZZvSvqAh+pjZ0B7KK+mFog7ty1GexpfzyMFeBCIq1kKSX3fMRKH9aP8HUcbj9T
 Y301osre3IjICYyu9TPQjUF+WwpHkJ3YcrP+EZyktKR3SddvdWL4R7m3olQLmwHsa2Mq
 g1jQ==
X-Gm-Message-State: AOAM530u+iz+SnZkqOmV7roQDYppAA/iod+tfQy8LEAD6OssKooNqkMf
 A9w7akuZ5zxvwGWWL3dCxXQ=
X-Google-Smtp-Source: ABdhPJyba/Mw4JNQOA2UBqAp7oOdfgwzWH7oe4pT+Uu1vrn/02nm2gmHgGmw+fcwzGRbDT4KmV6ccQ==
X-Received: by 2002:a7b:c083:: with SMTP id r3mr4232716wmh.65.1628776178299;
 Thu, 12 Aug 2021 06:49:38 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i21sm3190658wrb.62.2021.08.12.06.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 06:49:37 -0700 (PDT)
Subject: Re: [PATCH] hw/acpi: refactor acpi hp modules so that targets can
 just use what they need
To: Ani Sinha <ani@anisinha.ca>
References: <20210812071409.492299-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2108121851040.528313@anisinha-lenovo>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3dfd4192-a992-f2e2-84cc-9c57220325df@amsat.org>
Date: Thu, 12 Aug 2021 15:49:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2108121851040.528313@anisinha-lenovo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 3:22 PM, Ani Sinha wrote:
> On Thu, 12 Aug 2021, Ani Sinha wrote:
> 
>> Currently various acpi hotplug modules like cpu hotplug, memory hotplug, pci
>> hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is turned on.
>> This brings in support for whole lot of subsystems that some targets like
>> mips does not need. They are added just to satisfy symbol dependencies. This
>> is ugly and should be avoided. Targets should be able to pull in just what they
>> need and no more. For example, mips only needs support for PIIX4 and does not
>> need acpi pci hotplug support or cpu hotplug support or memory hotplug support
>> etc. This change is an effort to clean this up.
>> In this change, new config variables are added for various acpi hotplug
>> subsystems. Targets like mips can only enable PIIX4 support and not the rest
>> of all the other modules which were being previously pulled in as a part of
>> CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 needs but
>> are not required by mips (for example, symbols specific to pci hotplug etc)
>> are available to satisfy the dependencies.
>>
>> Currently, this change only addresses issues with mips malta targets. In future
>> we might be able to clean up other targets which are similarly pulling in lot
>> of unnecessary hotplug modules by enabling ACPI_X86.
>>
>> This change should also address issues such as the following:
>> https://gitlab.com/qemu-project/qemu/-/issues/221
>> https://gitlab.com/qemu-project/qemu/-/issues/193
> 
> I do not have a cross compiled mips64 vmlinux handy, so can't verify that
> issue #193 was indeed resolved.

The functional tests use some pre-built:

$ git grep I6400 tests/acceptance/

> I have verified that #221 was indeed
> fixed.

Good news!

