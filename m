Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E22F6A53C9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 08:40:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWuaf-0007K0-IJ; Tue, 28 Feb 2023 02:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWuab-0007Jk-OL
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 02:39:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWuaZ-0007UN-UD
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 02:39:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677569994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4CuH1aIrAL4IShJibOpzwPQfte5RpGoDNGh1Yknmno=;
 b=dSfVZA76tuA/yOTQ88MypLxdPxyBcUD6IJOxjIhbk2izEcWEP8t+qZZuutvNdXGW/Y7lCX
 C2ZUQkNq+vf/ZgXlB3XTRkHT9x3kYOA5RrIk4xCh4LgT6v0mFzgVMXedDSxXrGqqC6yDHo
 mJ6nfTaDjaQOSgs0l1t+SG8Z/vP911A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408-MiOxVvadN0aP8zG_2EObjA-1; Tue, 28 Feb 2023 02:39:53 -0500
X-MC-Unique: MiOxVvadN0aP8zG_2EObjA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi21-20020a05600c3d9500b003e836e354e0so3920489wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 23:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V4CuH1aIrAL4IShJibOpzwPQfte5RpGoDNGh1Yknmno=;
 b=TORR4sQ8p7+sHqgEJs4PN9jzJ81glZmSDLWNjnFDTFwdPI2RoXaoAhXKJ1wdi4w6v5
 y5YSVcESQIgaFfArfJtL9bLiRStXYmMjMS38Za3qcb9YB0hohW+CIzKTXDv2aYzTPGet
 /qxH45Oj3rLYKxmSkT/ujOgoDM5j+l6JeLJptcTrCdb+NnsVvDUfB52KOQh0ndOYFT7Y
 f/J0jgkJgtBnd5j0qaEbWbrfL3n472x3sy3+OR4gP422/17zpVIdGunkyJRs8+Nh18hX
 IucmKSE3A/HGqk66LPnvIpxkYQe+egGzZavxoOhCm1VizllLhB79S6UCepY+/sXgMzCH
 wO8Q==
X-Gm-Message-State: AO0yUKWwRzZuRZwAR067YMXsgEV8tOgbiBjDY0KOoCE+TAnAFnQ3Tnlt
 s3yTdNSFTAu9CBSQLqZkkr3K605dXGJUqAuP7zsArAe/gY8B35UpQbgnZUdU8kRwESxdgd1W6bj
 kQVmsRqSX/Br200I=
X-Received: by 2002:a05:600c:491d:b0:3dc:d5c:76d9 with SMTP id
 f29-20020a05600c491d00b003dc0d5c76d9mr1711001wmp.0.1677569992209; 
 Mon, 27 Feb 2023 23:39:52 -0800 (PST)
X-Google-Smtp-Source: AK7set/njPCmiXr23K7e76Er7M0HjsF+J1fmqdaUA9M/AOTPF1jtLXZ21lNSyv2Efwi4f6fqXtK/Ag==
X-Received: by 2002:a05:600c:491d:b0:3dc:d5c:76d9 with SMTP id
 f29-20020a05600c491d00b003dc0d5c76d9mr1710980wmp.0.1677569991934; 
 Mon, 27 Feb 2023 23:39:51 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de.
 [109.43.177.75]) by smtp.gmail.com with ESMTPSA id
 q8-20020a1cf308000000b003e11ad0750csm11789964wmq.47.2023.02.27.23.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 23:39:51 -0800 (PST)
Message-ID: <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
Date: Tue, 28 Feb 2023 08:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
In-Reply-To: <Y/z4rwv09Ckhbtfp@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 27/02/2023 19.38, Daniel P. Berrangé wrote:
> On Mon, Feb 27, 2023 at 12:10:48PM +0100, Thomas Huth wrote:
>> We're struggling quite badly with our CI minutes on the shared
>> gitlab runners, so we urgently need to think of ways to cut down
>> our supported build and target environments. qemu-system-i386 and
>> qemu-system-arm are not really required anymore, since nobody uses
>> KVM on the corresponding systems for production anymore, and the
>> -x86_64 and -arch64 variants are a proper superset of those binaries.
>> So it's time to deprecate them and the corresponding 32-bit host
>> environments now.
>>
>> This is a follow-up patch series from the previous discussion here:
>>
>>   https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
>>
>> where people still mentioned that there is still interest in certain
>> support for 32-bit host hardware. But as far as I could see, there is
>> no real need for 32-bit host support for system emulation on x86 and
>> arm anymore, so it should be fine if we drop these host environments
>> now (these are also the two architectures that contribute the most to
>> the long test times in our CI, so we would benefit a lot by dropping
>> those).
> 
> Your description here is a little ambiguous about what's being
> proposed. When you say dropping 32-bit host support do you mean
> just for the system emulator binaries, or for QEMU entirely ?

Just for system emulation. Some people said that user emulation still might 
be useful for some 32-bit environments.

> And when the deprecation period is passed, are you proposing
> to actively prevent 32-bit builds, or merely stopping CI testing
> and leave 32-bit builds still working if people want them ?

CI is the main pain point, so that's the most important thing. So whether we 
throw a warning or a hard error while configuring the build, I don't care 
too much.

  Thomas


