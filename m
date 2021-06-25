Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2915A3B3D08
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 09:10:34 +0200 (CEST)
Received: from localhost ([::1]:45582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwfyz-0008Lj-2K
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 03:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lwfy9-0007gr-J2
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 03:09:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lwfy4-0004qW-JQ
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 03:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624604975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pEj0k1SS6JYbJmnC4lThVXMIc5TQ2fOHYWGJUAjCWks=;
 b=f6o6+OfJ0TU8N4dSMngyd+U0aQL5iPaQ/vIIJRp70Vn7IouG9SqR611AkmSGtXHfudHIOo
 U4kbF4I2Xp5YXHkQGJ+Ip+icTps7YyI3LXse9eZAI9eb45fTYRUoiZ4FWhd01EkDzBBZ0e
 1eQbv7y/PGm2JaaU8VgbR9X7Xp2vYp0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-7XrftPcSPaO0roIYwNl0yA-1; Fri, 25 Jun 2021 03:09:30 -0400
X-MC-Unique: 7XrftPcSPaO0roIYwNl0yA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h17-20020adff4d10000b029011a7b7961dbso3142943wrp.15
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 00:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:cc:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pEj0k1SS6JYbJmnC4lThVXMIc5TQ2fOHYWGJUAjCWks=;
 b=BiMoXHtdce1rABgWeAmhw2AJSEnuA8E57PtbfimxC6E1Bs9w0y0aye1TfYnoqGdCwK
 VpkYmCUEnOkeIyzGSsQC7BQaucsiNvaszD+d7S4GfU3SBBTy1HUlUfrn+7unKmm9Gbz6
 W4LPJ+0WsSZzGTdO9s/U/vdlvoSU5ZkKRUpVm2A8EeAUUG2KvzH9MKGEY95UbeOXcs+T
 3JEW9sW8FzrcvuFlYYbAIqxCnaNd8nd3RuZhdj0bGqiAcpyVPX9TDdhsu5ONE6mDD7sf
 875WxHppjxTwF6wz2wc7NfYZzVvlabmjEXDy9jeC7baveHEBVnU34GCeTsrHaqHZ6cWA
 OxRQ==
X-Gm-Message-State: AOAM532y9Bzm6kx0h4mAUdeTbeCk+O39P5F+9cTW+SFlV2GX3oj8PqN7
 i4UMqdXolofzQFBg8KVUKKXFqRFmxKJDNP1lbPhCV24dhGH7gw6VxLAHTG2AImXARI/VfLKmsNt
 VBtajgYL6AhpshRc=
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr1272618wmk.51.1624604969284; 
 Fri, 25 Jun 2021 00:09:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqC0xdZ5WxvlgMPZ6DIpLk5RMzSeA6JG2sHFaX7VaeyUeaNawhkzkSlUWQmVadwKbMgOEPaw==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr1272601wmk.51.1624604969076; 
 Fri, 25 Jun 2021 00:09:29 -0700 (PDT)
Received: from thuth.remote.csb (pd9575d46.dip0.t-ipconnect.de. [217.87.93.70])
 by smtp.gmail.com with ESMTPSA id o3sm5293613wrj.94.2021.06.25.00.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 00:09:28 -0700 (PDT)
To: Richard Zak <richard.j.zak@gmail.com>, qemu-devel@nongnu.org
References: <CAOakUfODNr9UCpbNyzavk3n8ycD5fNFU0VBv87fVWLhrw5O2Ow@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Qemu on Haiku
Message-ID: <f4c552df-ba24-e4b7-7dad-57c057788dc5@redhat.com>
Date: Fri, 25 Jun 2021 09:09:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfODNr9UCpbNyzavk3n8ycD5fNFU0VBv87fVWLhrw5O2Ow@mail.gmail.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/2021 06.12, Richard Zak wrote:
> Hello there! I noticed the message which appears when building qemu on 
> Haiku. I'd hate for Haiku to lose qemu, so I would like to help!
> 
> What is needed in terms of a build system for continuous integration? I'm 
> not familiar with CI systems, other than simply knowing what they do.

  Hi,

since a couple of month, we already have a Haiku VM in our VM tests, so the 
basics are already there - it's possible to run a Haiku build test on a 
Linux host by typing:

  make vm-build-haiku.x86_64

However, it's still in a quite bad shape, the disk image that is used in 
that VM is not big enough for compiling the whole QEMU sources. So somebody 
needs to add some additional logic there to either increase the disk image 
on the fly or to add a second free disk image to the VM that could be used 
for compilation instead. If you want to have a try, have a look at: 
tests/vm/haiku.x86_64

Also, I'm not sure whether Peter is using this VM already in his gating CI 
tests? I guess not, due to those size limitations...

Finally, we'd also need somebody who's proficient with the Haiku APIs and 
who could help with problems in a timely manner, i.e. we'd need an entry in 
the "Hosts" section in the maintainers file. It should be someone who's 
basically familiar with the QEMU development process, so if you're 
interested, I'd suggest that you try to contribute some patches to QEMU 
first to get a basic understanding of the process (see e.g. 
https://wiki.qemu.org/Contribute/BiteSizedTasks for some easier tasks), and 
once you feel confident, you could add a Haiku entry to the MAINTAINERS file.

  Thomas


