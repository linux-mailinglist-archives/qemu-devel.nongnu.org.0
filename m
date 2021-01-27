Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEA33066BB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:51:39 +0100 (CET)
Received: from localhost ([::1]:60922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4siw-00089U-4d
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4shF-0007gZ-8c
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:49:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4shD-0003tN-EE
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 16:49:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611784190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kO8dWpPUIKIzFnM+50sBlc/hUYgG8GlX34/ygaPwz0Q=;
 b=Z1vHwMz5TEZuC7t0vWhwQblMDqrtOD8KpejHXcuLZmcHMMpx1R7kgn0MyJ4E1kvAZcYhSJ
 oHY/hzrU6FHQ4WkW5rk0MFYYcTbztRLmc5nXiZEq8kGpK7ackTyAFH0vrWsnVoWPKMre9T
 5l9mBwO5mJimmAe7TUxm6rM4iATMTBw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-tGjfcbM9Np22Rm2fD41gaA-1; Wed, 27 Jan 2021 16:49:45 -0500
X-MC-Unique: tGjfcbM9Np22Rm2fD41gaA-1
Received: by mail-wr1-f70.google.com with SMTP id n14so1934247wru.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 13:49:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kO8dWpPUIKIzFnM+50sBlc/hUYgG8GlX34/ygaPwz0Q=;
 b=QBo2zDga9kFHU14BFz7v8BlR7JFvdkYw+D/PJIrTMmHDFC/cHca79sIdV5elXATCWO
 qo+9XyIO/UcWn2n/BXc9zXsN+iK2t6xYd0PRmpaFo2Csuh3YtzjGDVLgMLNpx1X8B3yj
 ExpyLJ1xuhs4TB69usAQwb4UglADqQq8V4Y+mc4DAHNOOJkSYHrBJWcz2kKJU/RiheIA
 A+GZZQAA+TUg0CmoDifGa/5bXLmF683QV+UrEdkXF3N3iAD5WKvysqM3fGiAA+S1Kd/D
 wtGwQLDtgGi0A7F7OWxM1LalH0kbe5xREMuilAW00dXQyRqkG0DvHa4yspaYJ2hFTJRh
 912Q==
X-Gm-Message-State: AOAM530+pumOUP31I6JD4AW+dBRsieAcvs+8AkvZ7wrhbRC1o7H5kNAl
 yMPInicindtW+ZCSYFJ5ofFCQuG6IX4tXw5gDHcmrnBhE1MzkPv0Rxs80n/wBQw7q/8qWWEDCwP
 qsKAGksjQvb5iS48=
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr13364123wrz.343.1611784183943; 
 Wed, 27 Jan 2021 13:49:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1jJ2x0jq8fNAUbqehVSma4J7Wm/2bMgIbG9gbiFfauRkdBMSzszoVaY2ViY3SgjyFzK03Lg==
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr13364113wrz.343.1611784183832; 
 Wed, 27 Jan 2021 13:49:43 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r15sm4348973wrj.61.2021.01.27.13.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 13:49:43 -0800 (PST)
Subject: Re: [PATCH] configure: Move preadv check to meson.build
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210126155846.17109-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b61b0309-e5b5-0fb7-ab23-85da66518692@redhat.com>
Date: Wed, 27 Jan 2021 22:49:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126155846.17109-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 4:58 PM, Peter Maydell wrote:
> Move the preadv availability check to meson.build.  This is what we
> want to be doing for host-OS-feature-checks anyway, but it also fixes
> a problem with building for macOS with the most recent XCode SDK on a
> Catalina host.
> 
> On that configuration, 'preadv()' is provided as a weak symbol, so
> that programs can be built with optional support for it and make a
> runtime availability check to see whether the preadv() they have is a
> working one or one which they must not call because it will
> runtime-assert.  QEMU's configure test passes (unless you're building
> with --enable-werror) because the test program using preadv()
> compiles, but then QEMU crashes at runtime when preadv() is called,
> with errors like:
> 
>   dyld: lazy symbol binding failed: Symbol not found: _preadv
>     Referenced from: /Users/pm215/src/qemu/./build/x86/tests/test-replication
>     Expected in: /usr/lib/libSystem.B.dylib
> 
>   dyld: Symbol not found: _preadv
>     Referenced from: /Users/pm215/src/qemu/./build/x86/tests/test-replication
>     Expected in: /usr/lib/libSystem.B.dylib
> 
> Meson's own function availability check has a special case for macOS
> which adds '-Wl,-no_weak_imports' to the compiler flags, which forces
> the test to require the real function, not the macOS-version-too-old
> stub.
> 
> So this commit fixes the bug where macOS builds on Catalina currently
> require --disable-werror.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure   | 16 ----------------
>  meson.build |  4 +++-
>  2 files changed, 3 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


