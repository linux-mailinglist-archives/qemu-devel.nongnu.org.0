Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF536303100
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 01:44:08 +0100 (CET)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4CSl-0006tX-Gf
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 19:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4CQy-0006PW-3R
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 19:42:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4CQs-0001Iw-SE
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 19:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611621727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYhEDIROhXo590qHjmztfyTDQn19wr2f19isork+1jk=;
 b=hVTVEmoCvO5MoTAxCi0b4ITNuiO4XbuSX0NFLz4cztw4q+TslOBlCRg9uCgA5wF98ARFJn
 tGDSnuvSUuJydIcEy+5OM/JOP5FL1CziQBTxikg3g7aUGH+cvajOQ4zHXiNCqWd28SEa0A
 8JDEz7VcA8KuLdhPMsmrBCBc4IWRqUk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-hXPUgd-FPoW8qmOVMVanwA-1; Mon, 25 Jan 2021 19:42:05 -0500
X-MC-Unique: hXPUgd-FPoW8qmOVMVanwA-1
Received: by mail-ed1-f72.google.com with SMTP id o19so8486131edq.9
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 16:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IYhEDIROhXo590qHjmztfyTDQn19wr2f19isork+1jk=;
 b=hJ98gCdz77P1XyZ6nPdHRMGFX5lseLqwHZKRGe6X23mQlXiXFOTwmPxr9hH+Nrclje
 FuT4tFANXO0qYvp7o8W2LhHNfoYAKQqBvEYGP7GlTos39Ata/txLNkwX4lMDXXaxHUoV
 E+6Ewu/0c725dXPTDTWiEJnobsAADIwW2QHrA3iRsGH0/tYoa9PmyjZPnsYde0moMnea
 1gS9iOAsOEGXyiIfp9D5eQ1YU+og9pwTKUVGQvqJTxszHuJnsAl/FE5xWiesX6fgltA8
 JixjZM+A/MUipgab9/scekx/UCjNhVZGkqOFyobxXZIvjBms8hIHTC3/aeRF6YCjdz5u
 WcbQ==
X-Gm-Message-State: AOAM533DCK9DLJ6tFkEzRlcU8lmQSOHAHf/jNZi6jVEa5jvyiNenby+u
 jyawA33PfsurgHMPYTzsdNXfgQ2Ol4rTBh8pWTCN+A2jjjDW1/Zr0IXFkdOSH8sxc+v9/darrYl
 bSKdo7RBbRjUGHf3vKJt/1OJU/zS7cVeUGWHt3FUs3qLIlkjnh3eRtSJ3lwL2kWy9MW8=
X-Received: by 2002:a17:906:4955:: with SMTP id
 f21mr1919119ejt.384.1611621723503; 
 Mon, 25 Jan 2021 16:42:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx12ajmMhRgN5eDtxT8BxYMvIvtfXdVUq8OWetitqwWMyTubFkHoKkZNFBDRS08sq1jAEGq7A==
X-Received: by 2002:a17:906:4955:: with SMTP id
 f21mr1919106ejt.384.1611621723279; 
 Mon, 25 Jan 2021 16:42:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p27sm9008616ejd.72.2021.01.25.16.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 16:42:02 -0800 (PST)
Subject: Re: [PATCH v7 05/11] osdep: build with non-working system() function
To: Joelle van Dyne <j@getutm.app>
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-6-j@getutm.app>
 <CAFEAcA8V1nv1VV6t8UN25JoA7bw96xSBamaw6VnfBavOQjj44A@mail.gmail.com>
 <CAFEAcA8hA7_isLsAtyS8oSwcfL9nRjdSehL+qLj5C2MycbzLoA@mail.gmail.com>
 <CA+E+eSAhNNBxY06a5iQj9ANpgmYZk0Kf6LYQPduCLwNmr1UQvA@mail.gmail.com>
 <CAFEAcA8KZqxjDd0H7faF=YtkyY-XFB2WoP31qv_2ecFij_rLqQ@mail.gmail.com>
 <59a773e4-b277-a8a2-b496-d95b515718e2@redhat.com>
 <CA+E+eSB_ZbO4GGCJWdZsOL+e4VE7nzW0THUqBgmdeA05yjAzmg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <69a662a8-f48d-92ee-4202-03a7feb55716@redhat.com>
Date: Tue, 26 Jan 2021 01:42:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CA+E+eSB_ZbO4GGCJWdZsOL+e4VE7nzW0THUqBgmdeA05yjAzmg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/21 01:12, Joelle van Dyne wrote:
> Here's how meson does cc.has_function
> 
> https://github.com/mesonbuild/meson/blob/master/mesonbuild/compilers/mixins/clike.py#L761
> 
> Since the compiler error comes from the header file with
> 
> __attribute__((availability(ios,unavailable)))
> 
> The meson check will always pass.
> 
> cc.compiles should work though. Is there a reason why it's not used
> instead of all the compile_prog checks in ./configure ?

Just because the Meson build system is only a few months old.

Alternatively:

         # If we have any includes in the prefix supplied by the user, 
assume
         # that the user wants us to use the symbol prototype defined in 
those
         # includes. If not, then try to do the Autoconf-style check with
         # a dummy prototype definition of our own.

so adding a "prefix: '#include <stdlib.h>'" to cc.has_function should 
work too.

Paolo


