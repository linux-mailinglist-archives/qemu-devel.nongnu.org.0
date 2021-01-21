Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5052FEB46
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 14:14:55 +0100 (CET)
Received: from localhost ([::1]:43988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Zna-0002ov-CC
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 08:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2ZlI-00020F-AB
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:12:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2ZlG-0004rD-0U
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611234748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHBKan+j4jgIRxWqERT/EesK5IOBWmJH1MyH6HeJ32g=;
 b=Aa+vK0XMjM5tEO0f0gc0gHVeg6PuGANnoPh79/ldgdsT8mnR7KQbsjORaC9Er+GUOQ1o93
 P1hUMkal/oCEFyLla49agxJMxlbsTOaCyFUUgD9SNxXI3ZDfsT8jnumEc+zHplQR0QdSti
 +7R7Ht8gdCxT5XRvMX/kIjgAwLLnenA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-b0VTb7asPOOt-qELQWQnnA-1; Thu, 21 Jan 2021 08:12:24 -0500
X-MC-Unique: b0VTb7asPOOt-qELQWQnnA-1
Received: by mail-ej1-f71.google.com with SMTP id by20so726593ejc.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 05:12:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FHBKan+j4jgIRxWqERT/EesK5IOBWmJH1MyH6HeJ32g=;
 b=tBLOZfNjnF031obLnyITgSitiPS1hX47WnML8siCWL32ZVOEnBMXYFaJ8M4M+kwG2a
 2uW7ePkZuBCccoNpk84NqQ/lib76oD04nMv1c/w3IZpJPmBLPwSDvHvXtbSR2ME7m0HG
 6DSRiZT/s0xOYAcMGABRDgB5OhzeqC5U+BZgy+ETT6t3prfQXahUPcP7nuTIRh897ZCT
 9ARUfXzbgzxUvkrETgcNpxFAPTb3MJuCadKhkPHQOPHE14He6NyLjE1Oj0Hpza9S5zfN
 nH4mCWuFoy7uULfbmCpXSrFEn/RC1y0sYTPlbzpMpr495VQErNOQmBXBcPtccxE9CCiP
 sdYA==
X-Gm-Message-State: AOAM5327GlWXVrR3n74COsDHeEYfTuSfBlj6oqep20/ZfmkOX99X7bD6
 xXbaM+KUzvdP9Dyh+gVUUF0FBS5BL/yU2z0Qr2LCIawIxjl9jGUyQkQtux4BeAPWh13RL10reA7
 uflg1Xu+WNS8b0/wQMULD6NWwGYqUlRQQFXvf7gSxuxLfRENVfwmGSf9vfv/tZRKEB7o=
X-Received: by 2002:a17:906:9499:: with SMTP id
 t25mr8705589ejx.339.1611234742893; 
 Thu, 21 Jan 2021 05:12:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6O5ppZ42YAdvr5zdROS1eWgt0RZdV1aS1BM8S/WY8H55aw1pNIOqM7UxsrJmDS8d+BJuxDA==
X-Received: by 2002:a17:906:9499:: with SMTP id
 t25mr8705582ejx.339.1611234742685; 
 Thu, 21 Jan 2021 05:12:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id ar1sm2201457ejc.30.2021.01.21.05.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 05:12:21 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8mBK9932CLZ9uFtEa0rSycK6Sp9UDjSJnbJpg2hx8idg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: changing tests/qtest/meson.build causes unnecessary rebuilding
Message-ID: <17698af4-537b-3e8e-67c8-4ed45a922def@redhat.com>
Date: Thu, 21 Jan 2021 14:12:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8mBK9932CLZ9uFtEa0rSycK6Sp9UDjSJnbJpg2hx8idg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/21 12:56, Peter Maydell wrote:
> $ make -C build/arm-clang/ -j8
> make: Entering directory
> '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'
> [1/23] Generating qemu-version.h with a meson_exe.py custom command
> make: Leaving directory
> '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'
> $ touch tests/qtest/meson.build
> $ make -C build/arm-clang/ -j8
> make: Entering directory
> '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'
> /usr/bin/ninja  build.ninja && touch build.ninja.stamp
> [0/1] Regenerating build files.
> The Meson build system
> [...]
> 
> It then goes on to rebuild hundreds or thousands of files, most of
> which are not even in tests/. (Oddly, the exact set of files recompiled
> seems to vary from run to run.)
> 
> Forcing a full rebuild of all of QEMU seems rather excessive when
> the change was likely "add a new test case"...

This is "avoid build.ninja changes due to order of hash table iteration" 
(https://github.com/mesonbuild/meson/pull/7900/).  I think Meson 0.57 
(with the fix) should be out soon, hopefully before 6.0.

Alternatively you can try to bug your distro to include the patches, 
they are pretty safe.

Paolo


