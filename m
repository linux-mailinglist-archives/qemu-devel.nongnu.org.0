Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA833C262B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:44:23 +0200 (CEST)
Received: from localhost ([::1]:47408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rjq-0002J0-QO
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m1rao-0000OW-SW
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:35:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m1ral-0007U6-Je
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625841298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/H4fs8vCApx/sHJieTCAxMgiQ9F4cX+YyKuvvB7S5s0=;
 b=KhUQf9QRaaC/DMsSnqkH8yS7byw2EtPF3DXPq15wCIsBt1o37WGSFD4U/Ls/37R0SbVdQw
 uyNqZrBB5uJ/yp37XE3gbvWx+W42P+EydaaaIzUSPQA0Z4sKchn4WL4f0B2EPUfrjngPxW
 QG4Ay4ELdVieXp23AFysMV6Rd+F7GCg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-s9n0oQtMObyX5YLuWcnQuA-1; Fri, 09 Jul 2021 10:34:57 -0400
X-MC-Unique: s9n0oQtMObyX5YLuWcnQuA-1
Received: by mail-wr1-f70.google.com with SMTP id
 g4-20020a5d64e40000b029013398ce8904so2985307wri.16
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/H4fs8vCApx/sHJieTCAxMgiQ9F4cX+YyKuvvB7S5s0=;
 b=jjioeK1Ra4N4eDab2s0zxD0Ilih7Qro7STl/nFfjeFo1jT2YIFgbFRr1ddCtTK5ohC
 PxwBE193Hul1sOaghNHEpKEC0k1+EbIvCA4qY5CilYMFvJ3zTZ2ABCWuC8+PeqWCut8a
 5LQJm7brvB25z96qpBLEh3Sgf4a5OdQ3KSouknrV9iXyNbTO870cYBesqLOqylZ9S40B
 CaEgFI3jxbdYnDVfA7Mh5oqPI4Fjr9DN1PCEQXzLqYJs+9/MqdzPMW3c61u6etyDg8+H
 E6j6QBVH4vHyJ98dtgEdavW56eAm29JnosbXOhAjnkgt4eKnhfWXmMBsTBV8uDJ4+4Jm
 aFcQ==
X-Gm-Message-State: AOAM532OedM2ofyyBueGgRGkPRfeSDjY0ioT7dMbs6QkbgWI2hRcLZr0
 IUJoG5ywmwDUgCqh97uMQl5D4iEbB2qMcbZLGHwX09sb39w2bJPKcXrG3B0OjpmLPjfwnJgf2U2
 BRhfzB//YUwxR0AI=
X-Received: by 2002:a5d:5692:: with SMTP id f18mr20454901wrv.135.1625841296172; 
 Fri, 09 Jul 2021 07:34:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7tQc8HZhSj1ECSXwkW3sp7ZK9HoPdhP0d7gSxpvVkFAmsrXnI4xUp7MPkb/VPPjUJUd1HoQ==
X-Received: by 2002:a5d:5692:: with SMTP id f18mr20454882wrv.135.1625841295951; 
 Fri, 09 Jul 2021 07:34:55 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8303d.dip0.t-ipconnect.de.
 [217.232.48.61])
 by smtp.gmail.com with ESMTPSA id l14sm396696wrs.22.2021.07.09.07.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 07:34:55 -0700 (PDT)
Subject: Re: [RFC PATCH] gitlab-ci: Test compilation on Windows with MSYS2
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210709075218.1796207-1-thuth@redhat.com>
 <YOgGuJkAZ3AeRVTK@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c7f2d936-bc4c-4524-f152-6517c0345016@redhat.com>
Date: Fri, 9 Jul 2021 16:34:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOgGuJkAZ3AeRVTK@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/07/2021 10.20, Daniel P. Berrangé wrote:
> On Fri, Jul 09, 2021 at 09:52:18AM +0200, Thomas Huth wrote:
>> Gitlab also provides runners with Windows, we can use them to
>> test compilation with MSYS2.
>>
>> However, it takes quite a long time to set up the VM, so to
>> stay in the 1h time frame, we can only compile and check one
>> target here. And there is also still a problem with compiling
>> the multiboot.bin in pc-bios/optionrom/, so this is currently
>> disabled, too.
> 
> THe gitlab VM provisioning seems quite fast (2+1/2 minutes),
> so I guess you mean the time is sunk in intsalling msys
> packages.
> 
> In the crurent Cirrus job there's a bunch of code that is
> done to cache all the msys install, so that 90% of the time
> we're merely extracting a local zipfile.
> 
> I wonder if we can do similar caching here.

Maybe, yes. It might save 10 - 15 minutes or so, I guess.

> Perhaps even
> have 2 seprate jobs running on the windows runner. The
> first job can just build a zip file and store it as an
> artifact and cache it in gitlab for speed. The second
> job can do the actual build ?

I'm not sure ... the Windows builders are likely single-threaded on Gitlab, 
too, just like the Linux containers. So that the main problem - while we can 
compile with -j8 on Cirrus, it's 8 times slower on Gitlab.

  Thomas


