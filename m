Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08128648373
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 15:11:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3e4E-0003Aq-NQ; Fri, 09 Dec 2022 09:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3e4D-0003Ae-E6
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3e4B-00071a-C1
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670594970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CcvOullH24dr1AeLf2AoC90mOOqsInUk4CojlTziz9c=;
 b=I0h96c4Ew015kzoqczcnc5wM7MsyNxt0EVRJkLsqSJEq9iUUEtofF0jGSGSVd6Zu3qQtk9
 seOQx9lSolZkb//Q/08iqPrHK53oLp+9pd2PEvZElH3tE5OUXL9aiHW0b2jTNg3EA2A4h5
 So7VcnlcX4oSnpiJvCdfyO8MRdTVnKo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-s25wiFBYOPiTI6pcSP422g-1; Fri, 09 Dec 2022 09:09:28 -0500
X-MC-Unique: s25wiFBYOPiTI6pcSP422g-1
Received: by mail-ed1-f71.google.com with SMTP id
 j6-20020a05640211c600b0046d6960b266so1435685edw.6
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 06:09:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CcvOullH24dr1AeLf2AoC90mOOqsInUk4CojlTziz9c=;
 b=YOHXfqrVfvewHLl4hZWfZ/ynDW7j3TRK9pfBWP0xLq1i84TN70HHzECa4fHRrS6Sym
 xWnKXAqtQMHrjh2PL18anh6P+gcevS5+DC1vqOyV4SBvXqyJw/Gp4pb0xcoDeit5ydPy
 MLp6u+tUPW4qBECrJnhDVbEjGNxeeSHe0W15cdKb2yuuIOGw11w9NDJva3k3EdlEmVAI
 Qdudsb9cSxGHrQKmwOMOnrqtmlmNV68XN/YVhhWpLVau6HyZqFQuhha5I4t1/35DLbDa
 MT8x+BzEWreQIkY9g/nWjC/tSjYto4f/uzX6kD5xw8U39HVwacv/SHh7hG+DeDt9I++8
 knZg==
X-Gm-Message-State: ANoB5pmZrsxyu/UbKT6Qh86EUJslYtEL4g4Us2uf62g6MRC5rNm5Yg9E
 0A9qQPCYS/qFYcSWlX+hL1AMSJ3fis8DEAvL1Yd4zNgDOaZ5T2scInLEVWcxDtvIZlY+5rNFa6A
 2SeUxA0nfb6jHkBk=
X-Received: by 2002:a17:906:4c94:b0:7b5:860d:7039 with SMTP id
 q20-20020a1709064c9400b007b5860d7039mr5279663eju.10.1670594967644; 
 Fri, 09 Dec 2022 06:09:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6hAyL4RkP+Au1tEARSNPCft91AGoJBHxaYCtHQNRrxL7zbFHDkQtaJBJhV2w+QKe4dwFVeVg==
X-Received: by 2002:a17:906:4c94:b0:7b5:860d:7039 with SMTP id
 q20-20020a1709064c9400b007b5860d7039mr5279645eju.10.1670594967378; 
 Fri, 09 Dec 2022 06:09:27 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 10-20020a170906218a00b007815ca7ae57sm587465eju.212.2022.12.09.06.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 06:09:26 -0800 (PST)
Message-ID: <af52a8d4-839e-cb0e-abb1-a15782fb071c@redhat.com>
Date: Fri, 9 Dec 2022 15:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 27/30] build: move compiler version check to meson
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-28-pbonzini@redhat.com>
 <CAFEAcA_9wJy47nUpfkuonB_Fcu74MoC-14dj8dwi8i9HggWQKg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA_9wJy47nUpfkuonB_Fcu74MoC-14dj8dwi8i9HggWQKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/9/22 12:52, Peter Maydell wrote:
> The new code makes it much harder to move our compiler version
> requirements forward in future, because there's no longer a simple
> "check for normal clang X or apple clang Y" test where we can
> bump up X and Y based on what's provided in the various host
> platforms we have to support. Doesn't meson provide a way to do
> the version check on the version number the way we were doing
> previously?

Yes, I could just do the check with #error just like before.

For GCC I used the nicer "compiler.version().version_compare('>=x.y')" 
check.  For clang we have to deal with both upstream and Apple version 
numbers; it's also possible to check for __apple_build_version__ to 
distinguish between the two and then do version_compare(), but at that 
point it's easier to just use cc.compiles() and #error.

While it's possible to learn the upstream version corresponding to Apple 
compilers with "c++ --verbose", it is not really machine-friendly so 
Meson does not attempt to parse it and neither did QEMU's configure script.

So I went for the trick of using -Wpragma-pack, which was extracted from 
https://github.com/simd-everywhere/simde/blob/master/simde/simde-detect-clang.h. 
  The advantage is that you only have one check, the disadvantage is of 
course that it obscures what's going on.  I can add a clearer comment 
around the check, or switch to #error and add a pointer to 
https://trac.macports.org/wiki/XcodeVersionInfo where the mapping can be 
found, or really anything else that is your preference.

Paolo


