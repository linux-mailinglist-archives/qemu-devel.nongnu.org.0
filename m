Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928382E8854
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 20:46:18 +0100 (CET)
Received: from localhost ([::1]:40788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvmqv-0007ww-2c
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 14:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kvmot-0007Ac-4O
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 14:44:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kvmoj-0000RC-OS
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 14:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609616639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8SVQtwItSII+r6LGIsp9CENicfe1i8i/b9vp6qr+mc=;
 b=djNU9HgYsm9lhn868EUHoRfjk5CGJSiEdyOVYVlxQkrOELbaOGAAgecpUsl0yJNt7xQg93
 JIcuEtrEJeZ75Lu8s2/N40WG31AjAUyxXF0jYrwcKNktyS7MvqU0QmHQgzKNVo1h2HXt87
 STmaixruJCAbYok+Ts2lxwVdRXzhC2A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-APYZl3ZRMSWtrrRWANSBFg-1; Sat, 02 Jan 2021 14:43:56 -0500
X-MC-Unique: APYZl3ZRMSWtrrRWANSBFg-1
Received: by mail-ed1-f70.google.com with SMTP id h5so9723512edq.3
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 11:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f8SVQtwItSII+r6LGIsp9CENicfe1i8i/b9vp6qr+mc=;
 b=iODz/GmkP+jr+/g8S/6710/4ds2uWxqobxiCUBbHX+keuzqgw2286pMQvmTWMj1XWb
 omZInA+0D+60fJVj8+NYH7ekidJcGg0rJIbLwjaQ5uR3mQ7Ftp/AwYc8HyYXYaE9SghA
 LOKAmmuJ/9CBKoFUkSD7iQQDZ26HmNdfHV5MyjkO5d1hZ35zxooGTlnradNXvw6K347v
 ZKurE2X6+ohITucNBpPfP2QMfNYKr1WFr26ds66gUhaPHPWK+u9jyP+deGLAYu6L3eBg
 2EXl7xkGKU3sEqDzsjCUFqxNiK83MFgE9j7g7mjHCcDxWIahIusDOHUs5z4HzW/zl4Hz
 sn1g==
X-Gm-Message-State: AOAM533EU2m1DGdpA894gL38kzgWwLPGDh/SFw7pfExNB49n1ZcdhbUU
 3gaRXb2MEpyizXkDYrYrrsmAkjHTnMxh2yEY9vRVzQupzPM5LM0IxGvPIubWDHli3+woRKEmLuY
 uh1qS674X6xsOe5o=
X-Received: by 2002:a05:6402:22e1:: with SMTP id
 dn1mr65596650edb.347.1609616635362; 
 Sat, 02 Jan 2021 11:43:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1kPPOmDPTtzPP0r6nVx4FSToBJrETpiSubnhERl7pj5pcUHKq8NEVYiv8ZbySBcs5AwiRSw==
X-Received: by 2002:a05:6402:22e1:: with SMTP id
 dn1mr65596637edb.347.1609616635156; 
 Sat, 02 Jan 2021 11:43:55 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id cb14sm22099591ejb.105.2021.01.02.11.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 11:43:54 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
Message-ID: <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
Date: Sat, 2 Jan 2021 20:43:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.118, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/01/21 14:25, Peter Maydell wrote:
> Question to Paolo -- it seems pretty fragile to have to explicitly
> list "these source files need these extra CFLAGS" in half a dozen
> meson.build files, because it's pretty non-obvious that adding
> eg '#include "block/nbd.h"' to a .c file means that you also
> need to update the meson.build file to say "and now it needs these
> extra CFLAGS". Isn't there some way we can just have the CFLAGS
> added more globally so that if we use gnutls.h directly or
> indirectly from more .c files in future it Just Works ?
> 
> If the build failed for the common Linux case then it would be
> at least more obvious that you needed to update the meson.build
> files. I think it's better to avoid "you need to do this special
> thing that you'll only notice you're missing if you happen to test
> on a somewhat obscure host configuration" where we can.
> 
> (We don't want to link helper binaries etc against gnutls if
> they don't need it, but that's LDFLAGS, not CFLAGS.)

The gnutls dependency will already propagate from

if 'CONFIG_GNUTLS' in config_host
   crypto_ss.add(gnutls)
endif

to

libcrypto = static_library('crypto', crypto_ss.sources() + genh,
                           dependencies: [crypto_ss.dependencies()], ...)
crypto = declare_dependency(link_whole: libcrypto,
                             dependencies: [authz, qom])

That is, Meson does know that everything that needs crypto needs gnutls 
(see get_dependencies in mesonbuild/build.py if you're curious).

I think the issue is that dependencies are listed too late---in the 
declare_dependency rather than the static_library.  Take io/ for example:

libio = static_library('io', io_ss.sources() + genh,
                        dependencies: [io_ss.dependencies()],
                        link_with: libqemuutil,
                        name_suffix: 'fa',
                        build_by_default: false)
io = declare_dependency(link_whole: libio, dependencies: [crypto, qom])

Listing "crypto" in io's declare_dependency is enough to propagate the 
gnutls LDFLAGS down to the executables, but it does not add the CFLAGS 
to io/ files itself.  So for the io/ files we aren't telling meson that 
they need crypto (and thus in turn gnutls on the include path).

The fix should be pretty simple and localized to the "Library 
dependencies" section of meson.build.  For the two libraries above, the 
fixed version would look like:

crypto_ss.add(authz, qom)
libcrypto = ... # same as above
crypto = declare_dependency(link_whole: libcrypto)

io_ss.add(crypto, qom)
...
libio = ... # same as above
io = declare_dependency(link_whole: libio)

(Roman, feel free to plunder the above if you want to turn it into a 
commit message, and if it's correct of course).

Thanks,

Paolo


