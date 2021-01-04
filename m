Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386232E9F08
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 21:51:46 +0100 (CET)
Received: from localhost ([::1]:44486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwWpM-0005t2-Ox
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 15:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwWoN-0005Ix-9e
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 15:50:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kwWoL-0005zW-6E
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 15:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609793438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JygAV7c5qWb+7iyvfhbKRauIqHn/n1Tv8tzTH40R+v0=;
 b=agzwx5QwVQL4ghv7uhW09FjwT31NnIWXXgV1X8zGmKtyzmhwZGRee11CqohgGjPph29RQH
 h4HP7EQF2uhfjOaX8yiUpyhcCsWkxyWnc0dQxj+jcKGHoaI9kTQrKMJzfSY0AftTjGdXqt
 hJ/Xo/7SAS5mja7SZgoQbPGLnQ0KJC8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-ZY3T7UlaOAeKIHDli4AKQw-1; Mon, 04 Jan 2021 15:50:35 -0500
X-MC-Unique: ZY3T7UlaOAeKIHDli4AKQw-1
Received: by mail-wm1-f70.google.com with SMTP id k67so240594wmk.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 12:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JygAV7c5qWb+7iyvfhbKRauIqHn/n1Tv8tzTH40R+v0=;
 b=JUEmDYaFGi4Z7ol0H2Rjagi8LpdYcKVOGiHcUG24N79v+TyhXs5kSs70STNiDXnaWb
 LH1CWtsMhbCdXzAlurrEwg8JHu0lTGSwVFfPEWx3eJT2nZCgBH1qsBLlvxpSGiKaunlG
 rNV+4cPKnaQpP9OEKPqpo38a4AI3G4W/0FtHnpoOdxCJWyawl5QBAGP0phwUeTU4yy1V
 iR4WKpRFw8WEaMvsV2oAQeVBjIe6mZD6yqnI/T5uIr+5Y/kpwKySUKUsV07ioU3zGfqF
 UEwZIcgBpzY9NHMDAbzpfonwqWGTnGjDhysGXFhJFEuonYNfNlEgDoLnJdLy0j0nuEhA
 DEoQ==
X-Gm-Message-State: AOAM532+VXvUrGXMKygXaSYK+HuJWBoiGH0jXcttJxe8/lRIT/jTOW05
 eYaGgw8ZjUlSfznloHjXvq+5a7GODjsL7e5CcF5CbtcyPq818PH+xC2HPlVgEzzydWbv1Qyuzyo
 woE4PhPw3U8BSrVI=
X-Received: by 2002:a7b:c319:: with SMTP id k25mr591979wmj.142.1609793434429; 
 Mon, 04 Jan 2021 12:50:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYcuksqo7g2BIL4S+xfuT5/3J6fM3BmMHkxXvWYJpJv25HFxdrJ2kfreki3wjM2s+HrXGnMw==
X-Received: by 2002:a7b:c319:: with SMTP id k25mr591960wmj.142.1609793434180; 
 Mon, 04 Jan 2021 12:50:34 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e17sm91893809wrw.84.2021.01.04.12.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 12:50:33 -0800 (PST)
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
 <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
Date: Mon, 4 Jan 2021 21:50:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/01/21 18:24, Roman Bolshakov wrote:
> Hi Paolo,
> 
> I'm sorry I didn't reply earlier. As I showed in an example to Peter
> (https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00085.html):
> https://github.com/mesonbuild/meson/commit/ff5dc65ef841857dd306694dff1fb1cd2bf801e4
> 
> The approach doesn't propogate dependencies of crypto beyond libcrypto.
> i.e. if you specify crypto somewhere else as depedency, it won't pull
> CFLAGS needed for gnutls.

Hi Roman,

After writing the meson patch in fact I noticed that get_dependencies() 
is used only for linker flags.  I got a very quick reply from the Meson 
maintainer (https://github.com/mesonbuild/meson/pull/8151):

    The fact that header flags are not passed transitively but libraries
    are (in some cases) is intentional. Otherwise compiler flag counts
    explode in deep hierarchies. Because of this include paths must be
    exported manually, typically by adding the appropriate bits to a
    declare_dependency.

    Libs are a bit stupid, because you need to add direct dependencies
    if, for example, you link to a static library.

Does it work if you do:

crypto_ss.add(authz, qom)
libcrypto = static_library('crypto', crypto_ss.sources() + genh,
                            dependencies: crypto_ss.dependencies(),
                            ...)
crypto = declare_dependency(link_whole: libcrypto,
                             dependencies: crypto_ss.dependencies())

?  If so, that is also a good option.  If not, I will try to extend the 
test case to pitch the Meson change.

Paolo


