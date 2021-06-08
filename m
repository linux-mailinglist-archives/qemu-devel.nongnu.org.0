Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8220639F166
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:52:06 +0200 (CEST)
Received: from localhost ([::1]:36558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXSv-0005vz-Gv
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqXRF-0004mp-Pj
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:50:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqXRC-0004BD-PQ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623142217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vNNkAxm7jCoL7keVki3btNM5++6I3t/W1L8MVZn7aY=;
 b=gW+/gwPHgScpfnNkDmmoWzTq2y8M027M6ads8Y92NH19ZIKlnmWHht7Ld4PXMvpttfeNS6
 KBSXfFJl0l5NIhcBhmt7TsyycHnxxvbfcSuq9L95V80AC6gHEekP9oMzki4JVKU/6IFUvh
 v5kArjmzu9ANp9xwUBcp/aOs7sx9Ct0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-kvny1oIhNNu3sJ0tWBajbw-1; Tue, 08 Jun 2021 04:50:10 -0400
X-MC-Unique: kvny1oIhNNu3sJ0tWBajbw-1
Received: by mail-wr1-f72.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so9161310wrq.10
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 01:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3vNNkAxm7jCoL7keVki3btNM5++6I3t/W1L8MVZn7aY=;
 b=roFgBDX0RVvk7SrkfpcAgYXggCMxjeh/NhdX2kjSg5kup7pONbdhPcgPnTOSx9tCnf
 3gz5qeuvBJ5/WU1SEC7VYl8iSL5h84niAlT7qggw+8VIX5u+asnBz5xEQQWAEnAguPEe
 vwB+MZTd5l+g3qEorYWOwMsvvTISGwiy9SMDkNYOvy+ASLStkmtHwUv5ljzdMBMYUq8j
 jTK0CRk5fp3+E+fg6JvUMx3eMLClLVCaVecOlvsn+jeRl/FQVb4uXoiG7mfDUlELPZdK
 /b8HmyW3why+KX8lrpcS2oWXJO8OxQJNFEEaKoXN+CKh5na5W9SYtRwh1b4S5tNnH9Ws
 xBVg==
X-Gm-Message-State: AOAM533l3aQ4a5sQMAUqOLTTtN8FOAouE6y/Mg/FWbnry6fvLyciSP9h
 xJ5+y8QEQIhZeUa4oXK6Ln6HoBOgCGBQ+a3uquEODAM4HE1INUN4BrUDRKgFE9WZshZCgW8M9MC
 0WSq5IDowuwDmAxw=
X-Received: by 2002:a5d:6b52:: with SMTP id x18mr20856864wrw.11.1623142209008; 
 Tue, 08 Jun 2021 01:50:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT5UNHSQ4Vf7jfNPX+s6T27RqYrt2dkb0dERrKAdWMOrkuVRvskHeEIrD2mIWPIETrlzpvTw==
X-Received: by 2002:a5d:6b52:: with SMTP id x18mr20856837wrw.11.1623142208748; 
 Tue, 08 Jun 2021 01:50:08 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id t1sm18788436wrx.28.2021.06.08.01.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 01:50:08 -0700 (PDT)
Subject: Re: [PATCH v16 00/99] arm tcg/kvm refactor and split with kvm only
 support
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <8a4af018-acc9-0d35-7f28-9b32987519a0@redhat.com>
Message-ID: <12350ead-ce55-ba94-53b5-23aac7bd265b@redhat.com>
Date: Tue, 8 Jun 2021 10:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8a4af018-acc9-0d35-7f28-9b32987519a0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 10:44 AM, Philippe Mathieu-Daudé wrote:
> Hi Alex,
> 
> On 6/4/21 5:51 PM, Alex Bennée wrote:
>> Hi,
>>
>> I have picked up the baton from Claudio to try and get the ARM
>> re-factoring across the line. Most of the patches from Claudio remain
>> unchanged and have just had minor fixups from re-basing against the
>> moving target. I've done my best to make sure any fixes that have been
>> made in the meantime weren't lost.
>>
>> I've included Phillipe's qtest_has_accel v7 patches (I had problems
>> with v8) to aid in my aarch64 testing. I'm expecting them to be
>> up-streamed by Phillipe in due course. I've also nabbed one of
>> Phillipe's Kconfig tweaks to allow for target specific expression of
>> some config variables.
>>
>> The main thing that enables the --disable-tcg build is the addition of
>> --with-devices-FOO configure option which is a mechanism to override
>> the existing default device configurations. The two that I've been
>> testing are a 64 bit only build on x86:
>>
>>   '../../configure' '--without-default-features' \
>>      '--target-list=arm-softmmu,aarch64-softmmu' \
>>      '--with-devices-aarch64=../../configs/aarch64-softmmu/64bit-only.mak'
>>
>> which results in the aarch64-softmmu build only supporting sbsa-ref,
>> virt and xlnx-versal-virt.
>>
>> The second is a KVM only cross build:
>>
>>   '../../configure' '--disable-docs' \
>>     '--target-list=aarch64-softmmu' \
>>     '--enable-kvm' '--disable-tcg' \
>>     '--cross-prefix=aarch64-linux-gnu-' \
>>     '--with-devices-aarch64=../../configs/aarch64-softmmu/virt-only.mak'
>>
>> Finally I've made a few minor Kconfig and testing tweaks before adding
>> some gitlab coverage. As a result I was able to drop the Revert: idau
>> patch because I can properly build an image without stray devices in
>> the qtree.
>>
>> The following need review:
>>
>>  - gitlab: defend the new stripped down arm64 configs
>>  - tests/qtest: make xlnx-can-test conditional on being configured
>>  - tests/qtest: split the cdrom-test into arm/aarch64
>>  - hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
>>  - target/arm: move CONFIG_V7M out of default-devices
> 
> Without using --with-devices-aarch64, I'm getting:
> 
> FAILED: libqemu-aarch64-softmmu.fa.p/target_arm_tcg_sysemu_m_helper.c.o
> cc -Ilibqemu-aarch64-softmmu.fa.p -I. -I../.. -Itarget/arm
> -I../../target/arm -I../../capstone/include/capstone -Iqapi -Itrace -Iui
> -Iui/shader -I/usr/include/pixman-1 -I/usr/include/spice-server
> -I/usr/include/spice-1 -I/usr/include/glib-2.0
> -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto
> -pipe -Wall -Winvalid-pch -Werror -std=gnu99 -O2 -g -isystem
> /home/phil/qemu/linux-headers -isystem linux-headers -iquote . -iquote
> /home/phil/qemu -iquote /home/phil/qemu/include -iquote
> /home/phil/qemu/disas/libvixl -pthread -U_FORTIFY_SOURCE
> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
> -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
> -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
> -Wimplicit-fallthrough=2 -Wno-missing-include-dirs
> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
> -isystem../../linux-headers -isystemlinux-headers -DNEED_CPU_H
> '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
> '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
> libqemu-aarch64-softmmu.fa.p/target_arm_tcg_sysemu_m_helper.c.o -MF
> libqemu-aarch64-softmmu.fa.p/target_arm_tcg_sysemu_m_helper.c.o.d -o
> libqemu-aarch64-softmmu.fa.p/target_arm_tcg_sysemu_m_helper.c.o -c
> ../../target/arm/tcg/sysemu/m_helper.c
> In file included from ../../target/arm/tcg/sysemu/m_helper.c:12:
> /home/phil/qemu/include/exec/helper-proto.h:41:10: fatal error:
> trace/generated-helpers.h: No such file or directory
>    41 | #include "trace/generated-helpers.h"
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> 
> both --enable-xen and --disable-xen.
> 
> Is that expected?

IIRC (this was looong ago) before this configuration was not
buildable and Kconfig was erroring with something like:
"dependency not satisfied: ARM_V7M select TCG"


