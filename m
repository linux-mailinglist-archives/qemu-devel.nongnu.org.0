Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E838C804
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:28:18 +0200 (CEST)
Received: from localhost ([::1]:45040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5CL-00083o-7b
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk5BX-0006yI-RO
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:27:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk5BU-0004mO-J3
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621603643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEQRgH4/t4iZYwqf8O/qpVBhCBjM0zWOLXzHmTTdRdo=;
 b=h/DSuR//kJhOd2JQVVgGn3gTlMpDgb1EKgLHFshMuawu2D40O6NCJTYdL4ZY6SAaXZShQw
 o2rVF30rWUkXga4rK2d0PUDinrmIu7PXS+sDAhBGyKRjnBmaKU1hWRcGCvS+zkcgbINVLx
 GEEzhsy34Qj3SEJ2mlzKa2x9mJWPKSs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-1le38cODNg-hvu8AkrUhqQ-1; Fri, 21 May 2021 09:27:19 -0400
X-MC-Unique: 1le38cODNg-hvu8AkrUhqQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 d8-20020a0564020008b0290387d38e3ce0so11345152edu.1
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 06:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yEQRgH4/t4iZYwqf8O/qpVBhCBjM0zWOLXzHmTTdRdo=;
 b=QKBrVeaIlsZKGyC4gubD46R7enUTckEYlXmbjOE9CHj2G3ZZy5CZFxhrYRHlb6i0DU
 L/I+YJXC/cMURMWmHx6SMGmhfcl1aCMgN3PV6tKFIdhcizr9ilYvW0Rr3Ny8/QhpFQTD
 VsElAxWKCfQjndEakM/FppOOQOhixeNmhXb0XVheDQjxoZx+zpMFblUgoxYP0KLJD/bi
 xRVhxiE7hbvN+/qdOjVv+qVgzDW/Z74mXwxfwmc1Dl0OqlC7IHhIO30cN2gz5+guEOdY
 dWjrRQAXuJF5x2JQ6QLLJWmXMwmeS888WfERBRfSwKBnsVMdfx7qCMHIbUeITXjFRrQy
 4Ong==
X-Gm-Message-State: AOAM532ioYluPymHlT0r002v3i0tjGjwU7lf5ku58G5IL/Ce3wejTXRC
 KvaYKjvlWmV3mHLbO8gsFQh7djDP045wtgPgV565He2RsnQr3J4ccNvzcySnWMEt7sM4JU3vj4z
 JrVO1eIElRgDy+gERQb9nCeVg9RqEtQyUsa0dC14Ia9SuOVghRJUdm7I6DMEYA1kDtzI=
X-Received: by 2002:aa7:c349:: with SMTP id j9mr11092532edr.135.1621603638039; 
 Fri, 21 May 2021 06:27:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU8vp+4h3raIj2SghL6J1/FHuAeRKQxQFTBCWawuizcVNdWTOQ+m2Xj6Kmljh11hUK7veK4Q==
X-Received: by 2002:aa7:c349:: with SMTP id j9mr11092497edr.135.1621603637702; 
 Fri, 21 May 2021 06:27:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d17sm3474663ejp.90.2021.05.21.06.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 06:27:16 -0700 (PDT)
Subject: Re: [PULL 00/26] Misc patches for 2021-05-20
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210520082257.187061-1-pbonzini@redhat.com>
 <CAFEAcA_MV=UiHW4Kp3Zb4iT_5BHgqVwj9Qem1xjmp1AJ++K=sQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7775729e-e217-f469-429b-a966996a1ef3@redhat.com>
Date: Fri, 21 May 2021 15:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_MV=UiHW4Kp3Zb4iT_5BHgqVwj9Qem1xjmp1AJ++K=sQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/21 15:26, Peter Maydell wrote:
> WARNING: Project specifies a minimum meson_version '>=0.55.0' but uses
> features which were added in newer versions:
>   * 0.57.0: {'test() timeout <= 0'}
> 
> ERROR: Could not detect Ninja v1.8.2 or newer
> 
> (This system has ninja-build 1.7.2.)

What OS is it, and is there any chance of updating it?  ninja 1.7 was 
released in 2017, and I checked that all the supported OSes for QEMU 
have 1.8 before sending the pull request.

> Also, my OSX build which I configure with
> ../..configure --extra-cflags='-fdiagnostics-color=never -Werror
> -Wno-error=deprecated-declarations'
> 
> now triggers a meson.build warning:
> 
> ../../meson.build:118: WARNING: Consider using the built-in werror
> option instead of using "-Werror".
> ../../meson.build:120: WARNING: Consider using the built-in werror
> option instead of using "-Werror".
> ../../meson.build:122: WARNING: Consider using the built-in werror
> option instead of using "-Werror".

Which makes sense since we have --enable/--disable-werror.

> Also also, dropping the merge commit reveals that the pullreq somehow
> broke the build trees such that trying to do a build on master no
> longer works:  [...] This seems like a meson bug

It is and has been fixed since in Meson, but the older version obviously 
doesn't have the fix.

Paolo


